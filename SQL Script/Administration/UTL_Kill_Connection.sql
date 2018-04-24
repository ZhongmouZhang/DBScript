 if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	spid int,
	status varchar(50),
	Login varchar(50),
	hostName varchar(50),
	BlkBy varchar(20),
	DBName varchar(50),
	Command varchar(1500),
	CPUTime int,
	DiskIO int,
	BastBatch varchar(30),
	ProgramName varchar(500),
	spid2 int,
	requestid int
)
declare @spid int, @blkby int

truncate table #temp
	insert into #temp
	exec sp_who2

select spid from #temp where login like '%PHSABC\svc_WhiteNet%'

-------------------------------------------------
declare myCur cursor for 
select spid from #temp where login like '%PHSABC\svc_WhiteNet%'

declare @spid int

open myCur
Fetch next from myCur into @spid

while @@fetch_status = 0
begin
	print 'kill ' + convert (varchar (5), @spid) + ';'
	Fetch next from myCur into @spid
end

close myCur
deallocate myCur
