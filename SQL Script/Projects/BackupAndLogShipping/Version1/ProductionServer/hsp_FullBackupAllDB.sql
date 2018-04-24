 
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_FullBackupAllDB') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[hsp_FullBackupAllDB]
GO

CREATE         proc dbo.hsp_FullBackupAllDB 
as
declare @dbname varchar(50)
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @subject_str varchar(1000)
declare @from_str varchar(500)

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
	if (not exists (select * from master.dbo.BackupParameter where dbname=@dbname and backuptype='full'))
		select @path = path from master.dbo.BackupParameter where dbname='default'
	else
		select @path = path from master.dbo.BackupParameter where dbname=@dbname  and backuptype='full'
		 
	select @dest=@path + @dbname + '_Full_' + convert(varchar,getdate(),112)+'_' 
		+ 
		case when datepart(hour,getdate())>9 then convert(varchar,datepart(hour,getdate()))
			 else '0' + convert(varchar,datepart(hour,getdate()))
		end
		+
		case when datepart(minute,getdate())>9 then  convert(varchar,datepart(minute,getdate()))
			 else '0' + convert(varchar,datepart(minute,getdate()))
		end
		+ 
		case when datepart(second,getdate())>9 then  convert(varchar,datepart(second,getdate()))
			 else '0' + convert(varchar,datepart(second,getdate()))
		end
		+'.bak'
	-- select @dest

	backup database @dbname to Disk=@dest with init
	if (@@error != 0)
	begin
		set @subject_str = 'backup of the ' +@dbname+ ' database on server ' + @@Servername +' failed'
		EXEC usp_sendcdomail
			@From = 'dbserver@phsa.ca', 
			@To = 'phsaimitmonitor@phsa.ca;jzhang2@phsa.ca;rgrover2@phsa.ca',
			@Subject = @subject_str, 
			@Body = 'Please check the backup on the server'
	end
	else
	begin
		insert into master.dbo.backuplog (DBname,BackupType ,backuptime ,Source_filename,status )
		values (@dbname, 'Full', getdate(), @dest, 'Backup')

	end

	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full

-- delete the last full backup and all the related log backup before the last full backup