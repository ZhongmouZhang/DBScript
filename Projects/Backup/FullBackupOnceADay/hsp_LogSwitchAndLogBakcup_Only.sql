 if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_LogSwitchAndLogBackup_Only') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_LogSwitchAndLogBackup_Only
GO

CREATE         proc dbo.hsp_LogSwitchAndLogBackup_Only
as
declare @dbname varchar(500)
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @subject_str varchar(1000)
declare @from_str varchar(500)
declare @now datetime
Declare @switchlogfile int
declare @switchHr int
declare @switchMin int

set @now = getdate()
select @switchHr=convert(int, substring(path,1,2)), @switchMin = convert(int, substring(path, 4,2)) 
from master.dbo.BackupParameter
where dbname = 'LogSwitch_FullBackup'
	
-- Swithc log at specified time every day 
if (datepart(hour,@now)=@switchHr and datepart(minute, @now) between @switchMin and @switchMin+10)
	set @switchlogfile = 1
else
	set @switchlogfile = 0

--select @switchlogfile
--set @switchlogfile = 1
if (@switchlogfile = 1)
begin
	-- delete the log files which have already picked up by NetBackup 
	-- and move the log files which need to be picked up by netbackup
	if (@@version like 'Microsoft SQL Server 2005%' or @@version like 'Microsoft SQL Server 2008%')
	begin
		exec sp_configure 'show advanced option', '1'
		reconfigure
		exec sp_configure 'Ole Automation Procedures', '1'
		exec sp_configure 'xp_cmdshell', '1'
		reconfigure
	end

	declare myCur_path cursor for
	select distinct path from master.dbo.BackupParameter where backuptype = 'log' or dbname = 'default'
	open myCur_path 
	fetch next from myCur_path into @path
	while @@fetch_status=0
	begin
		-- delete the old log file
		set @stt = 'del /Q ' + @path + 'CompletedLogFile\*'
		print @stt
		exec master.dbo.xp_cmdshell @stt
		
		-- copy the current to-be-netbackup files
		set @stt = 'move ' + @path +'*_log_*.bak ' + @path + 'CompletedLogFile\'
		print @stt
		exec master.dbo.xp_cmdshell @stt

		fetch next from myCur_path into @path
	end
	close myCur_path
	deallocate myCur_path
	
	-- don't need to make log backup this time.
--	return
end


-- backup all of the databases logs
declare @offset int
if (datepart(hour,@now)>@switchHr 
	or  ( datepart(hour,@now)=@switchHr and datepart(minute, @now)>= @switchMin)
	)
	set @offset=0
else
	set @offset=-1


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
order by name

declare myCur_full cursor for 
select dbname from #temp 


open myCur_full
Fetch next from myCur_full into @dbname

while @@fetch_status = 0
begin
	if (not exists (select * from master.dbo.BackupParameter where dbname=@dbname and backuptype='Log'))
		select @path = path from master.dbo.BackupParameter where dbname='default'
	else
		select @path = path from master.dbo.BackupParameter where dbname=@dbname  and backuptype='Log'
		 
	select @dest=@path + @dbname + '_Log_' 
		+ convert(varchar,dateadd(day,@offset,@now),112)
		+'.bak'

	-- set @dbname = '[' + @dbname + ']'
	-- print 'backup log ' + @dbname + ' to Disk=''' + @dest + ''' with Stats'

	backup log @dbname to Disk=@dest with Stats
	if (@@error != 0)
	begin
		set @subject_str = 'Log backup of the ' +@dbname+ ' database on server ' + @@Servername +' failed'
		EXEC usp_sendcdomail
			@From = 'dbserver@phsa.ca', 
			@To = 'phsaimitmonitor@phsa.ca;jzhang2@phsa.ca',
			@Subject = @subject_str, 
			@Body = 'Please check the backup on the server'
	end


	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full