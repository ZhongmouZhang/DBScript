 use [master]
go



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
				
			4.	#reindex_time  hh:mm
				#excluded_from_default_reindex
				#full_reindex_day_of_week 6,7,... (1:Monday, .... 7: Sunday), at specific days, full re-index will be done.
				
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
	values ('default', '#check_integrity_time','22:00')

	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#reindex_time','02:00')
	insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
	values ('default', '#full_reindex_day_of_week','6')


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
go

/*********************************************************************

	Test if there is a corresponding database subfolder in a specified 
	path. If not, create one for the database
	
**********************************************************************/

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

/*********************************************************************

		Delete the backup older than the retention day
	exec hsp_delete_obsolete_backup 2, 'BookStore'
**********************************************************************/
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


/********************************************************************

		Full Backup Stored Procedure
		
*********************************************************************/

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
	--print @dest

	backup database @dbname to Disk=@dest with init,stats
	if (@@error != 0)
	begin
		raiserror ('Full backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end
end

go


 

/****************************************************************
1. Detect if there is any mirroring database. 
2. If yes, and it becomes principal database recently, 
3. If yes, check if the failover happens 10 minutes ago
4. If yes, check if there is a full backup for the database after the failover
5. If no, fully backup the database

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



****************************/

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


	backup log @dbname to Disk=@dest with  Stats 
	if (@@error != 0)
	begin
		raiserror ('Log backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end
end

go 




/****************************************************************

		Check database integrity
		
*******************************************************************/

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
		SET @sqlstr='USE ['+@db+'];
		DBCC CHECKDB WITH NO_INFOMSGS'
		EXEC (@sqlstr);
	END
END
go


/***********************************************************************

		Re-Index
		
**********************************************************************/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECTPROPERTY ( object_id('hsp_reindex'),'IsProcedure') = 1
	DROP PROC hsp_reindex
GO

CREATE PROCEDURE hsp_reindex
(
---------------------------------------------------------------
--	 VARIABLES TO CHANGE	 --
---------------------------------------------------------------
 @ForceReindex bit = 0,  -- Default Not to do reindex for all tables
 @DoOfflineToo bit = 0, -- Default Don't do offline reindex
 @FragThreshold INT = 30
)

AS
BEGIN
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
DECLARE @max INT
DECLARE @min INT
DECLARE @IndexListCount INT
DECLARE @Edition NVARCHAR(100)
DECLARE @sql NVARCHAR(1000)

DECLARE @DB_ID INT
DECLARE @LobCount INT
SELECT @LobCount = 0
DECLARE @Allow_pg_locks INT
SELECT @Allow_pg_locks = 1  -- Default page_locks is turned off

DECLARE @CDC_TABLE NVARCHAR(500)  -- SKIP TABLES AUDIT BY CDC

set @DB_NAME = ''
while 1=1
begin 
	select @DB_NAME =MIN(dbname) from #temp where dbname>@DB_NAME
    IF @DB_NAME IS NULL BREAK 

	SELECT @DB_ID = DB_ID(@DB_NAME)
	SELECT @Edition = LEFT(CONVERT(NVARCHAR(100), SERVERPROPERTY ('edition')),18)

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
		   avg_fragmentation_in_percent > 1 AND
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
	       
	   set @sql = 'SELECT  @LobCount = COUNT(1)
				   FROM    [' + @DB_NAME+ '].sys.index_columns A INNER JOIN
						   [' + @DB_NAME+ '].sys.columns B ON A.object_id = B.object_id AND A.Column_id = B.Column_ID INNER JOIN
						   [' + @DB_NAME+ '].sys.types C ON B.system_type_id = C.user_type_id
				   WHERE   A.object_id = @objectid AND
						   A.index_id = @indexid AND 
						  (C.name IN(''xml'',''image'',''text'',''ntext'') OR
						  (C.name IN(''varchar'',''nvarchar'',''varbinary'',''nvarbinary'') AND 
						   B.max_length = -1))'

		exec sp_executesql @sql, N'@LobCount INT OUTPUT, @objectid NVARCHAR(130), @indexid INT',
							 @LobCount OUTPUT, @objectid, @indexid
			   
			   
	   IF @frag < @FragThreshold AND @Allow_pg_locks <> 0
	   BEGIN
		   SET @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REORGANIZE';
	   END

	   IF (@frag >= @FragThreshold OR @Allow_pg_locks = 0) AND @indextype <> 1 AND @LobCount = 0 AND @Edition = 'Enterprise Edition'
	   BEGIN
		   SET @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname +'] REBUILD WITH(ONLINE = ON, SORT_IN_TEMPDB = ON)';
	   END

	   IF @frag >= @FragThreshold AND @DoOfflineToo = 1 AND (@indextype = 1 OR @LobCount <> 0 OR @Edition <> 'Enterprise Edition')
	   BEGIN
		   SET @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname +'] REBUILD WITH(ONLINE = OFF, SORT_IN_TEMPDB = ON)';
	   END
	   
	   IF @ForceReindex = 1
	   BEGIN
		   SET @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname +'] REBUILD WITH(ONLINE = OFF, SORT_IN_TEMPDB = ON)';
	   END
	          
       select @CDC_TABLE = ''
       set @sql = 'IF Exists ( select 1 
                                 from [' + @DB_NAME+ '].sys.objects AS o JOIN
                                      [' + @DB_NAME+ '].sys.schemas AS s ON s.schema_id = o.schema_id
                                where o.name =''change_tables'' and o.type = ''U'' and s.name = ''cdc'')
                                select @CDC_TABLE = REPLACE(capture_instance,''_'',''.'') FROM [' + @DB_NAME+ '].cdc.change_tables 
                                 where REPLACE(capture_instance,''_'',''.'') = '''+@schemaname+'.'+@objectname +''''
    	
    	exec sp_executesql @sql, N'@CDC_TABLE NVARCHAR(500) OUTPUT, @schemaname NVARCHAR(130),@objectname NVARCHAR(130)', @CDC_TABLE OUTPUT,@schemaname, @objectname


	   IF @CDC_TABLE <> ''
	       SET @command = '-- SKIP CDC AUDITED TABLES ' + @command

--	BEGIN TRY 
	   IF @partitioncount > 1
	   BEGIN
		   SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS NVARCHAR(10));
		
		   UPDATE #BenchmarkIndexList set starttime=getdate(), command=@command
		   WHERE   ID = @min
		   
		   EXEC (@command)
	   END

	   ELSE
	   BEGIN 
   		   UPDATE #BenchmarkIndexList set starttime=getdate(), command=@command
			WHERE   ID = @min
		   EXEC (@command)
	   END
   		UPDATE #BenchmarkIndexList set endtime= getdate()
		 WHERE   ID = @min

/****
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
*/
   SET @min = @min+1

	END

	select * FROM #BenchmarkIndexList

	DROP TABLE #BenchmarkIndexList

END

END
GO

 /******************************************************************

	Update Statistics
	
*******************************************************************/
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
/*****
	EXEC msdb.dbo.sp_send_dbmail
		@profile_name = 'Database Services',
		--@recipients = N'james.zhang@hssbc.ca', 
		@recipients = N'HSSBCTSDatabaseServices@fraserhealth.ca', 
		@body = @mail_body, 
		@subject = @MailSubject
**************/
END


SET NOCOUNT OFF

go


use [master]
go

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

use [master]
go

/*********************************************************************

		Delete the job output file older than the retention day

**********************************************************************/
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

set @stt = 'dir "' + @path + '" /S /B'  -- return the full path for the candidate files
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
	-- exec msdb.dbo.sp_cycle_agent_errorlog 
end

*************************************/
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





/*****************************************************************************************************
******************************************************************************************************

	
	
	the main stored procedure to call all the maintenace stored procedure
	based on the configuratin table.
	
	
	
*********************************************************************************************************
*********************************************************************************************************/

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


/******************************************************

		Integrity Check
		
******************************************************/
truncate table #temp

exec hsp_get_candidate_database_list '#check_integrity_time', '#excluded_from_default_check_integrity' ,@current_time

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
		


truncate table #temp

exec hsp_get_candidate_database_list '#reindex_time', '#excluded_from_default_reindex' ,@current_time

declare @dw_str varchar(20), @x xml
SET DATEFIRST 1
select @dw_str = parameter_value from master.dbo.tbl_maint_setting where parameter_name = '#full_reindex_day_of_week'
SELECT @X = CONVERT(xml,'<root><s>' + REPLACE(@dw_str,',','</s><s>') + '</s></root>')

if (exists (select * from #temp))
begin
	set @description_str = 'Database: '
	select @description_str = @description_str + dbname + ';  ' from #temp order by dbname
	if datepart(dw,getdate()) in 
		( SELECT [Value] = T.c.value('.','varchar(20)') FROM @X.nodes('/root/s') T(c))
	begin
		insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
		values (GETDATE(),'Begining of Full Re-index', @description_str)
		
		exec hsp_reindex @ForceReindex=1

		insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
		values (GETDATE(),'End of Full Re_index', '')
	end
	else 
	begin
		insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
		values (GETDATE(),'Begining of Re-index', @description_str)
		
		exec hsp_reindex

		insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
		values (GETDATE(),'End of Re-index', '')
	end
end
******************************/

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
FROM master.dbo.sysdatabases  
WHERE name NOT IN ('master','model','msdb','tempdb')  
   AND DATABASEPROPERTYEX(name, 'Recovery') IN ('FULL','BULK_LOGGED') 
   and  status & 512 != 512
   and  status & 32 != 32
   and  status & 1024 != 1024 --ready only
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
		-- @notify_email_operator_name=N'Database Services', 
		@job_id = @jobId OUTPUT
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

		reconfiure the server settting
		
************************************************************************/
use master

exec hsp_switch_job_output_file
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


go