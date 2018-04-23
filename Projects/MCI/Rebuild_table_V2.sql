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


-- 2. Reindex statements whith 20% fragmentation

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	tablename varchar(200),
	indexname varchar(200),
	avg_frgmnt decimal (5,2)
)
declare @tablename  varchar(200), @indexname varchar(200), @avg_frgmnt decimal(5,2), @stt varchar(4000)

-- Rebuild the clustered indexes

insert into #temp
SELECT object_name(a.object_id) table_name, b.name index_name, convert(decimal (5,2),avg_fragmentation_in_percent)
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL,NULL, NULL, NULL) AS a
    JOIN sys.indexes AS b ON a.object_id = b.object_id AND a.index_id = b.index_id
where b.index_id = 1 and avg_fragmentation_in_percent> 20  -- Percentage of fragmentation is greater than 20

declare myCur cursor for 
select distinct tablename, indexname from #temp order by tablename

open myCur
Fetch next from myCur into @tablename, @indexname
while @@fetch_status = 0
begin
	if (@tablename = 'MessageArchive')
		set @stt = 'alter index all on MessageArchive
reorganize

'
	else
		set @stt = 'alter index all on ' + @tablename + '
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

'
	print @stt	
	--exec (@stt)
	Fetch next from myCur into @tablename, @indexname
end

close myCur
deallocate myCur

--select * from #temp

-- rebuild the non-clustered indexes
truncate table #temp
insert into #temp
SELECT object_name(a.object_id) table_name, b.name index_name, convert(decimal (5,2),avg_fragmentation_in_percent)
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL,NULL, NULL, NULL) AS a
    JOIN sys.indexes AS b ON a.object_id = b.object_id AND a.index_id = b.index_id
where b.index_id >1 and avg_fragmentation_in_percent> 20 -- Percentage of fragmentation is greater than 20


declare myCur cursor for 
select distinct tablename, indexname from #temp order by tablename, indexname
open myCur
Fetch next from myCur into @tablename, @indexname
while @@fetch_status = 0
begin
	set @stt = 'alter index ' + @indexname + ' on ' + @tablename + '
rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

'
	print @stt	
	--exec (@stt)
	Fetch next from myCur into @tablename, @indexname
end

close myCur
deallocate myCur
 



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



