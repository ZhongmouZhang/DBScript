 /*********************************************************************

		kill all the specific db connections
		
*********************************************************************/

CREATE PROCEDURE usp_killDBConnections @DBName varchar(50), @withmsg bit=1
AS
SET NOCOUNT ON
DECLARE @spidstr varchar(8000)
DECLARE @ConnKilled smallint
SET @ConnKilled=0
SET @spidstr = ''

IF db_id(@DBName) < 4 
BEGIN
	PRINT 'Connections to system databases cannot be killed'
	RETURN
END

SELECT @spidstr=coalesce(@spidstr,',' )+'kill '+convert(varchar, spid)+ '; '
FROM master..sysprocesses WHERE dbid=db_id(@DBName)

IF LEN(@spidstr) > 0 
BEGIN
	SELECT @ConnKilled = COUNT(1)
	FROM master..sysprocesses WHERE dbid=db_id(@DBName) 
	
	EXEC(@spidstr)
END

IF @withmsg =1
	PRINT  CONVERT(VARCHAR(10), @ConnKilled) + ' Connection(s) killed for DB '  + @DBName
GO
