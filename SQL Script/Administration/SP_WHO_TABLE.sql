 if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
GO

create table #temp
(
	spid int,
	status varchar(50),
	Login varchar(500),
	hostName varchar(500),
	BlkBy varchar(20),
	DBName varchar(500),
	Command varchar(1500),
	CPUTime int,
	DiskIO int,
	LastBatch varchar(30),
	ProgramName varchar(500),
	spid2 int,
	requestid int
)
	insert into #temp
	exec sp_who2

select * from #temp where lower(status) like 'run%'

