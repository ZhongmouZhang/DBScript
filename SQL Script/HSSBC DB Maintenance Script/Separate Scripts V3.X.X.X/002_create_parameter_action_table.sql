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
end

if not exists (select * from sysobjects where id = object_id(N'tbl_maint_action') and xtype='U')
begin
	create table master.dbo.tbl_maint_action
	(
		id int identity (1,1),
		action_id int,
		[action] varchar (64),
		freq_type varchar (32),
		freq_interval int,
		freq_week_interval int,
		start_time varchar(8),
		[status] varchar(16),
		last_start_date_time datetime,
		next_start_date_time  datetime
	)
	create clustered index cl_ndx_action_id on tbl_maint_action (action_id)
end

