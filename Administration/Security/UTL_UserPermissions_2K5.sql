 select dp.NAME AS principal_name,
   dp.type_desc AS principal_type_desc,
           o.NAME AS object_name,
           p.permission_name,
           p.state_desc AS permission_state_desc 
from    sys.database_permissions p
     left    OUTER JOIN sys.all_objects o
     on     p.major_id = o.OBJECT_ID
     inner   JOIN sys.database_principals dp
    on     p.grantee_principal_id = dp.principal_id

