 SET NOCOUNT ON
DECLARE @spidstr varchar(8000)
DECLARE @cmdSTR varchar(1000)
DECLARE @ConnKilled smallint
declare @dbname varchar(100)

SET @ConnKilled=0
SET @spidstr = ''
set @DBname = 'MCI'

SELECT @spidstr=coalesce(@spidstr,',' )+'kill '+convert(varchar, spid)+ '; '
FROM master..sysprocesses WHERE dbid=db_id(@DBName)

IF LEN(@spidstr) > 0 
BEGIN
	SELECT @ConnKilled = COUNT(1)
	FROM master..sysprocesses WHERE dbid=db_id(@DBName) 
	EXEC(@spidstr)
END

--PRINT  CONVERT(VARCHAR(10), @ConnKilled) + ' Connection(s) killed for DB '  + @DBName

set @cmdSTR = 'alter database  ' + @DBname+ ' set offline'
EXEC (@cmdSTR)
