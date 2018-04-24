 ------------------------------------------------------
-- 2. Distributor_1.sql
--    This script has to run on "Distributor" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_distribution_db_name varchar(255)
declare @P_distribution_db_data_folder varchar(255)
declare @P_distribution_db_log_folder varchar(255)
declare @P_security_mode int

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_distribution_db_name = 'distribution_CC_PROD_FHA'
set @P_distribution_db_data_folder = 'H:\SQL_Data'
set @P_distribution_db_log_folder = 'I:\SQL_Log'
set @P_security_mode = 1
------------------------------------------------------

-- it will create distribution db. Each publisher should have it's own distribution db.
use master

exec sp_adddistributiondb @database = @P_distribution_db_name, 
@data_folder = @P_distribution_db_data_folder, 
@log_folder = @P_distribution_db_log_folder, 
@log_file_size = 2, @min_distretention = 0, @max_distretention = 72, 
@history_retention = 48, @security_mode = @P_security_mode
go


------------------------------------------------------
-- 3. Distributor_3.sql
--    This script has to run on "Distributor" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_distributer_server_name varchar(255)
declare @P_distributer_password varchar(255)
declare @P_distribution_db_name varchar(255)
declare @P_publisher_server_name varchar(255)
declare @P_security_mode int
declare @P_distributor_working_folder varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_distributer_server_name = 'SPWHTDBDIST'
set @P_distributer_password = '51@&maj7IwXF$xD87^o4' -- this password has to be the same as in 1_Distributor.sql
set @P_distribution_db_name = 'distribution_CC_PROD_FHA'
set @P_security_mode = 1
set @P_publisher_server_name = 'SPDB0011'
set @P_distributor_working_folder = 'H:\SQLSnapshot_CallCenter\FHA'
------------------------------------------------------

-- it will set up distribution db and add publisher for this distribution
set @Str = 
'use '+ @P_distribution_db_name + CHAR(13)+ 
'if (not exists (select * from sysobjects where name = ' + CHAR(39) + 
'UIProperties' + CHAR(39) + ' and type = ' + char(39) + 'U ' + char(39)+'))' + CHAR(13) + 
'  create table UIProperties(id int)' + CHAR(13) + 
'if (exists (select * from ::fn_listextendedproperty(' + char(39) + 
'SnapshotFolder' + CHAR(39) + ', ' + char(39) + 'user' +char(39) + 
', ' + char(39) + 'dbo' + char(39) + ', ' + char(39) + 'table' + CHAR(39) +', ' + char(39) + 'UIProperties' 
+ CHAR(39) + ', null, null))) ' + CHAR(13) +
'  EXEC sp_updateextendedproperty ' + char(39) + 'SnapshotFolder' + CHAR(39) + 
', ' + char(39) + @P_distributor_working_folder + char(39) + ', ' + char(39) + 'user' + char(39) +
', dbo, ' + char(39) + 'table' +char(39) + ', ' + char(39) + 'UIProperties' + char(39) + char(13) +
'else ' + char(13) +
'  EXEC sp_addextendedproperty ' + char(39) + 'SnapshotFolder' + char(39) + 
', ' + char(39) + @P_distributor_working_folder + char(39) +',' + char(39) + 'user' + char(39) +
', dbo, ' + char(39) + 'table' + char(39) + ',' + char(39) + 'UIProperties' + char(39) + char(13) +
'exec sp_adddistpublisher @publisher = ' + char(39) + @P_publisher_server_name + CHAR(39) +
', @distribution_db = ' + char(39) + @P_distribution_db_name + char(39) +',' + CHAR(13) +
'@security_mode =  1,' + CHAR(13) +
'@working_directory = ' + char(39) + @P_distributor_working_folder + char(39) +',' + CHAR(13) +
'@trusted = ' + char(39) + 'false' + CHAR(39) +', @thirdparty_flag = 0, @publisher_type = ' + char(39) + 'MSSQLSERVER' + CHAR(39) 

exec(@Str)
GO