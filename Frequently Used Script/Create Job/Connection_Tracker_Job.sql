 USE [msdb]
GO

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'Connect Tracker')
	GOTO EndSave

/****** Object:  Job [Connect Tracker]    Script Date: 07/19/2012 14:41:04 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 07/19/2012 14:41:04 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Connect Tracker', 
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
/****** Object:  Step [Tracker]    Script Date: 07/19/2012 14:41:04 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Tracker', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N' --Create V2 table if not exist
if NOT exists (select 1 from master.dbo.sysobjects where id = object_id(N''master.[dbo].[ConnectTracker]'') and OBJECTPROPERTY(id, ''IsUserTable'') = 1) 
	CREATE TABLE [dbo].[ConnectTracker] (
		[hostname] [varchar] (25)  
		,[loginame] [varchar] (25)  
		,[dbid] [int] NULL 
		,[Firstlogin] [datetime] NULL 
		,[Lastlogin] [datetime] NULL 
		,[Program_Name] [varchar](255)) 

-- Insert any newly found connections [THIS FAILS with # columns supplied not matched up]
Insert into master.dbo.ConnectTracker
   select sp1.hostname, sp1.loginame, sp1.dbid , max(login_time) as ''FirstLogin'', null as ''LastLogin'' , null as ''Program_Name''
   from  master.dbo.sysprocesses sp1
where sp1.hostname <> '''' and sp1.spid <> @@SPID
   and RTRIM(sp1.hostname) + '':'' + RTRIM(sp1.Loginame) + ''-'' + convert(varchar,sp1.dbid) not in
      (Select RTRIM(hostname) + '':'' + RTRIM(Loginame) + ''-'' + convert(varchar,dbid) from master.dbo.ConnectTracker)
group by sp1.hostname, sp1.loginame, sp1.dbid

--Update stats on any existing connections that are found
Update master.dbo.ConnectTracker
	Set LastLogin = sp.login_time, Program_Name = sp.Program_name
	FROM master.dbo.sysprocesses sp  JOIN master.dbo.ConnectTracker at on at.hostname = sp.hostname and at.loginame = sp.loginame and sp.dbid = at.dbid
	where sp.hostname <> ''''

/***********

select hostname, loginame, db_name(dbid) database_name, firstlogin, lastlogin, program_name 
from master.dbo.connectTracker
where not loginame in (''PHSABC\x-james'')
order by database_name, lastlogin desc


**************/', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=3, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20120719, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959 
		--@schedule_uid=N'f2788949-0683-463f-a5ce-bafc3afc93c5'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO


