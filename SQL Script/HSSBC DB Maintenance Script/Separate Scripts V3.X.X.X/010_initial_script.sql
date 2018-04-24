use [master]
go

-- save the configure value
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#sysconfigures_setting') and xtype='U')
drop table #sysconfigures_setting
CREATE TABLE #sysconfigures_setting(
 configure_value int)
insert into #sysconfigures_setting
select value from sys.sysconfigures where config = 16390 -- command shell

-- trun on xp_cmdshell
exec sp_configure 'show advanced option', '1'
reconfigure  with override
exec sp_configure 'xp_cmdshell', '1'
reconfigure  with override


/*******************************************************************

		Create the version 2 configuration table
		
********************************************************************/

if not exists (select * from sysobjects where id = object_id(N'tbl_maint_setting') and xtype='U')
begin 
	create table master.dbo.tbl_maint_setting
	(
			database_name varchar (128) not null default ('default'),   
				-- Default means for all the databases. Otherwise, it is a database name
				-- If parameter_name is #free_disk_space_threshold, default for all the disk, other letter a specific drive
			parameter_name varchar(128) not null,  
			/************************************
			1.	#backup_folder:
					Changed to  #full_backup_folder
								#log_backup_folder

				#full_backup_time
				#excluded_from_default_full_backup
				
			2.	#backup_retention_day:
					Changed to	#full_backup_retention_day
								#log_backup_retention_day
			 
								
			3.	#check_integrity_time
				#excluded_from_default_check_integrity
				#check_integrity_day_time with format d hh:mm
				
			4.  obsolete the parameter: #full_reindex_day_of_week,#reindex_time and add the following parameters
			4.1	#reindex_online_only_day_time  d hh:mm (1:Monday, .... 7: Sunday. one day/record)
				#excluded_from_default_reindex_online_only
				 
			4.2 #reindex_all_day_time d hh:mm (1:Monday, .... 7: Sunday. one day/record)
				#excluded_from_default_reindex_all
			
				
			5.	#update_statistics_time
				#excluded_from_default_update_statistics

			6.	#cleanup_history_and_error_log_time
			    #backup_restore_history_retention_day
				#job_history_retention_day
				#server_error_log_retention_day
				#agent_error_log_retention_day

			7.	#check_disk_space_time
				#free_disk_space_threshold 
				#excluded_from_default_disk_space_check
				
			8.  #job_output_folder
			    #job_output_file_switch_time
			    #job_output_file_retention_day
			    
			9.  #litespeed_for_full_backup: only Y/N
				#litespeed_for_log_backup:
			    
			******************************************************/
			parameter_value varchar(128) not null
	)

	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#backup_retention_day','3')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#backup_folder','K:\SQL_Backup\')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#full_backup_time','19:00')

	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#check_integrity_time','04:00')

	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#reindex_all_day_time','7 01:00')
	
	
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#update_statistics_time','04:00')


	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#cleanup_history_and_error_log_time','16:00')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#backup_restore_history_retention_day','60')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#job_history_retention_day','14')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#server_error_log_retention_day','14')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#agent_error_log_retention_day','14')


	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#check_disk_space_time','04:00')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#check_disk_space_time','15:00')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#free_disk_space_threshold','1024')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('Q', '#excluded_from_default_disk_space_check','')

	/*************
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('D', '#free_disk_space_threshold','1024')

	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('Q', '#excluded_from_default_disk_space_check','')

	**********************************/
	
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#job_output_folder','K:\maintenance_job_log\')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#job_output_file_switch_time','16:00')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#job_output_file_retention_day','7')
	
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#litespeed_for_full_backup','N')



end

/************************************************************************

		Insert V 2.1.1.0 default settting:
		output file parameters and history and error log parameters
		
*************************************************************************/
if not exists (select * from sysobjects where id = object_id(N'tbl_maint_version_info') and xtype='U')
begin 

	create table tbl_maint_version_info
	(
		id int identity (1,1) , 
		script_name varchar(64),
		version varchar(16),
		created_by varchar(32),
		date_time datetime,
		descript varchar(6000)
	)
end

if not exists (select *   FROM [master].[dbo].[tbl_maint_version_info] where version = '2.1.1.0')
begin
	if not exists (select * from master.dbo.tbl_maint_setting where parameter_name = '#job_output_folder')
		insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
		values ('default', '#job_output_folder','K:\maintenance_job_log\')
		
	if not exists (select * from master.dbo.tbl_maint_setting where parameter_name = '#job_output_file_switch_time')
		insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
		values ('default', '#job_output_file_switch_time','16:00')
		
	if not exists (select * from master.dbo.tbl_maint_setting where parameter_name = '#job_output_file_retention_day')
		insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
		values ('default', '#job_output_file_retention_day','7')
		

	if not exists (select * from master.dbo.tbl_maint_setting where parameter_name = '#cleanup_history_and_error_log_time')
		insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
		values ('default', '#cleanup_history_and_error_log_time','16:00')

	if not exists (select * from master.dbo.tbl_maint_setting where parameter_name = '#backup_restore_history_retention_day')
		insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
		values ('default', '#backup_restore_history_retention_day','60')

	if not exists (select * from master.dbo.tbl_maint_setting where parameter_name = '#job_history_retention_day')
		insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
		values ('default', '#job_history_retention_day','14')

	if not exists (select * from master.dbo.tbl_maint_setting where parameter_name = '#server_error_log_retention_day')
		insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
		values ('default', '#server_error_log_retention_day','14')

	if not exists (select * from master.dbo.tbl_maint_setting where parameter_name = '#agent_error_log_retention_day')
		insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
		values ('default', '#agent_error_log_retention_day','14')
end

go

/************************************************************************

		Upgrade to 3.0.0.0 default settting:
		output file parameters and history and error log parameters
		
*************************************************************************/
use master
go

declare @day int
declare @dw_str varchar(20), @X xml
SET DATEFIRST 1

if not exists (select *   FROM [master].[dbo].[tbl_maint_version_info] where version = '3.0.0.0')
	and  exists (select * from [master].[dbo].[tbl_maint_setting] where parameter_name='#reindex_time') 
	and not exists (select * from [master].[dbo].[tbl_maint_setting] 
					where parameter_name in ('#reindex_online_only_day_time','#reindex_all_day_time') )
begin
	select @dw_str = parameter_value from master.dbo.tbl_maint_setting where parameter_name = '#full_reindex_day_of_week'
	SELECT @X = CONVERT(xml,'<root><s>' + REPLACE(@dw_str,',','</s><s>') + '</s></root>')

	set @day = 1
	while @day<=7
	begin
		if @day in (SELECT [Value] = T.c.value('.','varchar(20)') FROM @X.nodes('/root/s') T(c))
			insert into tbl_maint_setting
			select database_name, '#reindex_all_day_time', CONVERT(varchar(1),@day)+ ' ' + parameter_value
			from tbl_maint_setting
			where parameter_name='#reindex_time'
		else
			insert into tbl_maint_setting
			select database_name, '#reindex_online_only_day_time', CONVERT(varchar(1),@day)+ ' ' + parameter_value
			from tbl_maint_setting
			where parameter_name='#reindex_time'
			
		set @day = @day + 1 
	end

	delete from tbl_maint_setting where parameter_name in ('#full_reindex_day_of_week','#reindex_time')
	
end

if exists (select * from [master].[dbo].[tbl_maint_setting] where parameter_name='#check_integrity_time') 
begin
	insert into tbl_maint_setting 
	select database_name, '#check_integrity_day_time', '6 ' + parameter_value
	from [master].[dbo].[tbl_maint_setting] 
	where parameter_name='#check_integrity_time'
	delete from tbl_maint_setting where parameter_name = '#check_integrity_time'
end

go


/**********************************************************************

		Create a log table for logging the action
		
***********************************************************************/
if not exists (select * from sysobjects where id = object_id(N'tbl_maint_logging') and xtype='U')
	create table master.dbo.tbl_maint_logging
	(
		ID int identity (1,1) primary key clustered,
		eventdate datetime, 
		action varchar(200),
		description varchar(8000)
	)

go
/******************************************************************************

		Unchcke the SQL Agent History property for it will be customized 
		by the tbl_maint_settting table
		
*******************************************************************************/
USE [msdb]
GO
EXEC msdb.dbo.sp_set_sqlagent_properties @jobhistory_max_rows=-1, 
		@jobhistory_max_rows_per_job=-1
GO


/*******************************************************************************

		drop stored procedures, jobs and backup table of the Version one's 
		
********************************************************************************/

use [master]
go

-- drop stored procedures
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_TestCreateSubfolder') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_TestCreateSubfolder

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_DeleteOldBackup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_DeleteOldBackup

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_FullBackupAllDB') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[hsp_FullBackupAllDB]

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_LogSwitchAndLogBackup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_LogSwitchAndLogBackup

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_ScriptVersionControl') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure dbo.hsp_ScriptVersionControl

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].dba_DiskSpaceAlert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure dbo.dba_DiskSpaceAlert

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].dba_IntegrityCheck') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure dbo.dba_IntegrityCheck

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].dba_OptimizeIndexes') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure dbo.dba_OptimizeIndexes

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].dba_UpdateStats') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure dbo.dba_UpdateStats
GO


--  drop the jobs
USE [msdb]
GO

declare @job_id_v uniqueidentifier

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'dba_Cleanup History')
begin 
	SELECT @job_id_v = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'dba_Cleanup History'
	EXEC msdb.dbo.sp_delete_job @job_id=@job_id_v, @delete_unused_schedule=1
end

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'dba_Disk Space Alert')
begin 
	SELECT @job_id_v = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'dba_Disk Space Alert'
	EXEC msdb.dbo.sp_delete_job @job_id=@job_id_v, @delete_unused_schedule=1
end

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'dba_Full and Trn Log Backups')
begin 
	SELECT @job_id_v = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'dba_Full and Trn Log Backups'
	EXEC msdb.dbo.sp_delete_job @job_id=@job_id_v, @delete_unused_schedule=1
end

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'dba_Integrity Check')
begin 
	SELECT @job_id_v = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'dba_Integrity Check'
	EXEC msdb.dbo.sp_delete_job @job_id=@job_id_v, @delete_unused_schedule=1
end

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'dba_Optimize Indexes')
begin 
	SELECT @job_id_v = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'dba_Optimize Indexes'
	EXEC msdb.dbo.sp_delete_job @job_id=@job_id_v, @delete_unused_schedule=1
end

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'dba_Update Statistics')
begin 
	SELECT @job_id_v = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'dba_Update Statistics'
	EXEC msdb.dbo.sp_delete_job @job_id=@job_id_v, @delete_unused_schedule=1
end

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'dba_Weekly Reindex')
begin 
	SELECT @job_id_v = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'dba_Weekly Reindex'
	EXEC msdb.dbo.sp_delete_job @job_id=@job_id_v, @delete_unused_schedule=1
end

-- backup_parameter migration
use master
go

if exists (select * from sysobjects where id = object_id(N'tbl_backup_parameter') and xtype='U')
begin
	if (exists (select * from master.dbo.tbl_backup_parameter where dbname = 'default'))
		update dbo.tbl_maint_setting
		set parameter_value = (select top 1 path from master.dbo.tbl_backup_parameter where dbname = 'default')
		where parameter_name = '#backup_folder' 
		
	if (exists (select * from master.dbo.tbl_backup_parameter where dbname = '#FullBackupTime'))
		update dbo.tbl_maint_setting
		set parameter_value = (select top 1 path from master.dbo.tbl_backup_parameter where dbname = '#FullBackupTime')
		where parameter_name = '#full_backup_time' 
		
	drop table tbl_backup_parameter
end 
	
go



