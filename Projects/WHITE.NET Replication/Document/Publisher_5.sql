------------------------------------------------------
-- 5. Publisher.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_publishing_db_name varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_publishing_db_name = 'whiteuat'
------------------------------------------------------

-- it will set up replication options of publishing db
set @Str = 
'use [' + @P_publishing_db_name + ']' + CHAR(13)+
'exec sp_replicationdboption @dbname = '+CHAR(39)+@P_publishing_db_name+CHAR(39)+', @optname = '+char(39)+'publish'+CHAR(39)+
', @value = '+char(39)+'true'+CHAR(39)+CHAR(13)

exec(@Str)
GO

