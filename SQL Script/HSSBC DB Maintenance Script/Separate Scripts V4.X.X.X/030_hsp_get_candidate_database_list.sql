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
else if @action = '#differential_backup'
begin
	insert into #temp 
	select rtrim(name) from master.sys.databases db
	where ( name = @database_name 
			or (@database_name='default' 
				and name not in ('tempdb','distribution', 'master','model','msdb') 
				and not exists (select * from master.dbo.tbl_maint_parameter bp 
								where parameter_name = '#excluded_from_default_differential_backup' 
								and db.name=bp.database_name)  
								-- exclude the dbs which are specifically excluded
				and not exists (select * from master.dbo.tbl_maint_action ma
								where [action] = @action and database_name = db.name) 
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


