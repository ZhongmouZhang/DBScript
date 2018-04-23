use [master]
go


if exists (select * from dbo.sysobjects where id = object_id(N'hsp_get_candidate_database_list') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_get_candidate_database_list
GO


CREATE         proc hsp_get_candidate_database_list
@parameter varchar(500),
@excluded_parameter varchar(500),
@current_time datetime
as
truncate table #temp
if exists 	
	(select * from master.dbo.tbl_maint_setting
			where  parameter_name= @parameter and database_name = 'default'
				and @current_time between convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + parameter_value + ':00')
							 and dateadd(minute, 10, convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + parameter_value + ':00'))
	)
begin  
	insert into #temp 
	select rtrim(name) from master.dbo.sysdatabases db
	where name not in ('tempdb','distribution') 
		and not exists (select * from master.dbo.tbl_maint_setting bp 
						where parameter_name in (@excluded_parameter, @parameter) 
							and db.name=bp.database_name)
		and  status & 512 != 512 -- off line 
		and  status & 32 != 32
		and  status & 1024 != 1024 --ready only 
end

insert into #temp 
select database_name from master.dbo.tbl_maint_setting 
where parameter_name = @parameter 
	and database_name <> 'default'
	and @current_time between convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + parameter_value + ':00')
							 and dateadd(minute, 10, convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + parameter_value + ':00'))
	and exists (select * from master.dbo.sysdatabases db 
				where db.name = database_name 
					and  status & 512 != 512 -- off line 
					and  status & 32 != 32
					and  status & 1024 != 1024 --ready only 
				)