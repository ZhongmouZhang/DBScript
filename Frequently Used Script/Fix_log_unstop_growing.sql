if exists (select * from master.sys.databases where name = 'snapshot_trakstarssf')
	drop database snapshot_trakstarssf
go

select * from sys.databases

exec sp_removedbreplication 'trakstarssf'


-- Key part from Microsoft, a potential issue of SQL Server
EXEC sp_repldone @xactid = NULL, @xact_segno = NULL, @numtrans = 0,     @time = 0, @reset = 1

 


 
SELECT name ,size/128.0 TotalSpaceInMB, size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 AS AvailableSpaceInMB
FROM sys.database_files;

dbcc shrinkfile (TrakstarSSF_Log, 0)

dbcc sqlperf(logspace)
