USE [master]
GO
/****** Object:  StoredProcedure [dbo].[usp_CopyBackupFileToAnotherServer]    Script Date: 07/22/2014 15:25:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
use master
exec sp_configure 'show advanced option', '1'
reconfigure with override
go
exec sp_configure 'Ole Automation Procedures', '1'
exec sp_configure 'xp_cmdshell', '1'
reconfigure with override
go 

	[usp_CopyBackupFileToAnotherServer] 
		@dbname = 'PSLS',
		@source_path = 'H:\SQL_Backup\PSLS\',
		@dest_path = '\\10.1.36.183\SQL_Backup_VPNGSQD01\'
*/

ALTER PROC [dbo].[usp_CopyBackupFileToAnotherServer]
@dbname varchar(128),
@source_path varchar(512),    
@dest_path varchar(1024)

as
declare @stt varchar (5000)
declare @filename VARCHAR(100)    

-- get the latest backup file name    
set @stt = 'dir ' + @source_path + ' /B'    
CREATE TABLE #fileList(line varchar(2000))    
INSERT INTO #fileList     
     EXEC xp_cmdshell @stt    
SELECT   
 @filename=line   
FROM #fileList     
WHERE   
 line like  @dbname + '[_]FULL[_]%'    
 and right(line,19) =     
        (select max(right(line,19))   
      from #fileList     
      where line like @dbname + '[_]FULL[_]%' and len(line)=len(@dbname)+25)    
DROP TABLE #fileList    
--print @filename

---- delete the old backup file in dest server   
set @stt = 'del "' + @dest_path + '"' + '*.bak' 
exec master.dbo.xp_cmdshell @stt

-- copy the latest backup file to dest server    
set @stt = 'xcopy ' + @source_path + @filename + ' ' + @dest_path 
exec master.dbo.xp_cmdshell @stt

----------------------------------------------------------------------------------------------

USE [msdb]
GO
/****** Object:  Job [Push the PSLS Lastest Backup File To STG]    Script Date: 07/22/2014 15:29:26 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 07/22/2014 15:29:27 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Push the PSLS Lastest Backup File To STG', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'PHSAPNG\s-bonital', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Push the PSLS Lastest Backup File To STG]    Script Date: 07/22/2014 15:29:27 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Push the PSLS Lastest Backup File To STG', 
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
exec sp_configure ''show advanced option'', ''1''
reconfigure with override
go
exec sp_configure ''Ole Automation Procedures'', ''1''
exec sp_configure ''xp_cmdshell'', ''1''
reconfigure with override
go 

	[usp_CopyBackupFileToAnotherServer] 
		@dbname = ''PSLS'',
		@source_path = ''\\VPNGSQD01\H$\SQL_Backup\PSLS\'',
		@dest_path = ''\\10.1.36.183\SQL_Backup_VPNGSQD01\''', 
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
		@active_start_date=20110823, 
		@active_end_date=99991231, 
		@active_start_time=193000, 
		@active_end_time=235959
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:



----------------------------------------  create the logins in new SQL 2008R2 ------------------------

/* sp_help_revlogin script 
** Generated Jul 22 2014  3:30PM on VPNGSQD01\IPNGSQD01 */
 
 
-- Login: BUILTIN\Administrators
CREATE LOGIN [BUILTIN\Administrators] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: NT AUTHORITY\SYSTEM
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: PHSAPNG\grp_clspngsqd
CREATE LOGIN [PHSAPNG\grp_clspngsqd] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: sysadm
CREATE LOGIN [sysadm] WITH PASSWORD = 0x0100B61AEA974A7CEFC0B0D496D712FAB03471B993ABE591883F HASHED, SID = 0xA0D63D2F6A4AD0438DBB7196A9961924, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = OFF
 
-- Login: datixcrm
CREATE LOGIN [datixcrm] WITH PASSWORD = 0x010087D04E29762A154DC314F4589BC203951AF68D1F888CDAAA HASHED, SID = 0x771C6904990244449CA0656BD623B9CE, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = OFF
 
-- Login: crystal
CREATE LOGIN [crystal] WITH PASSWORD = 0x0100C55315EF43AF4044D28A432EA2581C4D89C357241FB4120B HASHED, SID = 0xE343490FCF31744CABD1849D39FF0555, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = OFF
 
-- Login: iiruser
CREATE LOGIN [iiruser] WITH PASSWORD = 0x010039FE746BB6DBD16712EA2ADAFA0C4AC4A8E4A04E18B95742 HASHED, SID = 0x1EC4FCD31D098547984472505D69CA32, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = OFF

