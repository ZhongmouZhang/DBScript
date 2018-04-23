 use master;

-- log backup before switching recovery mode to simple
exec master.dbo.hsp_LogSwitchAndLogBackup_Only
alter database WolfTables set RECOVERY SIMPLE

use wolftables;
exec dbo.SP_Reindex_Online;

use master;
alter database WolfTables set RECOVERY full;

-- full backup after switch recovery to FULL
declare @dest varchar(1000)
select @dest='E:\MSSQL\BACKUP\WolfTables'  + '_Full_'
	+convert(varchar,getdate(),112)+'_' 
	+ 
	case when datepart(hour,getdate())>9 then convert(varchar,datepart(hour,getdate()))
		 else '0' + convert(varchar,datepart(hour,getdate()))
	end
	+
	case when datepart(minute,getdate())>9 then  convert(varchar,datepart(minute,getdate()))
		 else '0' + convert(varchar,datepart(hour,getdate()))
	end
	+ '00'
	+'.bak'
backup database WolfTables to Disk=@dest with init,STATS 



---------------------------------------------------------------------------------------------

create procedure SP_Reindex_Online
as

SET NOCOUNT ON;
DECLARE @objectid int;
DECLARE @indexid int;
DECLARE @partitioncount bigint;
DECLARE @schemaname sysname;
DECLARE @objectname sysname;
DECLARE @indexname sysname;
DECLARE @partitionnum bigint;
DECLARE @partitions bigint;
DECLARE @frag float;
DECLARE @command varchar(8000);
-- ensure the temporary table does not exist
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'work_to_do')
    DROP TABLE work_to_do;
-- conditionally select from the function, converting object and index IDs to names.
SELECT
    object_id AS objectid,
    index_id AS indexid,
    partition_number AS partitionnum,
    avg_fragmentation_in_percent AS frag
INTO work_to_do
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL , NULL, 'LIMITED')
WHERE avg_fragmentation_in_percent > 20.0 AND index_id > 0;
-- Declare the cursor for the list of partitions to be processed.
DECLARE partitions CURSOR FOR SELECT * FROM work_to_do;

-- Open the cursor.
OPEN partitions;

-- Loop through the partitions.
FETCH NEXT
   FROM partitions
   INTO @objectid, @indexid, @partitionnum, @frag;

WHILE @@FETCH_STATUS = 0
    BEGIN;
        SELECT @objectname = o.name, @schemaname = s.name
        FROM sys.objects AS o
        JOIN sys.schemas as s ON s.schema_id = o.schema_id
        WHERE o.object_id = @objectid;

        SELECT @indexname = name 
        FROM sys.indexes
        WHERE  object_id = @objectid AND index_id = @indexid;

        SELECT @partitioncount = count (*) 
        FROM sys.partitions
        WHERE object_id = @objectid AND index_id = @indexid;

-- 30 is an arbitrary decision point at which to switch between reorganizing and rebuilding
IF @frag < 30.0
    BEGIN;
    SELECT @command = 'ALTER INDEX [' + @indexname + '] ON ' + @schemaname + '.' + @objectname + ' REORGANIZE';
    IF @partitioncount > 1
        SELECT @command = @command + ' PARTITION=' + CONVERT (CHAR, @partitionnum);
    EXEC (@command);
    END;

IF @frag >= 30.0
    BEGIN;
    SELECT @command = 'ALTER INDEX [' + @indexname +'] ON ' + @schemaname + '.' + @objectname + ' REBUILD WITH (ONLINE=ON)';
    IF @partitioncount > 1
        SELECT @command = @command + ' PARTITION=' + CONVERT (CHAR, @partitionnum);
    EXEC (@command);
    END;
PRINT '    ' + @command;

FETCH NEXT FROM partitions INTO @objectid, @indexid, @partitionnum, @frag;
END;
-- Close and deallocate the cursor.
CLOSE partitions;
DEALLOCATE partitions;

-- drop the temporary table
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'work_to_do')
    DROP TABLE work_to_do;
GO
