use [master]
go

create table master.dbo.tbl_maint_setting
(
		database_name varchar (128) not null default ('default'),   
			-- Default means for all the databases unless specified not. Otherwise, it is a database name
		parameter_name varchar(128) not null,  
			-- 1. #backup_retention_day; 
			-- 2. #backup_folder
			-- 3. #full_backup_time
			-- 4. #excluded_from_default_full_backup
			-- 5. #excluded_from_default_backup_retention
			
			-- 6. #integrity_check_time
			-- 7. #update_statistics_time
			-- 8. #optimize_index_time
			-- 9. #reindex_weekly: hh:mm@7 (1:Monday, .... 7: Sunday)
			--10. #back_restore_history_retention_day
			--11. #job_history_retention_day
			--12. #check_disk_space_time
		parameter_value varchar(128) not null
)

insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#backup_retention_day','3')

insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#backup_folder','K:\SQL_Backup\')

insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#full_backup_time','20:00')

insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#integrity_check_time','50:00')
