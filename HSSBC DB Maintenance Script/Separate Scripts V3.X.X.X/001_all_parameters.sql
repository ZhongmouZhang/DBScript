			/************************************
			1.	#backup_folder:
					Changed to  #full_backup_folder (added in V4.0.0.0)
								#log_backup_folder (added in V4.0.0.0)

				#full_backup_time
				#excluded_from_default_full_backup
				
			2.	#backup_retention_day:
					Changed to	#full_backup_retention_day (added in V4.0.0.0)
								#log_backup_retention_day (added in V4.0.0.0)
			 
								
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
				#update_statistics_day_time  (added in V4.0.0.0)

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