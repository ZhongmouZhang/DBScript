 use [master]
go

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
			#excluded_from_default_backup_retention
			
		3.	#check_integrity_time
			#excluded_from_default_check_integrity
			
		4.	#reindex_time  hh:mm
			#excluded_from_default_reindex
			#full_reindex_day_of_week 6,7,... (1:Monday, .... 7: Sunday), at specific days, full re-index will be done.
			
		5.	#update_statistics_time
			#excluded_from_default_update_statistics

		6.	#backup_restore_history_retention_day

		7.	#job_history_retention_day

		8.	#check_disk_space_time
			#free_disk_space_threshold 
			#
		******************************************************/
		parameter_value varchar(128) not null
)

insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#backup_retention_day','3')
insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#backup_folder','K:\SQL_Backup\')
insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#full_backup_time','20:00')

insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#check_integrity_time','22:00')

insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#reindex_time','02:00')
insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#full_reindex_day_of_week','6')


insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#update_statistics_time','04:00')

insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#backup_restore_history_retention_day','60')
insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#job_history_retention_day','60')


insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#check_disk_space_time','04:00')
insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#free_disk_space_threshold','1024')
insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('D', '#free_disk_space_threshold','1024')


create table master.dbo.tbl_maint_logging
(
	ID int identity (1,1) primary key clustered,
	eventdate datetime, 
	action varchar(200),
	description varchar(8000)
)

