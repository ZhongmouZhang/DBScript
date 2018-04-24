 -- Select statement
SELECT object_name(object_id), * FROM sys.dm_db_index_physical_stats(DB_ID(N'MCI'), NULL, NULL, NULL , 'LIMITED')
order by index_type_desc, avg_fragmentation_in_percent desc


-- select indexes on a specific table
SELECT a.index_id, name, avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats (DB_ID(), OBJECT_ID(N'Production.Product'),
     NULL, NULL, NULL) AS a
    JOIN sys.indexes AS b ON a.object_id = b.object_id AND a.index_id = b.index_id;


-- select all the indexes    
SELECT a.object_id table_id, object_name(a.object_id) table_name, a.index_id, b.name index_name, avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL,NULL, NULL, NULL) AS a
    JOIN sys.indexes AS b ON a.object_id = b.object_id AND a.index_id = b.index_id
order by avg_fragmentation_in_percent desc



-- 1. change recovery mode to simple and disable the backup and archive jobs.

alter database MCI set RECOVERY SIMPLE
go

EXEC msdb.dbo.sp_update_job
    @job_name = N'Archive MCI Message',
    @enabled = 0 ;


EXEC msdb.dbo.sp_update_job
    @job_name = N'Backup -- dbs and logs',
    @enabled = 0 ;

go


-- 2. Reindex statements
 
 alter index all on dbo.ActionAudit
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

alter index all on dbo.MessageArchive
reorganize
go

alter index all on dbo.recordaudit
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

alter index all on dbo.SourceClient
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

alter index all on dbo.CompositeClient
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

alter index all on dbo.SourceClientLink
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

alter index all on dbo.CompositeClientHistory
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

alter index all on dbo.CompositeClientLink
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

alter index all on dbo.CompositeClientLinkHistory
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go


-- 3. set the recovery mode to full, make a full backup, enable the two jobs

alter database MCI set RECOVERY FULL
go

declare @dbname varchar(1000), @folder varchar(1000)
set @dbname = 'MCI'
select top 1 @folder = path from master.dbo.BackupParameter where backuptype='Specific' or dbname = 'default'
print 'Dbname: ' + @dbname 
print 'Path: ' + @folder
declare @dest varchar(1000)
select @dest=@folder + @dbname + '_FULL_'
	+convert(varchar,getdate(),112)+'_' 
	+ 
	case when datepart(hour,getdate())>9 then convert(varchar,datepart(hour,getdate()))
		 else '0' + convert(varchar,datepart(hour,getdate()))
	end
	+
	case when datepart(minute,getdate())>9 then  convert(varchar,datepart(minute,getdate()))
		 else '0' + convert(varchar,datepart(hour,getdate()))
	end
	+ '00'
	+'.bak'
--select @dest

backup database @dbname to Disk=@dest with init,STATS 
go

EXEC msdb.dbo.sp_update_job
    @job_name = N'Archive MCI Message',
    @enabled = 1 ;


EXEC msdb.dbo.sp_update_job
    @job_name = N'Backup -- dbs and logs',
    @enabled = 1 ;

go



