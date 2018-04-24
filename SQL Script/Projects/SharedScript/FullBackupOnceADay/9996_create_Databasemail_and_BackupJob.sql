  /************************************************
 Config the job alert:
 1. configure Database Mail
 2.SQL Server Agent => Alert System Page, enable the mail profile; Restart the SQL Agent
 3. Create the operators
 4. Configure the job notification
 
 ********************************************************/

-- Configure Database Mail

 EXECUTE msdb.dbo.sysmail_add_account_sp
    @account_name = 'DBAlert',
    @description = 'Mail account for Database Mail',
    @email_address = 'dbserver@phsa.ca',
    @display_name = 'MyAccount',
    @mailserver_name = 'SRVEXHT01' -- New PNG Mail Relay: SVMPNGSMTP


EXECUTE msdb.dbo.sysmail_add_profile_sp
       @profile_name = 'PublicMailProfile',
       @description = 'Profile used for database mail'

EXECUTE msdb.dbo.sysmail_add_profileaccount_sp
    @profile_name = 'PublicMailProfile',
    @account_name = 'DBAlert',
    @sequence_number = 1

EXECUTE msdb.dbo.sysmail_add_principalprofile_sp
    @profile_name = 'PublicMailProfile',
    @principal_name = 'public',
    @is_default = 1 ;
go

exec sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
exec sp_configure 'Database Mail XPs', 1;
GO
RECONFIGURE
GO
declare @body1 varchar(100)
set @body1 = 'Server :'+@@servername+ ' My First Database Email '
EXEC msdb.dbo.sp_send_dbmail @recipients='jzhang2@phsa.ca',
    @subject = 'My Mail Test',
    @body = @body1,
    @body_format = 'HTML' ;
    
 
 ---2.SQL Server Agent => Alert System Page, enable the mail profile; Restart the SQL Agent
USE [msdb]
GO
EXEC master.dbo.xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'SOFTWARE\Microsoft\MSSQLServer\SQLServerAgent', N'DatabaseMailProfile', N'REG_SZ', N'PublicMailProfile'
GO


--- 3. Create the operators

USE [msdb]
GO
EXEC msdb.dbo.sp_add_operator @name=N'DB Services Alert Mail', 
		@enabled=1, 
		@pager_days=0, 
		@email_address=N'james.zhang@hssbc.ca;Bonita.Luo@hssbc.ca'
		
/**************************************************************

--- 4. Create a bakcup job with schedule every hour; and Configure the job notification

***********************************/

USE [msdb]
GO

/****** Object:  Job [Bakcup -- Full and Log]    Script Date: 03/22/2011 14:18:17 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 03/22/2011 14:18:17 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
Declare @scheduleId int

EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Bakcup -- Full and Log', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DB Services Alert Mail', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [step 1]    Script Date: 03/22/2011 14:18:17 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'step 1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec master.dbo.[hsp_LogSwitchAndLogBackup]', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'daily', 
		@enabled=1, 
		@freq_type=4, -- 1: once; 4: daily
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=1, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20110309, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_id=@scheduleId
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO


