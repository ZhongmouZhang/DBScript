USE [msdb]
GO

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'DBA -- Databases Maintenance')
	EXEC sp_delete_job @job_name = N'DBA -- Databases Maintenance' , @delete_unused_schedule=1

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'DBA -- Log backup During Reindex')
	EXEC sp_delete_job @job_name = N'DBA -- Log backup During Reindex' , @delete_unused_schedule=1


use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_maint_control') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_maint_control
GO

IF OBJECTPROPERTY ( object_id('hsp_recycle_history_and_error_log'),'IsProcedure') = 1
	DROP PROC hsp_recycle_history_and_error_log
GO


if exists (select * from dbo.sysobjects where id = object_id(N'hsp_delete_obsolete_job_output_file') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_delete_obsolete_job_output_file
GO


IF OBJECTPROPERTY ( object_id('hsp_switch_job_output_file'),'IsProcedure') = 1
	DROP PROC hsp_switch_job_output_file
GO

IF OBJECTPROPERTY ( object_id('hsp_check_disk_space'),'IsProcedure') = 1
	DROP PROC hsp_check_disk_space
GO


IF OBJECTPROPERTY ( object_id('hsp_update_statistics'),'IsProcedure') = 1
	DROP PROC hsp_update_statistics
GO


if exists (select * from dbo.sysobjects where id = object_id(N'hsp_reindex') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_reindex
GO

IF OBJECTPROPERTY ( object_id('hsp_check_integrity'),'IsProcedure') = 1
	DROP PROC hsp_check_integrity
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_log_backup_database_with_dbname') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_log_backup_database_with_dbname
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_log_backup_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_log_backup_database
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_mirror_db_failover_fullbackup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_mirror_db_failover_fullbackup
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_mirror_db_failover_time') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_mirror_db_failover_time
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_full_backup_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_full_backup_database
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_delete_latest_full_backup_with_dbname') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_delete_latest_full_backup_with_dbname
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_delete_obsolete_backup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_delete_obsolete_backup
GO


if exists (select * from dbo.sysobjects where id = object_id(N'hsp_test_create_subfolder') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_test_create_subfolder
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_get_candidate_database_list') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_get_candidate_database_list
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_script_version_control') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_script_version_control
GO

if exists (select * from sysobjects where id = object_id(N'tbl_maint_setting') and xtype='U')
	drop table tbl_maint_setting

if exists (select * from sysobjects where id = object_id(N'tbl_maint_logging') and xtype='U')
	drop table tbl_maint_logging

if exists (select * from sysobjects where id = object_id(N'tbl_maint_version_info') and xtype='U')
	drop table tbl_maint_version_info


-- drop operator

USE [msdb]
GO

/****** Object:  Operator [Database Services]    Script Date: 10/28/2013 10:52:22 ******/
IF  EXISTS (SELECT name FROM msdb.dbo.sysoperators WHERE name = N'Database Services')
EXEC msdb.dbo.sp_delete_operator @name=N'Database Services'
GO


