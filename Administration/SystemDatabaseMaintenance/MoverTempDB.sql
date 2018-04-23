 USE master;
GO
ALTER DATABASE tempdb
MODIFY FILE (NAME = tempdev, FILENAME = 'J:\SQL_TempDB\tempdb.mdf', SIZE = 2048, filegrowth = 512 MB);
GO
ALTER DATABASE tempdb
MODIFY FILE (NAME = templog, FILENAME = 'J:\SQL_TempDB\templog.ldf', filegrowth = 256 MB);
GO

ALTER DATABASE tempdb 
ADD FILE (NAME = tempdev2, FILENAME = 'J:\SQL_TempDB\tempdb2.mdf', SIZE = 2048, filegrowth = 512 MB); 
ALTER DATABASE tempdb 
ADD FILE (NAME = tempdev3, FILENAME = 'J:\SQL_TempDB\tempdb3.mdf', SIZE = 2048, filegrowth = 512 MB); 
ALTER DATABASE tempdb 
ADD FILE (NAME = tempdev4, FILENAME = 'J:\SQL_TempDB\tempdb4.mdf', SIZE = 2048, filegrowth = 512 MB);

ALTER DATABASE tempdb 
ADD FILE (NAME = tempdev5, FILENAME = 'J:\SQL_TempDB\tempdb5.mdf', SIZE = 2048, filegrowth = 512 MB);
ALTER DATABASE tempdb 
ADD FILE (NAME = tempdev6, FILENAME = 'J:\SQL_TempDB\tempdb6.mdf', SIZE = 2048, filegrowth = 512 MB);
ALTER DATABASE tempdb 
ADD FILE (NAME = tempdev7, FILENAME = 'J:\SQL_TempDB\tempdb7.mdf', SIZE = 2048, filegrowth = 512 MB);
ALTER DATABASE tempdb 
ADD FILE (NAME = tempdev8, FILENAME = 'J:\SQL_TempDB\tempdb8.mdf', SIZE = 2048, filegrowth = 512 MB);


GO 

SELECT name, physical_name
FROM sys.master_files
WHERE database_id = DB_ID('tempdb');
