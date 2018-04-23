 
-- select * from dbo.fn_Split ('tetst,2222,3333,',',')
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].FN_Split'))
drop function [dbo].FN_Split
GO


CREATE FUNCTION FN_Split(
@IDValues as varchar(5000),
@Delimeter as varchar(1)
)
RETURNS @tValues TABLE(parameter varchar(500))
AS
BEGIN
	DECLARE @I AS INT, @Aux AS INT
	SET @I = 1
	SET @Aux = 1
	WHILE @I <= LEN(@IDValues)
	BEGIN
		IF SUBSTRING(@IDValues,@I,1)= @Delimeter
		BEGIN
			INSERT INTO @tValues (parameter) VALUES (SUBSTRING(@IDValues,@Aux,(@I-@Aux)))
			SET @Aux = @i + 1
		END
		SET @i = @i + 1
	END
RETURN
END

go

/*******************************************************************************

SP_Adhoc_Backup 'AIS,AIS3,ANES,', 'E:\MSSQL\Backup\','Y','N'

********************************************************************************/
   
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_Adhoc_Backup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].SP_Adhoc_Backup
GO

CREATE         proc dbo.SP_Adhoc_Backup
@dbstring varchar(6000) = 'All', 
						-- Default = All: backup all database
						-- string separated by coma
@dest_folder varchar(500) = 'Default', 
						-- default = default: from backupparameter table
						--  Specify a folder
@delete_old_backup char(1) = 'N' ,
							-- default = N: keep the old adhoc backup
							--          Y: delete the old adhos backup
@ShowPathOnly char (1) = 'N'
							-- Default = 'N'
							--			Y: Only show the path

as

declare @dbname varchar(1000), 	@dest varchar(1000), @stt varchar(5000)

-- enable xp_cmdshell
if (@@version like 'Microsoft SQL Server 2005%' or @@version like 'Microsoft SQL Server 2008%')
begin
	exec sp_configure 'show advanced option', '1'
	reconfigure
	exec sp_configure 'xp_cmdshell', '1'
	reconfigure
end

-- create a temporary database name table
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

-- select the databases which needs the backup
if @dbstring = 'All'
	insert into #temp 
	select name from master.dbo.sysdatabases db
	where name not in ('tempdb','distribution')
		and not exists (select dbname from master.dbo.BackupParameter bp where excluded = 1 and db.name=bp.dbname)
		and db.status & 512 != 512
	order by name
else 
	insert into #temp
	select parameter from dbo.Fn_Split(@dbstring,',')

-- declare the cursor for to-be-backed-up database list
declare myCur_full cursor for 
select dbname from #temp 

-- backup folder
if (@dest_folder='Default')
	select top 1 @dest_folder = path 
	from master.dbo.BackupParameter 
	where backuptype='Specific' or dbname = 'default'

open myCur_full
Fetch next from myCur_full into @dbname
while @@fetch_status = 0
begin
	If  (@delete_old_backup='Y')
	begin
		set @stt = 'del "' + @dest_folder + @dbname + '_Adhoc_*.bak' + '"'
		-- print @stt
		exec master.dbo.xp_cmdshell @stt
	end

	print 'Dbname: ' + @dbname 
	print 'Path: ' + @dest_folder

	select @dest=@dest_folder + @dbname + '_Adhoc_'
		+convert(varchar,getdate(),112)+'_' 
		+ 
		case when datepart(hour,getdate())>9 then convert(varchar,datepart(hour,getdate()))
			 else '0' + convert(varchar,datepart(hour,getdate()))
		end
		+
		case when datepart(minute,getdate())>9 then  convert(varchar,datepart(minute,getdate()))
			 else '0' + convert(varchar,datepart(hour,getdate()))
		end
		+ '00'
		+'.bak'
	--select @dest
	If (@ShowPathOnly='N')
		backup database @dbname to Disk=@dest with init,STATS 
	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full
