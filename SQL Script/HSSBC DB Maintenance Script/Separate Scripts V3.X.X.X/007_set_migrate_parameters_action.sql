

-- Set or Migrate Parameters
exec hsp_set_migrate_parameter 'Y', 1, '#backup_folder', '#full_backup_folder', 'K:\SQL_Backup\'
exec hsp_set_migrate_parameter 'Y', 2, '#backup_folder', '#log_backup_folder', 'K:\SQL_Backup\'
exec hsp_set_migrate_parameter 'N', 3, '#excluded_from_default_full_backup', '#excluded_from_default_full_backup', ''
exec hsp_set_migrate_parameter 'Y', 4, '#backup_retention_day', '#full_backup_retention_day', '3'
exec hsp_set_migrate_parameter 'Y', 5, '#backup_retention_day', '#log_backup_retention_day', '3'

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


-- schedule default action if it doesn't exist
exec hsp_schedule_defaul_action 1, '#full_backup', 'Daily', 0, 0, '19:00'
exec hsp_schedule_defaul_action 21, '#reindex_online_only', 'Weekly', 4, 0, '01:00'

exec hsp_schedule_defaul_action 41, '#cleanup_history_and_error_log', 'Daily', 0, 0, '16:00'

exec hsp_schedule_defaul_action 51, '#check_disk_space', 'Daily', 0, 0, '04:00'
exec hsp_schedule_defaul_action 51, '#check_disk_space', 'Daily', 0, 0, '15:00'

exec hsp_schedule_defaul_action 61, '#recycle_job_output_file', 'Daily', 0, 0, '16:00'