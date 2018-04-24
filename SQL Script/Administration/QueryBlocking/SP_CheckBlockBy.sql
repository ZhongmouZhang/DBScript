  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_CheckBlockBy') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_CheckBlockBy
GO

CREATE         proc dbo.sp_CheckBlockBy
as
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
while (not exists (select * from #temp))
begin
	insert into #temp
	exec sp_who2
	
	if (not exists (select * from #temp where blkby != '  .' and  spid != convert(int, blkby)))
	begin
		truncate table #temp
		waitfor Delay '00:00:05'
		--print 'Sleep 5 Seconds'
	end
end

select top 1 @spid=spid, @blkby=blkby from #temp where blkby != '  .' and  spid != convert(int, blkby) 
DBCC INPUTBUFFER (@spid)
DBCC INPUTBUFFER (@blkby)

select * from #temp
		
	

