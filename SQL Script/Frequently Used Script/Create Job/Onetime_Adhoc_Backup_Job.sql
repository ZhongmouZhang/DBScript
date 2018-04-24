USE [msdb]
GO
/****** Object:  Operator [Database Services]    Script Date: 07/04/2013 14:38:49 ******/
if (exists (select * from msdb.dbo.sysoperators where name = N'Adhoc Backup'))
	exec msdb.dbo.sp_delete_operator @name = N'Adhoc Backup' 
EXEC msdb.dbo.sp_add_operator @name=N'Adhoc Backup', 
		@enabled=1, 
		@weekday_pager_start_time=90000, 
		@weekday_pager_end_time=180000, 
		@saturday_pager_start_time=90000, 
		@saturday_pager_end_time=180000, 
		@sunday_pager_start_time=90000, 
		@sunday_pager_end_time=180000, 
		@pager_days=0, 
		@email_address=N'james.zhang@hssbc.ca', 
		@category_name=N'[Uncategorized]'
GO

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'DBA -- Adhoc Backup')
	GOTO EndSave
	
/****** Object:  Job [DBA -- Adhoc Backup]    Script Date: 07/04/2013 15:35:23 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 07/04/2013 15:35:23 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DBA -- Adhoc Backup', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=3, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'Adhoc Backup', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Adhoc Backup]    Script Date: 07/04/2013 15:35:23 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Adhoc Backup', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'use master
go
 
declare @dbname varchar(1000), @folder varchar(1000)
 
set @dbname = ''LHEOC''
set @folder = ''\\srvnetapp01\SQL_Back$\Adhoc\''   -- temporary backup destination

--select top 1 @folder = path from master.dbo.BackupParameter where backuptype=''Specific'' or dbname = ''default''
print ''Dbname: '' + @dbname 
print ''Path: '' + @folder

declare @dest varchar(1000)
select @dest=@folder + replace(@@servername,''\'',''_'') + ''_'' + @dbname + ''_Adhoc_''
	+convert(varchar,getdate(),112)+''_'' 
	+ 
	case when datepart(hour,getdate())>9 then convert(varchar,datepart(hour,getdate()))
		 else ''0'' + convert(varchar,datepart(hour,getdate()))
	end
	+
	case when datepart(minute,getdate())>9 then  convert(varchar,datepart(minute,getdate()))
		 else ''0'' + convert(varchar,datepart(minute,getdate()))
	end
	+ ''00''
	+''.bak''
	
print ''Destination: '' + @dest

backup database @dbname to Disk=@dest with init,STATS -- , compression
', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'One time', 
		@enabled=1, 
		@freq_type=1, 
		@freq_interval=0, 
		@freq_subday_type=0, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20130704, 
		@active_end_date=99991231, 
		@active_start_time=160000, 
		@active_end_time=235959
		--@schedule_uid=N'f6d0e8bf-d888-4050-9eaf-167ae10fddfd'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO


