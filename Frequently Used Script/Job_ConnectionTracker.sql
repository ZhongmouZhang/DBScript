 -- Script generated on 3/26/2013 5:05 PM
-- By: PHSABC\x-james
-- Server: VSQLS2K\ISQLS2K

BEGIN TRANSACTION            
  DECLARE @JobID BINARY(16)  
  DECLARE @ReturnCode INT    
  SELECT @ReturnCode = 0     
IF (SELECT COUNT(*) FROM msdb.dbo.syscategories WHERE name = N'[Uncategorized (Local)]') < 1 
  EXECUTE msdb.dbo.sp_add_category @name = N'[Uncategorized (Local)]'

  -- Delete the job with the same name (if it exists)
  SELECT @JobID = job_id     
  FROM   msdb.dbo.sysjobs    
  WHERE (name = N'DBA -- ConnectionTracker')       
  IF (@JobID IS NOT NULL)    
  BEGIN  
  -- Check if the job is a multi-server job  
  IF (EXISTS (SELECT  * 
              FROM    msdb.dbo.sysjobservers 
              WHERE   (job_id = @JobID) AND (server_id <> 0))) 
  BEGIN 
    -- There is, so abort the script 
    RAISERROR (N'Unable to import job ''DBA -- ConnectionTracker'' since there is already a multi-server job with this name.', 16, 1) 
    GOTO QuitWithRollback  
  END 
  ELSE 
    -- Delete the [local] job 
    EXECUTE msdb.dbo.sp_delete_job @job_name = N'DBA -- ConnectionTracker' 
    SELECT @JobID = NULL
  END 

BEGIN 

  -- Add the job
  EXECUTE @ReturnCode = msdb.dbo.sp_add_job @job_id = @JobID OUTPUT , @job_name = N'DBA -- ConnectionTracker', @owner_login_name = N'PHSABC\x-james', @description = N'No description available.', @category_name = N'[Uncategorized (Local)]', @enabled = 1, @notify_level_email = 0, @notify_level_page = 0, @notify_level_netsend = 0, @notify_level_eventlog = 2, @delete_level= 0
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the job steps
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobstep @job_id = @JobID, @step_id = 1, @step_name = N'connections', @command = N'  --Create V2 table if not exist
if NOT exists (select 1 from master.dbo.sysobjects where id = object_id(N''master.[dbo].[TBL_ConnectTracker]'') and OBJECTPROPERTY(id, ''IsUserTable'') = 1) 
	CREATE TABLE [dbo].[TBL_ConnectTracker] (
		[hostname] [varchar] (256)  
		,[loginame] [varchar] (256)  
		,[dbid] [int] NULL 
		,[Firstlogin] [datetime] NULL 
		,[Lastlogin] [datetime] NULL 
		,[Program_Name] [varchar](256)) 

-- Insert any newly found connections [THIS FAILS with # columns supplied not matched up]
Insert into master.dbo.TBL_ConnectTracker
   select sp1.hostname, sp1.loginame, sp1.dbid , max(login_time) as ''FirstLogin'', null as ''LastLogin'' , null as ''Program_Name''
   from  master.dbo.sysprocesses sp1
where sp1.hostname <> '''' and sp1.spid <> @@SPID
   and RTRIM(sp1.hostname) + '':'' + RTRIM(sp1.Loginame) + ''-'' + convert(varchar,sp1.dbid) not in
      (Select RTRIM(hostname) + '':'' + RTRIM(Loginame) + ''-'' + convert(varchar,dbid) from master.dbo.TBL_ConnectTracker)
group by sp1.hostname, sp1.loginame, sp1.dbid

--Update stats on any existing connections that are found
Update master.dbo.TBL_ConnectTracker
	Set LastLogin = sp.login_time, Program_Name = sp.Program_name
	FROM master.dbo.sysprocesses sp  JOIN master.dbo.TBL_ConnectTracker at on at.hostname = sp.hostname and at.loginame = sp.loginame and sp.dbid = at.dbid
	where sp.hostname <> ''''

/***********

select hostname, loginame, db_name(dbid) database_name, firstlogin, lastlogin, program_name 
from master.dbo.TBL_connectTracker
where not loginame in (''PHSABC\x-james'')
order by database_name, lastlogin desc


**************/', @database_name = N'master', @server = N'', @database_user_name = N'', @subsystem = N'TSQL', @cmdexec_success_code = 0, @flags = 0, @retry_attempts = 0, @retry_interval = 1, @output_file_name = N'', @on_success_step_id = 0, @on_success_action = 1, @on_fail_step_id = 0, @on_fail_action = 2
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 
  EXECUTE @ReturnCode = msdb.dbo.sp_update_job @job_id = @JobID, @start_step_id = 1 

  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the job schedules
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id = @JobID, @name = N'Every 5 minutes', @enabled = 1, @freq_type = 4, @active_start_date = 20130326, @active_start_time = 0, @freq_interval = 1, @freq_subday_type = 4, @freq_subday_interval = 5, @freq_relative_interval = 0, @freq_recurrence_factor = 0, @active_end_date = 99991231, @active_end_time = 235959
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

  -- Add the Target Servers
  EXECUTE @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @JobID, @server_name = N'(local)' 
  IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback 

END
COMMIT TRANSACTION          
GOTO   EndSave              
QuitWithRollback:
  IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION 
EndSave: 


