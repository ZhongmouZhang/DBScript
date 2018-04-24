 
 
 
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_SETSimpleAndAutoShrinkForAllUserDB') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].SP_SETSimpleAndAutoShrinkForAllUserDB
GO

CREATE         proc dbo.SP_SETSimpleAndAutoShrinkForAllUserDB 
as
declare @dbname varchar(500)
declare @stt varchar (5000)

-- backup all the database fully
create table #temp
(
	dbname varchar(500)
)

insert into #temp 
select name from master.dbo.sysdatabases db
where name not in ('tempdb','distribution','master','msdb','model')
order by name

declare myCur_full cursor for 
select dbname from #temp 


open myCur_full
Fetch next from myCur_full into @dbname

while @@fetch_status = 0
begin
	set @stt = 'alter database [' + @dbname + '] set  RECOVERY SIMPLE '
	exec (@stt)
	exec sp_dboption @dbname,'autoshrink','TRUE'
	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full