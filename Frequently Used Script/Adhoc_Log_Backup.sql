  use master
go
 
declare @dbname varchar(1000), @folder varchar(1000)
 
set @dbname = ''
set @folder = '\\srvnetapp01\SQL_Back$\Adhoc\'   -- temporary backup destination

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
	+'.trn'
	
print 'Destination: ' + @dest

backup log @dbname to Disk=@dest with init,STATS --, compression
