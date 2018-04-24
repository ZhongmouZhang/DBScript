
-- user, role, login
select  mp.name as [database user] ,sl.name as [Server Login],  rp.name as [database role]
from sys.database_role_members drm
join sys.database_principals rp on (drm.role_principal_id = rp.principal_id  )
join sys.database_principals mp on (drm.member_principal_id = mp.principal_id)
join sys.syslogins sl on sl.sid=mp.sid
where rp.principal_id>4 and mp.principal_id > 4
order by  mp.name

-- list object, user, permission
select sys.schemas.name 'Schema'
   , sys.objects.name Object
   , sys.database_principals.name username
   , sys.database_permissions.type permissions_type
   ,     sys.database_permissions.permission_name
   ,      sys.database_permissions.state permission_state
   ,     sys.database_permissions.state_desc
   ,     state_desc + ' ' + permission_name + ' on ['+ sys.schemas.name + '].[' + sys.objects.name + '] to [' + sys.database_principals.name + ']' COLLATE LATIN1_General_CI_AS 
from sys.database_permissions join sys.objects on sys.database_permissions.major_id =      sys.objects.object_id join sys.schemas on sys.objects.schema_id = sys.schemas.schema_id join sys.database_principals on sys.database_permissions.grantee_principal_id =      sys.database_principals.principal_id order by 1, 2, 3, 5

-- several common tables
select * from sys.database_principals

select * from sys.database_role_members 

select * from sys.database_permissions

select * from sys.syslogins 



/*********************************************************************

	List All the logins and Server Role

*******************************************************************/
select loginname as [Login Name]
, dbname as [Default Database]
, case isntname when 0 then 'SQL Login' else 'AD Login' end as [Login Type]
, case isntgroup when 1 then 'AD Group' else 
	case isntname when 0 then ' ' else 'AD User' end
  end as [AD Login Type]
, case sysadmin when 1 then 'Yes' else 'No' end as sysadmin
, case securityadmin when 1 then 'Yes' else 'No' end as securityadmin
, case serveradmin when 1 then 'Yes' else 'No' end as serveradmin
, case setupadmin when 1 then 'Yes' else 'No' end as setupadmin
, case processadmin when 1 then 'Yes' else 'No' end as processadmin
, case diskadmin when 1 then 'Yes' else 'No' end as diskadmin
, case dbcreator when 1 then 'Yes' else 'No' end as dbcreator
, case bulkadmin when 1 then 'Yes' else 'No' end as bulkadmin
from [sys].[syslogins]
order by loginname;





/******************************************************

		-- List all database, user, login and role

**********************************************************/
use [master]
go


if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
	drop table #temp

create table #temp
(
db_name varchar(256)
, db_user_name varchar(256)
, login_name varchar(256)
, role_name varchar(256)
)


DECLARE @dbname VARCHAR(50)   
DECLARE @statement NVARCHAR(max)

-- set @account = 'PHSABC\jzhang2'
-- set @role = 'db_owner'
DECLARE db_cursor CURSOR 
LOCAL FAST_FORWARD
FOR  
SELECT name
FROM sys.databases
WHERE name NOT IN ('master','model','msdb','tempdb','distribution')  and state = 0
order by name

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @dbname  
WHILE @@FETCH_STATUS = 0  
BEGIN  

SELECT @statement = 'use '+@dbname +';'+ 'insert into #temp select ''' + @dbname +''', mp.name as [database user] ,sl.name as [Server Login],  rp.name as [database role]
from sys.database_role_members drm
join sys.database_principals rp on (drm.role_principal_id = rp.principal_id  )
join sys.database_principals mp on (drm.member_principal_id = mp.principal_id)
join sys.syslogins sl on sl.sid=mp.sid
where rp.principal_id>4 and mp.principal_id > 4
order by  mp.name'

print @statement
print '------------------'
-- print ''
exec sp_executesql @statement

FETCH NEXT FROM db_cursor INTO @dbname  
END  
CLOSE db_cursor  
DEALLOCATE db_cursor 

select * from #temp