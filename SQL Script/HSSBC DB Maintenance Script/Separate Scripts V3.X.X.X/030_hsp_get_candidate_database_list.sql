 
--------------------------------------------------------------------------------------------------------------
--
--
--
--       Version 2 script Start from here
--
--
--
--
-------------------------------------------------------------------------------------------------------------



/*********************************************************************************

		Get Database List
		
**********************************************************************************/

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
SET DATEFIRST 1

if (@parameter in ('#reindex_online_only_day_time', '#reindex_all_day_time', '#check_integrity_day_time'))
begin
	if exists 	
		(select * from master.dbo.tbl_maint_setting
				where  parameter_name= @parameter and database_name = 'default'
					and datepart(dw,@current_time) = CONVERT (int, substring(parameter_value,1,1))  -- the same day
					and @current_time between convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + substring(parameter_value,3,5) + ':00')
								 and dateadd(minute, 10, convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + substring(parameter_value,3,5) + ':00'))
		)
	begin 
	 
		insert into #temp 
		select rtrim(name) from master.sys.databases db
		where name not in ('tempdb','distribution') 
			and not exists (select * from master.dbo.tbl_maint_setting bp 
							where parameter_name in (@excluded_parameter, @parameter) 
								and db.name=bp.database_name)
			and  state = 0
			
		/******** this is for SQL 2000 compatible version
		select rtrim(name) from master.dbo.sysdatabases db
		where name not in ('tempdb','distribution') 
			and not exists (select * from master.dbo.tbl_maint_setting bp 
							where parameter_name in (@excluded_parameter, @parameter) 
								and db.name=bp.database_name)
			and  status & 512 != 512 -- off line 
			and  status & 32 != 32
			and  status & 1024 != 1024 --ready only 
		**********************/
	end

	insert into #temp 
	select database_name from master.dbo.tbl_maint_setting 
	where parameter_name = @parameter 
		and database_name <> 'default'
		and datepart(dw,@current_time) = CONVERT (int, substring(parameter_value,1,1))  -- the same day
		and @current_time between convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + substring(parameter_value,3,5) + ':00')
								 and dateadd(minute, 10, convert (datetime, CONVERT(varchar(30), @current_time, 102) + ' ' + substring(parameter_value,3,5) + ':00'))
		and exists (select * from master.dbo.sysdatabases db 
					where db.name = database_name 
						and  status & 512 != 512 -- off line 
						and  status & 32 != 32
						and  status & 1024 != 1024 --ready only 
					)
		and not database_name in (select dbname from #temp)

end
else
begin
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
		and not database_name in (select dbname from #temp)
end
go




