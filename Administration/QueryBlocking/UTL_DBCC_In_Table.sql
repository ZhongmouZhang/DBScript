 --sp_who2

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
GO

create table #temp
( dbname varchar(500),
  logsize decimal(20,10),
  logspaceused decimal (15,5),
  status int
)

insert #temp
exec ('dbcc sqlperf(logspace)')

select * from #temp order by logsize

