------------------------------------------------------
-- Drop Articles.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------

DECLARE @str varchar(8000)
DECLARE @name VARCHAR(256) 
declare @publication_name varchar(256)

/*******************************************************
set @publication_name = 'publication_white_FHA'

use White3P_TEST -- VCHSQLDBP02
set @publication_name = 'publication_white_PHC_UAT'

use White3V -- VCHSQLDBP02
set @publication_name = 'publication_white_VCH'

use white3
set @publication_name = 'publication_white_FHA_UAT'

use white3  -- ATHENA\INST4
set @publication_name = 'publication_white_FHA'


use white3  -- ZVMSQ2K8R2
set @publication_name = 'publication_white_PHSA_UAT'



use VCH_White3; -- SDDBSWHT003
set @publication_name = 'publication_white_VCH_UAT'


use PHC_White3; -- SDDBSWHT003
set @publication_name = 'publication_white_PHC_UAT'


use BCEHS_White3; -- SDDBSWHT003
set @publication_name = 'publication_white_BCEHS_UAT'


*******************************************************/

use BCEHS_White3; -- SDDBSWHT003
set @publication_name = 'publication_white_BCEHS_UAT'



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
