
--- query cluster node, quorum and status
SELECT  member_name, member_state_desc, number_of_quorum_votes  
 FROM   sys.dm_hadr_cluster_members;  



select case when SERVERPROPERTY('IsClustered')=1 then 'Y' else 'N' end 


-- the current node name on which the instance is running
SELECT SERVERPROPERTY('ComputerNamePhysicalNetBIOS') AS [CurrentNodeName] 


-- SQL Server Cluster Nodes
SELECT * FROM fn_virtualservernodes() 

SELECT * FROM sys.dm_os_cluster_nodes 

-- SQL Server Cluster Shared Drives

SELECT * FROM fn_servershareddrives()

SELECT * FROM sys.dm_io_cluster_shared_drives

----------------------------------------------------

SELECT 'IsClustered', SERVERPROPERTY('IsClustered')

SELECT SERVERPROPERTY ('IsHadrEnabled');

select * from sys.dm_hadr_availability_group_states

select * from sys.dm_hadr_availability_replica_cluster_nodes


-------------------------------------------------------------------------
select case when SERVERPROPERTY('IsClustered')=1 or SERVERPROPERTY ('IsHadrEnabled')= 1 then 'Y' else 'N' end IsAlwaysOn


update tbl_instance
set is_clustered = case when SERVERPROPERTY('IsClustered')=1 then 'Y' else 'N' end 
where id = 1
