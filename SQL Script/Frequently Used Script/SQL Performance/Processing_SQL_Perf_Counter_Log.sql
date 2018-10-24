declare @instance_id int
declare @collection_date_pre datetime, @collection_date_curr datetime
declare @diff_time int

set @instance_id = 0

while 1=1
begin
	select @instance_id = min(instance_id) from [dbo].[tbl_sql_perf_counter_log] where instance_id>@instance_id

	if @instance_id is null
		break

	select @collection_date_pre = max(collection_date) from [dbo].[tbl_sql_perf_key_counter_snapshot] where instance_id=@instance_id
	if @collection_date_pre is null
		select @collection_date_pre = min(collection_date) from [tbl_sql_perf_counter_log] where instance_id=@instance_id 

	while 1=1
	begin
		select @collection_date_curr=min(collection_date) from [tbl_sql_perf_counter_log] where instance_id=@instance_id and collection_date>@collection_date_pre
		if @collection_date_curr is null
			break

		set @diff_time = datediff(second, @collection_date_pre, @collection_date_curr)
 
		INSERT INTO [dbo].[tbl_sql_perf_key_counter_snapshot]
           ([instance_id]
           ,[collection_date]
           ,[physical_memory_MB]
           ,[available_memory_MB]
           ,[sql_used_memory_MB]
           ,[buffer_cache_hit_ratio]
           ,[page_life_expectancy]
           ,[batch_requests_per_second]
           ,[sql_compilations_per_second]
           ,[sql_re_compilations_per_second]
           ,[user_connections]
           ,[lock_waits_per_second]
           ,[page_splits_per_second]
           ,[processes_block]
           ,[checkpoint_pages_per_second])
		select @instance_id
			, @collection_date_curr

			, (select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_curr=collection_date and counter_name like '%total_physical_memory_MB%')

			, (select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_curr=collection_date and counter_name like  '%available_physical_memory_MB%')

			, (select cntr_value/1024 from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_curr=collection_date and counter_name like '%Total Server Memory (KB)%')

			, (select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_curr=collection_date and counter_name like '%Buffer cache hit ratio     %')*100.00
				/
			  (select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_curr=collection_date and counter_name like '%Buffer cache hit ratio base%')
				
			, (select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_curr=collection_date and counter_name like '%Page life expectancy%')

			, ((select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_curr=collection_date and counter_name like '%Batch Requests/sec%')
				-
			  (select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_pre=collection_date and counter_name like '%Batch Requests/sec%'))
				/ @diff_time
			  
			, ((select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_curr=collection_date and counter_name like '%SQL Compilations/sec%')
				-
			  (select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_pre=collection_date and counter_name like '%SQL Compilations/sec%'))
				/ @diff_time


			, ((select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_curr=collection_date and counter_name like '%SQL Re-Compilations/sec%')
				-
			  (select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_pre=collection_date and counter_name like '%SQL Re-Compilations/sec%'))
				/ @diff_time

			, (select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_curr=collection_date and counter_name like '%User Connections%')

			, ((select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_curr=collection_date and counter_name like '%Lock Waits/sec%')
				-
			  (select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_pre=collection_date and counter_name like '%Lock Waits/sec%'))
				/ @diff_time
	
			, ((select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_curr=collection_date and counter_name like '%Page Splits/sec%')
				-
			  (select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_pre=collection_date and counter_name like '%Page Splits/sec%'))
				/ @diff_time
	
			, (select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_curr=collection_date and counter_name like '%Processes blocked%')

			, ((select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_curr=collection_date and counter_name like '%Checkpoint pages/sec%')
				-
			  (select cntr_value from [tbl_sql_perf_counter_log]
				where @instance_id = instance_id and @collection_date_pre=collection_date and counter_name like '%Checkpoint pages/sec%'))
				/ @diff_time
	
		set @collection_date_pre = @collection_date_curr
	end
end
