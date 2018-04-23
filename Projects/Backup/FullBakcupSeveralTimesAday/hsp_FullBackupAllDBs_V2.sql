  
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_FullBackupAllDBs_V2') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[hsp_FullBackupAllDBs_V2]
GO

CREATE         proc dbo.hsp_FullBackupAllDBs_V2 
@now datetime
as
declare @dbname varchar(50)

-- backup all the database fully
create table #temp
(
	dbname varchar(500)
)

insert into #temp 
select name from master.dbo.sysdatabases db
where name not in ('tempdb','distribution')
	and not exists (select dbname from master.dbo.BackupParameter bp where excluded = 1 and db.name=bp.dbname)
--	and db.status & 512 != 512
order by name

declare myCur_full cursor for 
select dbname from #temp 
open myCur_full
Fetch next from myCur_full into @dbname
while @@fetch_status = 0
begin
	-- delete the backup one day older
	exec hsp_DeleteBackupOnedayOlder_V2 @dbname, @now
	
	-- fully backup a database
	exec hsp_FullBackupADB_V2 @dbname, @now
	
	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full

