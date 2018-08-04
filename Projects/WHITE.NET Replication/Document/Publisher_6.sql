------------------------------------------------------
-- 6. Publisher.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_publishing_db_name varchar(255)
declare @P_security_mode int
declare @P_login_name varchar(255)
declare @P_login_password varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_publishing_db_name = 'whiteuat'
set @P_login_name = 'phsabc\whiteauto'
set @P_login_password = 'underpants'
------------------------------------------------------

-- It adds a Log Reader agent for a publishing db which creates a job on Distributer server.
set @Str = 
'use [' + @P_publishing_db_name + ']' + CHAR(13)+
'exec ['+@P_publishing_db_name+'].sys.sp_addlogreader_agent @job_login = '+CHAR(39)+@P_login_name+CHAR(39)+', @job_password = '+char(39)+@P_login_password+CHAR(39)+
', @publisher_security_mode = 1, @job_name = null'+CHAR(13)


exec(@Str)
GO
