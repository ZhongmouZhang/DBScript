create table KungFu
(KungFuID int primary key
,Hustle bit)

Insert into kungfu
	select row_number() over (order by t.object_id)
	, t.object_id%2
	--, t.object_id
	from sys.tables t
go 

delete from kungfu
where hustle = 0
go


update kungfu
set hustle = 0
where hustle = 1
go 

select object_schema_name (ios.object_id) + '.' + object_name(ios.object_id) as table_name
	, i.name as index_name
	, ios.leaf_insert_count
	, ios.leaf_update_count
	, ios.leaf_delete_count
	, ios.leaf_ghost_count
from sys.dm_db_index_operational_stats (db_id(), null,null,null) ios
	inner join sys.indexes i
		on i.object_id = ios.object_id
			and i.index_id = ios.index_id
where ios.object_id = object_id ('dbo.Kungfu')
order by ios.range_scan_count desc


-------------------------------------------------------------------------------------------------

select object_schema_name (ios.object_id) + '.' + object_name(ios.object_id) as table_name
	, i.name as index_name
	-- Page Allocation Cycle
	, leaf_allocation_count
	, nonleaf_allocation_count
	, leaf_page_merge_count
	, nonleaf_page_merge_count

	-- locking contention
	, ios.row_lock_count
	, ios.row_lock_wait_count
	, ios.row_lock_wait_in_ms
	
	, ios.page_lock_count
	, ios.page_lock_wait_count
	, ios.page_lock_wait_in_ms
	
	, ios.index_lock_promotion_attempt_count
	, ios.index_lock_promotion_count

	-- select activity
	, singleton_lookup_count
	, forwarded_fetch_count
	, range_scan_count
	-- insert, update, delete
	, ios.range_scan_count
	, ios.leaf_insert_count
	, ios.leaf_update_count
	, ios.leaf_delete_count
	, ios.leaf_ghost_count
from sys.dm_db_index_operational_stats (db_id(), null,null,null) ios
	inner join sys.indexes i
		on i.object_id = ios.object_id
			and i.index_id = ios.index_id
where ios.object_id = object_id ('dbo.Override')
order by ios.range_scan_count desc


---------------------------------------------------------------------------------------------------
-- Generating records
------------------------------------------

create table dbo.AllocationCycle
(
ID int primary key
,FillerData varchar(1000)
,CreateDate datetime
)
;

with [10] as (select 0 as c union all select 0), -- 2
	[11] as (select 0 as c from [10] as a cross join [10] as b), --2X2 = 4 2^2
	[12] as (select 0 as c from [11] as a cross join [11] as b), --4X4 = 16 2^4
	[13] as (select 0 as c from [12] as a cross join [12] as b), -- 16X16 = 256 2 ^8
	[14] as (select 0 as c from [13] as a cross join [13] as b), -- 2^16
	[15] as (select 0 as c from [14] as a cross join [14] as b), -- 2^32
	nums as (select Row_number() over (order by (select NULL)) as n from [14])

insert into allocationCycle
select top (100000) n, newid(), getdate()
from nums
order by n