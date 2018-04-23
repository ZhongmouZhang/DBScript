 USE [msdb]
GO

/****** Object:  Job [Xtend - Pushing non-patient XtendConsole to workstations]    Script Date: 05/03/2011 14:08:04 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 05/03/2011 14:08:04 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Xtend - Pushing non-patient XtendConsole to workstations', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'PHSABC\x-james', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Creating non-patient backup]    Script Date: 05/03/2011 14:08:05 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Creating non-patient backup', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'--step 1
-- step 1 create non-patient backup 

declare @From_str varchar(500)

backup database XtendConsole to Disk=''J:\MSSQL.1\MSSQL\Backup\XtendConsole_Full.bak'' with init,STATS 

restore database temp_XtendConsole
from disk = ''J:\MSSQL.1\MSSQL\Backup\XtendConsole_Full.bak''
with move ''XtendConsole'' to ''J:\MSSQL.1\MSSQL\Data\temp_XtendConsole_data.mdf'',
	 move ''XtendConsole_Log''  to ''J:\MSSQL.1\MSSQL\Data\temp_XtendConsole_log.ldf'',replace, stats

if (@@error != 0)
begin
		set @From_str = @@Servername + ''@phsa.ca''
		EXEC usp_sendcdomail
			@From = @From_str, 
			@To = ''jzhang2@phsa.ca'',
			@Subject = ''The restoration of temp_XtendConsole database failed'' , 
			@Body = ''Please check the prepare non-patient database job on the server''
end

alter database temp_XtendConsole set  RECOVERY SIMPLE 
go

use temp_XtendConsole
go

delete from temp_XtendConsole.dbo.xkm where format=9
truncate table dbo.Statistic
go

waitfor delay ''00:00:20''
use master
go

dbcc shrinkdatabase (TEMP_XtendConsole, 0)
go

declare @From_str varchar(100)
backup database temp_XtendConsole
to disk = ''J:\MSSQL.1\MSSQL\Backup\NonPatientXtendConsole.bak''
with init,stats

if (@@error != 0)
begin
		set @From_str = @@Servername + ''@phsa.ca''
		EXEC usp_sendcdomail
			@From = @From_str, 
			@To = ''jzhang2@phsa.ca'',
			@Subject = ''The backup of temp_XtendConsole database failed'' , 
			@Body = ''Please check the prepare non-patient database job on the server''
end
go

use master
go

drop database temp_XtendConsole
go 

', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Refresh XtendArchive]    Script Date: 05/03/2011 14:08:05 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Refresh XtendArchive', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'declare @From_str varchar(500)

exec master.dbo.usp_killDBConnections ''XtendArchive''

restore database XtendArchive
from disk = ''J:\MSSQL.1\MSSQL\Backup\XtendConsole_Full.bak''
with move ''XtendConsole'' to ''J:\MSSQL.1\MSSQL\Data\XtendArchive_data.mdf'',
	 move ''XtendConsole_Log''  to ''J:\MSSQL.1\MSSQL\Data\XtendArchive_log.ldf'',replace, stats

if (@@error != 0)
begin
		set @From_str = @@Servername + ''@phsa.ca''
		EXEC usp_sendcdomail
			@From = @From_str, 
			@To = ''jzhang2@phsa.ca'',
			@Subject = ''The restoration of temp_XtendConsole database failed'' , 
			@Body = ''Please check the prepare non-patient database job on the server''
end

', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Pushing the non-patient XtendConsole to workstation]    Script Date: 05/03/2011 14:08:05 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Pushing the non-patient XtendConsole to workstation', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- step 2 Pushing the backup to workstations

 exec sp_configure ''show advanced option'', ''1''
reconfigure
go
exec sp_configure ''Ole Automation Procedures'', ''1''
exec sp_configure ''xp_cmdshell'', ''1''
reconfigure
go 

declare @retry int
declare @destFolder varchar(500)
declare @sourceFile varchar(500)
declare @returnedCode int
declare @subject_str varchar(500)
declare @From_str varchar(500)
declare @sttm_str varchar (5000)

-- drop table #temp
create TABLE #temp(
	[EventDate] [datetime] NULL ,
	[SourceFileName] [varchar] (500)  ,
	Destination varchar(500),
	[Status] [varchar] (50)  
)


declare  @workstation table
(
	wk_folder varchar(50)
)

insert into @workstation values (''\\79404cw\restore\'')  -- admin
insert into @workstation values (''\\79405cw\restore\'')  -- admin
insert into @workstation values (''\\79406cw\restore\'')  -- admin
insert into @workstation values (''\\79415cw\restore\'')  -- admin
insert into @workstation values (''\\79416cw\restore\'')  -- admin
insert into @workstation values (''\\79417cw\restore\'')  -- admin
insert into @workstation values (''\\79516phsait\restore\'')  -- admin



set @sourceFile = ''J:\MSSQL.1\MSSQL\Backup\NonPatientXtendConsole.bak''

declare myCur cursor for 
select wk_folder from @workstation

open MyCur
Fetch next from MyCur into @destFolder

while @@fetch_status = 0
begin 
	set @retry = 0
	set @returnedCode = 0

	-- try the copy three time
	while (@retry < 3)
	begin
		set @sttm_str = ''copy '' + @sourceFile + ''  '' + @destFolder
		--print @sttm_str
		truncate table #temp
		insert into #temp (status)
		EXEC master.dbo.xp_cmdshell @sttm_str
		update #temp
		set EventDate = getdate(), 
			SourceFilename=@sourceFile, 
			Destination = @destFolder
		insert into master.dbo.FilePushLog
		select * from #temp where status is not null

		set @returnedCode = @@error
		if @returnedCode=0
			break
	    else 
		begin
			set @retry = @retry + 1
			-- sleep certain time
			waitfor delay ''00:01:00''
		end
	end
	Fetch next from MyCur into @destFolder
end

close myCur
deallocate myCur

drop table #temp
go


--select * from #temp
', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20090311, 
		@active_end_date=99991231, 
		@active_start_time=173000, 
		@active_end_time=235959, 
		@schedule_uid=N'2cea11c0-5a4d-4795-9502-0a583404c776'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO


