 ------------------------------------------------------
-- 4. Publisher.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------
declare @P_distributer_server_name varchar(255)
declare @P_distributer_password varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_distributer_server_name = 'SPWHTDBDIST'
set @P_distributer_password = '51@&maj7IwXF$xD87^o4' -- this password has to be the same as in 1_Distributor.sql
------------------------------------------------------

-- it will register remote distributer with already existing password
use master
exec sp_adddistributor @distributor = @P_distributer_server_name, @password = @P_distributer_password
GO