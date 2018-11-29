-- #1 Page, Extents

dbcc traceon (3604)
go

dbcc ind (test, internalStorageFormat, -1)
go

DBCC PAGE (test, 1, 314, 3);
GO


-- #3 Allocation Unit and IAM Page

SELECT  OBJECT_NAME(P.object_id) AS object_name,
        I.name AS index_name,
        i.type_desc AS index_type,
        P.partition_number,
        AU.type_desc AS allocation_unit_type
FROM    sys.allocation_units AS AU
JOIN    sys.partitions AS P
        ON P.partition_id = AU.container_id
JOIN    sys.indexes AS I
        ON P.object_id = I.object_id
           AND P.index_id = I.index_id;


-- #7 Latch Contention in TempDB
-- currently wating for a latch
select * from sys.dm_os_waiting_tasks
where resource_description in ('2:1:1', '2:1:2', '2:1:3')
go


-- query accumulating latch waiting time
select * from sys.dm_os_wait_stats
where wait_type like 'Pagelatch%'
order by wait_time_ms desc
go 


