use [master]
go

create table master.dbo.tbl_maint_setting
(
	parameter_name varchar(128) not null,  
			-- 1. #backup_retention_day; 
			-- 2. #backup_folder
			-- 3. #full_backup_time
			-- 4. #excluded_from_default_full_backup
			-- 5. #excluded_from_default_backup_retention
	database_name varchar(128) not null default ('default'),   
			-- Default means for all the databases unless specified not. Otherwise, it is a database name
	parameter_value varchar(128) not null
)

insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#backup_retention_day','3')

insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#backup_folder','K:\SQL_Backup\')

insert into master.dbo.tbl_maint_setting (database_name, parameter_name, parameter_value)
values ('default', '#full_backup_time','20:00')
