 
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_FullBackupAllDBWithoutDateSuffix') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_FullBackupAllDBWithoutDateSuffix
GO

CREATE         proc dbo.hsp_FullBackupAllDBWithoutDateSuffix
as
declare @dbname varchar(50)
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @subject_str varchar(1000)
declare @from_str varchar(500)

-- delete the existing full backups
declare myCur_path_full cursor for
select distinct path from master.dbo.BackupParameter where excluded != 1 and dbname != 'LogSwitch_FullBackup'
open myCur_path_full 
fetch next from myCur_path_full into @path
while @@fetch_status=0
begin
	set @stt = 'del "' + @path + '*_full_*.bak' + '"'
	-- print @stt
	exec master.dbo.xp_cmdshell @stt
	fetch next from myCur_path_full into @path
end
close myCur_path_full
deallocate myCur_path_full


-- backup all the database fully
create table #temp
(
	dbname varchar(500)
)

insert into #temp 
select name from master.dbo.sysdatabases db
where name not in ('tempdb','distribution')
	and not exists (select dbname from master.dbo.BackupParameter bp where excluded = 1 and db.name=bp.dbname)
order by name

declare myCur_full cursor for 
select dbname from #temp 


open myCur_full
Fetch next from myCur_full into @dbname

while @@fetch_status = 0
begin
	if (not exists (select * from master.dbo.BackupParameter where dbname=@dbname and backuptype='full'))
		select @path = path from master.dbo.BackupParameter where dbname='default'
	else
		select @path = path from master.dbo.BackupParameter where dbname=@dbname  and backuptype='full'
		 
	select @dest=@path + @dbname + '_Full_' +'.bak'
	--select @dest

	backup database @dbname to Disk=@dest with init
	if (@@error != 0)
	begin
		set @subject_str = 'backup of the ' +@dbname+ ' database on server ' + @@Servername +' failed'
		EXEC usp_sendcdomail
			@From = 'dbserver@phsa.ca', 
			@To = 'phsaimitmonitor@phsa.ca;jzhang2@phsa.ca',
			@Subject = @subject_str, 
			@Body = 'Please check the backup on the server'
	end


	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full