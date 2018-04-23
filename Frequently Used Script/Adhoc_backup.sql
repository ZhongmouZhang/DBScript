 use master
go
 
declare @dbname varchar(1000), @folder varchar(1000)
 
 /**************************************************
 ALTER DATABASE PerfMon SET Single_User
WITH
ROLLBACK IMMEDIATE
GO


*********************************************************/

set @dbname = ''
set @folder = '\\srvnetapp01.phsabc.ehcnet.ca\SQL_Back$\Adhoc\'   -- temporary backup destination
-- set @folder = '\\10.251.219.1\hssbc_dbs\SQL_Backup\'


--select top 1 @folder = path from master.dbo.BackupParameter where backuptype='Specific' or dbname = 'default'
print 'Dbname: ' + @dbname 
print 'Path: ' + @folder

declare @dest varchar(1000)

select @dest=@folder + replace(@@servername,'\','_') + '_' + @dbname + '_Adhoc_'
	+convert(varchar,getdate(),112)+'_' 
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
	
print 'Destination: ' + @dest

backup database @dbname to Disk=@dest with init,STATS , compression
