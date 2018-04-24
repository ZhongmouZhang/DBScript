SELECT o.name as Index_Name, index_id,
b.avg_fragmentation_in_percent, 
b.avg_page_space_used_in_percent,
page_count
FROM sys.dm_db_index_physical_stats(DB_ID('wbsass'), object_id('DBO.OVERRIDE'), NULL, NULL , 'DETAILED') as b
join sys.objects o on o.object_id = b.object_id



	select b.name table_name, d. name index_name, 
			convert(int, substring(c.reserved, 1, patindex('%KB%',c.reserved) - 1))/1024 [total_size(MB)] , 
			convert(int, substring(c.data, 1, patindex('%KB%',c.data) - 1))/1024 [data_size(MB)],
			convert(int, substring(c.index_size, 1, patindex('%KB%',c.index_size) - 1))/1024 [index_size(MB)],
			a.indextype, a.frag, a.page_count 
	from master.dbo.tbl_index_fragmentation a 
			join wbsass.sys.tables b on a.objectID=b.object_id
			join master.dbo.tbl_wbsass_top_30_table c on c.name=b.name
			join wbsass.sys.indexes d on d.object_id = a.objectID and d.index_id = a.indexid
	where page_count>1
	order by convert(int, substring(reserved, 1, patindex('%KB%',reserved) - 1)) desc, a.indexid



-- select * from wbsass.sys.indexes