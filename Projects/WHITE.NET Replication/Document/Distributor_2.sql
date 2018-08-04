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
set @P_distribution_db_name = 'white_distribution_UAT'
set @P_distribution_db_data_folder = 'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data'
set @P_distribution_db_log_folder = 'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data'
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
