/********************************************************
	
	Check the indexes in the current database which has never been used

***********************************************************/

select object_name(i.object_id) as table_name
	, i.name as index_name
	,ius.database_id
	,ius.object_id
	,ius.index_id
from sys.indexes i
	left join sys.dm_db_index_usage_stats ius
		on i.object_id = ius.object_id
		and i.index_id = ius.index_id
		and ius.database_id = db_id()
where ius.index_id is null
	and objectproperty(i.object_id,'IsUserTable') = 1
order by table_name, index_name


-- Indexes used for seek, scan, lookup and updates (insert, update, delete)
select object_name(i.object_id) as table_name
	, i.name as index_name
	,ius.user_seeks
	,ius.last_user_seek
	
	,ius.user_scans
	,ius.last_user_scan
	
	,ius.user_lookups
	,ius.last_user_lookup

	,ius.user_updates
	,ius.last_user_update
from sys.indexes i
	inner join sys.dm_db_index_usage_stats ius
		on i.object_id = ius.object_id
		and i.index_id = ius.index_id
		and ius.database_id = db_id()
where ius.object_id = object_id('dbo.OVERRIDE')
order by table_name, index_name


select object_name(i.object_id) as table_name
	, i.name as index_name
	,ius.system_seeks
	,ius.last_system_seek
	
	,ius.system_scans
	,ius.last_system_scan
	
	,ius.system_lookups
	,ius.last_system_lookup

	,ius.system_updates
	,ius.last_system_update
from sys.indexes i
	inner join sys.dm_db_index_usage_stats ius
		on i.object_id = ius.object_id
		and i.index_id = ius.index_id
		and ius.database_id = db_id()
where ius.object_id = object_id('dbo.OVERRIDE')
order by table_name, index_name