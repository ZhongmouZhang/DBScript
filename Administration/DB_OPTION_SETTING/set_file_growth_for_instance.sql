  use master;
 go
 
 set nocount on
 
 if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
GO

create table #temp
( database_name varchar(256),
  logical_name varchar(256),
  physical_name varchar(2048),
  size decimal(20,2),
  growth decimal(20,2) ,
  is_percent_growth int,
  type tinyint,
  type_desc nvarchar(60)
 )


declare @DB_NAME VARCHAR(256) 
declare @logical_name varchar(256)
declare @stt varchar(5000)
set @DB_NAME = ''

while (1=1)
begin
	SELECT @DB_NAME=MIN(name) FROM sys.databases 
	WHERE @DB_NAME<name AND database_id NOT IN (2,3)

	if @DB_NAME is NULL 
		break
	set @stt = 'select ''' + @DB_NAME + ''', name, physical_name, convert(decimal(20,2),size/128.0), convert(decimal(20,2),case is_percent_growth when 0 then growth/128.0 else growth end) growth,is_percent_growth,type,type_desc from [' + @DB_NAME + '].sys.database_files'
	--print @DB_NAME
	insert into #temp
	exec (@stt)
	--print @stt
end

-- set option on all the databases
declare myCur cursor for
select database_name, logical_name from #temp where not database_name in ('master','model','msdb')
open myCur
fetch next from myCur into @db_name, @logical_name
while @@fetch_status = 0
begin
	set @stt = 'alter database ' + @db_name + ' set auto_shrink off' 
	
	exec (@stt)
	print @stt
	fetch next from myCur into @db_name, @logical_name
end
close myCur
deallocate myCur




-- Set file growth limit
declare myCur cursor for
select database_name, logical_name from #temp where not database_name in ('master','model','msdb')
open myCur
fetch next from myCur into @db_name, @logical_name
while @@fetch_status = 0
begin
	set @stt = 'alter database ' + @db_name + ' modify file ( name = ''' + @logical_name 
			+ ''', filegrowth = 500 MB) ;'
	
	exec (@stt)
	print @stt
	fetch next from myCur into @db_name, @logical_name
end
close myCur
deallocate myCur