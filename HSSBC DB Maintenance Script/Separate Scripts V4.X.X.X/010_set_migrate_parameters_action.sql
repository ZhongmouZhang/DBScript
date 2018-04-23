
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

-- Set or Migrate Parameters

	exec hsp_set_migrate_parameter 'Y', 1, '#backup_folder', '#full_backup_folder', 'K:\SQL_Backup\full\'
	exec hsp_set_migrate_parameter 'Y', 2, '#backup_folder', '#log_backup_folder', 'K:\SQL_Backup\log\'
	exec hsp_set_migrate_parameter 'Y', 3, '', '#differential_backup_folder', 'K:\SQL_Backup\diff\'
	exec hsp_set_migrate_parameter 'Y', 4, '#backup_retention_day', '#full_backup_retention_day', '3'
	exec hsp_set_migrate_parameter 'Y', 5, '#backup_retention_day', '#log_backup_retention_day', '3'
	exec hsp_set_migrate_parameter 'Y', 6, '#', '#differential_backup_retention_day', '14'

	exec hsp_set_migrate_parameter 'N', 7, '#excluded_from_default_full_backup', '#excluded_from_default_full_backup', ''
	exec hsp_set_migrate_parameter 'N', 8, '', '#excluded_from_default_differential_backup', ''

	exec hsp_set_migrate_parameter 'N', 11, '#excluded_from_default_check_integrity', '#excluded_from_default_check_integrity', ''
	exec hsp_set_migrate_parameter 'N', 21, '#excluded_from_default_reindex_online_only', '#excluded_from_default_reindex_online_only', ''
	exec hsp_set_migrate_parameter 'N', 22, '#excluded_from_default_reindex_all', '#excluded_from_default_reindex_all', ''
	exec hsp_set_migrate_parameter 'N', 23, '#excluded_from_default_reindex', '#excluded_from_default_reindex', ''

	exec hsp_set_migrate_parameter 'N', 31, '#excluded_from_default_update_statistics', '#excluded_from_default_update_statistics', ''

	exec hsp_set_migrate_parameter 'Y', 41, '#server_error_log_retention_day', '#server_error_log_retention_day', '14'
	exec hsp_set_migrate_parameter 'Y', 42, '#agent_error_log_retention_day', '#agent_error_log_retention_day', '14'
	exec hsp_set_migrate_parameter 'Y', 43, '#job_history_retention_day', '#job_history_retention_day', '14'
	exec hsp_set_migrate_parameter 'Y', 44, '#backup_restore_history_retention_day', '#backup_restore_history_retention_day', '60'

	exec hsp_set_migrate_parameter 'Y', 51, '#free_disk_space_threshold', '#free_disk_space_threshold', '1024'
	exec hsp_set_migrate_parameter 'N', 52, '#excluded_from_default_disk_space_check', '#excluded_from_default_disk_space_check', ''

	exec hsp_set_migrate_parameter 'Y', 61, '#job_output_folder', '#job_output_folder', 'K:\maintenance_job_log\'
	exec hsp_set_migrate_parameter 'Y', 62, '#job_output_file_retention_day', '#job_output_file_retention_day', '7'

	--- Migrate Actions
	exec hsp_migrate_action '#full_backup_time', 1, '#full_backup'

	exec hsp_migrate_action '#check_integrity_time', 11, '#check_integrity'
	exec hsp_migrate_action '#check_integrity_day_time', 11, '#check_integrity'


	exec hsp_migrate_action '#reindex_online_only_day_time', 21, '#reindex_online_only'
	exec hsp_migrate_action '#reindex_all_day_time', 22, '#reindex_all'

	exec hsp_migrate_action '#update_statistics_time', 31, '#update_statistics'
	exec hsp_migrate_action '#update_statistics_day_time', 31, '#update_statistics'

	exec hsp_migrate_action '#cleanup_history_and_error_log_time', 41, '#cleanup_history_and_error_log'

	exec hsp_migrate_action '#check_disk_space_time', 51, '#check_disk_space'

	exec hsp_migrate_action '#job_output_file_switch_time', 61, '#recycle_job_output_file'


-- schedule default action if it is a new installation

/*******************************
insert into [dbo].[tbl_maint_parameter] values (71, 'ITAM','#adhoc_backup_folder','K:\SQL_Backup\Adhoc\')
insert into dbo.tbl_maint_parameter values (72, 'ITAM', '#adhoc_backup_notification_email','jzhang@phsa.ca;Don.Gee@hssbc.ca')
insert into dbo.tbl_maint_action values (71, '#adhoc_backup','ITAM','onetime',0,0,'00:00',null,null,'2015-05-21 16:00:00')

insert into dbo.tbl_maint_action values (81, '#shrink_log_file','default','daily',0,0,'22:00',null,null,'2015-05-21 16:00:00')

insert into dbo.tbl_maint_action values (2, '#differential_backup','default','weekly',6,0,'22:00',null,null,'2015-05-21 16:00:00')


***********************************/

if not exists (select * from sysobjects where id = object_id(N'tbl_maint_setting') and xtype='U')
begin
	exec hsp_schedule_defaul_action 1, '#full_backup', 'daily', 0, 0, '19:00'
	-- exec hsp_schedule_defaul_action 21, '#reindex_online_only', 'weekly', 4, 0, '01:00'

	exec hsp_schedule_defaul_action 41, '#cleanup_history_and_error_log', 'daily', 0, 0, '16:00'

	exec hsp_schedule_defaul_action 51, '#check_disk_space', 'daily', 0, 0, '04:00'
	exec hsp_schedule_defaul_action 51, '#check_disk_space', 'daily', 0, 0, '15:00'

	exec hsp_schedule_defaul_action 61, '#recycle_job_output_file', 'daily', 0, 0, '16:00'
end
else if not exists (select * from sysobjects where id = object_id(N'tbl_maint_setting_V3') and xtype='U')
	-- rename the old parameter table to make sure it is not used
	exec sp_rename 'tbl_maint_setting','tbl_maint_setting_v3'

-- calculate the next start time for the first time
exec hsp_calculate_next_run_time


go




