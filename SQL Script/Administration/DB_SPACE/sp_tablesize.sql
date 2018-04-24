/********** 
 if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_tablesize') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_tablesize
GO

CREATE         proc dbo.sp_tablesize
as

*********************/

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp

create table #temp
(
	name varchar(1000),
	rows int,
	reserved varchar(100),
	data varchar(100),
	index_size varchar(100),
	unused varchar(100)
)

declare myCur cursor for 
--select table_name from INFORMATION_SCHEMA.TABLES
/**************************  for SQL 2000 
 
select '[' + u.name + ']' + '.[' + o.name + ']' 
from sysobjects o join sysusers u on o.uid=u.uid where xtype='U'
***************************************/

select b.name+'.['+a.name + ']' from [sys].[tables] a join [sys].[schemas] b on a.schema_id = b.schema_id


declare @tablename  varchar(1000)

open myCur
Fetch next from myCur into @tablename

while @@fetch_status = 0
begin
	insert into #temp
	exec sp_spaceused @tablename
	Fetch next from myCur into @tablename
end

close myCur
deallocate myCur


--select * from #temp order by name

/**************
select * from #temp 
order by convert(int, substring(reserved, 1, patindex('%KB%',reserved) - 1)) desc
********************/


update #temp
set   reserved = replace (reserved, ' KB','')
	, data = replace (data, ' KB','')
	, index_size = replace (index_size, ' KB','')
	, unused = replace (unused, ' KB','')
	
select name
	, rows
	, convert (decimal (20,2), convert (int, reserved)/1024) [Reserved (MB)]
	, convert (decimal (20,2), convert (int, data)/1024.0)   [Data (MB)]
	, convert (decimal (20,2), convert (int, index_size)/1024.0)  [Index_Size (MB)]
	, convert (decimal (20,2), convert (int, unused)/1024.0)  [Unused (MB)]
from #temp
order by convert (int, reserved) desc