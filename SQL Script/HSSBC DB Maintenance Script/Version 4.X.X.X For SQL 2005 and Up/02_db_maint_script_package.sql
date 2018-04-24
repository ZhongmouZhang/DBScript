-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\010_initial_script.sql  ---------------------------------------------
---
---
---
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
			1.	#backup_folder
				#full_backup_time
				#excluded_from_default_full_backup
				
			2.	#backup_retention_day; 
								
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

/*******
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#reindex_online_only_day_time','1 01:00')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#reindex_online_only_day_time','2 01:00')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#reindex_online_only_day_time','3 01:00')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#reindex_online_only_day_time','4 01:00')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#reindex_online_only_day_time','5 01:00')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#reindex_online_only_day_time','6 01:00')
*************/
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





-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\020_hsp_script_version_control.sql  ---------------------------------------------
---
---
---
 /*************************************************************************

	Version Control Stored procedure
	
**************************************************************************/
USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_script_version_control') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_script_version_control
GO


create   proc [dbo].hsp_script_version_control
@version varchar(16),
@descript varchar(6000)
as
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

if exists (select * from sysobjects where id = object_id(N'tbl_maint') and xtype='U')   -- version 1 table
begin 
	insert into tbl_maint_version_info (script_name, version, created_by, date_time)
	select script_name, version, created_by, date_time from tbl_maint
	
	drop table tbl_maint
end

if not exists (select * from tbl_maint_version_info where version = @version)
	insert into tbl_maint_version_info values ('DB Maintenance Scripts', @version, SUSER_NAME(), getdate(),@descript)

go




-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\030_hsp_get_candidate_database_list.sql  ---------------------------------------------
---
---
---
 
--------------------------------------------------------------------------------------------------------------
--
--
--
--       Version 2 script Start from here
--
--
--
--
-------------------------------------------------------------------------------------------------------------



/*********************************************************************************

		Get Database List
		
**********************************************************************************/

use [master]
go


if exists (select * from dbo.sysobjects where id = object_id(N'hsp_get_candidate_database_list') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_get_candidate_database_list
GO


CREATE         proc hsp_get_candidate_database_list
@parameter varchar(500),
@excluded_parameter varchar(500),
@current_time datetime
as
truncate table #temp
SET DATEFIRST 1

if (@parameter in ('#reindex_online_only_day_time', '#reindex_all_day_time', '#check_integrity_day_time'))
begin
	if exists 	
		(select * from master.dbo.tbl_maint_setting
				where  parameter_name= @parameter and database_name = 'default'
					and datepart(dw,@current_time) = CONVERT (int, substring(parameter_value,1,1))  -- the same day
					and @current_time between convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + substring(parameter_value,3,5) + ':00')
								 and dateadd(minute, 10, convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + substring(parameter_value,3,5) + ':00'))
		)
	begin 
	 
		insert into #temp 
		select rtrim(name) from master.sys.databases db
		where name not in ('tempdb','distribution') 
			and not exists (select * from master.dbo.tbl_maint_setting bp 
							where parameter_name in (@excluded_parameter, @parameter) 
								and db.name=bp.database_name)
			and  state = 0
			
		/******** this is for SQL 2000 compatible version
		select rtrim(name) from master.dbo.sysdatabases db
		where name not in ('tempdb','distribution') 
			and not exists (select * from master.dbo.tbl_maint_setting bp 
							where parameter_name in (@excluded_parameter, @parameter) 
								and db.name=bp.database_name)
			and  status & 512 != 512 -- off line 
			and  status & 32 != 32
			and  status & 1024 != 1024 --ready only 
		**********************/
	end

	insert into #temp 
	select database_name from master.dbo.tbl_maint_setting 
	where parameter_name = @parameter 
		and database_name <> 'default'
		and datepart(dw,@current_time) = CONVERT (int, substring(parameter_value,1,1))  -- the same day
		and @current_time between convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + substring(parameter_value,3,5) + ':00')
								 and dateadd(minute, 10, convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + substring(parameter_value,3,5) + ':00'))
		and exists (select * from master.dbo.sysdatabases db 
					where db.name = database_name 
						and  status & 512 != 512 -- off line 
						and  status & 32 != 32
						and  status & 1024 != 1024 --ready only 
					)
		and not database_name in (select dbname from #temp)

end
else
begin
	if exists 	
		(select * from master.dbo.tbl_maint_setting
				where  parameter_name= @parameter and database_name = 'default'
					and @current_time between convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + parameter_value + ':00')
								 and dateadd(minute, 10, convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + parameter_value + ':00'))
		)
	begin  
		insert into #temp 
		select rtrim(name) from master.dbo.sysdatabases db
		where name not in ('tempdb','distribution') 
			and not exists (select * from master.dbo.tbl_maint_setting bp 
							where parameter_name in (@excluded_parameter, @parameter) 
								and db.name=bp.database_name)
			and  status & 512 != 512 -- off line 
			and  status & 32 != 32
			and  status & 1024 != 1024 --ready only 
	end

	insert into #temp 
	select database_name from master.dbo.tbl_maint_setting 
	where parameter_name = @parameter 
		and database_name <> 'default'
		and @current_time between convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + parameter_value + ':00')
								 and dateadd(minute, 10, convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + parameter_value + ':00'))
		and exists (select * from master.dbo.sysdatabases db 
					where db.name = database_name 
						and  status & 512 != 512 -- off line 
						and  status & 32 != 32
						and  status & 1024 != 1024 --ready only 
					)
		and not database_name in (select dbname from #temp)
end
go






-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\040_hsp_test_create_subfolder.sql  ---------------------------------------------
---
---
---
 
/*********************************************************************

	Test if there is a corresponding database subfolder in a specified 
	path. If not, create one for the database
	
**********************************************************************/

use master
go 

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_test_create_subfolder') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_test_create_subfolder
GO

-- hsp_TestCreateSubfolder '\\srvnetapp03\SQL_Back$\ZVMSQ2K801\', 'master'

CREATE         proc hsp_test_create_subfolder
@path varchar(1024),
@dbname varchar(1024)
as

declare @stt varchar (5000)

-- delete the existing full backups
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#subfolderList') and xtype='U')
drop table #subfolderList
CREATE TABLE #subfolderList(line varchar(2000))

set @stt = 'dir "' + @path + '" /B /A:D'
INSERT INTO #subfolderList 
EXEC xp_cmdshell @stt

--select * from #subfolderList

if not exists (select * from #subfolderList where line = @dbname)
begin 
	set @stt = 'md "' + @path + @dbname +'" '
	EXEC xp_cmdshell @stt
end

go
-- select * from #subfolderList





-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\050_hsp_delete_obsolete_backup.sql  ---------------------------------------------
---
---
---
 
/*********************************************************************

		Delete the backup older than the retention day
	exec hsp_delete_obsolete_backup 2, 'BookStore'
**********************************************************************/
use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_delete_obsolete_backup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_delete_obsolete_backup
GO

CREATE         proc dbo.hsp_delete_obsolete_backup
@flag int, -- 1: delete full backup   2: delete log backup
@database_name varchar(512) = ''   -- default is for all the databases
as

declare @path varchar(1024)
declare @filename varchar (512)
declare @stt varchar (5000)
declare @RetentionDay int
declare @match_pattern varchar(512)
declare @one_db char(1)

-- delete the existing full backups
-- create the two temp tables for candidate file list
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#DeletingFileList') and xtype='U')
drop table #DeletingFileList
CREATE TABLE #DeletingFileList(line varchar(2000))

-- Get all the candidate backup files
set @path = ''
while 1=1
begin 
	select @path = min(parameter_value) 
	from master.dbo.tbl_maint_setting
	where parameter_name = '#backup_folder' and parameter_value > @path
	if @path is null 		
		break
	set @stt = 'dir "' + @path + '" /S /B'  -- return the full path for the candidate files
	INSERT INTO #fileList 
    EXEC xp_cmdshell @stt
end
	
-- select to-be-deleted files
if @database_name = ''
	set @one_db = 'N'
else
	set @one_db = 'Y'
while 1=1
begin
	if @one_db = 'N'
		select @database_name = MIN(name)
		from master.dbo.sysdatabases db
		where name > @database_name
			and name not in ('tempdb','distribution')
			and  status & 512 != 512 -- off line 
			and  status & 32 != 32
			and  status & 1024 != 1024 --ready only 
	if @database_name is null 
		break
		
	if not exists ( select * from master.dbo.tbl_maint_setting 
				where database_name=@database_name and parameter_name='#backup_retention_day')
		select @RetentionDay = convert(int,parameter_value) 	
		from master.dbo.tbl_maint_setting 
		where database_name='default' and parameter_name='#backup_retention_day'
	else
		select @RetentionDay = convert(int,parameter_value) 	
		from master.dbo.tbl_maint_setting 
		where database_name=@database_name and parameter_name='#backup_retention_day'

	if (@flag = 1)  -- delete full backups
	begin
		set @match_pattern = '%' + @database_name + '[_]Full[_]%.bak'
		insert into #DeletingFileList
		SELECT line FROM #fileList 
		WHERE line like  @match_pattern
			and LEN (line) > 25
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 18, 8)) = 1
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 9, 6)) = 1
			and dateadd(hour,-@RetentionDay*24+5,getdate())>= 
				convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+ SUBSTRING(line, LEN(line) - 9, 2)+':'+
							SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2))
	end
	else 	-- delete log backups			
	begin
		set @match_pattern = '%' + @database_name + '[_]Log[_]%.trn'
		insert into #DeletingFileList
		SELECT line FROM #fileList 
		WHERE  line like @match_pattern
			and LEN (line) > 25
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 18, 8)) = 1
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 9, 6)) = 1
			and dateadd(day,-@RetentionDay,getdate())>= 
				convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+SUBSTRING(line, LEN(line) - 9, 2)+':'+
							SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2))
	end
	-- exit when only for one DB
	if @one_db = 'Y'
		break
end	

-- delete the to-be-deleted files
set @path = ''
while 1=1
begin 
	select @path = MIN(line) from #DeletingFileList where line > @path 
	if @path is null
		break
	set @stt = 'del "' + @path + '"'
	exec master.dbo.xp_cmdshell @stt
	--print @stt
end


go




-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\051_hsp_delete_latest_full_backup_with_dbname.sql  ---------------------------------------------
---
---
---

/*****************************************************************************

	Delete the latest backup file

******************************************************************************/

use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_delete_latest_full_backup_with_dbname') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_delete_latest_full_backup_with_dbname
GO


CREATE  proc hsp_delete_latest_full_backup_with_dbname
@dbname varchar(100)

as
declare @path varchar(500)
declare @filename varchar(100)
declare @stt nvarchar(2000),@spidstr varchar(4000)

if (@@version like 'Microsoft SQL Server 2005%' or @@version like 'Microsoft SQL Server 2008%')
begin
	exec sp_configure 'Ole Automation Procedures', '1'
	exec sp_configure 'xp_cmdshell', '1'
	reconfigure with override
end

-- get the backup folder
if not exists ( select * from master.dbo.tbl_maint_setting 
				where database_name=@dbname and parameter_name='#backup_folder')
	select @path = parameter_value 
	from master.dbo.tbl_maint_setting 
	where database_name='default' and parameter_name='#backup_folder'
else
	select @path = parameter_value 
	from master.dbo.tbl_maint_setting 
	where database_name=@dbname and parameter_name='#backup_folder'
	

-- get the latest backup file name
set @stt = 'dir ' + @path + @dbname + ' /B'
CREATE TABLE #fileList(line varchar(2000))
INSERT INTO #fileList 
     EXEC xp_cmdshell @stt
SELECT @filename=line FROM #fileList 
WHERE line like  @dbname + '[_]FULL[_]%'
	and right(line,19) = 
			(select max(right(line,19)) from #fileList 
				where line like @dbname + '[_]FULL[_]%' and len(line)=len(@dbname)+25)
Drop table #fileList

--print @path + @dbname + '\' + @filename
set @stt = 'del ' + @path + @dbname + '\' + @filename
exec xp_cmdshell @stt


go



 

-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\060_hsp_full_backup_database.sql  ---------------------------------------------
---
---
---

/********************************************************************

		Full Backup Stored Procedure
		
*********************************************************************/
use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_full_backup_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_full_backup_database
GO

CREATE         proc dbo.hsp_full_backup_database 
as
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @dbname varchar(128)


-- backup all the databases in #temp table
set @dbname = ''
while 1=1
begin 
	select @dbname =MIN(dbname) from #temp where dbname>@dbname
	if @dbname is null
		break
	-- select the backup folder
	if not exists ( select * from master.dbo.tbl_maint_setting 
					where database_name=@dbname and parameter_name='#backup_folder')
		select @path = parameter_value 
		from master.dbo.tbl_maint_setting 
		where database_name='default' and parameter_name='#backup_folder'
	else
		select @path = parameter_value 
		from master.dbo.tbl_maint_setting 
		where database_name=@dbname and parameter_name='#backup_folder'
	
	-- delete the obsolete full backup of the database
	exec hsp_delete_obsolete_backup 1, @dbname

	exec hsp_test_create_subfolder @path,@dbname
	set @path = @path + @dbname + '\'
	 
	select @dest=@path + @dbname + '_Full_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.bak'
	
	-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
	if exists (select * from master.dbo.tbl_maint_setting 
				where parameter_name='#litespeed_for_full_backup' and parameter_value = 'Y')
	begin
		set @stt = 'xp_backup_database @database = ''' + @dbname + ''', @filename = ''' + @dest + ''''
	end
	else
	begin
		set @stt = 'backup database [' + @dbname + '] to Disk=''' + @dest + ''' with init,stats'
		if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
			charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
		begin
			-- backup database @dbname to Disk=@dest with init,stats, compression
			set @stt = @stt + ', compression'
		end
	end

	print 'Full backup command: ' + @stt
	print ' '
	EXEC (@stt)
	
	if (@@error != 0)
	begin
		raiserror ('Full backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end
end

go
  

-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\070_hsp_mirror_db_failover_time.sql  ---------------------------------------------
---
---
---


 /*****************************************
The Stored procedure returns the time when the specified database failover happens

declare @switch_time datetime
exec master.dbo.hsp_Mirror_DBFailoverTime 'SS_Prod', @switch_time output
select @switch_time
go
*********************************************/
use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_mirror_db_failover_time') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_mirror_db_failover_time
GO

create procedure hsp_mirror_db_failover_time @database_name sysname, @switch_time datetime output 
as
begin
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#mirroring_status') and xtype='U')
drop table #mirroring_status
create table #mirroring_status
(
	database_name sysname,
	role int,
	mirroring_state int,
	witness_status int,
	log_generation_rate int,
	unsent_log int,
	send_rate int,
	unrestored_log int,
	recovery_rate int,
	trasaction_delay int,
	transactions_per_second int,
	average_delay int,
	time_record datetime,
	time_behind datetime,
	local_time time
)
insert into #mirroring_status
exec msdb.dbo.sp_dbmmonitorresults @database_name, 4

declare @time_diff int
set @time_diff = DATEDIFF(hour, getutcdate(),getdate())
select @switch_time = dateadd(hour,@time_diff, MIN(time_record))
from #mirroring_status
where role = 1 and time_record > (select MAX(time_record) from #mirroring_status where role = 2)
end

go



 

-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\080_hsp_mirror_db_failover_fullbackup.sql  ---------------------------------------------
---
---
---

/****************************************************************
1. Detect if there is any mirroring database. 
2. If yes, and it becomes principal database recently, 
3. If yes, check if the failover happens 10 minutes ago
4. If yes, check if there is a full backup for the database after the failover
5. If no, fully backup the database

******************************************************************/

use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_mirror_db_failover_fullbackup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_mirror_db_failover_fullbackup
GO
create procedure hsp_mirror_db_failover_fullbackup
as
declare @database_name varchar(128)
set @database_name = ''

declare @switch_time datetime

while 1=1
begin
	select @database_name = min(DB_NAME(database_id)) 
	from master.sys.database_mirroring 
	where mirroring_guid is not null 
			and mirroring_role = 1                -- Principal mirroring database
			and DB_NAME(database_id) > @database_name
	if @database_name is null 
		break
	-- print 'DB Name: ' + @database_name
	
	exec master.dbo.hsp_mirror_db_failover_time @database_name, @switch_time output
	if (@switch_time is null or DATEDIFF (minute, @switch_time,getdate()) < 10)    -- perform the full backup at least 10 minutes after the switch
		continue
		

	if not exists (select * from msdb.dbo.backupset
					where type = 'D' and database_name = @database_name and backup_start_date > @switch_time)
	begin
		insert into #temp values (@database_name)
		exec master.dbo.hsp_full_backup_database   --backup the specified database
	end
end
go



 

-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\090_hsp_log_backup_database.sql  ---------------------------------------------
---
---
---
 


/********************************************************************

		Log Backup Stored Procedure
		
*********************************************************************/
use [master]
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_log_backup_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_log_backup_database
GO

CREATE         proc dbo.hsp_log_backup_database
as
declare @dbname varchar(500)
declare @dest varchar(1000)
declare @dest_bak varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)


set @dbname = ''
while 1=1
begin 
	select @dbname = min(dbname) from #temp where dbname > @dbname
	if @dbname is null
		break
	-- select the backup folder
	if not exists ( select * from master.dbo.tbl_maint_setting 
					where database_name=@dbname and parameter_name='#backup_folder')
		select @path = parameter_value 
		from master.dbo.tbl_maint_setting 
		where database_name='default' and parameter_name='#backup_folder'
	else
		select @path = parameter_value 
		from master.dbo.tbl_maint_setting 
		where database_name=@dbname and parameter_name='#backup_folder'
	
	-- delete the obsolete full backup of the database
	exec hsp_delete_obsolete_backup 2, @dbname

	-- test if the corresponding folder exists
	exec hsp_test_create_subfolder @path,@dbname
	set @path = @path + @dbname + '\'
	
	select @dest=@path + @dbname + '_Log_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.trn'
	--print @dest
	
	-- make a full backup for newly created database.
	if ( select last_log_backup_lsn from master.sys.database_recovery_status where database_id = db_id(@dbname)) is null
	begin 
		set @dest_bak = REPLACE(@dest,'.trn','.bak')
		set @dest_bak = REPLACE(@dest_bak,'_Log_','_Full_')
	
		-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
		if exists (select * from master.dbo.tbl_maint_setting 
					where parameter_name='#litespeed_for_full_backup' and parameter_value = 'Y')
		begin
			set @stt = 'xp_backup_database @database = ''' + @dbname + ''', @filename = ''' + @dest_bak + ''''
		end
		else
		begin
			set @stt = 'backup database [' + @dbname + '] to Disk=''' + @dest_bak + ''' with init,stats'
			if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
				charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
			begin
				-- backup database @dbname to Disk=@dest with init,stats, compression
				set @stt = @stt + ', compression'
			end
		end
		print 'Full backup command: ' + @stt
		print ' '
		EXEC (@stt)
	end

	-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
	if exists (select * from master.dbo.tbl_maint_setting 
				where parameter_name='#litespeed_for_log_backup' and parameter_value = 'Y')
	begin
		set @stt = 'xp_backup_log @database = ''' + @dbname + ''', @filename = ''' + @dest + ''''
	end
	else
	begin
		set @stt = 'backup log [' + @dbname + '] to Disk=''' + @dest + ''' with init,stats'
		if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
			charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
		begin
			set @stt = @stt + ', compression'
		end
	end

	print 'Log backup command: ' + @stt
	print ' '
	EXEC (@stt)
	
	if (@@error != 0)
	begin
		raiserror ('Log backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end
end

go 





-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\091_hsp_log_backup_database_with_dbname.sql  ---------------------------------------------
---
---
---
-----------
----------
----------
--------  Another log backup procedure with dbname
----------
--------
--------

USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_log_backup_database_with_dbname') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_log_backup_database_with_dbname
GO


create         proc hsp_log_backup_database_with_dbname
@dbname varchar(500)
as

	declare @dest varchar(1000)
	declare @dest_bak varchar(1000)
	declare @path varchar(512)
	declare @stt varchar (5000)

	-- select the backup folder
	if not exists ( select * from master.dbo.tbl_maint_setting 
					where database_name=@dbname and parameter_name='#backup_folder')
		select @path = parameter_value 
		from master.dbo.tbl_maint_setting 
		where database_name='default' and parameter_name='#backup_folder'
	else
		select @path = parameter_value 
		from master.dbo.tbl_maint_setting 
		where database_name=@dbname and parameter_name='#backup_folder'
	
	-- delete the obsolete full backup of the database
	exec hsp_delete_obsolete_backup 2, @dbname

	-- test if the corresponding folder exists
	exec hsp_test_create_subfolder @path,@dbname
	set @path = @path + @dbname + '\'
	
	select @dest=@path + @dbname + '_Log_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.trn'
	--print @dest
	
	-- make a full backup for newly created database.
	if ( select last_log_backup_lsn from master.sys.database_recovery_status where database_id = db_id(@dbname)) is null
	begin 
		set @dest_bak = REPLACE(@dest,'.trn','.bak')
		set @dest_bak = REPLACE(@dest_bak,'_Log_','_Full_')
	
		-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
		if exists (select * from master.dbo.tbl_maint_setting 
					where parameter_name='#litespeed_for_full_backup' and parameter_value = 'Y')
		begin
			set @stt = 'xp_backup_database @database = ''' + @dbname + ''', @filename = ''' + @dest_bak + ''''
		end
		else
		begin
			set @stt = 'backup database ' + @dbname + ' to Disk=''' + @dest_bak + ''' with init,stats'
			if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
				charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
			begin
				-- backup database @dbname to Disk=@dest with init,stats, compression
				set @stt = @stt + ', compression'
			end
		end
		print 'Full backup command: ' + @stt
		EXEC (@stt)
	end

	-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
	if exists (select * from master.dbo.tbl_maint_setting 
				where parameter_name='#litespeed_for_log_backup' and parameter_value = 'Y')
	begin
		set @stt = 'xp_backup_log @database = ''' + @dbname + ''', @filename = ''' + @dest + ''''
	end
	else
	begin
		set @stt = 'backup log ' + @dbname + ' to Disk=''' + @dest + ''' with init,stats'
		if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
			charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
		begin
			set @stt = @stt + ', compression'
		end
	end

	print 'Log backup command: ' + @stt
	EXEC (@stt)
		if (@@error != 0)
	begin
		raiserror ('Log backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end

go




-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\100_hsp_check_integrity.sql  ---------------------------------------------
---
---
---

/****************************************************************

		Check database integrity
		
*******************************************************************/
use master
go

IF OBJECTPROPERTY ( object_id('hsp_check_integrity'),'IsProcedure') = 1
	DROP PROC hsp_check_integrity
GO

CREATE PROCEDURE hsp_check_integrity
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @db as varchar (100),@sqlstr as varchar(1200)

	SET @db=''
	WHILE (@db IS NOT NULL)
	BEGIN
		SELECT @db=MIN(dbname) FROM #temp
		WHERE @db<dbname

		IF @db IS NULL BREAK 
		print 'Checking the integrity of the database: ' + @db + '......'
		SET @sqlstr='USE ['+@db+'];
		DBCC CHECKDB WITH NO_INFOMSGS'
		EXEC (@sqlstr);
	END
END
go

 

-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\110_hsp_reindex.sql  ---------------------------------------------
---
---
---

/***********************************************************************

		Re-Index
		
**********************************************************************/

use master
go


if exists (select * from dbo.sysobjects where id = object_id(N'hsp_reindex') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_reindex
GO

CREATE         proc dbo.hsp_reindex
@SkipOfflineReindex int = 1,    -- if the offline re-index will be skipped
@FragThresholdForRebuild INT  = 30,        -- the threshold for rebuild an index
@FragThresholdForReorganize INT  = 10        -- the threshold for reorganize an index

as

---------------------------------------------------------------
---------------------------------------------------------------
Declare @DB_NAME varchar(500)
DECLARE @objectid INT
DECLARE @indexid INT
DECLARE @partitioncount bigint
DECLARE @schemaname NVARCHAR(130)
DECLARE @objectname NVARCHAR(130)
DECLARE @indexname NVARCHAR(130)
DECLARE @indextype INT
DECLARE @partitionnum bigint
DECLARE @partitions bigint
DECLARE @frag INT
DECLARE @command NVARCHAR(4000)
DECLARE @com_part NVARCHAR(15)
DECLARE @max INT
DECLARE @min INT
DECLARE @IndexListCount INT
DECLARE @Edition NVARCHAR(100)
DECLARE @sql NVARCHAR(1000)

DECLARE @DB_ID INT
DECLARE @IndexLobCount INT  --  LOB in the index
DECLARE @TableLobCount INT  -- LOB in the table
SELECT @IndexLobCount = 0, @TableLobCount = 0

DECLARE @Allow_pg_locks INT
SELECT @Allow_pg_locks = 1  -- Default page_locks is turned off

DECLARE @CDC_TABLE NVARCHAR(500)  -- SKIP TABLES AUDIT BY CDC

set nocount on

-- enable the extra log backup job during the re-index
DECLARE @jobId BINARY(16)
SELECT @jobId = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'DBA -- Log backup During Reindex'
exec msdb.dbo.sp_update_job @job_id = @jobId, @enabled = 1



set @DB_NAME = ''
while 1=1
begin 
	select @DB_NAME =MIN(dbname) from #temp where dbname>@DB_NAME
    IF @DB_NAME IS NULL BREAK 

	SELECT @DB_ID = DB_ID(@DB_NAME)
	SELECT @Edition = LEFT(CONVERT(NVARCHAR(100), SERVERPROPERTY ('edition')),18)

	if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#BenchmarkIndexList') and xtype='U')
	drop table #BenchmarkIndexList
	CREATE TABLE #BenchmarkIndexList (ID INT IDENTITY(1,1), 
	   DBName NVARCHAR(100), 
	   objectid INT,
	   indexid INT,
	   indextype NVARCHAR(30),
	   frag INT,
	   avg_frag_size_pages INT,
	   page_count INT,
	   partition_number INT,
	   starttime datetime,
	   endtime datetime,
	   command nvarchar(500))

	CREATE CLUSTERED INDEX IX_CL_IndexList ON #BenchmarkIndexList(ID)

	INSERT #BenchmarkIndexList (DBName, objectid, indexid, indextype, frag, 
					   avg_frag_size_pages, page_count, partition_number)
	SELECT DB_NAME(database_id) AS DBName, object_id, index_id, index_type_desc AS 'indextype',
		   avg_fragmentation_in_percent, avg_fragment_size_in_pages, page_count, partition_number
	FROM   sys.dm_db_index_physical_stats (@DB_ID, NULL, NULL, NULL, 'LIMITED')
	WHERE  page_count > 10 AND 
		   index_id > 0 AND 
		   avg_fragmentation_in_percent > @FragThresholdForReorganize AND
		   index_type_desc NOT LIKE '%XML%'
	       
	SELECT @IndexListCount = COUNT(1) FROM #BenchmarkIndexList

	SELECT @max = (SELECT MAX(ID) FROM #BenchmarkIndexList)
	SELECT @min = 1

	WHILE @min <= @max
	BEGIN
	   SELECT  @objectid = objectid, @indexid = indexid, @partitionnum = partition_number, @frag = frag
	   FROM    #BenchmarkIndexList
	   WHERE   ID = @min

	   set @sql = 'SELECT  @objectname = o.name, @schemaname = s.name
				   FROM [' + @DB_NAME + '].sys.objects AS o JOIN ['
						   + @DB_NAME + ']. sys.schemas AS s ON s.schema_id = o.schema_id
				   WHERE   o.object_id = @objectid'

	   exec sp_executesql @sql, N'@objectname NVARCHAR(130) OUTPUT, @schemaname NVARCHAR(130) OUTPUT, @objectid NVARCHAR(130)',
							 @objectname OUTPUT, @schemaname OUTPUT, @objectid
	   
	   
	   set @sql = 'SELECT  @indexname = name, @indextype = TYPE, @Allow_pg_locks = allow_page_locks
				   FROM [' + @DB_NAME + '].sys.indexes
				   WHERE   object_id = @objectid AND 
						   index_id = @indexid'

	   exec sp_executesql @sql, N'@indexname NVARCHAR(130) OUTPUT, @indextype INT OUTPUT, @Allow_pg_locks INT OUTPUT, @objectid NVARCHAR(130), @indexid INT',
							 @indexname OUTPUT, @indextype OUTPUT,@Allow_pg_locks OUTPUT, @objectid, @indexid
							 

			   
	   set @sql = 'SELECT  @partitioncount = COUNT(1)
				   FROM [' +@DB_NAME + '].sys.partitions
				   WHERE object_id = @objectid AND 
						 index_id = @indexid'

	   exec sp_executesql @sql, N'@partitioncount bigint OUTPUT, @objectid NVARCHAR(130), @indexid INT',
							 @partitioncount OUTPUT, @objectid, @indexid
	       
	   set @sql = 'SELECT  @IndexLobCount = COUNT(1)
				   FROM    [' + @DB_NAME+ '].sys.index_columns A INNER JOIN
						   [' + @DB_NAME+ '].sys.columns B ON A.object_id = B.object_id AND A.Column_id = B.Column_ID INNER JOIN
						   [' + @DB_NAME+ '].sys.types C ON B.system_type_id = C.user_type_id
				   WHERE   A.object_id = @objectid AND
						   A.index_id = @indexid AND 
						  (C.name IN(''xml'',''image'',''text'',''ntext'') OR
						  (C.name IN(''varchar'',''nvarchar'',''varbinary'',''nvarbinary'') AND 
						   B.max_length = -1))'

		exec sp_executesql @sql, N'@IndexLobCount INT OUTPUT, @objectid NVARCHAR(130), @indexid INT',
							 @IndexLobCount OUTPUT, @objectid, @indexid
							 
	   set @sql = ' select  @TableLobCount = COUNT(1)
					from [' + @DB_NAME+ '].sys.columns c left join [' + @DB_NAME+ '].sys.types t on t.system_type_id = c.system_type_id
					where c.object_id = @objectid 
						and (t.name IN(''xml'',''image'',''text'',''ntext'') OR c.max_length = -1)'

		exec sp_executesql @sql, N'@TableLobCount INT OUTPUT, @objectid NVARCHAR(130)',
							 @TableLobCount OUTPUT, @objectid


--- Modified to account for rebuild partition (JT : 2012/05/07)
--print '-------------------------------------------------------------'
--print 'frag=' + convert(varchar(20),@frag)
	
		IF @frag < @FragThresholdForRebuild AND @Allow_pg_locks <> 0  
			-- Re-organize the index
		BEGIN
--print '(2)frag=' + convert(varchar(20),@frag)
		    set @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REORGANIZE';
			IF @partitioncount > 1
			BEGIN
				SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS NVARCHAR(10));
			END
		END
		ELSE IF (@frag >= @FragThresholdForRebuild OR @Allow_pg_locks = 0) AND @IndexLobCount = 0 AND @Edition = 'Enterprise Edition'
				and (@indexid <> 1 or @TableLobCount = 0) and @partitioncount=1
			 
			-- Re-build the index online
	    BEGIN
			set @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REBUILD'
			--IF @partitioncount > 1
			--BEGIN
				--SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS NVARCHAR(10));
			--END
			set @command = @command + ' WITH(ONLINE = ON, SORT_IN_TEMPDB = ON)';
	    END
	    ELSE if @SkipOfflineReindex = 0
		BEGIN
		    set @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REBUILD';
			IF @partitioncount > 1
			BEGIN
				SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS NVARCHAR(10));
			END
			set @command = @command + ' WITH(SORT_IN_TEMPDB = ON)';
		END
		ELSE
			set @command = ''


       select @CDC_TABLE = ''
       set @sql = 'IF Exists ( select 1 
                                 from [' + @DB_NAME+ '].sys.objects AS o JOIN
                                      [' + @DB_NAME+ '].sys.schemas AS s ON s.schema_id = o.schema_id
                                where o.name =''change_tables'' and o.type = ''U'' and s.name = ''cdc'')
                                select @CDC_TABLE = REPLACE(capture_instance,''_'',''.'') FROM [' + @DB_NAME+ '].cdc.change_tables 
                                 where REPLACE(capture_instance,''_'',''.'') = '''+@schemaname+'.'+@objectname +''''
    	
    	exec sp_executesql @sql, N'@CDC_TABLE NVARCHAR(500) OUTPUT, @schemaname NVARCHAR(130),@objectname NVARCHAR(130)', @CDC_TABLE OUTPUT,@schemaname, @objectname


	   IF @CDC_TABLE <> ''
	       SET @command = ''

	BEGIN TRY 
	    UPDATE #BenchmarkIndexList set starttime=getdate(), command=@command
		WHERE   ID = @min
		
		-- execute a generated re-index command
		
		--if @command!='' EXEC (@command)

		print ''
		print '+++++++ re-index: ' + @command 
		print '        start time: ' + convert (varchar(30), getdate(),120)
		
		if @command!='' 
		begin
			print '               running....'
			EXEC (@command)
		end
		
		print '        end time: ' + convert (varchar(30), getdate(),120)

		


		UPDATE #BenchmarkIndexList set endtime= getdate()
		WHERE   ID = @min
	END TRY
	BEGIN CATCH
		  DECLARE @ErrorMessage NVARCHAR(4000)
		  DECLARE @ErrorSeverity INT
		  DECLARE @ErrorState INT
	      
				SELECT @ErrorMessage = ERROR_MESSAGE(),
					   @ErrorSeverity = ERROR_SEVERITY(),         
						 @ErrorState = ERROR_STATE()      
	                     
		  RAISERROR (@ErrorMessage, -- Message text.
						  @ErrorSeverity, -- Severity.
						  @ErrorState -- State.
							)


		  SELECT @ErrorSeverity, @ErrorState, @ErrorMessage, @command
	   
	END CATCH

	   SET @min = @min+1

	END
	

select rtrim(DBName), objectid,indexid,rtrim(indextype),frag , avg_frag_size_pages, page_count, partition_number, starttime, endtime, command
from #BenchmarkIndexList	

select rtrim(DBName),objectid,indexid,rtrim(indextype),frag , avg_frag_size_pages, page_count, partition_number, starttime, endtime, command
from #BenchmarkIndexList
where ltrim(command)=''

End

	
-- disable the extra log backup job during the re-index
SELECT @jobId = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'DBA -- Log backup During Reindex'
exec msdb.dbo.sp_update_job @job_id = @jobId, @enabled = 0



GO


 

-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\120_hsp_update_statistics.sql  ---------------------------------------------
---
---
---

 /******************************************************************

	Update Statistics
	
*******************************************************************/
use master
go

SET QUOTED_IDENTIFIER ON
GO
IF OBJECTPROPERTY ( object_id('hsp_update_statistics'),'IsProcedure') = 1
	DROP PROC hsp_update_statistics
GO


CREATE PROCEDURE hsp_update_statistics
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @db as varchar (100),@sqlstr as varchar(1200)

	SET @db=''
	WHILE (@db IS NOT NULL)
	BEGIN
		SELECT @db=MIN(dbname) FROM #temp
		WHERE @db<dbname

		IF @db IS NULL BREAK 
		SET @sqlstr='USE ['+@db+'];
		EXEC sp_updatestats'
		EXEC (@sqlstr);
	END
END
go

 

-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\130_hsp_check_disk_space.sql  ---------------------------------------------
---
---
---

/********************************************************

	Check free disk space
	
*********************************************************/

USE [master]
GO
IF OBJECTPROPERTY ( object_id('hsp_check_disk_space'),'IsProcedure') = 1
	DROP PROC hsp_check_disk_space
GO

CREATE PROC hsp_check_disk_space 

AS
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#free_space') and xtype='U')
drop table #free_space
CREATE TABLE #free_space(
 drive char(1), 
 free_mb int)

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.dbo.#tbl_disk_space_alert') and xtype='U')
drop table #tbl_disk_space_alert
create table #tbl_disk_space_alert (
 drive char(1), 
 free_mb int)


declare @str varchar(512)

INSERT INTO #free_space exec xp_fixeddrives

insert into #tbl_disk_space_alert
	select drive, free_mb from #free_space 
	where		
		(
			free_mb <
			(	select parameter_value from master.dbo.tbl_maint_setting 
				where parameter_name = '#free_disk_space_threshold' and database_name = 'default'
			) 		
			and 
			not drive in (	select database_name from master.dbo.tbl_maint_setting 
							where parameter_name = '#excluded_from_default_disk_space_check'
						  )
		)
		or 
			free_mb <
			(	select parameter_value from master.dbo.tbl_maint_setting 
				where parameter_name = '#free_disk_space_threshold' and database_name = drive
			)
	

-- select * from temp_alert_list_998990123

if (exists (select * from #tbl_disk_space_alert))
BEGIN
	DECLARE	@MailSubject nvarchar(60), @MailMsg varchar(70)
	-- build the subject --
	SET @MailSubject = 'Disk Space Alert on ' + @@SERVERNAME
	-- construct mail body
	declare @mail_body varchar(8000)
	declare @drive_id char(1), @free_mb int
	set @mail_body = 
'drive free_mb
----- ------------
'
	set @drive_id = ''
	while 1=1
	begin 
		select @drive_id = min(drive) from #tbl_disk_space_alert  where drive > @drive_id
		if @drive_id is null
			break
		select @free_mb = free_mb from #tbl_disk_space_alert where drive = @drive_id
		set @mail_body = @mail_body + @drive_id + SPACE(5)+ RIGHT(SPACE(12) + convert(varchar,@free_mb),12) +'
'
	end
		  -- send the message --
	EXEC msdb.dbo.sp_send_dbmail
		@profile_name = 'Database Services',
		--@recipients = N'james.zhang@hssbc.ca', 
		@recipients = N'HSSBCTSDatabaseServices@fraserhealth.ca', 
		@body = @mail_body, 
		@subject = @MailSubject
END


SET NOCOUNT OFF

go

 

-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\140_hsp_switch_job_output_file.sql  ---------------------------------------------
---
---
---


/*********************************************************************

	Switch the output file name 
	
**********************************************************************/

USE [master]
GO
IF OBJECTPROPERTY ( object_id('hsp_switch_job_output_file'),'IsProcedure') = 1
	DROP PROC hsp_switch_job_output_file
GO

CREATE PROC hsp_switch_job_output_file 
AS
declare @stt nvarchar(3000)
declare @path varchar(3000)
declare @file_name varchar(3000)

select @path = parameter_value 
from [master].[dbo].[tbl_maint_setting] 
where parameter_name = '#job_output_folder'

set @stt = 'IF NOT EXIST ' + @path + ' md ' + @path
--print @stt
EXEC xp_cmdshell @stt

select @file_name = @path + 'output_log_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.txt'
		
--print @file_name

EXEC msdb.dbo.sp_update_jobstep
    @job_name = N'DBA -- Databases Maintenance',
    @step_id=1, 
    @output_file_name = @file_name,
    @flags = 2

go
 

-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\150_hsp_delete_obsolete_job_output_file.sql  ---------------------------------------------
---
---
---
/*********************************************************************

		Delete the job output file older than the retention day

**********************************************************************/
 
use [master]
go

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_delete_obsolete_job_output_file') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_delete_obsolete_job_output_file
GO

CREATE         proc dbo.hsp_delete_obsolete_job_output_file
as

declare @path varchar(1024)
declare @filename varchar (512)
declare @stt varchar (5000)
declare @RetentionDay int

-- delete the existing full backups

-- create the two temp tables for candidate file list
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#DeletingFileList') and xtype='U')
drop table #DeletingFileList
CREATE TABLE #DeletingFileList(line varchar(2000))

select @path = parameter_value from master.dbo.tbl_maint_setting
where parameter_name = '#job_output_folder' 

select @RetentionDay = parameter_value from master.dbo.tbl_maint_setting
where parameter_name = '#job_output_file_retention_day' 

set @stt = 'dir "' + @path + '\output_log_????????_??????.txt" /S /B'  -- return the full path for the candidate files
INSERT INTO #fileList 
EXEC xp_cmdshell @stt


insert into #DeletingFileList
SELECT line FROM #fileList 
where dateadd(hour,-@RetentionDay*24+5,getdate())>= 
				convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+ SUBSTRING(line, LEN(line) - 9, 2)+':'+
							SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2))


-- delete the to-be-deleted files
set @path = ''
while 1=1
begin 
	select @path = MIN(line) from #DeletingFileList where line > @path 
	if @path is null
		break
	set @stt = 'del "' + @path + '"'
	exec master.dbo.xp_cmdshell @stt
	-- print @stt
end

go




-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\160_hsp_recycle_history_and_error_log.sql  ---------------------------------------------
---
---
---
 
/**************************************************************

		Clean Up the Logs: 
		Backup/Restore log, Job Log, SQL Server Log and SQL Agent Log
		
		
*****************************************************************/
use master
go

IF OBJECTPROPERTY ( object_id('hsp_recycle_history_and_error_log'),'IsProcedure') = 1
	DROP PROC hsp_recycle_history_and_error_log
GO

create proc hsp_recycle_history_and_error_log
as
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp_1') and xtype='U')
drop table #temp_1
create table #temp_1
(
log_date datetime,
process_info varchar(100),
text varchar (8000)
)

declare @log_start_date datetime
declare @retention_day int
DECLARE @dt DATETIME

/*****************************************************

		Clean up SQL Server Error Log
		
******************************************************/
insert into #temp_1
exec xp_readerrorlog 0,1
select top 1 @log_start_date = log_date 
from #temp_1

select @retention_day = CONVERT(int, parameter_value) from master.dbo.tbl_maint_setting
where parameter_name = '#server_error_log_retention_day'

--select @log_start_date, @retention_day

if DATEDIFF (day, @log_start_date,getdate()) > @retention_day
begin
	exec master.dbo.sp_cycle_errorlog
end

/*****************************************************

		Clean up SQL Agent Error Log
		
******************************************************/
truncate table #temp_1
insert into #temp_1
exec xp_readerrorlog 0,2
select top 1 @log_start_date = log_date 
from #temp_1

select @retention_day = CONVERT(int, parameter_value) from master.dbo.tbl_maint_setting
where parameter_name = '#agent_error_log_retention_day'

--select @log_start_date, @retention_day

if DATEDIFF (day, @log_start_date,getdate()) > @retention_day
begin
	exec msdb.dbo.sp_cycle_agent_errorlog 
end
/******************************************************

		Clean up backup/restore history
		
******************************************************/

select @retention_day = parameter_value 
from master.dbo.tbl_maint_setting 
where parameter_name = '#backup_restore_history_retention_day'
SET @dt = DATEADD(DAY, -@retention_day, GETDATE());
EXEC msdb.dbo.sp_delete_backuphistory @dt;

/******************************************************

		clean up job history
		
******************************************************/
select @retention_day = parameter_value 
from master.dbo.tbl_maint_setting 
where parameter_name = '#job_history_retention_day'
SET @dt = DATEADD(DAY, -@retention_day, GETDATE());
EXEC msdb.dbo.sp_purge_jobhistory @oldest_date=@dt;



go






-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\900_hsp_maint_control.sql  ---------------------------------------------
---
---
---
 
/*****************************************************************************************************
******************************************************************************************************

	
	
	the main stored procedure to call all the maintenace stored procedure
	based on the configuratin table.
	
	
	
*********************************************************************************************************
*********************************************************************************************************/
use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_maint_control') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_maint_control
GO

-- hsp_TestCreateSubfolder '\\srvnetapp03\SQL_Back$\ZVMSQ2K801\', 'master'

CREATE         proc hsp_maint_control
as
declare @current_time datetime
declare @description_str varchar(8000)
set @current_time = getdate()

-- create a temp table to store the db names
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

-- keep the original setting of cmdshell
declare @shell_setting varchar(5)
select @shell_setting = CONVERT(varchar(5), value) from sys.sysconfigures where config = 16390 -- command shell
exec sp_configure 'show advanced option', '1'
reconfigure  with override
exec sp_configure 'xp_cmdshell', '1'
reconfigure  with override


/************************************************************

		Ful backup 
		
*************************************************************/
-- Is it the time for full backup
truncate table #temp

exec hsp_get_candidate_database_list '#full_backup_time', '#excluded_from_default_full_backup' , @current_time

if (exists (select * from #temp))
begin
	set @description_str = 'Database: '
	select @description_str = @description_str + dbname + ';  ' from #temp order by dbname
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'Begining of Full Backup', @description_str)
	
	exec hsp_full_backup_database  -- full backup all the databases in #temp table
	
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'End of Full Backup', '')
end




/************************************************************

		backup the mirror databases.
		
*************************************************************/
truncate table #temp
exec hsp_mirror_db_failover_fullbackup


/******************************************************

		Integrity Check
		
******************************************************/
truncate table #temp

exec hsp_get_candidate_database_list '#check_integrity_day_time', '#excluded_from_default_check_integrity' ,@current_time

if (exists (select * from #temp))
begin
	set @description_str = 'Database: '
	select @description_str = @description_str + dbname + ';  ' from #temp  order by dbname
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'Begining of Integrity Check', @description_str)
	
	exec hsp_check_integrity

	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'End of Integrity Check', '')
end

/******************************************************

		reindex
		
******************************************************/
truncate table #temp

exec hsp_get_candidate_database_list '#reindex_online_only_day_time', '#excluded_from_default_reindex_online_only' ,@current_time

if (exists (select * from #temp))
begin
	set @description_str = 'Database: '
	select @description_str = @description_str + dbname + ';  ' from #temp order by dbname
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'Begining of Re-index', @description_str)
		
	exec hsp_reindex @SkipOfflineReindex=1


	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'End of Re-index', '')
end


/******************************************************

		full reindex
		
******************************************************/
truncate table #temp

exec hsp_get_candidate_database_list '#reindex_all_day_time', '#excluded_from_default_reindex_all' ,@current_time

if (exists (select * from #temp))
begin
	set @description_str = 'Database: '
	select @description_str = @description_str + dbname + ';  ' from #temp order by dbname
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'Begining of Full Re-index', @description_str)
		
	exec hsp_reindex  @SkipOfflineReindex=0

	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'End of Full Re-index', '')
end



/******************************************************

		Update Statistics
		
******************************************************/
truncate table #temp

exec hsp_get_candidate_database_list '#update_statistics_time', '#excluded_from_default_update_statistics' ,@current_time

if (exists (select * from #temp))
begin
	set @description_str = 'Database: '
	select @description_str = @description_str + dbname + ';  ' from #temp order by dbname
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'Begining of Update Statistics', @description_str)
	
	exec hsp_update_statistics

	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'End of Update Statistics', '')
end

/******************************************************

		Log backup
		
******************************************************/
truncate table #temp

insert into #temp 
SELECT rtrim(name)
FROM master.sys.databases  
WHERE name NOT IN ('master','model','msdb','tempdb')  
   AND DATABASEPROPERTYEX(name, 'Recovery') IN ('FULL','BULK_LOGGED') 
   and  state = 0

 --  and  name in (select database_name from [dbo].[tbl_maint_setting] where [parameter_name]='#full_backup_time')
 -- For BizTalk, only backup the log of the specified databases in the tbl_maint_setting table
order by name

exec hsp_log_backup_database


/******************************************************

		Disk Space Check
		
******************************************************/
truncate table #temp

if exists 	
	(select * from master.dbo.tbl_maint_setting
			where  parameter_name= '#check_disk_space_time'
				and @current_time between convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + parameter_value + ':00')
							 and dateadd(minute, 10, convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + parameter_value + ':00'))
	)
begin
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'Checking Disk Space', '')
	
	exec hsp_check_disk_space
end


/*****************************************************

	Switch the output file
	
******************************************************/
if exists 	
	(select * from master.dbo.tbl_maint_setting
			where  parameter_name= '#job_output_file_switch_time'
				and @current_time between convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + parameter_value + ':00')
							 and dateadd(minute, 10, convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + parameter_value + ':00'))
	)
begin
	exec hsp_switch_job_output_file
	exec hsp_delete_obsolete_job_output_file
end


/*****************************************************

	Clean up the history log (backup/restore, job) and error log (SQL Server and SQL Server Agent)
	
******************************************************/
if exists 	
	(select * from master.dbo.tbl_maint_setting
			where  parameter_name= '#cleanup_history_and_error_log_time'
				and @current_time between convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + parameter_value + ':00')
							 and dateadd(minute, 10, convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + parameter_value + ':00'))
	)
begin
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'The Begining of Cleaning up History and Error Logs', '')

	exec hsp_recycle_history_and_error_log
	
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'The End of Cleaning up History and Error Logs', '')
	
end

/**************************************************************

		Reset the cmdshell to the original value
		
***************************************************************/
exec sp_configure 'xp_cmdshell', @shell_setting
reconfigure  with override

-- disable the extra log backup job during the re-index
DECLARE @jobId BINARY(16)
SELECT @jobId = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'DBA -- Log backup During Reindex'
exec msdb.dbo.sp_update_job @job_id = @jobId, @enabled = 0


print ' '
print ' '
print '###################################################################'
print '#                                                                 #'
print '#                                                                 #'
print '#                                                                 #'
print '#    DBA -- Database Maintenance Job End                          #'
print '#                                                                 #'
print '#                                                                 #'
print '#                                                                 #'
print '#                                                                 #'
print '###################################################################'
print ' '
print ' '

go
 


-------------------   C:\Software\Git_Repository\SQL_Utility\DBScript.root\DBScript\HSSBC DB Maintenance Script\Separate Scripts\990_last_script.sql  ---------------------------------------------
---
---
---
 
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

		register the current version
		
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




go




