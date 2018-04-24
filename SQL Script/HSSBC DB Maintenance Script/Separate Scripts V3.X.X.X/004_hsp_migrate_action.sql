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
if not exists (select * from master.dbo.tbl_maint_action where parameter_name = @action)
	and exists (select * from sysobjects where id = object_id(N'tbl_maint_setting') and xtype='U')
	and exists (select * from master.dbo.tbl_maint_setting where parameter_name = @old_parameter)
begin
		insert into master.dbo.tbl_maint_action( action_id, [action], freq_type, freq_interval, freq_week_interval, start_time )
		select @id, @action
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
