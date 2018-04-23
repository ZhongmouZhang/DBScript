
select a.instance_name
	--, a.sql_version
	, substring((select node_name + ',' from tbl_cluster_node where instance_name = a.instance_name for XML PATH('')), 1,
			len((select node_name + ',' from tbl_cluster_node where instance_name = a.instance_name for XML PATH('')))-1) nodes

	, stuff((select ',' + node_name  from tbl_cluster_node where instance_name = a.instance_name for XML PATH('')),1,1,'') nodes2

	, b.database_name
	, c.first_name
	, c.last_name
	, c.email
from tbl_instance a left join tbl_database b on a.id=b.instance_id
		left join [dbo].[tbl_contact] c on c.database_id = b.id
where instance_name in 
		(
			select distinct a.instance_name
			from vw_all_connectable_instance a join [tbl_cluster_node] b on a.instance_name=b.instance_name
			where (is_clustered = 'Y' or is_hadr_enabled = 'Y' )
				and dbo.fn_HANameByFqn (fqn) = 'FHA' 
				and a.instance_name in (select instance_name from [dbo].[tbl_cluster_node])
		)
	and b.database_name not in ('master','model','msdb','tempdb')
order by instance_name, database_name

