/*******************************************************

	list all databases space usage  in a instance
	
********************************************************/
declare @dbname varchar(50)
declare @stt varchar (5000)

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
( dbname varchar(500),
  filename varchar(500),
  filetype varchar (5),
  totalspace decimal(15,2),
  freespace decimal (15,2),
  freepercentage decimal (15,2)
)

-- iterate all the databases
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#tables') and xtype='U')
drop table #tables

create table #tables
(
	dbname varchar(500)
)
insert into #tables 
select name from master.dbo.sysdatabases db
where name not in ('tempdb','distribution')
	and not exists (select dbname from master.dbo.BackupParameter bp where excluded = 1 and db.name=bp.dbname)
--	and db.status & 512 != 512
order by name

declare myCur_full cursor for 
select dbname from #tables 

open myCur_full
Fetch next from myCur_full into @dbname

while @@fetch_status = 0
begin
	set @stt = 'use ' + @dbname + '
	SELECT ''' + @dbname + ''', filename, groupid, size/128.0, size/128.0-CAST(FILEPROPERTY(name, ''SpaceUsed'') AS int)/128.0,0
	FROM [' + @dbname + '].dbo.sysfiles' 
	--print @stt
	insert into #temp 	exec (@stt)
	
	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full
update #temp
set freepercentage = freespace/totalspace*100
select * from #temp



/***********************************************
	print out one database space
***********************************************/

declare @datafilesize dec(15,2)
declare @datafilefree dec(15,2)

declare @logfilesize dec(15,2)
declare @logfilefree dec(15,2)

declare @result dec(15,2)

SELECT @datafilesize = sum(size/128.0), 
	@datafilefree = sum (size/128.0-CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0)
FROM sysfiles
where groupid = 1  -- data file 

SELECT @logfilesize = sum(size/128.0), 
	@logfilefree = sum (size/128.0-CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0)
FROM sysfiles
where groupid = 0  -- log file 


print 'DB Data file size ' + convert(varchar(15),@datafilesize)
print 'DB Data file Free Space ' + convert(varchar(15),@datafilefree)

select @result = (@datafilefree/@datafilesize)*100
print '% Free Data Space ' + convert(varchar(15),@result)
print '' 
print 'DB log file size ' + convert(varchar(15),@logfilesize)
print 'DB Log file Free Space ' + convert(varchar(15), @logfilefree)
select @result = (@logfilefree/@logfilesize)*100
print '% Free Data Space ' + convert(varchar(15),@result)




/**************************************
	SQL 2005 Version
	
***************************************/

SELECT name AS 'File Name' , physical_name AS 'Physical Name', size/128 AS 'Total Size in MB',
size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 AS 'Available Space In MB', *
FROM sys.database_files;


/********************************************
   Compatible Verion
   
**********************************************/

DBCC showfilestats with no_infomsgs  --data files
  
dbcc sqlperf(logspace) with no_infomsgs  -- log files


SELECT name AS 'File Name' , size/128 AS 'Total Size in MB',
size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 AS 'Available Space In MB', *
FROM sysfiles;

/***************************************************
	calculate data file and log file size
****************************************************/
use master;
select case groupid when 0 then 'LogFile' else 'DataFile' end FileType, sum(Total_Size) FileSize, sum(Available_Space) AvailableSize
from
(
	SELECT name AS 'File Name' , size/128  AS 'Total_Size',
	size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 AS 'Available_Space',groupid
	FROM sysfiles
) V
group by case groupid when 0 then 'LogFile' else 'DataFile' end 
