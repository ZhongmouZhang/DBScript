 /*****************************************************************
	
		Drop Stored Procedures, Jobs and Tables of Version 1
		
*****************************************************************/

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

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'Bakcup -- Full and Log')
begin 
	SELECT @job_id_v = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'Bakcup -- Full and Log'
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
	
	
	