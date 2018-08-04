------------------------------------------------------
-- 7 Publisher.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_publishing_name varchar(255)
declare @P_publishing_db_name varchar(255)
declare @P_publisher_server_name varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_publishing_name = 'publication_white_UAT'
set @P_publishing_db_name = 'whiteuat'
set @P_publisher_server_name = 'PHSAWMODEV03\SQL2008'
------------------------------------------------------

-- Adding the transactional publication
set @Str = 
'use [' + @P_publishing_db_name + ']' + CHAR(13)+
'exec sp_addpublication @publication = '+char(39)+@P_publishing_name+CHAR(39)+', '+CHAR(13)+
'@description = '+char(39)+'Transactional publication of database '+char(39)+char(39)+@P_publishing_db_name+char(39)+char(39)+
' from Publisher '+char(39)+char(39)+@P_publisher_server_name +char(39)+char(39)+'.'+CHAR(39)+', '+CHAR(13)+
'@sync_method = '+char(39)+'concurrent'+CHAR(39)+', @retention = 0, @allow_push = '+char(39)+'true'+CHAR(39)+
', @allow_pull = '+char(39)+'true'+CHAR(39)+', '+CHAR(13)+
'@allow_anonymous = '+char(39)+'true'+CHAR(39)+', @enabled_for_internet = '+char(39)+'false'+CHAR(39)+
', @snapshot_in_defaultfolder = '+char(39)+'true'+CHAR(39)+', '+CHAR(13)+
'@compress_snapshot = '+char(39)+'false'+CHAR(39)+', @ftp_port = 21, @ftp_login = '+char(39)+'anonymous'+CHAR(39)+
', @allow_subscription_copy = '+char(39)+'false'+CHAR(39)+', '+CHAR(13)+
'@add_to_active_directory = '+char(39)+'false'+CHAR(39)+', @repl_freq = '+char(39)+'continuous'+CHAR(39)+
', @status = '+char(39)+'active'+CHAR(39)+', @independent_agent = '+char(39)+'true'+CHAR(39)+', '+CHAR(13)+
'@immediate_sync = '+char(39)+'true'+CHAR(39)+', @allow_sync_tran = '+char(39)+'false'+CHAR(39)+
', @autogen_sync_procs = '+char(39)+'false'+CHAR(39)+', @allow_queued_tran = '+char(39)+'false'+CHAR(39)+', '+CHAR(13)+
'@allow_dts = '+char(39)+'false'+CHAR(39)+', @replicate_ddl = 1, @allow_initialize_from_backup = '+char(39)+
'false'+CHAR(39)+', @enabled_for_p2p = '+char(39)+'false'+CHAR(39)+', '+CHAR(13)+
'@enabled_for_het_sub = '+char(39)+'false'+CHAR(39)

exec(@Str)
GO


-- sp_droppublication publication_white_UAT
