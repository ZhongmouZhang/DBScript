-- =============================================
-- Script Template
-- =============================================
select is_clustered, COUNT(*) 
from dbo.vw_all_connectable_instance
group by is_clustered with rollup

select COUNT (*) from dbo.vw_current_user_db_info


select top 10 * from dbo.vw_current_db_info


-- 
select product_version, COUNT(*) 
from dbo.vw_all_connectable_instance
group by  product_version  with rollup
order by product_version

-- instance number by version and clustered or not
select case when product_version like '8.%' then 'SQL Server 2000'
			when product_version like '9.%' then 'SQL Server 2005'
			when product_version like '10.0.%' then 'SQL Server 2008'
			when product_version like '10.50.%' then 'SQL Server 2008R2'
			when product_version like '11.%' then 'SQL Server 2012'
		end SQLServer, is_clustered, COUNT(*)
from dbo.vw_all_connectable_instance
group by case when product_version like '8.%' then 'SQL Server 2000'
			when product_version like '9.%' then 'SQL Server 2005'
			when product_version like '10.0.%' then 'SQL Server 2008'
			when product_version like '10.50.%' then 'SQL Server 2008R2'
			when product_version like '11.%' then 'SQL Server 2012'
		end , is_clustered
order by SQLServer,is_clustered



-- database size by Version

select case when product_version like '8.%' then 'SQL Server 2000'
			when product_version like '9.%' then 'SQL Server 2005'
			when product_version like '10.0.%' then 'SQL Server 2008'
			when product_version like '10.50.%' then 'SQL Server 2008R2'
			when product_version like '11.%' then 'SQL Server 2012'
		end SQLServer, convert(int,SUM(m.size))
from dbo.vw_all_connectable_instance a join tbl_db_info m on a.id = m.instance_info_id
where (m.id =      (SELECT MAX(id) AS Expr1
                    FROM   dbo.tbl_db_info AS s
                    WHERE (m.instance_info_id = instance_info_id) AND (m.database_name = database_name)))
group by case when product_version like '8.%' then 'SQL Server 2000'
			when product_version like '9.%' then 'SQL Server 2005'
			when product_version like '10.0.%' then 'SQL Server 2008'
			when product_version like '10.50.%' then 'SQL Server 2008R2'
			when product_version like '11.%' then 'SQL Server 2012'
		end 
order by SQLServer




--- databsae size by HA
select dbo.fn_HANameByIP(ip) HA, convert(int,SUM(m.size))
from dbo.vw_all_connectable_instance a join tbl_db_info m on a.id = m.instance_info_id
where (m.id =      (SELECT MAX(id) AS Expr1
                    FROM   dbo.tbl_db_info AS s
                    WHERE (m.instance_info_id = instance_info_id) AND (m.database_name = database_name)))
group by dbo.fn_HANameByIP(ip)


-- group by HA and SQL Version
select dbo.fn_HANameByFqn(fqn) HA, 
		case when product_version like '8.%' then 'SQL Server 2000'
			when product_version like '9.%' then 'SQL Server 2005'
			when product_version like '10.0.%' then 'SQL Server 2008'
			when product_version like '10.50.%' then 'SQL Server 2008R2'
			when product_version like '11.%' then 'SQL Server 2012'
		end Version, 
		count(distinct instance_name) [ Server Total] , 
		COUNT(*) [DB Total],
		convert(int,SUM(m.size)) as [Size(MB)]
from dbo.vw_all_connectable_instance a join tbl_db_info m on a.id = m.instance_info_id
where (m.id =      (SELECT MAX(id) AS Expr1
                    FROM   dbo.tbl_db_info AS s
                    WHERE (m.instance_info_id = instance_info_id) AND (m.database_name = database_name)))
group by dbo.fn_HANameByFqn(fqn), case when product_version like '8.%' then 'SQL Server 2000'
			when product_version like '9.%' then 'SQL Server 2005'
			when product_version like '10.0.%' then 'SQL Server 2008'
			when product_version like '10.50.%' then 'SQL Server 2008R2'
			when product_version like '11.%' then 'SQL Server 2012'
		end --with rollup
order by HA, Version


-- for the Server Summary Report
select (select SUM(ServerTotal) from vw_instance_db_total_by_ha_version) TotalCountOfServers,
		(select SUM(DBTotal) from vw_instance_db_total_by_ha_version) TotalCountOfDatabases,
		(select SUM(serverTotal) from vw_instance_db_total_by_ha_version where is_clustered='Y') TotalCountofCluster,
		(select SUM(DBSize) from vw_instance_db_total_by_ha_version) TotalCountOfDataSize


select a.SQLVersion, 
		(select SUM(servertotal) from vw_instance_db_total_by_ha_version where SQLVersion = a.SQLVersion) VersionTotal,
		(select SUM(servertotal) from vw_instance_db_total_by_ha_version where SQLVersion = a.SQLVersion and is_clustered='Y') ClusterTotal,
		(select SUM(servertotal) from vw_instance_db_total_by_ha_version where SQLVersion = a.SQLVersion  and is_clustered='N') NonClusterTotal,
		(select SUM(DBSize) from vw_instance_db_total_by_ha_version where SQLVersion = a.SQLVersion) DBSizeTotal
from (select distinct SQLVersion from vw_instance_db_total_by_ha_version) a

select HA, SUM(DBSize) TotalDBSize, SUM(ServerTotal) TotalServer
from vw_instance_db_total_by_ha_version
group by HA
order by HA