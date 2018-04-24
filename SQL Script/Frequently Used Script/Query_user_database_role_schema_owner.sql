-- Query to get the user associated Database Role
select DBPrincipal_2.name as role, DBPrincipal_1.name as owner 
from sys.database_principals as DBPrincipal_1 inner join sys.database_principals as DBPrincipal_2 
on DBPrincipal_1.principal_id = DBPrincipal_2.owning_principal_id 
where DBPrincipal_1.name = 'SQLDEVSTGLNKSRV'


-- Query to get the user associated schema
select * from information_schema.schemata
where schema_owner = 'SQLDEVSTGLNKSRV'

