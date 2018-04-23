  
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_FullBackupAllDB') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[hsp_FullBackupAllDB]
GO

 -- hsp_FullBackupADB_V2 'AdventureWorks', '2007-05-02 00:00:00'
CREATE         proc dbo.hsp_FullBackupADB_V2
@dbname varchar(100),
@now datetime

as
declare @path varchar(512)
declare @stt varchar (5000)
declare @subject_str varchar(1000)
declare @from_str varchar(500)

if (not exists (select * from master.dbo.BackupParameter where dbname=@dbname and backuptype='full'))
	select @path = path from master.dbo.BackupParameter where dbname='default'
else
	select top 1 @path = path from master.dbo.BackupParameter where dbname=@dbname  and backuptype='full'
		 
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
	values (@dbname, 'Full', @now, @dest, 'Backup')
end
