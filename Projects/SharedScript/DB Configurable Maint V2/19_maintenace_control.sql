use [master]
go

/*********************************************************************

	the main stored procedure to call all the maintenace stored procedure
	based on the configuratin table.
	
**********************************************************************/

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
exec hsp_get_candidate_database_list '#full_backup_time', '#excluded_from_default_full_backup' , @current_time

if (exists (select * from #temp))
begin
	set @description_str = 'Database: '
	select @description_str = @description_str + dbname + ';  ' from #temp
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'Begining of Full Backup', @description_str)
	
	exec hsp_full_backup_database  -- full backup all the databases in #temp table
	
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'End of Full Backup', '')
end




/************************************************************

		backup the mirror databases.
		
*************************************************************/
exec hsp_mirror_db_failover_fullbackup


/******************************************************

		Integrity Check
		
******************************************************/
exec hsp_get_candidate_database_list '#check_integrity_time', '#excluded_from_default_check_integrity' ,@current_time

if (exists (select * from #temp))
begin
	set @description_str = 'Database: '
	select @description_str = @description_str + dbname + ';  ' from #temp
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'Begining of Integrity Check', @description_str)
	
	exec hsp_check_integrity

	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'End of Integrity Check', '')
end

/******************************************************

		reindex
		
******************************************************/
exec hsp_get_candidate_database_list '#reindex_time', '#excluded_from_default_reindex' ,@current_time

declare @dw_str varchar(20), @x xml
SET DATEFIRST 1
select @dw_str = parameter_value from master.dbo.tbl_maint_setting where parameter_name = '#full_reindex_day_of_week'
SELECT @X = CONVERT(xml,'<root><s>' + REPLACE(@dw_str,',','</s><s>') + '</s></root>')

if (exists (select * from #temp))
begin
	set @description_str = 'Database: '
	select @description_str = @description_str + dbname + ';  ' from #temp
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
		values (GETDATE(),'End of Re_index', '')
	end
end


/******************************************************

		Update Statistics
		
******************************************************/
exec hsp_get_candidate_database_list '#update_statistics_time', '#excluded_from_default_update_statistics' ,@current_time

if (exists (select * from #temp))
begin
	set @description_str = 'Database: '
	select @description_str = @description_str + dbname + ';  ' from #temp
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'Begining of Update Statistics', @description_str)
	
	exec hsp_update_statistics

	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'End of UPdate Statistics', '')
end


/******************************************************

		Disk Space Check
		
******************************************************/
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

/******************************************************

		Clean up backup/restore history
		
******************************************************/
DECLARE @dt DATETIME, @retention int

select @retention = parameter_value 
from master.dbo.tbl_maint_setting 
where parameter_name = '#backup_restore_history_retention_day'
SET @dt = DATEADD(DAY, -@retention, GETDATE());
EXEC msdb.dbo.sp_delete_backuphistory @dt;

/******************************************************

		clean up job history
		
******************************************************/
select @retention = parameter_value 
from master.dbo.tbl_maint_setting 
where parameter_name = '#job_history_retention_day'
SET @dt = DATEADD(DAY, -@retention, GETDATE());
EXEC msdb.dbo.sp_purge_jobhistory @oldest_date=@dt;


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