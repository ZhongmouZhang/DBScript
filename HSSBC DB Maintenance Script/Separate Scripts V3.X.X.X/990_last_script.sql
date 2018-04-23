 
/*******************************************************

	Create the maintenance job
	
********************************************************/

/****** Object:  Job [DBA -- Databases Maintenance]    Script Date: 10/28/2011 10:14:23 ******/

USE [msdb]
GO

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'DBA -- Databases Maintenance')
	GOTO EndSave
	
/****** Object:  Job [DBA -- Databases Maintenance]    Script Date: 11/01/2011 11:25:39 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/01/2011 11:25:40 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DBA -- Databases Maintenance', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'Database Services', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [maintenace control]    Script Date: 11/01/2011 11:25:40 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'maintenace control', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec master.dbo.hsp_maint_control', 
		@database_name=N'master', 
		@flags=2
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'every 15 minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111017, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959 
		--@schedule_uid=N'98c4c050-8064-4845-b52a-514009093a72'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO

/***********************************************************************

		Performancing the log bckup during the re-index
		
************************************************************************/
USE [msdb]
GO

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'DBA -- Log backup During Reindex')
	GOTO EndSave

/****** Object:  Job [DBA -- Log backup During Reindex]    Script Date: 05/30/2012 14:55:50 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 05/30/2012 14:55:50 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DBA -- Log backup During Reindex', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		--@notify_email_operator_name=N'Database Services', 
		@job_id = @jobId OUTPUT

IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Step_1]    Script Date: 05/30/2012 14:55:50 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Step_1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'if exists (select * from tempdb.dbo.sysobjects where id = object_id(N''tempdb.[dbo].#temp'') and xtype=''U'')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

insert into #temp 
SELECT rtrim(name)
FROM master.dbo.sysdatabases  
WHERE name NOT IN (''master'',''model'',''msdb'',''tempdb'')  
   AND DATABASEPROPERTYEX(name, ''Recovery'') IN (''FULL'',''BULK_LOGGED'') 
   and  status & 512 != 512
   and  status & 32 != 32
   and  status & 1024 != 1024 --ready only
order by name

Exec master.dbo.hsp_log_backup_database',		
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
		@freq_subday_interval=2, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20120530, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959
		--@schedule_uid=N'a59a51ab-3de8-4cc3-bd49-757a659a29fd'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO



/***********************************************************************

		reconfiure the server settting
		
************************************************************************/
use master

exec hsp_switch_job_output_file
go


-- change back the shell setting befor running this script
declare @shell_setting_before_running_script varchar(5)
select @shell_setting_before_running_script = convert(varchar(5),configure_value) from #sysconfigures_setting
exec sp_configure 'xp_cmdshell', @shell_setting_before_running_script
reconfigure  with override
go


/***********************************************************************

		register the current version --add a line
		
***********************************************************************/
use master
go

exec master.dbo.hsp_script_version_control '2.0.0.0', 'First Version of Centralizing DB Maintenance Jobs'
exec master.dbo.hsp_script_version_control '2.1.0.0', 'Adding features to configure job output file'
exec master.dbo.hsp_script_version_control '2.1.1.0', 'Adding features to clean up errorlog and reset xp_cmdshell back to the value before the maintenance job runs'
exec master.dbo.hsp_script_version_control '2.1.2.0', 'Fixing the script running error when xp_cmdshell is off and sp_send_dbmail with query issue in SQL 2008 version'
exec master.dbo.hsp_script_version_control '2.1.3.0', 'Fixing the issue in stored procedure hsp_mirror_db_failover_fullbackup, in which hsp_full_backup_database use the old version'
exec master.dbo.hsp_script_version_control '2.1.4.0', 'Delete the parameter: #excluded_from_default_backup_retention. It is not used'
-- exec master.dbo.hsp_script_version_control '2.1.5.0', 'separating the parameters for re-index and full re-index, and adding #switch_to_simple_recovery_model_when_reindexing parameter'
exec master.dbo.hsp_script_version_control '3.0.0.0', '1) Add another job,DBA -- Log backup During Reindex, for doing log backup during the re-index; 2) add #reindex_online_only_day_time and #reindex_all_day_time; 3) obsolete #full_reindex_day_of_week,#reindex_time; 4) re-write hsp_reidex stored procedure; 5) backup with compression; 6) Add #check_integrity_day_time 7) add #litespeed_for_full_backup and #litespeed_for_log_backup 8. fix an backup issue when database name contains space or special character'
exec master.dbo.hsp_script_version_control '3.0.1.0', 'Fix the online re-index issue when there is a user defined column in the table'
exec master.dbo.hsp_script_version_control '3.0.1.1', 'Fix the online re-index issue for the partitioned table'
exec master.dbo.hsp_script_version_control '3.0.1.2', 'Fix a case-sensitive issue'
exec master.dbo.hsp_script_version_control '3.0.1.3', 'Set MAXDOP to 1 to work around the issue of potential data loss when doing online paralall re-build'





go


