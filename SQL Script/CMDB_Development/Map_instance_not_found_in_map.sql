
-- instances not found in map
select m.instance_name, i.* 
from tbl_sql_instance i full join
(
select distinct
	case when [SQL Server Instance Name] = 'MSSQLSERVER' then substring ([Computer Name], 1, charindex ('.', [Computer Name])-1)
		when [SQL Server Instance Name] != 'MSSQLSERVER' and [SQL Server Cluster Network Name] = '' then replace ([SQL Server Instance Name], 'MSSQL$', substring ([Computer Name], 1, charindex ('.', [Computer Name])-1) + '\')
		else replace ([SQL Server Instance Name], 'MSSQL$', [SQL Server Cluster Network Name] + '\')
	end instance_name
 from [dbo].[TEMP_InstanceByMap] 
) m on i.instance_name=m.instance_name
where i.is_deleted='N'
	and m.instance_name is null
	and i.connection_status_type = 0  -- Success
	and i.is_hadr_enabled = 'N'
	and charindex ('.',i.instance_name) = 0
 order by m.instance_name
