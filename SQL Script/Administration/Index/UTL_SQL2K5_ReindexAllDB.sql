USE [master]
GO
/****** Object:  StoredProcedure [dbo].[dba_OptimizeIndexes]    Script Date: 03/25/2011 14:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECTPROPERTY ( object_id('dba_OptimizeIndexes'),'IsProcedure') = 1
	DROP PROC dba_OptimizeIndexes
GO

CREATE PROCEDURE [dbo].[dba_OptimizeIndexes]
(
---------------------------------------------------------------
--	 VARIABLES TO CHANGE	 --
---------------------------------------------------------------
 @DB_NAME NVARCHAR(128) = '',
 @ForceReindex bit = 0,  -- Default Not to do reindex for all tables
 @DoOfflineToo bit = 0, -- Default Don't do offline reindex
 @FragThreshold INT = 30
)

AS
BEGIN
---------------------------------------------------------------
---------------------------------------------------------------

DECLARE @objectid INT
DECLARE @indexid INT
DECLARE @partitioncount bigint
DECLARE @schemaname VARCHAR(130)
DECLARE @objectname VARCHAR(130)
DECLARE @indexname VARCHAR(130)
DECLARE @indextype INT
DECLARE @partitionnum bigint
DECLARE @partitions bigint
DECLARE @frag INT
DECLARE @command VARCHAR(4000)
DECLARE @max INT
DECLARE @min INT
DECLARE @IndexListCount INT
DECLARE @Edition NVARCHAR(100)
DECLARE @sql nvarchar(1000)

DECLARE @ONE_DB INT 
SELECT @ONE_DB = 0
DECLARE @DB_ID INT
DECLARE @LobCount INT
SELECT @LobCount = 0
DECLARE @Allow_pg_locks INT
SELECT @Allow_pg_locks = 1  -- Default page_locks is turned off

IF @DB_NAME <> ''
BEGIN
   SELECT @ONE_DB=1
END

WHILE (@DB_NAME IS NOT NULL)
BEGIN
    IF @ONE_DB = 1
    BEGIN
		SELECT @DB_NAME=name 
		FROM master.dbo.sysdatabases  
		WHERE @DB_NAME=name 
			AND name NOT IN ('master','model','msdb','tempdb')  
			and  status & 512 != 512
			and  status & 32 != 32
			and  status & 1024 != 1024 --ready only
    END
    ELSE
    BEGIN
		SELECT @DB_NAME=MIN(name) 
				FROM master.dbo.sysdatabases  
		WHERE @DB_NAME<name 
			AND name NOT IN ('master','model','msdb','tempdb')  
			and  status & 512 != 512
			and  status & 32 != 32
			and  status & 1024 != 1024 --ready only
    END

    IF @DB_NAME IS NULL BREAK 

	SELECT @DB_ID = DB_ID(@DB_NAME)
	SELECT @Edition = LEFT(CONVERT(NVARCHAR(100), SERVERPROPERTY ('edition')),18)

	CREATE TABLE #BenchmarkIndexList (ID INT IDENTITY(1,1), 
	   DBName VARCHAR(100), 
	   objectID INT,
	   indexid INT,
	   indextype VARCHAR(30),
	   frag INT,
	   avg_frag_size_pages INT,
	   page_count INT,
	   partition_number INT,
	   starttime datetime,
	   endtime datetime,
	   command nvarchar(500))

	CREATE CLUSTERED INDEX IX_CL_IndexList ON #BenchmarkIndexList(ID)

	INSERT #BenchmarkIndexList (DBName, objectID, indexid, indextype, frag, 
					   avg_frag_size_pages, page_count, partition_number)
	SELECT DB_NAME(database_id) AS DBName, OBJECT_ID, index_id, index_type_desc AS 'indextype',
		   avg_fragmentation_in_percent, avg_fragment_size_in_pages, page_count, partition_number
	FROM   sys.dm_db_index_physical_stats (@DB_ID, NULL, NULL, NULL, 'LIMITED')
	WHERE  page_count > 10 AND 
		   index_id > 0 AND 
		   avg_fragmentation_in_percent > 1 AND
		   index_type_desc NOT LIKE '%XML%'
	       
	SELECT @IndexListCount = COUNT(1) FROM #BenchmarkIndexList

	SELECT @max = (SELECT MAX(ID) FROM #BenchmarkIndexList)
	SELECT @min = 1

	WHILE @min <= @max
	BEGIN
	   SELECT  @objectid = objectID, @indexid = indexid, @partitionnum = partition_number, @frag = frag
	   FROM    #BenchmarkIndexList
	   WHERE   ID = @min

	   set @sql = 'SELECT  @objectname = o.name, @schemaname = s.name
				   FROM [' + @DB_NAME + '].sys.objects AS o JOIN ['
						   + @DB_NAME + ']. sys.schemas AS s ON s.schema_id = o.schema_id
				   WHERE   o.OBJECT_ID = @objectid'

	   exec sp_executesql @sql, N'@objectname VARCHAR(130) OUTPUT, @schemaname VARCHAR(130) OUTPUT, @objectid VARCHAR(130)',
							 @objectname OUTPUT, @schemaname OUTPUT, @objectid
	   
	   
	   set @sql = 'SELECT  @indexname = name, @indextype = TYPE, @Allow_pg_locks = allow_page_locks
				   FROM [' + @DB_NAME + '].sys.indexes
				   WHERE   OBJECT_ID = @objectid AND 
						   index_id = @indexid'

	   exec sp_executesql @sql, N'@indexname VARCHAR(130) OUTPUT, @indextype INT OUTPUT, @Allow_pg_locks INT OUTPUT, @objectid VARCHAR(130), @indexid INT',
							 @indexname OUTPUT, @indextype OUTPUT,@Allow_pg_locks OUTPUT, @objectid, @indexid
							 

			   
	   set @sql = 'SELECT  @partitioncount = COUNT(1)
				   FROM [' +@DB_NAME + '].sys.partitions
				   WHERE OBJECT_ID = @objectid AND 
						 index_id = @indexid'

	   exec sp_executesql @sql, N'@partitioncount bigint OUTPUT, @objectid VARCHAR(130), @indexid INT',
							 @partitioncount OUTPUT, @objectid, @indexid
	       
	   set @sql = 'SELECT  @LobCount = COUNT(1)
				   FROM    [' + @DB_NAME+ '].sys.index_columns A INNER JOIN
						   [' + @DB_NAME+ '].sys.columns B ON A.OBJECT_ID = B.OBJECT_ID AND A.Column_id = B.Column_ID INNER JOIN
						   [' + @DB_NAME+ '].sys.types C ON B.system_type_id = C.user_type_id
				   WHERE   A.OBJECT_ID = @objectID AND
						   A.index_id = @indexid AND 
						  (C.name IN(''xml'',''image'',''text'',''ntext'') OR
						  (C.name IN(''varchar'',''nvarchar'',''varbinary'',''nvarbinary'') AND 
						   B.max_length = -1))'

	exec sp_executesql @sql, N'@LobCount INT OUTPUT, @objectid VARCHAR(130), @indexid INT',
							 @LobCount OUTPUT, @objectid, @indexid
			   
			   
	   IF @frag < @FragThreshold AND @Allow_pg_locks <> 0
	   BEGIN
		   SET @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REORGANIZE';
	   END

	   IF (@frag >= @FragThreshold OR @Allow_pg_locks = 0) AND @indextype <> 1 AND @LobCount = 0 AND @Edition = 'Enterprise Edition'
	   BEGIN
		   SET @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname +'] REBUILD WITH(ONLINE = ON, SORT_IN_TEMPDB = ON)';
	   END

	   IF @frag >= @FragThreshold AND @DoOfflineToo = 1 AND (@indextype = 1 OR @LobCount <> 0 OR @Edition <> 'Enterprise Edition')
	   BEGIN
		   SET @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname +'] REBUILD WITH(ONLINE = OFF, SORT_IN_TEMPDB = ON)';
	   END
	   
	   IF @ForceReindex = 1
	   BEGIN
		   SET @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname +'] REBUILD WITH(ONLINE = OFF, SORT_IN_TEMPDB = ON)';
	   END
	   
	BEGIN TRY 
	   IF @partitioncount > 1
	   BEGIN
		   SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS VARCHAR(10));
		
		   UPDATE #BenchmarkIndexList set starttime=getdate(), command=@command
		   WHERE   ID = @min
		   
		   EXEC (@command)
	   END

	   ELSE
	   BEGIN 
   		   UPDATE #BenchmarkIndexList set starttime=getdate(), command=@command
			WHERE   ID = @min
		   EXEC (@command)
	   END
   		UPDATE #BenchmarkIndexList set endtime= getdate()
		 WHERE   ID = @min
	END TRY
	BEGIN CATCH
		  DECLARE @ErrorMessage NVARCHAR(4000)
		  DECLARE @ErrorSeverity INT
		  DECLARE @ErrorState INT
	      
				SELECT @ErrorMessage = ERROR_MESSAGE(),
					   @ErrorSeverity = ERROR_SEVERITY(),         
						 @ErrorState = ERROR_STATE()      
	                     
		  RAISERROR (@ErrorMessage, -- Message text.
						  @ErrorSeverity, -- Severity.
						  @ErrorState -- State.
							)


		  SELECT @ErrorSeverity, @ErrorState, @ErrorMessage, @command
	   
	END CATCH

	   SET @min = @min+1

	END

	select * FROM #BenchmarkIndexList

	DROP TABLE #BenchmarkIndexList

    IF @ONE_DB = 1 BREAK
END

END
go
exec master.dbo.hsp_ScriptVersionControl 'Optimize Indexes', '1.1'
go