 
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_FullBackupAllLog') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_FullBackupAllLog
GO

CREATE         proc dbo.hsp_FullBackupAllLog
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
SELECT name  
FROM master.dbo.sysdatabases  
WHERE name NOT IN ('master','model','msdb','tempdb')  
   AND DATABASEPROPERTYEX(name, 'Recovery') IN ('FULL','BULK_LOGGED') 
order by name

declare myCur_full cursor for 
select dbname from #temp 


open myCur_full
Fetch next from myCur_full into @dbname

while @@fetch_status = 0
begin
	if (not exists (select * from master.dbo.BackupParameter where dbname=@dbname and backuptype='Log'))
		select @path = path from master.dbo.BackupParameter where dbname='default'
	else
		select @path = path from master.dbo.BackupParameter where dbname=@dbname  and backuptype='Log'
		 
	select @dest=@path + @dbname + '_Log_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.bak'
	--print @dest

	backup log @dbname to Disk=@dest with init
	if (@@error != 0)
	begin
		set @subject_str = 'Log backup of the ' +@dbname+ ' database on server ' + @@Servername +' failed'
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