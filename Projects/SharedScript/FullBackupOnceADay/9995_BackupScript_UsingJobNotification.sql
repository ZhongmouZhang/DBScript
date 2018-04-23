use master
go

/*********************************************************************

	Test if there is a corresponding database subfolder in a specified 
	path. If not, create one for the database
	
**********************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_TestCreateSubfolder') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_TestCreateSubfolder
GO

-- hsp_TestCreateSubfolder '\\srvnetapp03\SQL_Back$\ZVMSQ2K801\', 'master'

CREATE         proc dbo.hsp_TestCreateSubfolder
@path varchar(1024),
@dbname varchar(1024)
as

declare @stt varchar (5000)

-- delete the existing full backups
if (@@version like 'Microsoft SQL Server 2005%' or @@version like 'Microsoft SQL Server 2008%')
begin
	exec sp_configure 'show advanced option', '1'
	reconfigure with override
	exec sp_configure 'Ole Automation Procedures', '1'
	exec sp_configure 'xp_cmdshell', '1'
	reconfigure with override
end

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#subfolderList') and xtype='U')
drop table #subfolderList
CREATE TABLE #subfolderList(line varchar(2000))

set @stt = 'dir "' + @path + '" /B /A:D'
INSERT INTO #subfolderList 
EXEC xp_cmdshell @stt

--select * from #subfolderList

if not exists (select * from #subfolderList where line = @dbname)
begin 
	set @stt = 'md "' + @path + @dbname +'" '
	EXEC xp_cmdshell @stt
end

go
-- select * from #subfolderList


/*********************************************************************

		Delete the backup older than the retention day
		
**********************************************************************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_DeleteOldBackup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_DeleteOldBackup
GO

CREATE         proc dbo.hsp_DeleteOldBackup
@flag int -- 1: delete full backup   2: delete log backup
as

declare @path varchar(1024)
declare @filename varchar (512)
declare @stt varchar (5000)
declare @RetentionDay int

-- delete the existing full backups
if (@@version like 'Microsoft SQL Server 2005%' or @@version like 'Microsoft SQL Server 2008%')
begin
	exec sp_configure 'show advanced option', '1'
	reconfigure  with override
	exec sp_configure 'Ole Automation Procedures', '1'
	exec sp_configure 'xp_cmdshell', '1'
	reconfigure  with override
end

select @RetentionDay = convert(int,path) from dbo.tbl_backup_parameter where dbname = '#RetentionDay'
--print @RetentionDay

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#DeletingFileList') and xtype='U')
drop table #DeletingFileList
CREATE TABLE #DeletingFileList(line varchar(2000))

declare myCur_path_full cursor for
select distinct path from master.dbo.tbl_backup_parameter where excluded != 1 and not dbname like '#%'
open myCur_path_full 
fetch next from myCur_path_full into @path
while @@fetch_status=0
begin
	-- get the file list in the folder
	
	set @stt = 'dir "' + @path + '" /S /B'  -- return the full path for the candidate files

	truncate table #fileList
	INSERT INTO #fileList 
    EXEC xp_cmdshell @stt
    
    if (@flag = 1)  -- delete full backups
		insert into #DeletingFileList
		SELECT line FROM #fileList 
		WHERE line like  '%[_]Full[_]%.bak'
			and LEN (line) > 25
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 18, 8)) = 1
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 9, 6)) = 1
			and dateadd(hour,-@RetentionDay*24+5,getdate())>= 
				convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+ SUBSTRING(line, LEN(line) - 9, 2)+':'+
							SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2))
	else 	-- delete log backups			
		insert into #DeletingFileList
		SELECT line FROM #fileList 
		WHERE ( line like '%[_]Log[_]%.bak' or line like '%[_]Log[_]%.trn')
			and LEN (line) > 25
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 18, 8)) = 1
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 9, 6)) = 1
			and dateadd(day,-@RetentionDay,getdate())>= 
				convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+SUBSTRING(line, LEN(line) - 9, 2)+':'+
							SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2))
	
	fetch next from myCur_path_full into @path
end
close myCur_path_full
deallocate myCur_path_full

declare MyCur_DeletingFile cursor for select line from #DeletingFileList
open MyCur_DeletingFile 
fetch next from MyCur_DeletingFile into @path
while @@fetch_status=0
begin
	set @stt = 'del "' + @path + '"'
	exec master.dbo.xp_cmdshell @stt
	--print @stt
	fetch next from MyCur_DeletingFile into @path
end
close MyCur_DeletingFile
deallocate MyCur_DeletingFile

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



/********************************************************************

		Full Backup Stored Procedure
		
*********************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_FullBackupAllDB') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[hsp_FullBackupAllDB]
GO

CREATE         proc dbo.hsp_FullBackupAllDB 
as
declare @dbname varchar(500)
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @subject_str varchar(1000)
declare @from_str varchar(500)
declare @to_str varchar(500)

-- delete the older full backup
exec hsp_DeleteOldBackup 1

-- backup all the database fully
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

insert into #temp 
select name from master.dbo.sysdatabases db
where name not in ('tempdb','distribution')
	and not exists (select dbname from master.dbo.tbl_backup_parameter bp where excluded = 1 and db.name=bp.dbname)
	and db.status & 512 != 512   -- off line 
	--and db.status & 1073741824  != 1073741824  -- cleanly shutdown
order by name

declare myCur_full cursor for 
select dbname from #temp 


open myCur_full
Fetch next from myCur_full into @dbname

while @@fetch_status = 0
begin
	if (not exists (select * from master.dbo.tbl_backup_parameter where dbname=@dbname and backuptype='full'))
		select @path = path from master.dbo.tbl_backup_parameter where dbname='default'
	else
		select @path = path from master.dbo.tbl_backup_parameter where dbname=@dbname  and backuptype='full'
	
	exec hsp_TestCreateSubfolder @path,@dbname
	set @path = @path + @dbname + '\'
	 
	select @dest=@path + @dbname + '_Full_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.bak'
	-- select @dest

	backup database @dbname to Disk=@dest with init,stats
	if (@@error != 0)
	begin
		raiserror ('Full backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end
	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full

go


/********************************************************************

		Log Backup Stored Procedure
		
*********************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_LogSwitchAndLogBackup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_LogSwitchAndLogBackup
GO

CREATE         proc dbo.hsp_LogSwitchAndLogBackup
as
declare @dbname varchar(500)
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @subject_str varchar(1000)
declare @from_str varchar(500)
declare @to_str varchar(500)

---- Is it time to do full backup

if exists (select * from master.dbo.tbl_backup_parameter 
where dbname = '#FullBackupTime' 
		and datepart(hour,getdate())=convert(int, substring(path,1,2))
		and datepart(minute,getdate())between convert(int, substring(path, 4,2)) and convert(int, substring(path, 4,2))+10)
begin 
--	exec hsp_DeleteOldBackup 1
	exec hsp_FullBackupAllDB                           -- full backup the databases
	exec hsp_cycle_errorlog_historylog                 -- recycle the server/agent error log and backup/job history log
end

-- delete log backups
exec hsp_DeleteOldBackup 2

-- backup the all of the databases logs
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

insert into #temp 
SELECT name  
FROM master.dbo.sysdatabases  
WHERE name NOT IN ('master','model','msdb','tempdb')  
   AND DATABASEPROPERTYEX(name, 'Recovery') IN ('FULL','BULK_LOGGED') 
   and  status & 512 != 512
   and  status & 32 != 32
   and  status & 1024 != 1024 --ready only
order by name

declare myCur_full cursor for 
select dbname from #temp 


open myCur_full
Fetch next from myCur_full into @dbname

while @@fetch_status = 0
begin
	if (not exists (select * from master.dbo.tbl_backup_parameter where dbname=@dbname and backuptype='Log'))
		select @path = path from master.dbo.tbl_backup_parameter where dbname='default'
	else
		select @path = path from master.dbo.tbl_backup_parameter where dbname=@dbname  and backuptype='Log'
		 
	exec hsp_TestCreateSubfolder @path,@dbname
	set @path = @path + @dbname + '\'
	select @dest=@path + @dbname + '_Log_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.trn'
	--print @dest

	backup log @dbname to Disk=@dest with  Stats 
	if (@@error != 0)
	begin
		raiserror ('Log backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end
	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full

go 

/***************************************************************************************

	Clean up backup and job history log and server/agent log
	
***************************************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_cycle_errorlog_historylog') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_cycle_errorlog_historylog
GO

-- hsp_TestCreateSubfolder '\\srvnetapp03\SQL_Back$\ZVMSQ2K801\', 'master'

CREATE         proc dbo.hsp_cycle_errorlog_historylog

as
declare @num_of_day int, @historylog_retentionday int, @errorlog_retentionday int
declare @dt datetime

set @num_of_day = DATEDIFF(day, 0, getdate())

select @historylog_retentionday = path
from  master.dbo.tbl_backup_parameter
where dbname = '#HistoryLog_RetentionDay'

select @errorlog_retentionday = path
from  master.dbo.tbl_backup_parameter
where dbname = '#ErrorLog_RetentionDay'

select @num_of_day,@errorlog_retentionday,@historylog_retentionday,@num_of_day%@historylog_retentionday

if (@num_of_day%@historylog_retentionday=0)
begin 
	SET @dt = DATEADD(DAY, -@historylog_retentionday, GETDATE())
	EXEC msdb.dbo.sp_delete_backuphistory @dt
	EXEC msdb.dbo.sp_purge_jobhistory @oldest_date=@dt
end

if (@num_of_day%@errorlog_retentionday=0)
begin
	exec sp_cycle_errorlog
	exec msdb.dbo.sp_cycle_agent_errorlog
end

go

-- log the script version

exec master.dbo.hsp_ScriptVersionControl 'backup', '1.0.0.2'