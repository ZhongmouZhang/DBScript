 create table #temp
(
	dbname varchar(500)
)

insert into #temp 
select name from master.dbo.sysdatabases db
where name not in ('master','msdb','model','tempdb','distribution')

declare @dbname varchar(50), @stt nvarchar(2000)
declare myCur_full cursor for 
select dbname from #temp 


open myCur_full
Fetch next from myCur_full into @dbname

while @@fetch_status = 0
begin
	set @stt = 'Exec sp_dboption ''' + @dbname + ''', ''single user'', ''TRUE'''
	print @stt
	-- exec sp_executesql @stt
	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full
drop table #temp
