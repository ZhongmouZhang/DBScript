------------------------------------------------------
-- 9. Subscriber_1.sql
--    This script has to run on "Subscription" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_newdb varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_newdb = 'White_rep_UAT'
------------------------------------------------------

-- it will create Subscription db on Subscription server.
set @Str =
'create database ' + @P_newdb

exec(@Str)

--drop database White_rep_UAT