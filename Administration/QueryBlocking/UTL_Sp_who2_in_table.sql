-- Create a tracking table in master database

create table SP_WHO_TRACKING
(
	Eventdate datetime,
	login varchar (500),
	hostName varchar(500),
	DBName varchar(500),
	ProgramName varchar(500),
)


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

insert into SP_WHO_TRACKING (eventdate, Login, Hostname, DBName, ProgramName)
select distinct getdate(), Login, HostName, DBName, ProgramName
from #temp
where not exists (select * from SP_WHO_TRACKING 
				where eventdate > dateadd(day,-1, getdate()) and login = #temp.login and hostname = #temp.hostname
					and dbname = #temp.dbname and ProgramName = #temp.ProgramName)
		and dbname is not null

--truncate table SP_WHO_TRACKING
select * from SP_WHO_TRACKING


