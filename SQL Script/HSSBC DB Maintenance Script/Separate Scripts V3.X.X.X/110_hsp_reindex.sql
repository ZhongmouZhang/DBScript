
/***********************************************************************

		Re-Index
		
**********************************************************************/

use master
go


if exists (select * from dbo.sysobjects where id = object_id(N'hsp_reindex') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_reindex
GO

CREATE         proc dbo.hsp_reindex
@SkipOfflineReindex int = 1,    -- if the offline re-index will be skipped
@FragThresholdForRebuild INT  = 30,        -- the threshold for rebuild an index
@FragThresholdForReorganize INT  = 10        -- the threshold for reorganize an index

as

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
DECLARE @IndexLobCount INT  --  LOB in the index
DECLARE @TableLobCount INT  -- LOB in the table
SELECT @IndexLobCount = 0, @TableLobCount = 0

DECLARE @Allow_pg_locks INT
SELECT @Allow_pg_locks = 1  -- Default page_locks is turned off

DECLARE @CDC_TABLE NVARCHAR(500)  -- SKIP TABLES AUDIT BY CDC

set nocount on

-- enable the extra log backup job during the re-index
DECLARE @jobId BINARY(16)
SELECT @jobId = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'DBA -- Log backup During Reindex'
exec msdb.dbo.sp_update_job @job_id = @jobId, @enabled = 1



set @DB_NAME = ''
while 1=1
begin 
	select @DB_NAME =MIN(dbname) from #temp where dbname>@DB_NAME
    IF @DB_NAME IS NULL BREAK 

	SELECT @DB_ID = DB_ID(@DB_NAME)
	SELECT @Edition = LEFT(CONVERT(NVARCHAR(100), SERVERPROPERTY ('edition')),18)

	if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#BenchmarkIndexList') and xtype='U')
	drop table #BenchmarkIndexList
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
		   avg_fragmentation_in_percent > @FragThresholdForReorganize AND
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
	       
	   set @sql = 'SELECT  @IndexLobCount = COUNT(1)
				   FROM    [' + @DB_NAME+ '].sys.index_columns A INNER JOIN
						   [' + @DB_NAME+ '].sys.columns B ON A.object_id = B.object_id AND A.Column_id = B.Column_ID INNER JOIN
						   [' + @DB_NAME+ '].sys.types C ON B.system_type_id = C.user_type_id
				   WHERE   A.object_id = @objectid AND
						   A.index_id = @indexid AND 
						  (C.name IN(''xml'',''image'',''text'',''ntext'') OR
						  (C.name IN(''varchar'',''nvarchar'',''varbinary'',''nvarbinary'') AND 
						   B.max_length = -1))'

		exec sp_executesql @sql, N'@IndexLobCount INT OUTPUT, @objectid NVARCHAR(130), @indexid INT',
							 @IndexLobCount OUTPUT, @objectid, @indexid
							 
	   set @sql = ' select  @TableLobCount = COUNT(1)
					from [' + @DB_NAME+ '].sys.columns c left join [' + @DB_NAME+ '].sys.types t on t.system_type_id = c.system_type_id
					where c.object_id = @objectid 
						and (t.name IN(''xml'',''image'',''text'',''ntext'') OR c.max_length = -1)'

		exec sp_executesql @sql, N'@TableLobCount INT OUTPUT, @objectid NVARCHAR(130)',
							 @TableLobCount OUTPUT, @objectid


--- Modified to account for rebuild partition (JT : 2012/05/07)
--print '-------------------------------------------------------------'
--print 'frag=' + convert(varchar(20),@frag)
	
		IF @frag < @FragThresholdForRebuild AND @Allow_pg_locks <> 0  
			-- Re-organize the index
		BEGIN
--print '(2)frag=' + convert(varchar(20),@frag)
		    set @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REORGANIZE';
			IF @partitioncount > 1
			BEGIN
				SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS NVARCHAR(10));
			END
		END
		ELSE IF (@frag >= @FragThresholdForRebuild OR @Allow_pg_locks = 0) AND @IndexLobCount = 0 AND @Edition = 'Enterprise Edition'
				and (@indexid <> 1 or @TableLobCount = 0) and @partitioncount=1
			 
			-- Re-build the index online
	    BEGIN
			set @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REBUILD'
			--IF @partitioncount > 1
			--BEGIN
				--SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS NVARCHAR(10));
			--END
			set @command = @command + ' WITH(ONLINE = ON, SORT_IN_TEMPDB = ON, MAXDOP=1)';
	    END
	    ELSE if @SkipOfflineReindex = 0
		BEGIN
		    set @command = 'ALTER INDEX [' + @indexname + '] ON [' + @DB_NAME + '].[' + @schemaname + '].[' + @objectname + '] REBUILD';
			IF @partitioncount > 1
			BEGIN
				SET @command = @command + ' PARTITION =' + CAST(@partitionnum AS NVARCHAR(10));
			END
			set @command = @command + ' WITH(SORT_IN_TEMPDB = ON)';
		END
		ELSE
			set @command = ''


       select @CDC_TABLE = ''
       set @sql = 'IF Exists ( select 1 
                                 from [' + @DB_NAME+ '].sys.objects AS o JOIN
                                      [' + @DB_NAME+ '].sys.schemas AS s ON s.schema_id = o.schema_id
                                where o.name =''change_tables'' and o.type = ''U'' and s.name = ''cdc'')
                                select @CDC_TABLE = REPLACE(capture_instance,''_'',''.'') FROM [' + @DB_NAME+ '].cdc.change_tables 
                                 where REPLACE(capture_instance,''_'',''.'') = '''+@schemaname+'.'+@objectname +''''
    	
    	exec sp_executesql @sql, N'@CDC_TABLE NVARCHAR(500) OUTPUT, @schemaname NVARCHAR(130),@objectname NVARCHAR(130)', @CDC_TABLE OUTPUT,@schemaname, @objectname


	   IF @CDC_TABLE <> ''
	       SET @command = ''

	BEGIN TRY 
	    UPDATE #BenchmarkIndexList set starttime=getdate(), command=@command
		WHERE   ID = @min
		
		-- execute a generated re-index command
		
		--if @command!='' EXEC (@command)

		print ''
		print '+++++++ re-index: ' + @command 
		print '        start time: ' + convert (varchar(30), getdate(),120)
		
		if @command!='' 
		begin
			print '               running....'
			EXEC (@command)
		end
		
		print '        end time: ' + convert (varchar(30), getdate(),120)

		


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
	

select rtrim(DBName), objectid,indexid,rtrim(indextype),frag , avg_frag_size_pages, page_count, partition_number, starttime, endtime, command
from #BenchmarkIndexList	

select rtrim(DBName),objectid,indexid,rtrim(indextype),frag , avg_frag_size_pages, page_count, partition_number, starttime, endtime, command
from #BenchmarkIndexList
where ltrim(command)=''

End

	
-- disable the extra log backup job during the re-index
SELECT @jobId = job_id FROM msdb.dbo.sysjobs_view WHERE name = N'DBA -- Log backup During Reindex'
exec msdb.dbo.sp_update_job @job_id = @jobId, @enabled = 0



GO


 