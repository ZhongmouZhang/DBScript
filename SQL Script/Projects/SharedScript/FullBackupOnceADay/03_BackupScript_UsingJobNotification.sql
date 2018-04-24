use [master]
go

/*********************************************************************

		Delete the backup older than the retention day
	exec hsp_delete_obsolete_backup 2, 'BookStore'
**********************************************************************/
if exists (select * from dbo.sysobjects where id = object_id(N'hsp_delete_obsolete_backup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_delete_obsolete_backup
GO

CREATE         proc dbo.hsp_delete_obsolete_backup
@flag int, -- 1: delete full backup   2: delete log backup
@database_name varchar(512) = ''   -- default is for all the databases
as

declare @path varchar(1024)
declare @filename varchar (512)
declare @stt varchar (5000)
declare @RetentionDay int
declare @match_pattern varchar(512)
declare @one_db char(1)

-- delete the existing full backups
if (@@version like 'Microsoft SQL Server 2005%' or @@version like 'Microsoft SQL Server 2008%')
begin
	exec sp_configure 'show advanced option', '1'
	reconfigure  with override
	exec sp_configure 'Ole Automation Procedures', '1'
	exec sp_configure 'xp_cmdshell', '1'
	reconfigure  with override
end

-- create the two temp tables for candidate file list
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#DeletingFileList') and xtype='U')
drop table #DeletingFileList
CREATE TABLE #DeletingFileList(line varchar(2000))

-- Get all the candidate backup files
set @path = ''
while 1=1
begin 
	select @path = min(parameter_value) 
	from master.dbo.tbl_maint_setting
	where parameter_name = '#backup_folder' and parameter_value > @path
	if @path is null 		
		break
	set @stt = 'dir "' + @path + '" /S /B'  -- return the full path for the candidate files
	INSERT INTO #fileList 
    EXEC xp_cmdshell @stt
end
	
-- select to-be-deleted files
if @database_name = ''
	set @one_db = 'N'
else
	set @one_db = 'Y'
while 1=1
begin
	if @one_db = 'N'
		select @database_name = MIN(name)
		from master.dbo.sysdatabases db
		where name > @database_name
			and name not in ('tempdb','distribution')
			and not exists (select dbname from master.dbo.tbl_backup_parameter bp where excluded = 1 and db.name=bp.dbname)
			and  status & 512 != 512 -- off line 
			and  status & 32 != 32
			and  status & 1024 != 1024 --ready only 
	if @database_name is null 
		break
		
	if not exists ( select * from master.dbo.tbl_maint_setting 
				where database_name=@database_name and parameter_name='#backup_retention_day')
		select @RetentionDay = convert(int,parameter_value) 	
		from master.dbo.tbl_maint_setting 
		where database_name='default' and parameter_name='#backup_retention_day'
	else
		select @RetentionDay = convert(int,parameter_value) 	
		from master.dbo.tbl_maint_setting 
		where database_name=@database_name and parameter_name='#backup_retention_day'

	if (@flag = 1)  -- delete full backups
	begin
		set @match_pattern = '%' + @database_name + '[_]Full[_]%.bak'
		insert into #DeletingFileList
		SELECT line FROM #fileList 
		WHERE line like  @match_pattern
			and LEN (line) > 25
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 18, 8)) = 1
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 9, 6)) = 1
			and dateadd(hour,-@RetentionDay*24+5,getdate())>= 
				convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+ SUBSTRING(line, LEN(line) - 9, 2)+':'+
							SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2))
	end
	else 	-- delete log backups			
	begin
		set @match_pattern = '%' + @database_name + '[_]Log[_]%.bak'
		insert into #DeletingFileList
		SELECT line FROM #fileList 
		WHERE  line like @match_pattern
			and LEN (line) > 25
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 18, 8)) = 1
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 9, 6)) = 1
			and dateadd(day,-@RetentionDay,getdate())>= 
				convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+SUBSTRING(line, LEN(line) - 9, 2)+':'+
							SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2))
	end
	-- exit when only for one DB
	if @one_db = 'Y'
		break
end	

-- delete the to-be-deleted files
set @path = ''
while 1=1
begin 
	select @path = MIN(line) from #DeletingFileList where line > @path 
	if @path is null
		break
	set @stt = 'del "' + @path + '"'
		exec master.dbo.xp_cmdshell @stt
	--print @stt
end


go

/****************************************************************

	SELECT convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+SUBSTRING(line, LEN(line) - 9, 2)+':'+SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2)), line
	FROM #fileList 
	WHERE (line like  '%[_]FULL[_]%.bak' or line like '%[_]Log[_]%.bak')
			and LEN (line) > 25
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 18, 8)) = 1
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 9, 6)) = 1
			and convert(varchar, dateadd(day,-1,getdate()),112) >= SUBSTRING(line, LEN(line) - 18, 8)

**********************************************************************/
