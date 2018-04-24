 -- backup all the database fully
declare @dbname varchar(1000)
declare @stt varchar (4000)


if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp_result') and xtype='U')
drop table #temp_result
create table #temp_result
(
	database_name varchar(500)
	, database_user_name varchar(500)
	, type char(1)
	, type_desc varchar(64)
)

insert into #temp (dbname)
select name from master.dbo.sysdatabases db
where name not in ('tempdb','distribution')
--	and not exists (select dbname from master.dbo.BackupParameter bp where excluded = 1 and db.name=bp.dbname)
	and db.status & 512 != 512
order by name

declare myCur_full cursor for 
select dbname from #temp 
open myCur_full
Fetch next from myCur_full into @dbname
while @@fetch_status = 0
begin

	set @stt = 'use [' + @dbname + ']; select ''' + @dbname + ''', b.name, b.type, b.type_desc
from master.sys.syslogins a right join sys.database_principals b on a.sid=b.sid
where a.sid is null and b.type in (''S'', ''U'') '
 
	insert into #temp_result (database_name, database_user_name, type, type_desc)
	exec (@stt)

	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full

select * from #temp_result where database_user_name not in ('guest','sys','INFORMATION_SCHEMA')

 

