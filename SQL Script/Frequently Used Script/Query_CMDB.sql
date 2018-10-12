

------------------- Quere Shared Instance
select instance_name, product_version, substring(fqn, charindex('.',fqn)+1, len(fqn)) domain, used_for, ip, sql_version
from [dbo].[tbl_sql_instance]
where instance_type = 'Shared'
order by domain, product_version



----------------- Query All the SQL Version and Windows Versin  -----------------------------
select instance_name,server_name
	, substring(sql_version, 1,26) sql_version
	, sp
	, [dbo].[fn_latest_sp]([product_version]) latest_sp
	, case when sp=[dbo].[fn_latest_sp]([product_version]) then 'No' else 'Yes' end need_upgrade
	, [dbo].[fn_HANameByFqn](fqn) HA
	, instance_type
	, windows_version
--	, m.instance_id
from [dbo].[vw_all_connectable_instance] m left join [vw_instance_windows_version] n on m.instance_id = n.instance_id


