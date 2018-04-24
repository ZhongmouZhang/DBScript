 set nocount on
 
 -- backup all the database fully
 if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

declare @login varchar(500), @dbname varchar(500)

set @login = 'phsabc\alin'

insert into #temp 
select name from master.dbo.sysdatabases db
where name not in ('tempdb','distribution', 'master', 'model', 'msdb')
order by name

declare myCur_full cursor for 
select dbname from #temp 


open myCur_full
Fetch next from myCur_full into @dbname

while @@fetch_status = 0
begin

	print 'use ' + @dbname
	print 'go'
	print 'EXEC sp_grantdbaccess ''' + @login + ''', ''' + @login + ''''
	print 'Exec sp_addrolemember ''db_datareader'', ''' + @login + ''''
	print 'Exec sp_addrolemember ''db_datawriter'', ''' + @login + ''''
	print ''
	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full