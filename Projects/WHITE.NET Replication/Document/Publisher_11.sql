------------------------------------------------------
-- 11. Publisher.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_publishing_name varchar(255)
declare @P_publishing_db_name varchar(255)
declare @P_subscriber_server_name varchar(255)
declare @P_subscription_db_name varchar(255)
declare @P_login_name varchar(255)
declare @P_login_password varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_publishing_name = 'publication_CC'
set @P_publishing_db_name = 'CALLCENTER_REPL'
set @P_subscriber_server_name = 'STVWHTDBSUB'
set @P_subscription_db_name = 'CC_SUB'
set @P_login_name = 'phsabc\abcdef'
set @P_login_password = '123456'
------------------------------------------------------

-- It adds a subscription to a publication and sets the Subscriber status. Also adds a new agent job used to synchronize a push subscription to a transactional publication
set @Str = 
'use ['+@P_publishing_db_name+']'+ CHAR(13)+
'exec sp_addsubscription @publication = '+char(39)+@P_publishing_name+char(39)+', '+CHAR(13)+
'@subscriber = '+char(39)+@P_subscriber_server_name+char(39)+', @destination_db = '+char(39)+@P_subscription_db_name+char(39)+', '+CHAR(13)+
'@subscription_type = '+char(39)+'Push'+char(39)+', @sync_type = '+char(39)+'automatic'+char(39)+', @article = '+char(39)+'all'+char(39)+', '+CHAR(13)+
'@update_mode = '+char(39)+'read only'+char(39)+', @subscriber_type = 0'+CHAR(13)+
'
exec sp_addpushsubscription_agent @publication = '+char(39)+@P_publishing_name+char(39)+', '+CHAR(13)+
'@subscriber = '+char(39)+@P_subscriber_server_name+char(39)+', @subscriber_db = '+char(39)+@P_subscription_db_name+char(39)+', '+char(13)+
'@job_login = '+char(39)+@P_login_name+char(39)+', @job_password = '+char(39)+@P_login_password+char(39)+', @subscriber_security_mode = 1,'+char(13)+
'@frequency_type = 64, @frequency_interval = 0, @frequency_relative_interval = 0,'+char(13)+ 
'@frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0,'+char(13)+ 
'@active_start_time_of_day = 0, @active_end_time_of_day = 235959,'+char(13)+ 
'@active_start_date = 20111007, @active_end_date = 99991231, @enabled_for_syncmgr = '+char(39)+'False'+char(39)+', '+char(13)+
'@dts_package_location = '+char(39)+'Distributor'+CHAR(39)+char(13)

exec(@Str)
GO


