------------------------------------------------------
-- Drop Articles.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------

DECLARE @str varchar(8000)
DECLARE @name VARCHAR(256) 
declare @publication_name varchar(256)

set @publication_name = 'publication_white_FHA'

DECLARE db_cursor CURSOR FOR  
SELECT name
FROM sys.tables
WHERE is_replicated = 1
union all
SELECT name
FROM sys.procedures
WHERE is_schema_published = 1
union all
SELECT name
from sys.views
WHERE is_schema_published = 1
union all
select name
from sys.all_objects
where type in ('IF','TF','FN') and is_schema_published = 1

OPEN db_cursor   
FETCH NEXT FROM db_cursor INTO @name   

WHILE @@FETCH_STATUS = 0   
BEGIN   
    SET @str = 'EXEC sp_droparticle @publication = '+@publication_name+',@article = '+@name+',@force_invalidate_snapshot = 1'
	exec(@str)

       FETCH NEXT FROM db_cursor INTO @name   
END   

CLOSE db_cursor   
DEALLOCATE db_cursor
