SET NOCOUNT ON
DECLARE @crdate DATETIME, @day varchar(50), @hr VARCHAR(50), @min VARCHAR(5)
SELECT @crdate=crdate FROM master.dbo.sysdatabases WHERE SET NOCOUNT ON
DECLARE @crdate DATETIME, @day varchar(50), @hr VARCHAR(50), @min VARCHAR(5)
SELECT @crdate=crdate FROM master.dbo.sysdatabases WHERE name ='tempdb'

SELECT @hr=(DATEDIFF ( mi, @crdate,GETDATE()))/60
select @day = convert(int,@hr)/24, @hr = convert(int,@hr)%24

IF ((DATEDIFF ( mi, @crdate,GETDATE()))/60)=0
SELECT @min=(DATEDIFF ( mi, @crdate,GETDATE()))
ELSE
SELECT @min=(DATEDIFF ( mi, @crdate,GETDATE()))-((DATEDIFF( mi, @crdate,GETDATE()))/60)*60
PRINT 'SQL Server "' + @@servername +'" is Online for the past ' + @day + ' days ' +@hr+' hours & '+@min+' minutes'
IF NOT EXISTS (SELECT 1 FROM master.dbo.sysprocesses WHERE program_name = N'SQLAgent - Generic Refresher')
BEGIN
PRINT 'SQL Server is running but SQL Server Agent <<NOT>> running'
END
ELSE BEGIN
PRINT 'SQL Server and SQL Server Agent both are running'
END
    ='tempdb'

SELECT @hr=(DATEDIFF ( mi, @crdate,GETDATE()))/60
select @day = convert(int,@hr)/24, @hr = convert(int,@hr)%24

IF ((DATEDIFF ( mi, @crdate,GETDATE()))/60)=0
SELECT @min=(DATEDIFF ( mi, @crdate,GETDATE()))
ELSE
SELECT @min=(DATEDIFF ( mi, @crdate,GETDATE()))-((DATEDIFF( mi, @crdate,GETDATE()))/60)*60
PRINT 'SQL Server "' + @@servername +'" is Online for the past ' + @day + ' days ' +@hr+' hours & '+@min+' minutes'
IF NOT EXISTS (SELECT 1 FROM master.dbo.sysprocesses WHERE program_name = N'SQLAgent - Generic Refresher')
BEGIN
PRINT 'SQL Server is running but SQL Server Agent <<NOT>> running'
END
ELSE BEGIN
PRINT 'SQL Server and SQL Server Agent both are running'
END
    