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


