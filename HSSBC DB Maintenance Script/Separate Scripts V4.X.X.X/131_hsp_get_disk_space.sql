USE [master]
GO
IF OBJECTPROPERTY ( object_id('hsp_get_disk_space'),'IsProcedure') = 1
	DROP PROC hsp_get_disk_space
GO

CREATE PROC hsp_get_disk_space 

AS
SET NOCOUNT ON
DECLARE @hr int
DECLARE @fso int
DECLARE @drive char(1)
DECLARE @odrive int
DECLARE @TotalSize varchar(20) 
DECLARE @MB Numeric  
SET @MB = 1048576

CREATE TABLE #drives 
	(	drive char(1) PRIMARY KEY
		, FreeSpace int NULL
		, TotalSize int NULL
	) 

/***********************	
exec sp_configure 'show advanced option', '1'
reconfigure  with override
exec sp_configure 'Ole Automation Procedures', '1'
reconfigure  with override
*****************************/

INSERT #drives(drive,FreeSpace) 
EXEC master.dbo.xp_fixeddrives 
EXEC @hr=sp_OACreate 'Scripting.FileSystemObject',@fso OUT 

IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso

DECLARE dcur CURSOR LOCAL FAST_FORWARD
FOR SELECT drive from #drives ORDER by drive
OPEN dcur FETCH NEXT FROM dcur INTO @drive

WHILE @@FETCH_STATUS=0
BEGIN
	EXEC @hr = sp_OAMethod @fso,'GetDrive', @odrive OUT, @drive
	IF @hr <> 0 
		EXEC sp_OAGetErrorInfo @fso 
	EXEC @hr = sp_OAGetProperty @odrive,'TotalSize', @TotalSize OUT 
	IF @hr <> 0 
		EXEC sp_OAGetErrorInfo @odrive 
	
	UPDATE #drives SET TotalSize=@TotalSize/@MB WHERE drive=@drive 
	FETCH NEXT FROM dcur INTO @drive
End

Close dcur
DEALLOCATE dcur

EXEC @hr=sp_OADestroy @fso 
IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso

SELECT drive, TotalSize as 'Total(MB)', FreeSpace as 'Free(MB)' FROM #drives
ORDER BY drive 
DROP TABLE #drives 

exec sp_configure 'Ole Automation Procedures', '0'
reconfigure  with override

GO 
