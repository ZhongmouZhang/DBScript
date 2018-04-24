  -- Select statement
 SELECT object_name (object_id), avg_fragmentation_in_percent, fragment_count, avg_fragment_size_in_pages, *
 FROM sys.dm_db_index_physical_stats(DB_ID(N'MCI_20080304'), NULL, NULL, NULL , 'LIMITED')

SELECT a.index_id, name, avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats (DB_ID(), OBJECT_ID(N'Production.Product'),
     NULL, NULL, NULL) AS a
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
 
alter index all on dbo.WorkQueue
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

alter index IX_SourceClientLink_SourceClientID on dbo.SourceClientLink
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go
alter index IX_SourceClientLink_CompositeClientLinkID on dbo.SourceClientLink
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

/*********************
create index for workqueuemessage table

alter index all on dbo.WorkQueueMessage
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

******************************/
create clustered index IX_WorkQueueMessageID on dbo.WorkQueueMessage(WorkQueueMessageID)
with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

alter index IX_SourceClient_ActiveSSID on dbo.SourceClient
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

alter index IX_CompositeClient_MCIID on dbo.CompositeClient
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go
alter index IX_CompositeClient_Demographic on dbo.CompositeClient
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go


alter index all on dbo.WorkQueueCompositeClient
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

alter index all on dbo.WorkQueueSourceClient
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

alter index all on dbo.CompositeClientLinkHistory
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go

alter index IX_CompositeClientLink_TranslatedCompositeClientID on dbo.CompositeClientLink
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go


alter index IX1_ActionAudit on dbo.ActionAudit
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)
go
alter index IX2_ActionAudit on dbo.ActionAudit
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



