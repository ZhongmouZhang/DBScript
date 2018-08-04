------------------------------------------------------
-- 1. Distributor_1.sql
--    This script has to run on "Distributor" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_distributer_server_name varchar(255)
declare @P_distributer_password varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_distributer_server_name = '91887OHSAH\SQL2008'
set @P_distributer_password = 'Sql2008!_123'
------------------------------------------------------

-- it will mark server as Distributor.
use master
exec sp_adddistributor @distributor = @P_distributer_server_name, @password = @P_distributer_password
go



--EXEC sp_dropdistributor @no_checks = 1, @ignore_distributor = 1
--GO
