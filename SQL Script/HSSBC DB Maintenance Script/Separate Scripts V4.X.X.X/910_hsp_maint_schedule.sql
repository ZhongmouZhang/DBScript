
use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_maint_schedule') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_maint_schedule
GO

CREATE         proc hsp_maint_schedule
as

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


-- to store action
declare @action varchar(64) , @database_name varchar(256)
declare @id int

-- run the log backup by default
exec hsp_log_backup_database


-- perform the scheduled ad hoc backup first
while exists (select * from dbo.tbl_maint_action 
				where next_start_date_time < GETDATE()
					and ( last_start_date_time is null or last_start_date_time < next_start_date_time)
					and [action] = '#adhoc_backup'
			 )
begin
	exec hsp_adhoc_backup_database
end



while exists (select * from dbo.tbl_maint_action 
				where next_start_date_time < GETDATE()
					and ( last_start_date_time is null or last_start_date_time < next_start_date_time)
			 )
begin
	select @id = MIN(id) 
	from dbo.tbl_maint_action 
				where next_start_date_time < GETDATE()
					and ( last_start_date_time is null or last_start_date_time < next_start_date_time)

	select @action = [action] , @database_name = database_name
	from dbo.tbl_maint_action
	where [id]=@id
	
	update tbl_maint_action
	set last_start_date_time = GETDATE(), [status] = 'running'
	where [id]=@id
	

	exec hsp_get_candidate_database_list @action, @database_name
	exec hsp_maint_log @is_begin='Y', @action=@action


	if @action='#full_backup'
	begin
		exec hsp_full_backup_database
	end
	else if @action='#differential_backup'
	begin
		exec hsp_differential_backup_database
	end 	
	else if @action='#check_integrity'
	begin
		exec hsp_check_integrity
	end 
	else if @action='#reindex_online_only'
	begin
		exec hsp_reindex @SkipOfflineReindex=1
	end 	
	else if @action='#reindex_all'
	begin
		exec hsp_reindex @SkipOfflineReindex=0
	end 	
	else if @action='#update_statistics'
	begin
		exec hsp_update_statistics
	end 	
	else if @action='#cleanup_history_and_error_log'
	begin
		exec hsp_recycle_history_and_error_log
	end 	
	else if @action='#check_disk_space'
	begin
		exec hsp_check_disk_space
	end 	
	else if @action='#recycle_job_output_file'
	begin
		exec hsp_switch_job_output_file
		exec hsp_delete_obsolete_job_output_file
	end 
	else if @action = '#shrink_log_file'
	begin
		exec hsp_shrink_log_file
	end	
	
	update tbl_maint_action
	set [status] = 'successful'
	where [id]=@id

	exec hsp_maint_log 'N', @action
	
	-- re-run log backup 
	if @action in ('#full_backup','#check_integrity','#reindex_online_only','#reindex_all','#update_statistics')
		exec hsp_log_backup_database
		
	-- calculating the next run time
	exec hsp_calculate_next_run_time
	
end

-- in case there is no action is run at time time
-- calculating the next run time
exec hsp_calculate_next_run_time

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
 
