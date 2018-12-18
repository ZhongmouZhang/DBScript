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
        AU.type_desc AS allocation_unit_type,
		total_pages, used_pages,data_pages 
FROM    sys.allocation_units AS AU
JOIN    sys.partitions AS P
        ON P.partition_id = AU.container_id
JOIN    sys.indexes AS I
        ON P.object_id = I.object_id
           AND P.index_id = I.index_id
order by total_pages

-- find all the LOB Data Type Columns
SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE DATA_TYPE IN ('FILESTREAM','XML','VARBINARY','TEXT','NTEXT','IMAGE') 
OR(DATA_TYPE IN ('VARCHAR', 'NVARCHAR') AND CHARACTER_MAXIMUM_LENGTH = -1)
ORDER BY TABLE_NAME



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



-- # 9
-- retrieve physical information about the clustered index, nonclustered index
select * from sys.dm_db_index_physical_stats 
(db_id('EEG_Data'), object_id ('tbl_scan_data'), null, null, 'DETAILED' )

go



-- # 22 buffer pool

-- buffer of pages for a specific database

 select * from sys.dm_os_buffer_descriptors
 where database_id = db_id('CYPC_PROD')
 order by page_level


-- how much buffer allocated to every database
select db_name(database_id) as 'DatabaseName'
	 , convert (bigint, count(*))  * 8192 / 1024 /1024 as 'MB'
 from sys.dm_os_buffer_descriptors
 where database_id <> 32767
 group by database_id
 order by count(*) desc
 go


