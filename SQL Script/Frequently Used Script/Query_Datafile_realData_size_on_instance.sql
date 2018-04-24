 if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp

create table #temp
(
	dbname varchar(500),
	[filename] varchar(500),
	groupid int,  -- 0: log file 1: datafile
	file_size decimal (20,2),
	data_size decimal (20,2)
--	filename varchar(1512)
)

/**************************** Full Size including log files
insert #temp (dbname, size, remark)
exec sp_databases
***********************************************/



declare myCur cursor for 
select rtrim(name) from master.dbo.sysdatabases db
	where name not in ('tempdb','distribution')
		and  status & 512 != 512 -- off line 
		and  status & 32 != 32
		and  status & 1024 != 1024 --ready only 
		
declare @dbname varchar(500)
declare @device varchar(50)
declare @stt nvarchar(1024)

open myCur
Fetch next from myCur into @dbname

while @@fetch_status = 0
begin
	set @stt = 'use ' + @dbname + '; insert #temp (dbname, [filename], groupid, file_size, data_size) select ''' + @dbname 
	+ ''',  filename, groupid, size/128.0, CAST(FILEPROPERTY(name, ''SpaceUsed'') AS int)/128.0' 
	+ ' from .dbo.sysfiles '
	print @stt
	exec sp_executesql @stt
Fetch next from myCur into @dbname
end
close myCur
deallocate myCur

select * from #temp order by dbname, groupid, filename


/****
select groupid, convert (decimal(20,3),sum(file_size)/1024), convert (decimal(20,3),sum (data_size)/1024)
from #temp
group by groupid


*****/
