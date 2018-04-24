

use master
go

if not exists (select * from sysobjects where id = object_id(N'tbl_maint_parameter') and xtype='U')
begin
	create table master.dbo.tbl_maint_parameter
	(
		id int ,
		database_name varchar (128) not null default ('default'),   
				-- Default means for all the databases. Otherwise, it is a database name
				-- If parameter_name is #free_disk_space_threshold, default for all the disk, other letter a specific drive
		parameter_name varchar(128) not null,  
		parameter_value varchar(128) not null,
	)
	
	create clustered index cl_ndx_parameter_id on tbl_maint_parameter (id)

	alter table dbo.tbl_maint_parameter
	add constraint fk_parameter_name 
	foreign key (parameter_name) references tbl_dic_parameter (parameter)

end

if not exists (select * from sysobjects where id = object_id(N'tbl_maint_action') and xtype='U')
begin
	create table master.dbo.tbl_maint_action
	(
		id int identity (1,1),
		action_id int not null,
		[action] varchar (128) not null,
		database_name varchar(256) not null,
		freq_type varchar (128) not null,
		freq_interval int,
		freq_week_interval int,
		start_time varchar(8) not null,
		[status] varchar(16),
		last_start_date_time datetime,
		next_start_date_time  datetime 
	)
	create clustered index cl_ndx_action_id on tbl_maint_action (action_id)

	alter table dbo.tbl_maint_action
	add constraint fk_action 
	foreign key ([action]) references tbl_dic_action (parameter)

	alter table dbo.tbl_maint_action
	add constraint fk_freq_type
	foreign key ([freq_type]) references tbl_dic_freq_type (parameter)

	alter table dbo.tbl_maint_action
	add constraint column_integrity_check check (
		(
			(freq_type = 'onetime' and next_start_date_time is not null)
			or 
			(freq_type = 'daily' and freq_interval >= 0)
			or
			(freq_type = 'weekly' and freq_interval between 1 and 7)
			or 
			(freq_type = 'monthly_day' and freq_interval between 1 and 31)
			or
			(freq_type = 'monthly_week_day' and freq_interval between 1 and 7 and freq_week_interval between 1 and 4)
		)
		and 
		(
			start_time like '[0-1][0-9]:[0-5][0-9]' or start_time like '[2][0-3]:[0-5][0-9]' 
		)
	)
end

if not exists (select * from sysobjects where id = object_id(N'tbl_maint_logging') and xtype='U')
	create table master.dbo.tbl_maint_logging
	(
		ID int identity (1,1) primary key clustered,
		eventdate datetime, 
		action varchar(200),
		description varchar(8000)
	)

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

go

go
