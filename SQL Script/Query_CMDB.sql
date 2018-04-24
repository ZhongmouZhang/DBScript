-- query the duplicated instance 

SELECT id, server_Name, instance_name, connection_string, fqn, created_date, is_deleted, connection_status_desc
from CMDB_V3.dbo.tbl_instance m
WHERE is_deleted = 'N' 
and server_Name 
IN(
select server_Name
from CMDB_V3.dbo.tbl_instance
WHERE is_deleted = 'N' and instance_name not like '%AG%'
group by server_Name
HAVING COUNT(*) > 1
) 
and id < (select max(id) from CMDB_V3.dbo.tbl_instance where server_name = m.server_name)
ORDER BY server_Name, created_date 
