
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_FullBackupSpecificDB') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_FullBackupSpecificDB
GO

CREATE         proc dbo.hsp_FullBackupSpecificDB 
as
declare @dbname varchar(50)
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @subject_str varchar(1000)
declare @from_str varchar(500)

-- delete the existing full backups
declare myCur_path cursor for
select distinct path from master.dbo.BackupParameter where excluded != 1 and dbname != 'LogSwitch_FullBackup'
open myCur_path 
fetch next from myCur_path into @path
while @@fetch_status=0
begin
	set @stt = 'del ' + @path + '*_Specific_*.bak'
	-- print @stt
	exec master.dbo.xp_cmdshell @stt
	fetch next from myCur_path into @path
end
close myCur_path
deallocate myCur_path


-- backup all the database fully
declare myCur cursor for 
select dbname from master.dbo.BackupParameter
where backuptype = 'Specific'

open myCur
Fetch next from myCur into @dbname

while @@fetch_status = 0
begin
	if (not exists (select * from master.dbo.BackupParameter where dbname=@dbname))
		select @path = path from master.dbo.BackupParameter where dbname='default'
	else
		select @path = path from master.dbo.BackupParameter where dbname=@dbname
		 
	select @dest=@path + @dbname + '_Specific_' + convert(varchar,getdate(),112)+'_' 
		+ 
		case when datepart(hour,getdate())>9 then convert(varchar,datepart(hour,getdate()))
			 else '0' + convert(varchar,datepart(hour,getdate()))
		end
		+
		case when datepart(minute,getdate())>9 then  convert(varchar,datepart(minute,getdate()))
			 else '0' + convert(varchar,datepart(minute,getdate()))
		end
		+ '00'
		+'.bak'
	select @dest

	backup database @dbname to Disk=@dest with init, stats
	if (@@error != 0)
	begin
		set @subject_str = 'backup of the ' +@dbname+ ' database on server ' + @@Servername +' failed'
		EXEC usp_sendcdomail
			@From = 'dbserver@phsa.ca', 
			@To = 'phsaimitmonitor@phsa.ca;jzhang2@phsa.ca',
			@Subject = @subject_str, 
			@Body = 'Please check the backup on the server'
	end


	Fetch next from myCur into @dbname
end
close myCur
deallocate myCur