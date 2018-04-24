------------Merging Date and Time: 06/16/2016 13:46:59 --------------------




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\001_all_parameters.sql --------------------
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
use master
go

if not exists (select * from sysobjects where id = object_id(N'tbl_dic_parameter') and xtype='U')
begin
	create table tbl_dic_parameter
	(
		parameter varchar(128) primary key
	)

	insert into tbl_dic_parameter values ('#full_backup_folder')
	insert into tbl_dic_parameter values ('#log_backup_folder')
	insert into tbl_dic_parameter values ('#excluded_from_default_full_backup')
	insert into tbl_dic_parameter values ('#full_backup_retention_day')
	insert into tbl_dic_parameter values ('#log_backup_retention_day')
	insert into tbl_dic_parameter values ('#excluded_from_default_check_integrity')
	insert into tbl_dic_parameter values ('#excluded_from_default_reindex_online_only')
	insert into tbl_dic_parameter values ('#excluded_from_default_reindex_all')
	insert into tbl_dic_parameter values ('#excluded_from_default_reindex')
	insert into tbl_dic_parameter values ('#excluded_from_default_update_statistics')
	insert into tbl_dic_parameter values ('#server_error_log_retention_day')
	insert into tbl_dic_parameter values ('#agent_error_log_retention_day')
	insert into tbl_dic_parameter values ('#job_history_retention_day')
	insert into tbl_dic_parameter values ('#backup_restore_history_retention_day')
	insert into tbl_dic_parameter values ('#free_disk_space_threshold')
	insert into tbl_dic_parameter values ('#excluded_from_default_disk_space_check')
	insert into tbl_dic_parameter values ('#job_output_folder')
	insert into tbl_dic_parameter values ('#job_output_file_retention_day')
	insert into tbl_dic_parameter values ('#adhoc_backup_folder')
	insert into tbl_dic_parameter values ('#adhoc_backup_notification_email')
end

if not exists (select * from sysobjects where id = object_id(N'tbl_dic_action') and xtype='U')
begin
	create table tbl_dic_action
	(
		parameter varchar(128) primary key
	)
	insert into tbl_dic_action values ('#full_backup')
	insert into tbl_dic_action values ('#log_backup')
	insert into tbl_dic_action values ('#check_integrity')
	insert into tbl_dic_action values ('#reindex_online_only')
	insert into tbl_dic_action values ('#reindex_all')
	insert into tbl_dic_action values ('#update_statistics')
	insert into tbl_dic_action values ('#cleanup_history_and_error_log')
	insert into tbl_dic_action values ('#check_disk_space')
	insert into tbl_dic_action values ('#recycle_job_output_file')
	insert into tbl_dic_action values ('#adhoc_backup')
	insert into tbl_dic_action values ('#shrink_log_file')
end

if not exists (select * from sysobjects where id = object_id(N'tbl_dic_freq_type') and xtype='U')
begin
	create table tbl_dic_freq_type
	(
		parameter varchar(128) primary key
	)

	-- frequent type
	insert into tbl_dic_freq_type values ('onetime')
	insert into tbl_dic_freq_type values ('daily')
	insert into tbl_dic_freq_type values ('weekly')
	insert into tbl_dic_freq_type values ('monthly_day')
	insert into tbl_dic_freq_type values ('monthly_week_day')

end





---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\002_create_parameter_action_logging_version_table.sql --------------------


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




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\003_hsp_set_migrate_parameter.sql --------------------
USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_set_migrate_parameter') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_set_migrate_parameter
GO


create   proc [dbo].hsp_set_migrate_parameter
@is_mandatory char (1),  -- Y/N
@id int,
@old_parameter varchar(64),
@new_parameter varchar(64),
@default_value varchar(64)
as
if not exists (select * from master.dbo.tbl_maint_parameter where parameter_name = @new_parameter)
begin
	if not exists (select * from sysobjects where id = object_id(N'tbl_maint_setting') and xtype='U')
	begin
		if @is_mandatory = 'Y'
			insert into master.dbo.tbl_maint_parameter ( id, database_name, parameter_name, parameter_value)
			values (@id, 'default', @new_parameter,@default_value)
	end		
	else
	begin
		if exists (select * from master.dbo.tbl_maint_setting where parameter_name = @old_parameter)
		begin
			insert into master.dbo.tbl_maint_parameter ( id, database_name, parameter_name, parameter_value)
			select @id, database_name, @new_parameter ,parameter_value
			from tbl_maint_setting
			where parameter_name = @old_parameter
		end
		else
		begin
			if @is_mandatory = 'Y'
				insert into master.dbo.tbl_maint_parameter ( id, database_name, parameter_name, parameter_value)
				values (@id, 'default', @new_parameter,@default_value)
		end
	end
end

go




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\004_hsp_migrate_action.sql --------------------
USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_migrate_action') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_migrate_action
GO


create   proc [dbo].hsp_migrate_action
@old_parameter varchar(64),    -- if ='' means schedule a new time for the acton
@id int,
@action varchar(32)

as
-- migrating the scheduled actions
if exists (select * from sysobjects where id = object_id(N'tbl_maint_setting') and xtype='U')
begin
	if not exists (select * from master.dbo.tbl_maint_action where [action] = @action)
		and exists (select * from master.dbo.tbl_maint_setting where parameter_name = @old_parameter)
	begin
			insert into master.dbo.tbl_maint_action( action_id, [action], database_name, freq_type, freq_interval, freq_week_interval, start_time )
			select @id, @action
				, database_name 
				, case when SUBSTRING( parameter_value, 2,1)=' ' then 'weekly'
						else 'daily'
				  end
				, case when SUBSTRING( parameter_value, 2,1)=' ' then CONVERT (int, substring(parameter_value,1,1))
						else 0
				  end
				, 0
				, case when SUBSTRING( parameter_value, 2,1)=' ' then SUBSTRING (parameter_value, 3,5)
						else parameter_value
				  end

			from tbl_maint_setting
			where parameter_name = @old_parameter
	end

end

go





---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\005_hsp_schedule_default_action.sql --------------------
USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_schedule_defaul_action') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_schedule_defaul_action
GO


create   proc [dbo].hsp_schedule_defaul_action
@id int,
@action varchar(32),
@freq_type varchar(16),
@freq_interval int,
@freq_week_interval int,
@start_time varchar(16)

as

if not exists (select * from tbl_maint_action where [action]= @action)
begin 
	insert into tbl_maint_action (action_id, [action], database_name, freq_type, freq_interval, freq_week_interval, start_time )
	values (@id, @action,'default', @freq_type, @freq_interval, @freq_week_interval, @start_time)
end


go




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\006_hfn_week_number_of_month.sql --------------------
if exists (select * from dbo.sysobjects where id = object_id(N'hfn_week_number_in_month'))
drop function hfn_week_number_in_month
GO


CREATE function    hfn_week_number_in_month
( @date datetime )
returns int
begin
	return (select datediff(week, dateadd(week, datediff(week, 0, dateadd(month, datediff(month, 0, @date), 0)), 0), @date - 1) + 1)
end

go






---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\007_hfn_last_day_of_month.sql --------------------
if exists (select * from dbo.sysobjects where id = object_id(N'hfn_last_day_of_month'))
drop function hfn_last_day_of_month
GO


CREATE function    hfn_last_day_of_month

(
    @Date DATETIME
)
RETURNS DATETIME
AS
BEGIN

    RETURN DATEADD(d, -1, DATEADD(m, DATEDIFF(m, 0, @Date) + 1, 0))

END


go






---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\008_hsp_calculate_next_run_time.sql --------------------
use [master]
go


if exists (select * from dbo.sysobjects where id = object_id(N'hsp_calculate_next_run_time') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_calculate_next_run_time
GO

CREATE         proc hsp_calculate_next_run_time

as
declare @id int
declare @freq_type varchar(32), @freq_interval int, @freq_week_interval int, @start_time varchar(8)
declare @next_start_date_time datetime
declare @week_in_month int


SET DATEFIRST 1

while exists (select * from dbo.tbl_maint_action 
				where ( next_start_date_time is null 
						or last_start_date_time >= next_start_date_time -- job got run successfully
						)
					and freq_type in ('daily','weekly','monthly_day','monthly_week_day')
			 )
begin
	select @id = min(id) 
	from dbo.tbl_maint_action 
	where ( next_start_date_time is null 
			or last_start_date_time >= next_start_date_time -- job got run successfully
			)
		and freq_type in ('daily','weekly','monthly_day','monthly_week_day')
	
	select	@freq_type= freq_type
			, @freq_interval = freq_interval
			, @freq_week_interval = freq_week_interval
			, @start_time = start_time
	from tbl_maint_action
	where id = @id

	-- set next start date time as today
	set @next_start_date_time = substring (convert (varchar (20), getdate(), 120), 1, 10) + ' ' + @start_time

	-- if the @start_time format is not correct, set the time to the midnight by default
	if @@ERROR != 0
	set @next_start_date_time = substring (convert (varchar (20), getdate(), 120), 1, 10) + ' 23:59:00'

	if (@freq_type = 'daily')
	begin
		if GETDATE() > @next_start_date_time
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)
	end
	else if @freq_type = 'weekly'
	begin
		if DATEPART(DW,@next_start_date_time)=@freq_interval
		begin
			if GETDATE() > @next_start_date_time
				set @next_start_date_time = dateadd (day,1,@next_start_date_time)
		end
		
		while  DATEPART(DW,@next_start_date_time)!=@freq_interval
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)
	end
	else if @freq_type = 'monthly_day'
	begin
		if DATEPART(Day,@next_start_date_time)=@freq_interval
		begin
			if GETDATE() > @next_start_date_time
				set @next_start_date_time = dateadd (day,1,@next_start_date_time)
		end

		if @freq_interval=31   -- last day of month
		begin
			select @next_start_date_time = dbo.hfn_last_day_of_month(@next_start_date_time)
			set @next_start_date_time = substring (convert (varchar (20), @next_start_date_time, 120), 1, 10) + ' ' + @start_time
		end
		else
		begin
			while  DATEPART(Day,@next_start_date_time)!=@freq_interval
				set @next_start_date_time = dateadd (day,1,@next_start_date_time)
		end 
	end	
	else if @freq_type = 'monthly_week_day'
	begin
		-- set first day of next month
		set @next_start_date_time = DATEADD(dd,-(DAY(DATEADD(mm,1,@next_start_date_time))-1),DATEADD(mm,1,@next_start_date_time))

		if dbo.hfn_week_number_in_month(@next_start_date_time) = @freq_week_interval
			 and DATEPART(DW,@next_start_date_time)=@freq_interval
		begin
			if GETDATE() > @next_start_date_time
				set @next_start_date_time = dateadd (day,1,@next_start_date_time)
		end
		
		while  dbo.hfn_week_number_in_month(@next_start_date_time) != @freq_week_interval
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)

		while  DATEPART(DW,@next_start_date_time)!=@freq_interval
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)
	end		
	
	update dbo.tbl_maint_action
	set next_start_date_time = @next_start_date_time
	where [id]=@id
end


go




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\010_set_migrate_parameters_action.sql --------------------

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


-- schedule default action if it is a new installation

/*******************************
insert into [dbo].[tbl_maint_parameter] values (71, 'ITAM','#adhoc_backup_folder','K:\SQL_Backup\Adhoc\')
insert into dbo.tbl_maint_parameter values (72, 'ITAM', '#adhoc_backup_notification_email','jzhang@phsa.ca;Don.Gee@hssbc.ca')
insert into dbo.tbl_maint_action values (71, '#adhoc_backup','ITAM','onetime',0,0,'00:00',null,null,'2015-05-21 16:00:00')

insert into dbo.tbl_maint_action values (81, '#shrink_log_file','default','daily',0,0,'22:00',null,null,'2015-05-21 16:00:00')

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








---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\020_hsp_script_version_control.sql --------------------
 /*************************************************************************

	Version Control Stored procedure
	
**************************************************************************/
USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_script_version_control') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_script_version_control
GO


create   proc [dbo].hsp_script_version_control
@version varchar(16),
@descript varchar(6000)
as

if exists (select * from sysobjects where id = object_id(N'tbl_maint') and xtype='U')   -- version 1 table
begin 
	insert into tbl_maint_version_info (script_name, version, created_by, date_time)
	select script_name, version, created_by, date_time from tbl_maint
	
	drop table tbl_maint
end

if not exists (select * from tbl_maint_version_info where version = @version)
	insert into tbl_maint_version_info values ('DB Maintenance Scripts', @version, SUSER_NAME(), getdate(),@descript)

go






---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\021_hfn_week_number_of_month.sql --------------------
if exists (select * from dbo.sysobjects where id = object_id(N'hfn_week_number_in_month'))
drop function hfn_week_number_in_month
GO


CREATE function    hfn_week_number_in_month
( @date datetime )
returns int
begin
	return (select datediff(week, dateadd(week, datediff(week, 0, dateadd(month, datediff(month, 0, @date), 0)), 0), @date - 1) + 1)
end

go





---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\022_last_day_of_month.sql --------------------
if exists (select * from dbo.sysobjects where id = object_id(N'hfn_last_day_of_month'))
drop function hfn_last_day_of_month
GO


CREATE function    hfn_last_day_of_month

(
    @Date DATETIME
)
RETURNS DATETIME
AS
BEGIN

    RETURN DATEADD(d, -1, DATEADD(m, DATEDIFF(m, 0, @Date) + 1, 0))

END

go





---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\023_calculate_next_run_time.sql --------------------
use [master]
go


if exists (select * from dbo.sysobjects where id = object_id(N'hsp_calculate_next_run_time') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_calculate_next_run_time
GO

CREATE         proc hsp_calculate_next_run_time

as
declare @id int
declare @freq_type varchar(32), @freq_interval int, @freq_week_interval int, @start_time varchar(8)
declare @next_start_date_time datetime
declare @week_in_month int


SET DATEFIRST 1

while exists (select * from dbo.tbl_maint_action 
				where ( next_start_date_time is null 
						or last_start_date_time >= next_start_date_time -- job got run successfully
						)
					and freq_type in ('daily','weekly','monthly_day','monthly_week_day')
			 )
begin
	select @id = min(id) 
	from dbo.tbl_maint_action 
	where ( next_start_date_time is null 
			or last_start_date_time >= next_start_date_time -- job got run successfully
			)
		and freq_type in ('daily','weekly','monthly_day','monthly_week_day')
	
	select	@freq_type= freq_type
			, @freq_interval = freq_interval
			, @freq_week_interval = freq_week_interval
			, @start_time = start_time
	from tbl_maint_action
	where id = @id

	-- set next start date time as today
	set @next_start_date_time = substring (convert (varchar (20), getdate(), 120), 1, 10) + ' ' + @start_time

	-- if the @start_time format is not correct, set the time to the midnight by default
	if @@ERROR != 0
	set @next_start_date_time = substring (convert (varchar (20), getdate(), 120), 1, 10) + ' 23:59:00'

	if (@freq_type = 'daily')
	begin
		if GETDATE() > @next_start_date_time
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)
	end
	else if @freq_type = 'weekly'
	begin
		if DATEPART(DW,@next_start_date_time)=@freq_interval
		begin
			if GETDATE() > @next_start_date_time
				set @next_start_date_time = dateadd (day,1,@next_start_date_time)
		end
		
		while  DATEPART(DW,@next_start_date_time)!=@freq_interval
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)
	end
	else if @freq_type = 'monthly_day'
	begin
		if DATEPART(Day,@next_start_date_time)=@freq_interval
		begin
			if GETDATE() > @next_start_date_time
				set @next_start_date_time = dateadd (day,1,@next_start_date_time)
		end

		if @freq_interval=31   -- last day of month
		begin
			select @next_start_date_time = dbo.hfn_last_day_of_month(@next_start_date_time)
			set @next_start_date_time = substring (convert (varchar (20), @next_start_date_time, 120), 1, 10) + ' ' + @start_time
		end
		else
		begin
			while  DATEPART(Day,@next_start_date_time)!=@freq_interval
				set @next_start_date_time = dateadd (day,1,@next_start_date_time)
		end 
	end	
	else if @freq_type = 'monthly_week_day'
	begin
		-- set first day of next month
		set @next_start_date_time = DATEADD(dd,-(DAY(DATEADD(mm,1,@next_start_date_time))-1),DATEADD(mm,1,@next_start_date_time))

		if dbo.hfn_week_number_in_month(@next_start_date_time) = @freq_week_interval
			 and DATEPART(DW,@next_start_date_time)=@freq_interval
		begin
			if GETDATE() > @next_start_date_time
				set @next_start_date_time = dateadd (day,1,@next_start_date_time)
		end
		
		while  dbo.hfn_week_number_in_month(@next_start_date_time) != @freq_week_interval
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)

		while  DATEPART(DW,@next_start_date_time)!=@freq_interval
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)
	end		
	
	update dbo.tbl_maint_action
	set next_start_date_time = @next_start_date_time
	where [id]=@id
end


go




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\024_hsp_maint_log.sql --------------------
USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_maint_log') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_maint_log
GO


create   proc [dbo].hsp_maint_log
@is_begin char(1),
@action varchar(64)
as
declare @description_str varchar (5000)
	
if @is_begin = 'Y'
begin
	if @action in ('#full_backup','#check_integrity','#reindex_online_only','#reindex_all','#update_statistics')
	begin 
		set @description_str = 'Database: '
		select @description_str = @description_str + dbname + ';  ' from #temp order by dbname
	end 
	else
		set @description_str = ''
		
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'Starting ' + @action , @description_str)
end
else
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'End of ' + @action , '')



go







---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\025_hfn_get_retention_day.sql --------------------
if exists (select * from dbo.sysobjects where id = object_id(N'hfn_get_retention_day'))
drop function hfn_get_retention_day
GO


CREATE function    hfn_get_retention_day
( @parameter varchar(64),
@database_name varchar(128)  )
returns int
begin
	declare @retention_day int
	if @parameter in ('#full_backup_retention_day','#log_backup_retention_day') 
	begin
		if not exists ( select * from master.dbo.tbl_maint_parameter
				where database_name=@database_name and parameter_name=@parameter)
			select @retention_day=convert(int,parameter_value) 	
			from master.dbo.tbl_maint_parameter 
			where database_name='default' and parameter_name=@parameter
		else
			select @retention_day=convert(int,parameter_value) 	
			from master.dbo.tbl_maint_parameter 
			where database_name=@database_name and parameter_name=@parameter
	end 
	else
		select @retention_day=convert(int,parameter_value) 	
		from master.dbo.tbl_maint_parameter 
		where parameter_name=@parameter
		
	return @retention_day
end



go






---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\026_hfn_get_backup_path.sql --------------------
if exists (select * from dbo.sysobjects where id = object_id(N'hfn_get_backup_path'))
drop function hfn_get_backup_path
GO


CREATE function    hfn_get_backup_path
( @parameter varchar(512),
@database_name varchar(128)  )
returns varchar(512)
begin
	declare @path varchar(512)
	if not exists ( select * from master.dbo.tbl_maint_parameter
			where database_name=@database_name and parameter_name=@parameter)
		select @path = parameter_value 
		from tbl_maint_parameter
		where database_name='default' and parameter_name=@parameter
	else
		select @path =parameter_value
		from master.dbo.tbl_maint_parameter 
		where database_name=@database_name and parameter_name=@parameter

	return @path
end


go






---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\030_hsp_get_candidate_database_list.sql --------------------
use [master]
go


if exists (select * from dbo.sysobjects where id = object_id(N'hsp_get_candidate_database_list') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_get_candidate_database_list
GO


CREATE         proc hsp_get_candidate_database_list
@action varchar(64),
@database_name varchar(256)
as
truncate table #temp
SET DATEFIRST 1

if @action = '#full_backup'
begin
	insert into #temp 
	select rtrim(name) from master.sys.databases db
	where ( name = @database_name 
			or (@database_name='default' 
				and name not in ('tempdb','distribution') 
				and not exists (select * from master.dbo.tbl_maint_parameter bp 
								where parameter_name = '#excluded_from_default_full_backup' 
								and db.name=bp.database_name)  
								-- exclude the dbs which are specifically excluded
				and not exists (select * from master.dbo.tbl_maint_action ma
								where [action] = '#full_backup' and database_name = db.name) 
								-- exclude the dbs which have their own backup schedule
				)
		)
		and  state = 0 and is_read_only = 0 
end
else if @action = '#check_integrity'
begin
	insert into #temp 
	select rtrim(name) from master.sys.databases db
	where ( name = @database_name 
			or (@database_name='default' 
				and name not in ('tempdb','distribution') 
				and not exists (select * from master.dbo.tbl_maint_parameter bp 
								where parameter_name = '#excluded_from_default_check_integrity' 
								and db.name=bp.database_name)  
								-- exclude the dbs which are specifically excluded
				and not exists (select * from master.dbo.tbl_maint_action ma
								where [action] = '#check_integrity' and database_name = db.name) 
								-- exclude the dbs which have their own backup schedule
				)
		)
		and  state = 0 and is_read_only = 0 
end
else if @action = '#reindex_online_only'
begin
	insert into #temp 
	select rtrim(name) from master.sys.databases db
	where ( name = @database_name 
			or (@database_name='default' 
				and name not in ('tempdb','distribution') 
				and not exists (select * from master.dbo.tbl_maint_parameter bp 
								where parameter_name in ('#excluded_from_default_reindex_online_only','#excluded_from_default_reindex') 
								and db.name=bp.database_name)  
								-- exclude the dbs which are specifically excluded
				and not exists (select * from master.dbo.tbl_maint_action ma
								where [action] = '#reindex_online_only' and database_name = db.name) 
								-- exclude the dbs which have their own backup schedule
				)
		)
		and  state = 0 and is_read_only = 0 
end
else if @action = '#reindex_all'
begin
	insert into #temp 
	select rtrim(name) from master.sys.databases db
	where ( name = @database_name 
			or (@database_name='default' 
				and name not in ('tempdb','distribution') 
				and not exists (select * from master.dbo.tbl_maint_parameter bp 
								where parameter_name in ('#excluded_from_default_reindex_all','#excluded_from_default_reindex') 
								and db.name=bp.database_name)  
								-- exclude the dbs which are specifically excluded
				and not exists (select * from master.dbo.tbl_maint_action ma
								where [action] = '#reindex_all' and database_name = db.name) 
								-- exclude the dbs which have their own backup schedule
				)
		)
		and  state = 0 and is_read_only = 0 

end
else if @action = '#update_statistics'
begin
	insert into #temp 
	select rtrim(name) from master.sys.databases db
	where ( name = @database_name 
			or (@database_name='default' 
				and name not in ('tempdb','distribution') 
				and not exists (select * from master.dbo.tbl_maint_parameter bp 
								where parameter_name in ('#excluded_from_default_update_statistics') 
								and db.name=bp.database_name)  
								-- exclude the dbs which are specifically excluded
				and not exists (select * from master.dbo.tbl_maint_action ma
								where [action] = '#update_statistics' and database_name = db.name) 
								-- exclude the dbs which have their own backup schedule
				)
		)
		and  state = 0 and is_read_only = 0 
end

go






---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\040_hsp_test_create_subfolder.sql --------------------
 
/*********************************************************************

	Test if there is a corresponding database subfolder in a specified 
	path. If not, create one for the database
	
**********************************************************************/

use master
go 

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_test_create_subfolder') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_test_create_subfolder
GO

-- hsp_TestCreateSubfolder '\\srvnetapp03\SQL_Back$\ZVMSQ2K801\', 'master'

CREATE         proc hsp_test_create_subfolder
@path varchar(1024),
@dbname varchar(1024)
as

declare @stt varchar (5000)

-- delete the existing full backups
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#subfolderList') and xtype='U')
drop table #subfolderList
CREATE TABLE #subfolderList(line varchar(2000))

set @stt = 'dir "' + @path + '" /B /A:D'
INSERT INTO #subfolderList 
EXEC xp_cmdshell @stt

--select * from #subfolderList

if not exists (select * from #subfolderList where line = @dbname)
begin 
	set @stt = 'md "' + @path + @dbname +'" '
	EXEC xp_cmdshell @stt
end

go
-- select * from #subfolderList







---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\050_hsp_delete_obsolete_backup.sql --------------------
 
/*********************************************************************

		Delete the backup older than the retention day
	exec hsp_delete_obsolete_backup 2, 'BookStore'
**********************************************************************/
use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_delete_obsolete_backup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_delete_obsolete_backup
GO

CREATE         proc dbo.hsp_delete_obsolete_backup
@flag int, -- 1: delete full backup   2: delete log backup  3: differential backup
@database_name varchar(512) = ''   -- default is for all the databases
as

declare @path varchar(1024)
declare @filename varchar (512)
declare @stt varchar (5000)
declare @full_backup_retention int, @log_backup_retention int
declare @match_pattern varchar(512)
declare @one_db char(1)

-- delete the existing full backups
-- create the two temp tables for candidate file list
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#DeletingFileList') and xtype='U')
drop table #DeletingFileList
CREATE TABLE #DeletingFileList(line varchar(2000))

-- Get all the candidate backup files
set @path = ''
while 1=1
begin 
	select @path = min(parameter_value) 
	from master.dbo.tbl_maint_parameter
	where parameter_name in ( '#full_backup_folder','#log_backup_folder') and parameter_value > @path
	if @path is null 		
		break
	set @stt = 'dir "' + @path + '" /S /B'  -- return the full path for the candidate files
	INSERT INTO #fileList 
    EXEC xp_cmdshell @stt
end
	
-- select to-be-deleted files
if @database_name = ''
	set @one_db = 'N'
else
	set @one_db = 'Y'
while 1=1
begin
	if @one_db = 'N'
		select @database_name = MIN(name)
		from master.dbo.sysdatabases db
		where name > @database_name
			and name not in ('tempdb','distribution')
			and  status & 512 != 512 -- off line 
			and  status & 32 != 32
			and  status & 1024 != 1024 --ready only 
	if @database_name is null 
		break
		
	-- get the full/log backup retention day
	select @full_backup_retention=dbo.hfn_get_retention_day('#full_backup_retention_day',@database_name)
			, @log_backup_retention = dbo.hfn_get_retention_day('#log_backup_retention_day',@database_name)

	if (@flag = 1)  -- delete full backups
	begin
		set @match_pattern = '%' + @database_name + '[_]Full[_]%.bak'
		insert into #DeletingFileList
		SELECT line FROM #fileList 
		WHERE line like  @match_pattern
			and LEN (line) > 25
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 18, 8)) = 1
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 9, 6)) = 1
			and dateadd(hour,-@full_backup_retention*24+5,getdate())>= 
				convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+ SUBSTRING(line, LEN(line) - 9, 2)+':'+
							SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2))
	end
	else if (@flag = 2)	-- delete log backups			
	begin
		set @match_pattern = '%' + @database_name + '[_]Log[_]%.trn'
		insert into #DeletingFileList
		SELECT line FROM #fileList 
		WHERE  line like @match_pattern
			and LEN (line) > 25
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 18, 8)) = 1
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 9, 6)) = 1
			and dateadd(day,-@log_backup_retention,getdate())>= 
				convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+SUBSTRING(line, LEN(line) - 9, 2)+':'+
							SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2))
	end
	else if (@flag = 3)  -- delete differential backup
	begin
		set @match_pattern = '%' + @database_name + '[_]diff[_]%.trn'
		insert into #DeletingFileList
		SELECT line FROM #fileList 
		WHERE  line like @match_pattern
			and LEN (line) > 25
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 18, 8)) = 1
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 9, 6)) = 1
			and dateadd(hour,-@log_backup_retention*24+5,getdate())>= 
				convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+SUBSTRING(line, LEN(line) - 9, 2)+':'+
							SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2))
	end

	-- exit when only for one DB
	if @one_db = 'Y'
		break
end	

-- delete the to-be-deleted files
set @path = ''
while 1=1
begin 
	select @path = MIN(line) from #DeletingFileList where line > @path 
	if @path is null
		break
	set @stt = 'del "' + @path + '"'
	exec master.dbo.xp_cmdshell @stt
	--print @stt
end


go






---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\051_hsp_delete_latest_full_backup_with_dbname.sql --------------------

/*****************************************************************************

	Delete the latest backup file

******************************************************************************/

use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_delete_latest_full_backup_with_dbname') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_delete_latest_full_backup_with_dbname
GO


CREATE  proc hsp_delete_latest_full_backup_with_dbname
@dbname varchar(100)

as
declare @path varchar(500)
declare @filename varchar(100)
declare @stt nvarchar(2000),@spidstr varchar(4000)

if (@@version like 'Microsoft SQL Server 2005%' or @@version like 'Microsoft SQL Server 2008%')
begin
	exec sp_configure 'Ole Automation Procedures', '1'
	exec sp_configure 'xp_cmdshell', '1'
	reconfigure with override
end

-- get the backup folder
if not exists ( select * from master.dbo.tbl_maint_setting 
				where database_name=@dbname and parameter_name='#backup_folder')
	select @path = parameter_value 
	from master.dbo.tbl_maint_setting 
	where database_name='default' and parameter_name='#backup_folder'
else
	select @path = parameter_value 
	from master.dbo.tbl_maint_setting 
	where database_name=@dbname and parameter_name='#backup_folder'
	

-- get the latest backup file name
set @stt = 'dir ' + @path + @dbname + ' /B'
CREATE TABLE #fileList(line varchar(2000))
INSERT INTO #fileList 
     EXEC xp_cmdshell @stt
SELECT @filename=line FROM #fileList 
WHERE line like  @dbname + '[_]FULL[_]%'
	and right(line,19) = 
			(select max(right(line,19)) from #fileList 
				where line like @dbname + '[_]FULL[_]%' and len(line)=len(@dbname)+25)
Drop table #fileList

--print @path + @dbname + '\' + @filename
set @stt = 'del ' + @path + @dbname + '\' + @filename
exec xp_cmdshell @stt


go



 




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\060_hsp_full_backup_database.sql --------------------
USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_full_backup_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_full_backup_database
GO


create        proc [dbo].hsp_full_backup_database
as

declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @dbname varchar(128)


-- backup all the databases in #temp table
set @dbname = ''
while 1=1
begin 
_next_loop:
	select @dbname =MIN(dbname) from #temp where dbname>@dbname
	if @dbname is null
		break
	-- select the backup folder
	select @path = dbo.hfn_get_backup_path('#full_backup_folder',@dbname)
	
	-- delete the obsolete full backup of the database
	exec hsp_delete_obsolete_backup 1, @dbname

	-- if HADR is enabled and current replica is not a preferred backup, skip it
	if (SELECT SERVERPROPERTY ('IsHadrEnabled'))=1 
	begin
		if  sys.fn_hadr_backup_is_preferred_replica (@dbname) != 1
			goto _next_loop
	end

	exec hsp_test_create_subfolder @path,@dbname
	set @path = @path + @dbname + '\'
	 
	select @dest=@path + @dbname + '_Full_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.bak'
	
	-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
	if exists (select * from master.dbo.tbl_maint_parameter
				where parameter_name='#litespeed_for_full_backup' and parameter_value = 'Y')
	begin
		set @stt = 'xp_backup_database @database = ''' + @dbname + ''', @filename = ''' + @dest + ''''
	end
	else
	begin
		set @stt = 'backup database [' + @dbname + '] to Disk=''' + @dest + ''' with init,stats'
		if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
			charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
		begin
			-- backup database @dbname to Disk=@dest with init,stats, compression
			set @stt = @stt + ', compression'
		end

		-- if HADR is enabled and current replica is a secondary replica
		if (SELECT SERVERPROPERTY ('IsHadrEnabled'))=1 
		begin
			if  dbo.fn_hadr_is_primary_replica (@dbname) != 1  -- not the primary replica
				set @stt = @stt + ', copy_only'
		end
		end

	print 'Full backup command: ' + @stt
	print ' '
	EXEC (@stt)
	
	if (@@error != 0)
	begin
		raiserror ('Full backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end
end


go






---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\061_hsp_adhoc_backup_database.sql --------------------
USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_adhoc_backup_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_adhoc_backup_database
GO


create        proc [dbo].hsp_adhoc_backup_database
as
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @database_name varchar(128)
declare @id int
declare @action varchar(64)
declare	@mail_subject nvarchar(600), @mail_body varchar(700), @email_address varchar(800)



select @id = MIN(id)
from dbo.tbl_maint_action 
where next_start_date_time < GETDATE()
		and ( last_start_date_time is null or last_start_date_time < next_start_date_time)
		and [action] = '#adhoc_backup'
		
if (@id is null)
	goto _the_end
		
select @action = [action] , @database_name = database_name
from dbo.tbl_maint_action
where [id]=@id
	
update tbl_maint_action
set last_start_date_time = GETDATE(), [status] = 'running'
where [id]=@id
	
exec hsp_maint_log @is_begin='Y', @action=@action
	
	

-- adhoc backup a databases
	
-- select the backup folder
select @path = dbo.hfn_get_backup_path('#adhoc_backup_folder',@database_name)
select @email_address = dbo.hfn_get_backup_path('#adhoc_backup_notification_email',@database_name)
if @path is null
	goto _the_end 

exec hsp_test_create_subfolder @path,@database_name
set @path = @path + @database_name + '\'
	 
select @dest=@path + @database_name + '_adhoc_' + convert(varchar,getdate(),112)+'_' 
	+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
	+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
	+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
	+'.bak'
	
		set @stt = 'backup database [' + @database_name + '] to Disk=''' + @dest + ''' with init,stats'
		if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
			charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
		begin
			-- backup database @dbname to Disk=@dest with init,stats, compression
			set @stt = @stt + ', compression'
		end
	
EXEC (@stt)

if @@ERROR = 0
begin 
	set @mail_subject = 'The adhoc backup of ' +@@SERVERNAME + '\' + @database_name + ' is done'
	set @mail_body = 'The backup file name: ' + @dest
	EXEC msdb.dbo.sp_send_dbmail
		@profile_name = 'Database Services',
		--@recipients = N'james.zhang@hssbc.ca', 
		@recipients = @email_address, 
		@body = @mail_body, 
		@subject = @mail_subject
end 


	
update tbl_maint_action
set [status] = 'successful'
where [id]=@id

exec hsp_maint_log 'N', @action

-- calculating the next run time
exec hsp_calculate_next_run_time
 
	

_the_end:

go






---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\070_hsp_mirror_db_failover_time.sql --------------------


 /*****************************************
The Stored procedure returns the time when the specified database failover happens

declare @switch_time datetime
exec master.dbo.hsp_Mirror_DBFailoverTime 'SS_Prod', @switch_time output
select @switch_time
go
*********************************************/
use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_mirror_db_failover_time') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_mirror_db_failover_time
GO

create procedure hsp_mirror_db_failover_time @database_name sysname, @switch_time datetime output 
as
begin
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#mirroring_status') and xtype='U')
drop table #mirroring_status
create table #mirroring_status
(
	database_name sysname,
	role int,
	mirroring_state int,
	witness_status int,
	log_generation_rate int,
	unsent_log int,
	send_rate int,
	unrestored_log int,
	recovery_rate int,
	trasaction_delay int,
	transactions_per_second int,
	average_delay int,
	time_record datetime,
	time_behind datetime,
	local_time time
)
insert into #mirroring_status
exec msdb.dbo.sp_dbmmonitorresults @database_name, 4

declare @time_diff int
set @time_diff = DATEDIFF(hour, getutcdate(),getdate())
select @switch_time = dateadd(hour,@time_diff, MIN(time_record))
from #mirroring_status
where role = 1 and time_record > (select MAX(time_record) from #mirroring_status where role = 2)
end

go



 




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\080_hsp_mirror_db_failover_fullbackup.sql --------------------

/****************************************************************
1. Detect if there is any mirroring database. 
2. If yes, and it becomes principal database recently, 
3. If yes, check if the failover happens 10 minutes ago
4. If yes, check if there is a full backup for the database after the failover
5. If no, fully backup the database

******************************************************************/

use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_mirror_db_failover_fullbackup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_mirror_db_failover_fullbackup
GO
create procedure hsp_mirror_db_failover_fullbackup
as
declare @database_name varchar(128)
set @database_name = ''

declare @switch_time datetime

while 1=1
begin
	select @database_name = min(DB_NAME(database_id)) 
	from master.sys.database_mirroring 
	where mirroring_guid is not null 
			and mirroring_role = 1                -- Principal mirroring database
			and DB_NAME(database_id) > @database_name
	if @database_name is null 
		break
	-- print 'DB Name: ' + @database_name
	
	exec master.dbo.hsp_mirror_db_failover_time @database_name, @switch_time output
	if (@switch_time is null or DATEDIFF (minute, @switch_time,getdate()) < 10)    -- perform the full backup at least 10 minutes after the switch
		continue
		

	if not exists (select * from msdb.dbo.backupset
					where type = 'D' and database_name = @database_name and backup_start_date > @switch_time)
	begin
		insert into #temp values (@database_name)
		exec master.dbo.hsp_full_backup_database   --backup the specified database
	end
end
go



 




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\090_hsp_log_backup_database.sql --------------------
 


/********************************************************************

		Log Backup Stored Procedure
		
*********************************************************************/
use [master]
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_log_backup_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_log_backup_database
GO

CREATE         proc dbo.hsp_log_backup_database
as
declare @dbname varchar(500)
declare @dest varchar(1000)
declare @dest_bak varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)



truncate table #temp
insert into #temp 
SELECT rtrim(name)
FROM master.sys.databases  
WHERE name NOT IN ('master','model','msdb','tempdb')  
   AND DATABASEPROPERTYEX(name, 'Recovery') IN ('FULL','BULK_LOGGED') 
   and  state = 0
	and is_read_only=0
order by name

set @dbname = ''

while 1=1
begin 
_next_loop:
	select @dbname = min(dbname) from #temp where dbname > @dbname
	if @dbname is null
		break
	-- select the backup folder
	select @path = dbo.hfn_get_backup_path ('#log_backup_folder',@dbname)
	
	-- delete the obsolete full backup of the database
	exec hsp_delete_obsolete_backup 2, @dbname


	-- if HADR is enabled and current replica is not a preferred backup, skip it
	if (SELECT SERVERPROPERTY ('IsHadrEnabled'))=1 
	begin
		if  sys.fn_hadr_backup_is_preferred_replica (@dbname) != 1
			goto _next_loop
	end

	-- test if the corresponding folder exists
	exec hsp_test_create_subfolder @path,@dbname
	set @path = @path + @dbname + '\'
	
	select @dest=@path + @dbname + '_Log_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.trn'
	--print @dest
	
	-- make a full backup for newly created database.
	if ( select last_log_backup_lsn from master.sys.database_recovery_status where database_id = db_id(@dbname)) is null
	begin 
		set @dest_bak = REPLACE(@dest,'.trn','.bak')
		set @dest_bak = REPLACE(@dest_bak,'_Log_','_Full_')
	
		-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
		if exists (select * from master.dbo.tbl_maint_parameter
					where parameter_name='#litespeed_for_full_backup' and parameter_value = 'Y')
		begin
			set @stt = 'xp_backup_database @database = ''' + @dbname + ''', @filename = ''' + @dest_bak + ''''
		end
		else
		begin
			set @stt = 'backup database [' + @dbname + '] to Disk=''' + @dest_bak + ''' with init,stats'
			if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
				charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
			begin
				-- backup database @dbname to Disk=@dest with init,stats, compression
				set @stt = @stt + ', compression'
			end
		end
		print 'Full backup command: ' + @stt
		print ' '
		EXEC (@stt)
	end

	-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
	if exists (select * from master.dbo.tbl_maint_parameter
				where parameter_name='#litespeed_for_log_backup' and parameter_value = 'Y')
	begin
		set @stt = 'xp_backup_log @database = ''' + @dbname + ''', @filename = ''' + @dest + ''''
	end
	else
	begin
		set @stt = 'backup log [' + @dbname + '] to Disk=''' + @dest + ''' with init,stats'
		if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
			charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
		begin
			set @stt = @stt + ', compression'
		end
	end

	print 'Log backup command: ' + @stt
	print ' '
	EXEC (@stt)
	
	if (@@error != 0)
	begin
		raiserror ('Log backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end
end

go 







---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\091_hsp_log_backup_database_with_dbname.sql --------------------
-----------
----------
----------
--------  Another log backup procedure with dbname
----------
--------
--------

USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_log_backup_database_with_dbname') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_log_backup_database_with_dbname
GO


create         proc hsp_log_backup_database_with_dbname
@dbname varchar(500)
as

	declare @dest varchar(1000)
	declare @dest_bak varchar(1000)
	declare @path varchar(512)
	declare @stt varchar (5000)

	-- select the backup folder
	if not exists ( select * from master.dbo.tbl_maint_setting 
					where database_name=@dbname and parameter_name='#backup_folder')
		select @path = parameter_value 
		from master.dbo.tbl_maint_setting 
		where database_name='default' and parameter_name='#backup_folder'
	else
		select @path = parameter_value 
		from master.dbo.tbl_maint_setting 
		where database_name=@dbname and parameter_name='#backup_folder'
	
	-- delete the obsolete full backup of the database
	exec hsp_delete_obsolete_backup 2, @dbname

	-- test if the corresponding folder exists
	exec hsp_test_create_subfolder @path,@dbname
	set @path = @path + @dbname + '\'
	
	select @dest=@path + @dbname + '_Log_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.trn'
	--print @dest
	
	-- make a full backup for newly created database.
	if ( select last_log_backup_lsn from master.sys.database_recovery_status where database_id = db_id(@dbname)) is null
	begin 
		set @dest_bak = REPLACE(@dest,'.trn','.bak')
		set @dest_bak = REPLACE(@dest_bak,'_Log_','_Full_')
	
		-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
		if exists (select * from master.dbo.tbl_maint_setting 
					where parameter_name='#litespeed_for_full_backup' and parameter_value = 'Y')
		begin
			set @stt = 'xp_backup_database @database = ''' + @dbname + ''', @filename = ''' + @dest_bak + ''''
		end
		else
		begin
			set @stt = 'backup database ' + @dbname + ' to Disk=''' + @dest_bak + ''' with init,stats'
			if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
				charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
			begin
				-- backup database @dbname to Disk=@dest with init,stats, compression
				set @stt = @stt + ', compression'
			end
		end
		print 'Full backup command: ' + @stt
		EXEC (@stt)
	end

	-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
	if exists (select * from master.dbo.tbl_maint_setting 
				where parameter_name='#litespeed_for_log_backup' and parameter_value = 'Y')
	begin
		set @stt = 'xp_backup_log @database = ''' + @dbname + ''', @filename = ''' + @dest + ''''
	end
	else
	begin
		set @stt = 'backup log ' + @dbname + ' to Disk=''' + @dest + ''' with init,stats'
		if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
			charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
		begin
			set @stt = @stt + ', compression'
		end
	end

	print 'Log backup command: ' + @stt
	EXEC (@stt)
		if (@@error != 0)
	begin
		raiserror ('Log backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end

go






---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\100_hsp_check_integrity.sql --------------------


/****************************************************************

		Check database integrity
		
*******************************************************************/
use master
go

IF OBJECTPROPERTY ( object_id('hsp_check_integrity'),'IsProcedure') = 1
	DROP PROC hsp_check_integrity
GO

CREATE PROCEDURE hsp_check_integrity
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @db as varchar (100),@sqlstr as varchar(1200)

	SET @db=''
	WHILE (@db IS NOT NULL)
	BEGIN
	_next_loop:
		SELECT @db=MIN(dbname) FROM #temp
		WHERE @db<dbname

		IF @db IS NULL BREAK 

		-- check the integrity only on the backup replica if the HADR is enabled
		if (SELECT SERVERPROPERTY ('IsHadrEnabled'))=1 
		begin
			if  sys.fn_hadr_backup_is_preferred_replica (@db) != 1
				goto _next_loop
		end
		print 'Checking the integrity of the database: ' + @db + '......'
		SET @sqlstr='USE ['+@db+'];
		DBCC CHECKDB WITH NO_INFOMSGS'
		EXEC (@sqlstr);
	END
END
go

 




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\110_hsp_reindex.sql --------------------


/***********************************************************************

		Re-Index
		
**********************************************************************/

use master
go


if exists (select * from dbo.sysobjects where id = object_id(N'hsp_reindex') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_reindex
GO

CREATE         proc dbo.hsp_reindex
@SkipOfflineReindex int = 1,    -- if the offline re-index will be skipped
@FragThresholdForRebuild INT  = 30,        -- the threshold for rebuild an index
@FragThresholdForReorganize INT  = 10        -- the threshold for reorganize an index

as

---------------------------------------------------------------
---------------------------------------------------------------
Declare @DB_NAME varchar(500)
DECLARE @objectid INT
DECLARE @indexid INT
DECLARE @partitioncount bigint
DECLARE @schemaname NVARCHAR(130)
DECLARE @objectname NVARCHAR(130)
DECLARE @indexname NVARCHAR(130)
DECLARE @indextype INT
DECLARE @partitionnum bigint
DECLARE @partitions bigint
DECLARE @frag INT
DECLARE @command NVARCHAR(4000)
DECLARE @com_part NVARCHAR(15)
DECLARE @max INT
DECLARE @min INT
DECLARE @IndexListCount INT
DECLARE @Edition NVARCHAR(100)
DECLARE @sql NVARCHAR(1000)

DECLARE @DB_ID INT
DECLARE @IndexLobCount INT  --  LOB in the index
DECLARE @TableLobCount INT  -- LOB in the table
SELECT @IndexLobCount = 0, @TableLobCount = 0

DECLARE @Allow_pg_locks INT
SELECT @Allow_pg_locks = 1  -- Default page_locks is turned off

DECLARE @CDC_TABLE NVARCHAR(500)  -- SKIP TABLES AUDIT BY CDC

set nocount on

-- enable the extra log backup job during the re-index
DECLARE @jobId BINARY(16)
SELECT @jobId = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'DBA -- Log backup During Reindex'
exec msdb.dbo.sp_update_job @job_id = @jobId, @enabled = 1



set @DB_NAME = ''
while 1=1
begin 
_next_loop:
	select @DB_NAME =MIN(dbname) from #temp where dbname>@DB_NAME
    IF @DB_NAME IS NULL BREAK 

	-- if HADR is enabled and current replica is a primary replica, skip it
	if (SELECT SERVERPROPERTY ('IsHadrEnabled'))=1 
	begin
		if  sys.fn_hadr_is_primary_replica(@DB_NAME) != 1
			goto _next_loop
	end

	SELECT @DB_ID = DB_ID(@DB_NAME)
	SELECT @Edition = LEFT(CONVERT(NVARCHAR(100), SERVERPROPERTY ('edition')),18)

	if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#BenchmarkIndexList') and xtype='U')
	drop table #BenchmarkIndexList
	CREATE TABLE #BenchmarkIndexList (ID INT IDENTITY(1,1), 
	   DBName NVARCHAR(100), 
	   objectid INT,
	   indexid INT,
	   indextype NVARCHAR(30),
	   frag INT,
	   avg_frag_size_pages INT,
	   page_count INT,
	   partition_number INT,
	   starttime datetime,
	   endtime datetime,
	   command nvarchar(500))

	CREATE CLUSTERED INDEX IX_CL_IndexList ON #BenchmarkIndexList(ID)

	INSERT #BenchmarkIndexList (DBName, objectid, indexid, indextype, frag, 
					   avg_frag_size_pages, page_count, partition_number)
	SELECT DB_NAME(database_id) AS DBName, object_id, index_id, index_type_desc AS 'indextype',
		   avg_fragmentation_in_percent, avg_fragment_size_in_pages, page_count, partition_number
	FROM   sys.dm_db_index_physical_stats (@DB_ID, NULL, NULL, NULL, 'LIMITED')
	WHERE  page_count > 10 AND 
		   index_id > 0 AND 
		   avg_fragmentation_in_percent > @FragThresholdForReorganize AND
		   index_type_desc NOT LIKE '%XML%'
	       
	SELECT @IndexListCount = COUNT(1) FROM #BenchmarkIndexList

	SELECT @max = (SELECT MAX(ID) FROM #BenchmarkIndexList)
	SELECT @min = 1

	WHILE @min <= @max
	BEGIN
	   SELECT  @objectid = objectid, @indexid = indexid, @partitionnum = partition_number, @frag = frag
	   FROM    #BenchmarkIndexList
	   WHERE   ID = @min

	   set @sql = 'SELECT  @objectname = o.name, @schemaname = s.name
				   FROM [' + @DB_NAME + '].sys.objects AS o JOIN ['
						   + @DB_NAME + ']. sys.schemas AS s ON s.schema_id = o.schema_id
				   WHERE   o.object_id = @objectid'

	   exec sp_executesql @sql, N'@objectname NVARCHAR(130) OUTPUT, @schemaname NVARCHAR(130) OUTPUT, @objectid NVARCHAR(130)',
							 @objectname OUTPUT, @schemaname OUTPUT, @objectid
	   
	   
	   set @sql = 'SELECT  @indexname = name, @indextype = TYPE, @Allow_pg_locks = allow_page_locks
				   FROM [' + @DB_NAME + '].sys.indexes
				   WHERE   object_id = @objectid AND 
						   index_id = @indexid'

	   exec sp_executesql @sql, N'@indexname NVARCHAR(130) OUTPUT, @indextype INT OUTPUT, @Allow_pg_locks INT OUTPUT, @objectid NVARCHAR(130), @indexid INT',
							 @indexname OUTPUT, @indextype OUTPUT,@Allow_pg_locks OUTPUT, @objectid, @indexid
							 

			   
	   set @sql = 'SELECT  @partitioncount = COUNT(1)
				   FROM [' +@DB_NAME + '].sys.partitions
				   WHERE object_id = @objectid AND 
						 index_id = @indexid'

	   exec sp_executesql @sql, N'@partitioncount bigint OUTPUT, @objectid NVARCHAR(130), @indexid INT',
							 @partitioncount OUTPUT, @objectid, @indexid
	       
	   set @sql = 'SELECT  @IndexLobCount = COUNT(1)
				   FROM    [' + @DB_NAME+ '].sys.index_columns A INNER JOIN
						   [' + @DB_NAME+ '].sys.columns B ON A.object_id = B.object_id AND A.Column_id = B.Column_ID INNER JOIN
						   [' + @DB_NAME+ '].sys.types C ON B.system_type_id = C.user_type_id
				   WHERE   A.object_id = @objectid AND
						   A.index_id = @indexid AND 
						  (C.name IN(''xml'',''image'',''text'',''ntext'') OR
						  (C.name IN(''varchar'',''nvarchar'',''varbinary'',''nvarbinary'') AND 
						   B.max_length = -1))'

		exec sp_executesql @sql, N'@IndexLobCount INT OUTPUT, @objectid NVARCHAR(130), @indexid INT',
							 @IndexLobCount OUTPUT, @objectid, @indexid
							 
	   set @sql = ' select  @TableLobCount = COUNT(1)
					from [' + @DB_NAME+ '].sys.columns c left join [' + @DB_NAME+ '].sys.types t on t.system_type_id = c.system_type_id
					where c.object_id = @objectid 
						and (t.name IN(''xml'',''image'',''text'',''ntext'') OR c.max_length = -1)'

		exec sp_executesql @sql, N'@TableLobCount INT OUTPUT, @objectid NVARCHAR(130)',
							 @TableLobCount OUTPUT, @objectid


--- Modified to account for rebuild partition (JT : 2012/05/07)
--print '-------------------------------------------------------------'
--print 'frag=' + convert(varchar(20),@frag)
	
		IF @frag < @FragThresholdForRebuild AND @Allow_pg_locks <> 0  
			-- Re-organize the index
		BEGIN
--print '(2)frag=' + convert(varchar(20),@frag)
		    set @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REORGANIZE';
			IF @partitioncount > 1
			BEGIN
				SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS NVARCHAR(10));
			END
		END
		ELSE IF (@frag >= @FragThresholdForRebuild OR @Allow_pg_locks = 0) AND @IndexLobCount = 0 AND @Edition = 'Enterprise Edition'
				and (@indexid <> 1 or @TableLobCount = 0) and @partitioncount=1
			 
			-- Re-build the index online
	    BEGIN
			set @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REBUILD'
			--IF @partitioncount > 1
			--BEGIN
				--SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS NVARCHAR(10));
			--END
			set @command = @command + ' WITH(ONLINE = ON, SORT_IN_TEMPDB = ON, MAXDOP=1)';
	    END
	    ELSE if @SkipOfflineReindex = 0
		BEGIN
		    set @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REBUILD';
			IF @partitioncount > 1
			BEGIN
				SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS NVARCHAR(10));
			END
			set @command = @command + ' WITH(SORT_IN_TEMPDB = ON)';
		END
		ELSE
			set @command = ''


       select @CDC_TABLE = ''
       set @sql = 'IF Exists ( select 1 
                                 from [' + @DB_NAME+ '].sys.objects AS o JOIN
                                      [' + @DB_NAME+ '].sys.schemas AS s ON s.schema_id = o.schema_id
                                where o.name =''change_tables'' and o.type = ''U'' and s.name = ''cdc'')
                                select @CDC_TABLE = REPLACE(capture_instance,''_'',''.'') FROM [' + @DB_NAME+ '].cdc.change_tables 
                                 where REPLACE(capture_instance,''_'',''.'') = '''+@schemaname+'.'+@objectname +''''
    	
    	exec sp_executesql @sql, N'@CDC_TABLE NVARCHAR(500) OUTPUT, @schemaname NVARCHAR(130),@objectname NVARCHAR(130)', @CDC_TABLE OUTPUT,@schemaname, @objectname


	   IF @CDC_TABLE <> ''
	       SET @command = ''

	BEGIN TRY 
	    UPDATE #BenchmarkIndexList set starttime=getdate(), command=@command
		WHERE   ID = @min
		
		-- execute a generated re-index command
		
		--if @command!='' EXEC (@command)

		print ''
		print '+++++++ re-index: ' + @command 
		print '        start time: ' + convert (varchar(30), getdate(),120)
		
		if @command!='' 
		begin
			print '               running....'
			SET QUOTED_IDENTIFIER on
			EXEC (@command)
		end
		
		print '        end time: ' + convert (varchar(30), getdate(),120)

		


		UPDATE #BenchmarkIndexList set endtime= getdate()
		WHERE   ID = @min
	END TRY
	BEGIN CATCH
		  DECLARE @ErrorMessage NVARCHAR(4000)
		  DECLARE @ErrorSeverity INT
		  DECLARE @ErrorState INT
	      
				SELECT @ErrorMessage = ERROR_MESSAGE(),
					   @ErrorSeverity = ERROR_SEVERITY(),         
						 @ErrorState = ERROR_STATE()      
	                     
		  RAISERROR (@ErrorMessage, -- Message text.
						  @ErrorSeverity, -- Severity.
						  @ErrorState -- State.
							)


		  SELECT @ErrorSeverity, @ErrorState, @ErrorMessage, @command
	   
	END CATCH

	   SET @min = @min+1

	END
	

select rtrim(DBName), objectid,indexid,rtrim(indextype),frag , avg_frag_size_pages, page_count, partition_number, starttime, endtime, command
from #BenchmarkIndexList	

select rtrim(DBName),objectid,indexid,rtrim(indextype),frag , avg_frag_size_pages, page_count, partition_number, starttime, endtime, command
from #BenchmarkIndexList
where ltrim(command)=''

End

	
-- disable the extra log backup job during the re-index
SELECT @jobId = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'DBA -- Log backup During Reindex'
exec msdb.dbo.sp_update_job @job_id = @jobId, @enabled = 0



GO


 




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\120_hsp_update_statistics.sql --------------------


 /******************************************************************

	Update Statistics
	
*******************************************************************/
use master
go

SET QUOTED_IDENTIFIER ON
GO
IF OBJECTPROPERTY ( object_id('hsp_update_statistics'),'IsProcedure') = 1
	DROP PROC hsp_update_statistics
GO


CREATE PROCEDURE hsp_update_statistics
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @db as varchar (100),@sqlstr as varchar(1200)

	SET @db=''
	WHILE (@db IS NOT NULL)
	BEGIN
	_next_loop:
		SELECT @db=MIN(dbname) FROM #temp
		WHERE @db<dbname

		IF @db IS NULL BREAK 

		-- if HADR is enabled and current replica is a primary replica, skip it
		if (SELECT SERVERPROPERTY ('IsHadrEnabled'))=1 
		begin
			if  sys.fn_hadr_is_primary_replica(@db) != 1
				goto _next_loop
		end

		SET @sqlstr='USE ['+@db+'];
		EXEC sp_updatestats'
		EXEC (@sqlstr);
	END
END
go

 




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\130_hsp_check_disk_space.sql --------------------


/********************************************************

	Check free disk space
	
*********************************************************/

USE [master]
GO
IF OBJECTPROPERTY ( object_id('hsp_check_disk_space'),'IsProcedure') = 1
	DROP PROC hsp_check_disk_space
GO

CREATE PROC hsp_check_disk_space 

AS
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#free_space') and xtype='U')
drop table #free_space
CREATE TABLE #free_space(
 drive char(1), 
 free_mb int)

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.dbo.#tbl_disk_space_alert') and xtype='U')
drop table #tbl_disk_space_alert
create table #tbl_disk_space_alert (
 drive char(1), 
 free_mb int)


declare @str varchar(512)

INSERT INTO #free_space exec xp_fixeddrives

insert into #tbl_disk_space_alert
	select drive, free_mb from #free_space 
	where		
		(
			free_mb <
			(	select parameter_value from master.dbo.tbl_maint_parameter 
				where parameter_name = '#free_disk_space_threshold' and database_name = 'default'
			) 		
			and 
			not drive in (	select database_name from master.dbo.tbl_maint_parameter 
							where parameter_name = '#excluded_from_default_disk_space_check'
						  )
		)
		or 
			free_mb <
			(	select parameter_value from master.dbo.tbl_maint_parameter 
				where parameter_name = '#free_disk_space_threshold' and database_name = drive
			)
	

-- select * from temp_alert_list_998990123

if (exists (select * from #tbl_disk_space_alert))
BEGIN
	DECLARE	@MailSubject nvarchar(60), @MailMsg varchar(70)
	-- build the subject --
	SET @MailSubject = 'Disk Space Alert on ' + @@SERVERNAME
	-- construct mail body
	declare @mail_body varchar(8000)
	declare @drive_id char(1), @free_mb int
	set @mail_body = 
'drive free_mb
----- ------------
'
	set @drive_id = ''
	while 1=1
	begin 
		select @drive_id = min(drive) from #tbl_disk_space_alert  where drive > @drive_id
		if @drive_id is null
			break
		select @free_mb = free_mb from #tbl_disk_space_alert where drive = @drive_id
		set @mail_body = @mail_body + @drive_id + SPACE(5)+ RIGHT(SPACE(12) + convert(varchar,@free_mb),12) +'
'
	end
		  -- send the message --
	EXEC msdb.dbo.sp_send_dbmail
		@profile_name = 'Database Services',
		--@recipients = N'james.zhang@hssbc.ca', 
		@recipients = N'HSSBCTSDatabaseServices@hssbc.ca', 
		@body = @mail_body, 
		@subject = @MailSubject
END


SET NOCOUNT OFF

go

 




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\131_hsp_get_disk_space.sql --------------------
USE [master]
GO
IF OBJECTPROPERTY ( object_id('hsp_get_disk_space'),'IsProcedure') = 1
	DROP PROC hsp_get_disk_space
GO

CREATE PROC hsp_get_disk_space 

AS
SET NOCOUNT ON
DECLARE @hr int
DECLARE @fso int
DECLARE @drive char(1)
DECLARE @odrive int
DECLARE @TotalSize varchar(20) 
DECLARE @MB Numeric  
SET @MB = 1048576

CREATE TABLE #drives 
	(	drive char(1) PRIMARY KEY
		, FreeSpace int NULL
		, TotalSize int NULL
	) 

/***********************	
exec sp_configure 'show advanced option', '1'
reconfigure  with override
exec sp_configure 'Ole Automation Procedures', '1'
reconfigure  with override
*****************************/

INSERT #drives(drive,FreeSpace) 
EXEC master.dbo.xp_fixeddrives 
EXEC @hr=sp_OACreate 'Scripting.FileSystemObject',@fso OUT 

IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso

DECLARE dcur CURSOR LOCAL FAST_FORWARD
FOR SELECT drive from #drives ORDER by drive
OPEN dcur FETCH NEXT FROM dcur INTO @drive

WHILE @@FETCH_STATUS=0
BEGIN
	EXEC @hr = sp_OAMethod @fso,'GetDrive', @odrive OUT, @drive
	IF @hr <> 0 
		EXEC sp_OAGetErrorInfo @fso 
	EXEC @hr = sp_OAGetProperty @odrive,'TotalSize', @TotalSize OUT 
	IF @hr <> 0 
		EXEC sp_OAGetErrorInfo @odrive 
	
	UPDATE #drives SET TotalSize=@TotalSize/@MB WHERE drive=@drive 
	FETCH NEXT FROM dcur INTO @drive
End

Close dcur
DEALLOCATE dcur

EXEC @hr=sp_OADestroy @fso 
IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso

SELECT drive, TotalSize as 'Total(MB)', FreeSpace as 'Free(MB)' FROM #drives
ORDER BY drive 
DROP TABLE #drives 

exec sp_configure 'Ole Automation Procedures', '0'
reconfigure  with override

GO 




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\140_hsp_switch_job_output_file.sql --------------------



/*********************************************************************

	Switch the output file name 
	
**********************************************************************/

USE [master]
GO
IF OBJECTPROPERTY ( object_id('hsp_switch_job_output_file'),'IsProcedure') = 1
	DROP PROC hsp_switch_job_output_file
GO

CREATE PROC hsp_switch_job_output_file 
AS
declare @stt nvarchar(3000)
declare @path varchar(3000)
declare @file_name varchar(3000)

select @path = parameter_value 
from [master].[dbo].[tbl_maint_parameter] 
where parameter_name = '#job_output_folder'

set @stt = 'IF NOT EXIST ' + @path + ' md ' + @path
--print @stt
EXEC xp_cmdshell @stt

select @file_name = @path + 'output_log_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.txt'
		
--print @file_name

EXEC msdb.dbo.sp_update_jobstep
    @job_name = N'DBA -- Databases Maintenance',
    @step_id=1, 
    @output_file_name = @file_name,
    @flags = 2

go
 




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\150_hsp_delete_obsolete_job_output_file.sql --------------------
/*********************************************************************

		Delete the job output file older than the retention day

**********************************************************************/
 
use [master]
go

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_delete_obsolete_job_output_file') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_delete_obsolete_job_output_file
GO

CREATE         proc dbo.hsp_delete_obsolete_job_output_file
as

declare @path varchar(1024)
declare @filename varchar (512)
declare @stt varchar (5000)
declare @RetentionDay int

-- delete the existing full backups

-- create the two temp tables for candidate file list
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#DeletingFileList') and xtype='U')
drop table #DeletingFileList
CREATE TABLE #DeletingFileList(line varchar(2000))

select @path = parameter_value from master.dbo.tbl_maint_parameter
where parameter_name = '#job_output_folder' 

select @RetentionDay = parameter_value from master.dbo.tbl_maint_parameter
where parameter_name = '#job_output_file_retention_day' 

set @stt = 'dir "' + @path + '\output_log_????????_??????.txt" /S /B'  -- return the full path for the candidate files
INSERT INTO #fileList 
EXEC xp_cmdshell @stt


insert into #DeletingFileList
SELECT line FROM #fileList 
where dateadd(hour,-@RetentionDay*24+5,getdate())>= 
				convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+ SUBSTRING(line, LEN(line) - 9, 2)+':'+
							SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2))


-- delete the to-be-deleted files
set @path = ''
while 1=1
begin 
	select @path = MIN(line) from #DeletingFileList where line > @path 
	if @path is null
		break
	set @stt = 'del "' + @path + '"'
	exec master.dbo.xp_cmdshell @stt
	-- print @stt
end

go






---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\160_hsp_recycle_history_and_error_log.sql --------------------
 
/**************************************************************

		Clean Up the Logs: 
		Backup/Restore log, Job Log, SQL Server Log and SQL Agent Log
		
		
*****************************************************************/
use master
go

IF OBJECTPROPERTY ( object_id('hsp_recycle_history_and_error_log'),'IsProcedure') = 1
	DROP PROC hsp_recycle_history_and_error_log
GO

create proc hsp_recycle_history_and_error_log
as
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp_1') and xtype='U')
drop table #temp_1
create table #temp_1
(
log_date datetime,
process_info varchar(100),
text varchar (8000)
)

declare @log_start_date datetime
declare @retention_day int
DECLARE @dt DATETIME

/*****************************************************

		Clean up SQL Server Error Log
		
******************************************************/
insert into #temp_1
exec xp_readerrorlog 0,1
select top 1 @log_start_date = log_date 
from #temp_1

select @retention_day = CONVERT(int, parameter_value) from master.dbo.tbl_maint_parameter
where parameter_name = '#server_error_log_retention_day'

--select @log_start_date, @retention_day

if DATEDIFF (day, @log_start_date,getdate()) > @retention_day
begin
	exec master.dbo.sp_cycle_errorlog
end

/*****************************************************

		Clean up SQL Agent Error Log
		
******************************************************/
truncate table #temp_1
insert into #temp_1
exec xp_readerrorlog 0,2
select top 1 @log_start_date = log_date 
from #temp_1

select @retention_day = CONVERT(int, parameter_value) from master.dbo.tbl_maint_parameter
where parameter_name = '#agent_error_log_retention_day'

--select @log_start_date, @retention_day

if DATEDIFF (day, @log_start_date,getdate()) > @retention_day
begin
	exec msdb.dbo.sp_cycle_agent_errorlog 
end
/******************************************************

		Clean up backup/restore history
		
******************************************************/

select @retention_day = parameter_value 
from master.dbo.tbl_maint_parameter 
where parameter_name = '#backup_restore_history_retention_day'
SET @dt = DATEADD(DAY, -@retention_day, GETDATE());
EXEC msdb.dbo.sp_delete_backuphistory @dt;

/******************************************************

		clean up job history
		
******************************************************/
select @retention_day = parameter_value 
from master.dbo.tbl_maint_parameter 
where parameter_name = '#job_history_retention_day'
SET @dt = DATEADD(DAY, -@retention_day, GETDATE());
EXEC msdb.dbo.sp_purge_jobhistory @oldest_date=@dt;



go








---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\170_hsp_shrink_log_file.sql --------------------
use master
go

IF OBJECTPROPERTY ( object_id('hsp_shrink_log_file'),'IsProcedure') = 1
	DROP PROC hsp_shrink_log_file
GO

create proc hsp_shrink_log_file
as


if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp_logspace') and xtype='U')
drop table #temp_logspace
create table #temp_logspace
(
	dbname varchar(500),
	log_size float,
	used_log_size float,
	status int
)

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp_logspace_log_file_name') and xtype='U')
drop table #temp_logspace_log_file_name
create table #temp_logspace_log_file_name
(
	id int identity (1,1) primary key,
	dbname varchar(500),
	log_file_name varchar(500)
)

declare @database_name varchar(500), @log_file_name varchar(500), @stt varchar(5000), @id int, @max_id int

insert into #temp_logspace
exec ('dbcc sqlperf(logspace)')

set @database_name = ''
while 1=1
begin
	select @database_name= min(dbname) from #temp_logspace 
	where log_size > 2048 and used_log_size < 20 and dbname > @database_name
	if @database_name is null 
		break
	set @stt = 'SELECT ''' + @database_name + ''', name FROM [' 
			+ @database_name + '].sys.database_files where type = 1'
			
	insert into #temp_logspace_log_file_name (dbname, log_file_name)
	exec (@stt)
end 

select @id = 1, @max_id = max(id) from #temp_logspace_log_file_name

while @id <= @max_id
begin
	select @database_name = dbname, @log_file_name = log_file_name
	from #temp_logspace_log_file_name
	where id = @id
	
	set @stt = 'use ' + @database_name + ';dbcc shrinkfile ( ' + @log_file_name + ', 1)'
	--print @stt

	exec (@stt)
	set @id = @id + 1
end


--select * from #temp_logspace

--select * from #temp_logspace_log_file_name

go




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\180_hsp_differential_backup_database.sql --------------------
USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_differential_backup_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_differential_backup_database
GO


create        proc [dbo].hsp_differential_backup_database
as

declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @dbname varchar(128)


-- backup all the databases in #temp table
set @dbname = ''
while 1=1
begin 
_next_loop:
	select @dbname =MIN(dbname) from #temp where dbname>@dbname
	if @dbname is null
		break
	-- select the backup folder
	select @path = dbo.hfn_get_backup_path('#full_backup_folder',@dbname)
	
	-- delete the obsolete differential backup of the database
	exec hsp_delete_obsolete_backup 3, @dbname

	-- if HADR is enabled and current replica is not a preferred backup, skip it
	if (SELECT SERVERPROPERTY ('IsHadrEnabled'))=1 
	begin
		if  sys.fn_hadr_backup_is_preferred_replica (@dbname) != 1
			goto _next_loop
	end

	exec hsp_test_create_subfolder @path,@dbname
	set @path = @path + @dbname + '\'
	 
	select @dest=@path + @dbname + '_diff_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.bak'
	
	-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
	if exists (select * from master.dbo.tbl_maint_parameter
				where parameter_name='#litespeed_for_full_backup' and parameter_value = 'Y')
	begin
		set @stt = 'xp_backup_database @database = ''' + @dbname + ''', @filename = ''' + @dest + ''''
	end
	else
	begin
		set @stt = 'backup database [' + @dbname + '] to Disk=''' + @dest + ''' with DIFFERENTIAL, init,stats'
		if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
			charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
		begin
			-- backup database @dbname to Disk=@dest with init,stats, compression
			set @stt = @stt + ', compression'
		end
	end

	print 'differential backup command: ' + @stt
	print ' '
	EXEC (@stt)
	
	if (@@error != 0)
	begin
		raiserror ('differential backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end
end


go






---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\910_hsp_maint_schedule.sql --------------------

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
 




---------------------------- C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X\990_last_script.sql --------------------
 
/*******************************************************

	Create the maintenance job
	
********************************************************/

/****** Object:  Job [DBA -- Databases Maintenance]    Script Date: 10/28/2011 10:14:23 ******/

USE [msdb]
GO

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'DBA -- Databases Maintenance')
begin 
	if not exists (select * from master.dbo.tbl_maint_version_info where version = '4.0.0.0')
		EXEC sp_delete_job @job_name = N'DBA -- Databases Maintenance'
	else 
		GOTO EndSave
end
	
/****** Object:  Job [DBA -- Databases Maintenance]    Script Date: 11/01/2011 11:25:39 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/01/2011 11:25:40 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DBA -- Databases Maintenance', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'Database Services', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [maintenace control]    Script Date: 11/01/2011 11:25:40 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'maintenace schedule', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec master.dbo.hsp_maint_schedule', 
		@database_name=N'master', 
		@flags=2
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'every 15 minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111017, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959 
		--@schedule_uid=N'98c4c050-8064-4845-b52a-514009093a72'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO

/***********************************************************************

		Performancing the log bckup during the re-index
		
************************************************************************/
USE [msdb]
GO

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'DBA -- Log backup During Reindex')
	GOTO EndSave

/****** Object:  Job [DBA -- Log backup During Reindex]    Script Date: 05/30/2012 14:55:50 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 05/30/2012 14:55:50 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DBA -- Log backup During Reindex', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		--@notify_email_operator_name=N'Database Services', 
		@job_id = @jobId OUTPUT

IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Step_1]    Script Date: 05/30/2012 14:55:50 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Step_1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'if exists (select * from tempdb.dbo.sysobjects where id = object_id(N''tempdb.[dbo].#temp'') and xtype=''U'')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

insert into #temp 
SELECT rtrim(name)
FROM master.dbo.sysdatabases  
WHERE name NOT IN (''master'',''model'',''msdb'',''tempdb'')  
   AND DATABASEPROPERTYEX(name, ''Recovery'') IN (''FULL'',''BULK_LOGGED'') 
   and  status & 512 != 512
   and  status & 32 != 32
   and  status & 1024 != 1024 --ready only
order by name

Exec master.dbo.hsp_log_backup_database',		
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=2, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20120530, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959
		--@schedule_uid=N'a59a51ab-3de8-4cc3-bd49-757a659a29fd'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO



/***********************************************************************

		reconfiure the server settting
		
************************************************************************/
use master

exec hsp_switch_job_output_file
go


-- change back the shell setting befor running this script
declare @shell_setting_before_running_script varchar(5)
select @shell_setting_before_running_script = convert(varchar(5),configure_value) from #sysconfigures_setting
exec sp_configure 'xp_cmdshell', @shell_setting_before_running_script
reconfigure  with override
go

/********************************************************************************

	Set unlimited for job history

********************************************************************************/
USE [msdb]
GO
EXEC msdb.dbo.sp_set_sqlagent_properties @jobhistory_max_rows=-1, 
		@jobhistory_max_rows_per_job=-1
GO

/***********************************************************************

		register the current version --add a line
		
***********************************************************************/
use master
go

exec master.dbo.hsp_script_version_control '2.0.0.0', 'First Version of Centralizing DB Maintenance Jobs'
exec master.dbo.hsp_script_version_control '2.1.0.0', 'Adding features to configure job output file'
exec master.dbo.hsp_script_version_control '2.1.1.0', 'Adding features to clean up errorlog and reset xp_cmdshell back to the value before the maintenance job runs'
exec master.dbo.hsp_script_version_control '2.1.2.0', 'Fixing the script running error when xp_cmdshell is off and sp_send_dbmail with query issue in SQL 2008 version'
exec master.dbo.hsp_script_version_control '2.1.3.0', 'Fixing the issue in stored procedure hsp_mirror_db_failover_fullbackup, in which hsp_full_backup_database use the old version'
exec master.dbo.hsp_script_version_control '2.1.4.0', 'Delete the parameter: #excluded_from_default_backup_retention. It is not used'
-- exec master.dbo.hsp_script_version_control '2.1.5.0', 'separating the parameters for re-index and full re-index, and adding #switch_to_simple_recovery_model_when_reindexing parameter'
exec master.dbo.hsp_script_version_control '3.0.0.0', '1) Add another job,DBA -- Log backup During Reindex, for doing log backup during the re-index; 2) add #reindex_online_only_day_time and #reindex_all_day_time; 3) obsolete #full_reindex_day_of_week,#reindex_time; 4) re-write hsp_reidex stored procedure; 5) backup with compression; 6) Add #check_integrity_day_time 7) add #litespeed_for_full_backup and #litespeed_for_log_backup 8. fix an backup issue when database name contains space or special character'
exec master.dbo.hsp_script_version_control '3.0.1.0', 'Fix the online re-index issue when there is a user defined column in the table'
exec master.dbo.hsp_script_version_control '3.0.1.1', 'Fix the online re-index issue for the partitioned table'
exec master.dbo.hsp_script_version_control '3.0.1.2', 'Fix a case-sensitive issue'
exec master.dbo.hsp_script_version_control '3.0.1.3', 'Set MAXDOP to 1 to work around the issue of potential data loss when doing online paralall re-build'
exec master.dbo.hsp_script_version_control '4.0.0.0', '1. replace setting table with parameter and action tables; 2. add adhoc backup feature; 3. provide new feature of scheduling an action 4. support AlwaysOn Bakcup'
exec master.dbo.hsp_script_version_control '4.0.1.0', 'Add #shrink_log_file action'
exec master.dbo.hsp_script_version_control '4.0.2.0', '1) By default, Snapshot databases will not get backed up 2) job history log set to unlimited 3) fixed the issue of calculating next-run-time of Monthly_Week_Day type'
exec master.dbo.hsp_script_version_control '4.0.3.0', 'Fixing the full backup on the secondary replica. Copy_only option is added'
exec master.dbo.hsp_script_version_control '4.0.3.1', 'increasing the length of @path to 512 to accomodate the long path'







go


