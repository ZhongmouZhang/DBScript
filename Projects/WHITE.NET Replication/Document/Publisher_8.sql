------------------------------------------------------
-- 8. Publisher_5.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_publishing_name varchar(255)
declare @P_publishing_db_name varchar(255)
declare @P_login_name varchar(255)
declare @P_login_password varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_publishing_name = 'publication_white_UAT'
set @P_publishing_db_name = 'whiteuat'
set @P_login_name = 'phsabc\whiteauto'
set @P_login_password = 'underpants'
------------------------------------------------------

-- it creates the Snapshot Agent for the specified publication and job on Distributer server
set @Str = 
'use [' + @P_publishing_db_name + ']' + CHAR(13)+
'exec sp_addpublication_snapshot @publication = '+char(39)+@P_publishing_name+ char(39)+', '+CHAR(13)+
'@frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, ' +CHAR(13)+
'@frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, '+CHAR(13)+
'@active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, '+CHAR(13)+
'@active_end_date = 0, @job_login = '+char(39)+@P_login_name+char(39)+', @job_password = '+char(39)+
@P_login_password+char(39)+', @publisher_security_mode = 1'+CHAR(13)

exec(@Str)
GO
