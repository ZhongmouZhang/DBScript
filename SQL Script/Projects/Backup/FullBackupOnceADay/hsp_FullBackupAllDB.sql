
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_FullBackupAllDB') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[hsp_FullBackupAllDB]
GO

CREATE         proc dbo.hsp_FullBackupAllDB 
as
declare @dbname varchar(500)
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @subject_str varchar(1000)
declare @from_str varchar(500)

-- delete the existing full backups
if (@@version like 'Microsoft SQL Server 2005%' or @@version like 'Microsoft SQL Server 2008%')
begin
	exec sp_configure 'show advanced option', '1'
	reconfigure
	exec sp_configure 'Ole Automation Procedures', '1'
	exec sp_configure 'xp_cmdshell', '1'
	reconfigure
end


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
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

insert into #temp 
select name from master.dbo.sysdatabases db
where name not in ('tempdb','distribution')
	and not exists (select dbname from master.dbo.BackupParameter bp where excluded = 1 and db.name=bp.dbname)
	and db.status & 512 != 512   -- off line 
	and db.status & 1073741824  != 1073741824  -- cleanly shutdown
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
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.bak'
	-- select @dest

	backup database @dbname to Disk=@dest with init,stats
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