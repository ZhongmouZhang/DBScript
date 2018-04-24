-- =============================================
-- Script Template
-- =============================================

-- two contral management tables
SELECT  *  FROM [msdb].[dbo].[sysmanagement_shared_registered_servers_internal]
  
SELECT  *  FROM [msdb].dbo.sysmanagement_shared_server_groups_internal


-- servers which are in use but not connectable
select domain, instance_name, ip
from cmdb.dbo.tbl_instance_info
where sql_version is null and is_in_use ='Y' and is_connectable = 'Y' --and ip != '0.0.0.0'
order by ip, instance_name


-- check the unsuccessful refresh of Database Info

select * from cmdb.dbo.tbl_instance_info where info_update_status like 'Database_INfo'


-- total database size by instance
select Instance_name, SUM(size)/1024 as [Total(GB)]
from vw_current_db_info	
group by instance_name with rollup
order by SUM(size) desc



-- query the instance and database info
SELECT i.domain, i.instance_name, i.sql_version,  m.database_name, convert (decimal(9,5), m.size/1024) as "size (GB)"
FROM  dbo.tbl_db_info AS m INNER JOIN
               dbo.tbl_instance_info AS i ON m.instance_info_id = i.id
WHERE (m.id =
                   (SELECT MAX(id) AS Expr1
                    FROM   dbo.tbl_db_info AS s
                    WHERE (m.instance_info_id = instance_info_id) AND (m.database_name = database_name)))
       and m.database_name not in ('master','msdb','tempdb','model')
order by domain, i.instance_name, m.database_name


-- Instance is connectable but database info is not available
	select *
	from tbl_instance_info a left join tbl_db_info b on a.id = b.instance_info_id
	where sql_version is not null and b.database_name is null



-- get the domain section in FQN
select SUBSTRING (fqn, charindex ('.', fqn)+1, len (fqn) - charindex ('.', fqn)), COUNT(*)
from tbl_instance_info
group by SUBSTRING (fqn, charindex ('.', fqn)+1, len (fqn) - charindex ('.', fqn))
order by SUBSTRING (fqn, charindex ('.', fqn)+1, len (fqn) - charindex ('.', fqn))


-- find all the instances in which users have SA permission.
select * from dbo.view_user_with_sa
order by SUBSTRING (fqn, charindex('.', fqn), LEN(fqn)-charindex('.', fqn)), fqn


