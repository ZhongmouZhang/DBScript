
/*******************************************************************************

Ten key performance counter about SQL Server, 10 second average

*************************************************************************************/

/*************

select *
from sys.dm_os_performance_counters 
where counter_name like '%Batch Requests/Sec%' and instance_name=''

*************/
declare @physical_memory_MB bigint, @available_memory_MB bigint, @sql_used_memory_MB bigint
declare @buffer_cache_hit_ratio numeric(5,2)
declare @page_life_expectancy bigint
declare @batch_requests_per_second bigint
declare @sql_compilations_per_second bigint
declare @sql_re_compilations_per_second bigint
declare @user_connections bigint
declare @lock_waits_per_second bigint
declare @page_splits_per_second bigint
declare @processes_block bigint
declare @checkpoint_pages_per_second bigint

declare @start_time datetime
declare @diff_time int

declare @delay varchar(32)
set @delay = '00:00:05'

SELECT  @physical_memory_MB = [total_physical_memory_kb]/1024 ,
@available_memory_MB = [available_physical_memory_kb]/1024 
FROM     sys.dm_os_sys_memory

-- Total Memory used by SQL Server instance from Perf Mon 
SELECT @sql_used_memory_MB = cntr_value/1024 
FROM sys.dm_os_performance_counters 
WHERE counter_name = 'Total Server Memory (KB)'


set @start_time = GETDATE()
set @buffer_cache_hit_ratio = (select cntr_value from  sys.dm_os_performance_counters where object_name like '%buffer Manager%' and counter_name = 'Buffer cache hit ratio')*100.00/
		(select cntr_value from  sys.dm_os_performance_counters where object_name like '%buffer Manager%' and counter_name = 'Buffer cache hit ratio base') -- as [Buffer cache hit ratio]
	
set @page_life_expectancy = (select cntr_value from sys.dm_os_performance_counters where counter_name like '%Page life expectancy%' and instance_name='')  -- as [Page life expectancy]
	-- unit: second

set @batch_requests_per_second = (select cntr_value from sys.dm_os_performance_counters where counter_name like '%Batch Requests/Sec%' and instance_name='')  -- as [Batch Requests/Sec]

set @sql_compilations_per_second = (select cntr_value from sys.dm_os_performance_counters where counter_name like '%SQL Compilations/Sec%' and instance_name='') -- as [SQL Compilations/Sec]
	-- Ideally you want to have one compile per every 10 batch requests

set @sql_re_compilations_per_second = (select cntr_value from sys.dm_os_performance_counters where counter_name like '%SQL Re-Compilations/Sec%' and instance_name='') --as [SQL Re-Compilations/Sec]
	-- Ideally you want to keep this counter less than 10% of the number of Compilations/Sec.

set @user_connections = (select cntr_value from sys.dm_os_performance_counters where counter_name like '%User Connections%' and instance_name='') --as [User Connections]

set @lock_waits_per_second = (select cntr_value from sys.dm_os_performance_counters where counter_name like '%Lock Waits/sec%' and instance_name like'_Total%') --as [Lock Waits/sec]
	-- Ideally you don't want any request to wait for a lock. Therefore you want to keep this counter at zero, or close to zero at all times.

set @page_splits_per_second = (select cntr_value from sys.dm_os_performance_counters where counter_name like '%Page Splits/sec%' and instance_name='') --as [Page Splits/sec]
	-- Ideally this counter should be less than 20% of the batch requests per second.

set @processes_block = (select cntr_value from sys.dm_os_performance_counters where counter_name like '%Processes Block%' and instance_name='') --as [Processes Block]
	-- Ideally you don't want to see any blocked processes. When processes are being blocked you should investigate.

set @checkpoint_pages_per_second = (select cntr_value from sys.dm_os_performance_counters where counter_name like '%Checkpoint Pages/Sec%' and instance_name='') --as [Checkpoint Pages/Sec]
	-- The checkpoint pages per second counter measures the number of pages written to disk by a checkpoint operation. You should watch this counter over time 
	-- to establish a baseline for your systems. Once a baseline value has been established you can watch this value to see if it is climbing. 
	-- If this counter is climbing, it might mean you are running into memory pressures that are causing dirty pages to be flushed to disk more frequently than normal


waitfor delay @delay


set @diff_time = datediff(second, @start_time, GETDATE())


set @batch_requests_per_second = ((select cntr_value from sys.dm_os_performance_counters where counter_name like '%Batch Requests/Sec%' and instance_name='')- @batch_requests_per_second)/@diff_time  

set @sql_compilations_per_second = ((select cntr_value from sys.dm_os_performance_counters where counter_name like '%SQL Compilations/Sec%' and instance_name='') - @sql_compilations_per_second)/@diff_time 

set @sql_re_compilations_per_second = ((select cntr_value from sys.dm_os_performance_counters where counter_name like '%SQL Re-Compilations/Sec%' and instance_name='') - @sql_re_compilations_per_second)/@diff_time

set @lock_waits_per_second = ((select cntr_value from sys.dm_os_performance_counters where counter_name like '%Lock Waits/sec%' and instance_name like'_Total%') - @lock_waits_per_second) / @diff_time

set @page_splits_per_second = ((select cntr_value from sys.dm_os_performance_counters where counter_name like '%Page Splits/sec%' and instance_name='') - @page_splits_per_second) / @diff_time

set @checkpoint_pages_per_second = ((select cntr_value from sys.dm_os_performance_counters where counter_name like '%Checkpoint Pages/Sec%' and instance_name='') - @checkpoint_pages_per_second ) /@diff_time


select @diff_time diff_time
select @buffer_cache_hit_ratio buffer_cache_hit_ratio
	, @page_life_expectancy page_life_expectancy
	,  @batch_requests_per_second batch_requests_per_second
	, @sql_compilations_per_second sql_compilations_per_second
	, @sql_re_compilations_per_second sql_re_compilations_per_second
	, @user_connections  user_connections
	, @lock_waits_per_second lock_waits_per_second
	, @page_splits_per_second page_splits_per_second
	, @processes_block processes_block
	, @checkpoint_pages_per_second checkpoint_pages_per_second
	, @physical_memory_MB  physical_memory_MB
	, @available_memory_MB available_memory_MB
	, @sql_used_memory_MB   sql_used_memory_MB

