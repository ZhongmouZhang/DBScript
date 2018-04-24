 use master;
 go
 
 if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
GO

create table #temp
( database_name varchar(256),
  physical_name varchar(2048),
  size decimal(20,2),
  growth decimal(20,2) ,
  is_percent_growth int,
  type tinyint,
  type_desc nvarchar(60)
 )


declare @DB_NAME NVARCHAR(128) 
declare @stt varchar(5000)
set @DB_NAME = ''

while (1=1)
begin
	SELECT @DB_NAME=MIN(name) FROM sys.databases 
	WHERE @DB_NAME<name AND database_id NOT IN (2,3)

	if @DB_NAME is NULL 
		break
	set @stt = 'select ''' + @DB_NAME + ''', physical_name, convert(decimal(20,2),size/128.0), convert(decimal(20,2),case is_percent_growth when 0 then growth/128.0 else growth end) growth,is_percent_growth,type,type_desc from [' + @DB_NAME + '].sys.database_files'
	print @DB_NAME
	insert into #temp
	exec (@stt)
	print @stt
end

-- select * from #temp

-- the size of all databases on the instance
select database_name, sum(size)
from #temp
where type <>1
group by database_name
with rollup
order by database_name

-- autogrowth setting
select database_name, physical_name, 
	cast( size as varchar(32)) + 'MB' size
	, case is_percent_growth when 0 then cast(growth as varchar(32)) + 'MB' else cast (growth as varchar(32)) + '%' end growth
from #temp 
where is_percent_growth = 0 and growth < 10
