 
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
	and is_read_only=0

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
 
