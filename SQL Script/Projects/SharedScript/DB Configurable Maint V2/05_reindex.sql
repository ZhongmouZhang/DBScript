 USE [master]
GO
/****** Object:  StoredProcedure [dbo].[dba_OptimizeIndexes]    Script Date: 03/25/2011 14:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECTPROPERTY ( object_id('hsp_reindex'),'IsProcedure') = 1
	DROP PROC hsp_reindex
GO

CREATE PROCEDURE hsp_reindex
(
---------------------------------------------------------------
--	 VARIABLES TO CHANGE	 --
---------------------------------------------------------------
 @ForceReindex bit = 0,  -- Default Not to do reindex for all tables
 @DoOfflineToo bit = 0, -- Default Don't do offline reindex
 @FragThreshold INT = 30
)

AS
BEGIN
---------------------------------------------------------------
---------------------------------------------------------------
Declare @DB_NAME varchar(500)
DECLARE @objectid INT
DECLARE @indexid INT
DECLARE @partitioncount bigint
DECLARE @schemaname NVARCHAR(130)
DECLARE @objectname NVARCHAR(130)
DECLARE @indexname NVARCHAR(130)
DECLARE @indextype INT
DECLARE @partitionnum bigint
DECLARE @partitions bigint
DECLARE @frag INT
DECLARE @command NVARCHAR(4000)
DECLARE @max INT
DECLARE @min INT
DECLARE @IndexListCount INT
DECLARE @Edition NVARCHAR(100)
DECLARE @sql NVARCHAR(1000)

DECLARE @DB_ID INT
DECLARE @LobCount INT
SELECT @LobCount = 0
DECLARE @Allow_pg_locks INT
SELECT @Allow_pg_locks = 1  -- Default page_locks is turned off

DECLARE @CDC_TABLE NVARCHAR(500)  -- SKIP TABLES AUDIT BY CDC

set @DB_NAME = ''
while 1=1
begin 
	select @DB_NAME =MIN(dbname) from #temp where dbname>@dbname
    IF @DB_NAME IS NULL BREAK 

	SELECT @DB_ID = DB_ID(@DB_NAME)
	SELECT @Edition = LEFT(CONVERT(NVARCHAR(100), SERVERPROPERTY ('edition')),18)

	CREATE TABLE #BenchmarkIndexList (ID INT IDENTITY(1,1), 
	   DBName NVARCHAR(100), 
	   objectid INT,
	   indexid INT,
	   indextype NVARCHAR(30),
	   frag INT,
	   avg_frag_size_pages INT,
	   page_count INT,
	   partition_number INT,
	   starttime datetime,
	   endtime datetime,
	   command nvarchar(500))

	CREATE CLUSTERED INDEX IX_CL_IndexList ON #BenchmarkIndexList(ID)

	INSERT #BenchmarkIndexList (DBName, objectid, indexid, indextype, frag, 
					   avg_frag_size_pages, page_count, partition_number)
	SELECT DB_NAME(database_id) AS DBName, object_id, index_id, index_type_desc AS 'indextype',
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
	   SELECT  @objectid = objectid, @indexid = indexid, @partitionnum = partition_number, @frag = frag
	   FROM    #BenchmarkIndexList
	   WHERE   ID = @min

	   set @sql = 'SELECT  @objectname = o.name, @schemaname = s.name
				   FROM [' + @DB_NAME + '].sys.objects AS o JOIN ['
						   + @DB_NAME + ']. sys.schemas AS s ON s.schema_id = o.schema_id
				   WHERE   o.object_id = @objectid'

	   exec sp_executesql @sql, N'@objectname NVARCHAR(130) OUTPUT, @schemaname NVARCHAR(130) OUTPUT, @objectid NVARCHAR(130)',
							 @objectname OUTPUT, @schemaname OUTPUT, @objectid
	   
	   
	   set @sql = 'SELECT  @indexname = name, @indextype = TYPE, @Allow_pg_locks = allow_page_locks
				   FROM [' + @DB_NAME + '].sys.indexes
				   WHERE   object_id = @objectid AND 
						   index_id = @indexid'

	   exec sp_executesql @sql, N'@indexname NVARCHAR(130) OUTPUT, @indextype INT OUTPUT, @Allow_pg_locks INT OUTPUT, @objectid NVARCHAR(130), @indexid INT',
							 @indexname OUTPUT, @indextype OUTPUT,@Allow_pg_locks OUTPUT, @objectid, @indexid
							 

			   
	   set @sql = 'SELECT  @partitioncount = COUNT(1)
				   FROM [' +@DB_NAME + '].sys.partitions
				   WHERE object_id = @objectid AND 
						 index_id = @indexid'

	   exec sp_executesql @sql, N'@partitioncount bigint OUTPUT, @objectid NVARCHAR(130), @indexid INT',
							 @partitioncount OUTPUT, @objectid, @indexid
	       
	   set @sql = 'SELECT  @LobCount = COUNT(1)
				   FROM    [' + @DB_NAME+ '].sys.index_columns A INNER JOIN
						   [' + @DB_NAME+ '].sys.columns B ON A.object_id = B.object_id AND A.Column_id = B.Column_ID INNER JOIN
						   [' + @DB_NAME+ '].sys.types C ON B.system_type_id = C.user_type_id
				   WHERE   A.object_id = @objectid AND
						   A.index_id = @indexid AND 
						  (C.name IN(''xml'',''image'',''text'',''ntext'') OR
						  (C.name IN(''varchar'',''nvarchar'',''varbinary'',''nvarbinary'') AND 
						   B.max_length = -1))'

		exec sp_executesql @sql, N'@LobCount INT OUTPUT, @objectid NVARCHAR(130), @indexid INT',
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
	          
       select @CDC_TABLE = ''
       set @sql = 'IF Exists ( select 1 
                                 from [' + @DB_NAME+ '].sys.objects AS o JOIN
                                      [' + @DB_NAME+ '].sys.schemas AS s ON s.schema_id = o.schema_id
                                where o.name =''change_tables'' and o.type = ''U'' and s.name = ''cdc'')
                                select @CDC_TABLE = REPLACE(capture_instance,''_'',''.'') FROM [' + @DB_NAME+ '].cdc.change_tables 
                                 where REPLACE(capture_instance,''_'',''.'') = '''+@schemaname+'.'+@objectname +''''
    	
    	exec sp_executesql @sql, N'@CDC_TABLE NVARCHAR(500) OUTPUT, @schemaname NVARCHAR(130),@objectname NVARCHAR(130)', @CDC_TABLE OUTPUT,@schemaname, @objectname


	   IF @CDC_TABLE <> ''
	       SET @command = '-- SKIP CDC AUDITED TABLES ' + @command

	BEGIN TRY 
	   IF @partitioncount > 1
	   BEGIN
		   SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS NVARCHAR(10));
		
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

END

END
GO
