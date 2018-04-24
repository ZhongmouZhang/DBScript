  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_LogBackup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_LogBackup
GO

CREATE         proc dbo.hsp_LogBackup
as

declare @dbname varchar(50)
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @subject_str varchar(1000)
declare @from_str varchar(500)

declare myCur cursor for 
	select dbname, path from master.dbo.BackupParameter where backuptype = 'log'

open myCur
Fetch next from myCur into @dbname, @path

while @@fetch_status = 0
begin
	select @dest=@path + @dbname + '_Log_' 
		+ convert(varchar,getdate(),112)
		+'_' 
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

	backup log @dbname to Disk=@dest with noinit
	if (@@error != 0)
	begin
		set @subject_str = 'the log backup of the ' +@dbname+ ' database on server ' + @@Servername +' failed'
		EXEC usp_sendcdomail
			@From = 'dbserver@phsa.ca', 
			@To = 'jzhang2@phsa.ca',
			@Subject = @subject_str, 
			@Body = 'Please check the log backup on the server'
	end
	else
	begin
		insert into master.dbo.backuplog (DBname,BackupType ,backuptime ,Source_filename,status )
		values (@dbname, 'Log', getdate(), @dest, 'Backup')
	end

	Fetch next from myCur into @dbname, @path
end
close myCur
deallocate myCur