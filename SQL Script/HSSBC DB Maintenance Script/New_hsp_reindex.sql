 USE [master]
GO

/****** Object:  StoredProcedure [dbo].[hsp_reindex]    Script Date: 05/07/2012 16:21:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[hsp_reindex]
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
DECLARE @com_part NVARCHAR(15)
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

--
--  For switch recovery model purpose
--
declare @db_recovery_model varchar(20)
declare @stt varchar(3000)
declare @accumulated_page_count int  -- stored how many page has been re-index after last log backup
--
--
--
set @DB_NAME = ''
while 1=1
begin 
	select @DB_NAME =MIN(dbname) from #temp where dbname>@DB_NAME
    IF @DB_NAME IS NULL BREAK 
    
    --
	-- test if db needs to switch recovery model. if yes, switch it to simple model, Added by James
	--
	set @db_recovery_model = convert(varchar(20),DATABASEPROPERTYEX(@DB_NAME, 'Recovery'))
	set @accumulated_page_count = 0
	if exists (select * from tbl_maint_setting 
				where parameter_name = '#switch_to_simple_recovery_model_when_reindexing' and parameter_value = 'Y' and (database_name='default' or database_name = @DB_NAME))
		and  @db_recovery_model IN ('FULL','BULK_LOGGED')
	begin
		exec master.dbo.hsp_log_backup_database_with_dbname @DB_NAME
		set @stt = 'ALTER DATABASE ' + @DB_NAME + ' SET RECOVERY simple'
		exec ( @stt)
	end
	--
	--
	--	


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
		   avg_fragmentation_in_percent > 10 AND
		   index_type_desc NOT LIKE '%XML%'
	       
	SELECT @IndexListCount = COUNT(1) FROM #BenchmarkIndexList

	SELECT @max = (SELECT MAX(ID) FROM #BenchmarkIndexList)
	SELECT @min = 1

	WHILE @min <= @max
	BEGIN
	   SELECT  @objectid = objectid, @indexid = indexid, @partitionnum = partition_number, @frag = frag,
				@accumulated_page_count = @accumulated_page_count + page_count  
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

--- Modified to account for rebuild partition (JT : 2012/05/07)
	
		IF @frag < @FragThreshold AND @Allow_pg_locks <> 0
		BEGIN
		    set @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REORGANIZE';
			IF @partitioncount > 1
			BEGIN
				SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS NVARCHAR(10));
			END
		END

	   IF (@frag >= @FragThreshold OR @Allow_pg_locks = 0) AND @indextype <> 1 AND @LobCount = 0 AND @Edition = 'Enterprise Edition'
	   BEGIN
			set @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REBUILD WITH(ONLINE = ON, SORT_IN_TEMPDB = ON)';
	   END

	   set @com_part = 'ONLINE = OFF, ';
	   IF @frag >= @FragThreshold AND @DoOfflineToo = 1 AND (@indextype = 1 OR @LobCount <> 0 OR @Edition <> 'Enterprise Edition')
	   BEGIN
		    set @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REBUILD';
			IF @partitioncount > 1
			BEGIN
				SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS NVARCHAR(10));
				SET @com_part = '';
			END
			set @command = @command + ' WITH(' + @com_part + 'SORT_IN_TEMPDB = ON)';
	   END

	   set @com_part = 'ONLINE = OFF, ';	   
	   IF @ForceReindex = 1
	   BEGIN
		    set @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REBUILD';
			IF @partitioncount > 1
			BEGIN
				SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS NVARCHAR(10));
				SET @com_part = '';
			END
			set @command = @command + ' WITH(' + @com_part + 'SORT_IN_TEMPDB = ON)';
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
	    UPDATE #BenchmarkIndexList set starttime=getdate(), command=@command
		WHERE   ID = @min
		
		-- execute a generated re-index command
		--EXEC (@command)
		print @command
		
		--
		-- do log backup if @accumulated_page_count>128000 (1GB) and @db_recovery_model IN ('FULL','BULK_LOGGED')
		--
		if @accumulated_page_count>128000 and  @db_recovery_model IN ('FULL','BULK_LOGGED')
		begin
			--exec master.dbo.hsp_log_backup_database_with_dbname @DB_NAME
			print '@accumulated_page_countconvert=' + (varchar(20), @accumulated_page_count)
			set @accumulated_page_count = 0
		end
		--
		--
		--


		UPDATE #BenchmarkIndexList set endtime= getdate()
		WHERE   ID = @min
	END TRY
	BEGIN CATCH
		  DECLARE @ErrorMessage NVARCHAR(4000)
		  DECLARE @ErrorSeverity INT
		  DECLARE @ErrorState INT
	      
				SELECT @ErrorMessage = ERROR_MESSAGE(),
					   @ErrorSeverity = ERROR_SEVERITY(),         
						 @ErrorState = ERROR_STATE()  l    
	                     
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

	--
	-- test if there is a recovery model switching. if yes, switch it back to the original model
	--
	if exists (select * from tbl_maint_setting 
				where parameter_name = '#switch_to_simple_recovery_model_when_reindexing' and parameter_value = 'Y' and (database_name='default' or database_name = @DB_NAME))
		and  @db_recovery_model IN ('FULL','BULK_LOGGED')
	begin
		exec hsp_delete_latest_full_backup_with_dbname @DB_NAME
		set @stt = 'ALTER DATABASE ' + @DB_NAME + ' SET RECOVERY ' + @db_recovery_model
		exec ( @stt)
	end
END

END

GO


