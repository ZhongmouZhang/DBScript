 -- backup all the database fully
declare @dbname varchar(1000), @folder varchar(1000)
declare @dest varchar(1000)

set @folder = '\\srvnetapp03\SQL_Back$\Adhoc\'  --temporary backup destination

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

insert into #temp 
select name from master.dbo.sysdatabases db
where name not in ('tempdb','distribution')
--	and not exists (select dbname from master.dbo.BackupParameter bp where excluded = 1 and db.name=bp.dbname)
--	and db.status & 512 != 512
order by name

declare myCur_full cursor for 
select dbname from #temp 
open myCur_full
Fetch next from myCur_full into @dbname

while @@fetch_status = 0
begin
	select @dest=@folder + replace(@@servername,'\','_') +'_' + @dbname + '_Adhoc_'
		+convert(varchar,getdate(),112)+'_' 
		+ 
		case when datepart(hour,getdate())>9 then convert(varchar,datepart(hour,getdate()))
			 else '0' + convert(varchar,datepart(hour,getdate()))
		end
		+
		case when datepart(minute,getdate())>9 then  convert(varchar,datepart(minute,getdate()))
			 else '0' + convert(varchar,datepart(hour,getdate()))
		end
		+ '00'
		+'.bak'

	print 'Backup File: ' + @dest

	backup database @dbname to Disk=@dest with init,STATS 

	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full

 

