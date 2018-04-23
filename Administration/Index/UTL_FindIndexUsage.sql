 declare @dbid int
--To get Datbase ID
set @dbid = db_id()


--This query will order result according to index usage, which can help you to find which indexes are highly used and requires more attention
-- I am not using index upadate count over here since we requires details of  index usage for search operations 
-- Join this view to Sys.indexes to get name of indexes. Index name will be null where there is no index exist and table scan happens. 

--Here index_name and index_column may come NULL, where no index exists and SQL Server refers table directly which is called heap.

 

select 
db_name(d.database_id) database_name
,object_name(d.object_id) object_name
,s.name index_name,
c.index_columns
,d.*
from sys.dm_db_index_usage_stats d
inner join sys.indexes  s
on d.object_id = s.object_id
and d.index_id = s.index_id
left outer join 
(select distinct object_id, index_id, 
stuff((SELECT   ','+col_name(object_id,column_id ) as 'data()' FROM   sys.index_columns t2  where t1.object_id =t2.object_id  and t1.index_id = t2.index_id FOR XML PATH ('')),1,1,'')    
as 'index_columns' FROM  sys.index_columns t1  ) c on
c.index_id = s.index_id and c.object_id = s.object_id
where database_id = @dbid
and objectproperty(d.object_id, 'IsIndexable') = 1
order by 
(user_seeks+user_scans+user_lookups+system_seeks+system_scans+system_lookups) desc

 

-- To find index scans

select 
db_name(d.database_id) database_name
,object_name(d.object_id) object_name
,s.name index_name,
c.index_columns
,d.*
from sys.dm_db_index_usage_stats d
inner join sys.indexes  s
on d.object_id = s.object_id
and d.index_id = s.index_id
left outer join 
(select distinct object_id, index_id, 
stuff((SELECT   ','+col_name(object_id,column_id ) as 'data()' FROM   sys.index_columns t2  where t1.object_id =t2.object_id  and t1.index_id = t2.index_id FOR XML PATH ('')),1,1,'')    
as 'index_columns' FROM  sys.index_columns t1  ) c on
c.index_id = s.index_id and c.object_id = s.object_id
where database_id = @dbid
and objectproperty(d.object_id, 'IsIndexable') = 1
and ( d.user_scans +d.system_scans ) > 0
order by 
d.user_scans +d.system_scans

--To find unused indexes 
-- This query will give you details of unused indexes with details like object_name index_name,index_type , index columns .
-- We are considering only indexes so we are omitting index_type heap, clustered since it represents tables

select  object_name(i.object_id) object_name,
i.name index_name, 
i.index_id index_id,
i.type_desc type_desc,
c.index_columns
from sys.indexes i  left outer join sys.dm_db_index_usage_stats d 
on d.object_id=i.object_id and i.index_id=d.index_id 
and d.database_id = @dbid 
left outer join 
(select distinct object_id, index_id, 
stuff((SELECT   ','+col_name(object_id,column_id ) as 'data()' FROM   sys.index_columns t2  where t1.object_id =t2.object_id  and t1.index_id = t2.index_id FOR XML PATH ('')),1,1,'')    
as 'index_columns' FROM  sys.index_columns t1  ) c on
c.index_id = i.index_id and c.object_id = i.object_id
where objectproperty(i.object_id, 'IsIndexable') = 1 
and d.index_id is null and i.type_desc not in ('heap','clustered') 

-- another version for finding unused indexes
DECLARE  @dbid INT
SELECT @dbid = DB_ID(DB_NAME())
SELECT   OBJECTNAME = OBJECT_NAME(I.OBJECT_ID),
            INDEXNAME = I.NAME,
            I.INDEX_ID
FROM     SYS.INDEXES I
            JOIN SYS.OBJECTS O
            ON I.OBJECT_ID = O.OBJECT_ID
WHERE    OBJECTPROPERTY(O.OBJECT_ID,'IsUserTable') = 1
        AND I.INDEX_ID NOT IN (
			SELECT S.INDEX_ID
			FROM   SYS.DM_DB_INDEX_USAGE_STATS S
			WHERE  S.OBJECT_ID = I.OBJECT_ID
				AND I.INDEX_ID = S.INDEX_ID
				AND DATABASE_ID = @dbid)
    ORDER BY OBJECTNAME,
            I.INDEX_ID,
            INDEXNAME ASC
GO


-- To find only indexes which are only updated but not used in index seek, lookup or scan.

select  object_name(i.object_id) object_name,
i.name index_name, 
i.index_id index_id,
i.type_desc type_desc,
c.index_columns,
d.user_updates,
d.user_seeks,
d.user_scans,
d.user_lookups,
d.system_updates,
d.system_seeks,
d.system_scans,
d.system_lookups
from sys.indexes i  inner join sys.dm_db_index_usage_stats d 
on d.object_id=i.object_id and i.index_id=d.index_id 
and d.database_id = @dbid left outer join 
(select distinct object_id, index_id, 
stuff((SELECT   ','+col_name(object_id,column_id ) as 'data()' FROM   sys.index_columns t2  where t1.object_id =t2.object_id  and t1.index_id = t2.index_id FOR XML PATH ('')),1,1,'')    
as 'index_columns' FROM  sys.index_columns t1  ) c on
c.index_id = i.index_id and c.object_id = i.object_id
where objectproperty(i.object_id, 'IsIndexable') = 1 
and i.type_desc not in ('heap','clustered') 
and (d.user_updates > 0 or d.system_updates > 0) and d.user_seeks = 0 
and d.user_scans = 0 and d.user_lookups = 0
and  d.system_seeks=0
and d.system_scans = 0 and d.system_lookups = 0


 
