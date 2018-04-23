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


