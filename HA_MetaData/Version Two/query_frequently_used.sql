select * from dbo.tbl_database


select instance_name, database_name, size, database_id
from dbo.vw_current_database_size a join tbl_database b on a.database_id= b.id
	join tbl_instance c on b.instance_id=c.id
	
	



-- Get CPU count

SELECT cpu_count
FROM sys.dm_os_sys_info
GO
-- Identify Virtual Processors in for SQL Server 2000
CREATE TABLE #TempTable
([Index] VARCHAR(2000),
[Name] VARCHAR(2000),
[Internal_Value] VARCHAR(2000),
[Character_Value] VARCHAR(2000)) ;
INSERT INTO #TempTable
EXEC xp_msver;
SELECT Internal_Value AS VirtualCPUCount
FROM #TempTable
WHERE Name = 'ProcessorCount';
DROP TABLE #TempTable
GO

---  HA, Instance_name, database_name, size

select dbo.fn_HANameByFqn(fqn) HA, instance_name, b.database_name, c.size
from dbo.vw_all_connectable_instance a join tbl_database b on a.id = b.instance_id
		join dbo.vw_current_database_size c on b.id=c.database_id
order by dbo.fn_HANameByFqn(fqn), instance_name, database_name


---  Monthly Report 

select dbo.fn_HANameByFqn(fqn) HA
	, count(distinct instance_name) [# of SQL Servers]
	,count(b.database_name) [DB #]
	,convert (decimal(12,2),sum(c.size)/1024) [Total Size(GB)]
from dbo.vw_all_connectable_instance a join tbl_database b on a.id = b.instance_id
		join dbo.vw_current_database_size c on b.id=c.database_id
group by dbo.fn_HANameByFqn(fqn) with rollup
order by HA


select dbo.fn_HANameByIP(ip) HA, dbo.fn_SQLVersionName(product_version) SQL_Version, 
	count(distinct instance_name) [# of SQL Servers], 
	count(*) [# of DBs], 
	convert(decimal(12,2), sum(c.size)/1024) [Size of DBs(MB)]
from dbo.vw_all_connectable_instance a join tbl_database b on a.id = b.instance_id
		join dbo.vw_current_database_size c on b.id=c.database_id
group by dbo.fn_HANameByIP(ip), dbo.fn_SQLVersionName(product_version) with rollup
order by dbo.fn_HANameByIP(ip), dbo.fn_SQLVersionName(product_version)


select dbo.fn_HANameByFqn(fqn) HA, count(b.database_name) [DB #], sum(c.size) [Total Size(MB)]
from dbo.vw_all_connectable_instance a join tbl_database b on a.id = b.instance_id
		join dbo.vw_all_database_size c on b.id=c.database_id
group by dbo.fn_HANameByFqn(fqn) with rollup
order by HA

-- select the instance_id which has not been refreshed for 7 days.

select instance_name from vw_all_instance 
where id in (
select distinct instance_id
from tbl_database m 
where not exists (select * from tbl_database 
					where m.instance_id = tbl_database.instance_id 
						and id in (select database_id from dbo.vw_current_database_size))
)
order by instance_name






--- find the server name in register table
select b.name, a.* 
from msdb.dbo.sysmanagement_shared_registered_servers_internal a 
	join msdb.dbo.sysmanagement_shared_server_groups_internal b on a.server_group_id = b.server_group_id
where a.name like 'SPDBSVMGR001'



-- query tbl_instance_sa_account table

select dbo.fn_HANameByFqn(fqn), b.instance_name, a.account_name 
from dbo.tbl_instance_sa_account a join tbl_instance b on a.instance_id=b.id
where account_name not in ('sa','NT AUTHORITY\SYSTEM','HEALTHBC\Database Services Management (HSSBC) - (DE)')
	and not account_name like '%SR HSSBC SQL Admin (CrossHA)'
	and not account_name like '%SQLServer2005%'
	and not account_name like '%NT SERVICE%'
	and not account_name like '%NT AU%'
	and account_name <>'BUILTIN\Administrators'
	and account_name <>'phsabc\jzhang2'
	
order by dbo.fn_HANameByFqn(fqn), b.instance_name


-- instance not connectable 

select instance_name, connection_string,  b.*
from tbl_instance a join tbl_info_populating_status b on a.id=b.instance_id
where server_configuration_status = 'Starting' 
			or instance_info_status = 'Starting' 
			or database_info_status = 'Starting' 
			or connection_traker_status = 'Starting'
order by instance_name


-- show the progress of refreshing
select * from dbo.tbl_info_populating_status
where instance_id >= (select max (instance_id) from tbl_info_populating_status where database_info_update_date!='2000-01-01')
order by instance_id


-- select SQL Accounts on all the instances
select b.instance_name, a.*
from tbl_logins a join tbl_instance b on a.instance_id = b.id
where isntname = 0 and name !='sa' and not name like '##%' and hasaccess = 1


-
-- SQL Server version and windows version

select dbo.fn_HANameByFqn(fqn) HA
	, instance_name
	, dbo.fn_SQLVersionName( product_version) sql_version
	, (select dbo.fn_WindowsVersionName(character_value) from tbl_server_configuration where instance_id = i.id and index_id = 15) windows_version_name
	, (select character_value from tbl_server_configuration where instance_id = i.id and index_id = 15) windows_version_number
from  dbo.vw_all_connectable_instance i
order by HA, instance_name


