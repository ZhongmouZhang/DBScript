use master
go

/***********
sp_configure '',1
reconfig with override
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_disk_and_usage') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_disk_and_usage
GO

CREATE         proc dbo.hsp_disk_and_usage
as

************************/
 SET NOCOUNT ON
DECLARE @hr int
DECLARE @fso int
DECLARE @drive char(1)
DECLARE @odrive int
DECLARE @TotalSize varchar(20) DECLARE @MB Numeric ; SET @MB = 1048576

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#drives') and xtype='U')
drop table #drives

CREATE TABLE #drives 
(drive char(1) PRIMARY KEY, 
FreeSpace int NULL,
TotalSize int NULL) 

INSERT #drives(drive,FreeSpace) 
EXEC master.dbo.xp_fixeddrives 
EXEC @hr=sp_OACreate 'Scripting.FileSystemObject',@fso OUT IF @hr <> 0 
EXEC sp_OAGetErrorInfo @fso

DECLARE dcur CURSOR LOCAL FAST_FORWARD
FOR SELECT drive from #drives ORDER by drive
OPEN dcur FETCH NEXT FROM dcur INTO @drive
WHILE @@FETCH_STATUS=0
BEGIN
	EXEC @hr = sp_OAMethod @fso,'GetDrive', @odrive OUT, @drive
	IF @hr <> 0 
		EXEC sp_OAGetErrorInfo @fso 
	EXEC @hr =sp_OAGetProperty @odrive,'TotalSize', @TotalSize OUT 
	IF @hr <> 0 
		EXEC sp_OAGetErrorInfo @odrive 
	
	UPDATE #drives 
	SET TotalSize=@TotalSize/@MB 
	WHERE drive=@drive 
	FETCH NEXT FROM dcur INTO @drive
End
Close dcur
DEALLOCATE dcur
EXEC @hr=sp_OADestroy @fso 
IF @hr <> 0 
	EXEC sp_OAGetErrorInfo @fso

SELECT drive, TotalSize/1024.00 as 'Total(GB)', FreeSpace/1024.00 as 'Free(GB)' 
FROM #drives
ORDER BY drive 


GO 
