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
	if exists (select * from sysobjects where id = object_id(N'tbl_maint_setting') and xtype='U')
		and exists (select * from master.dbo.tbl_maint_setting where parameter_name = @old_parameter)
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