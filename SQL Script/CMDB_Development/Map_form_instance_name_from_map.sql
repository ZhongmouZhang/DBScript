-- form the instance name
-- three cases: Default instance; Standalone Server with named instance; cluster with named instance

select 
	case when [SQL Server Instance Name] = 'MSSQLSERVER' then substring ([Computer Name], 1, charindex ('.', [Computer Name])-1) 
		when [SQL Server Instance Name] != 'MSSQLSERVER' and [SQL Server Cluster Network Name] = '' then replace ([SQL Server Instance Name], 'MSSQL$', substring ([Computer Name], 1, charindex ('.', [Computer Name])-1) + '\')
		else replace ([SQL Server Instance Name], 'MSSQL$', [SQL Server Cluster Network Name] + '\')
	end Instance_name
	, *
 from [dbo].[TEMP_InstanceByMap] 
where [SQL Server Instance Name] != 'MSSQLSERVER' 
	and [SQL Server Cluster Network Name] !=''

-- distinct instances

select distinct
	case when [SQL Server Instance Name] = 'MSSQLSERVER' then substring ([Computer Name], 1, charindex ('.', [Computer Name])-1)
		when [SQL Server Instance Name] != 'MSSQLSERVER' and [SQL Server Cluster Network Name] = '' then replace ([SQL Server Instance Name], 'MSSQL$', substring ([Computer Name], 1, charindex ('.', [Computer Name])-1) + '\')
		else replace ([SQL Server Instance Name], 'MSSQL$', [SQL Server Cluster Network Name] + '\')
	end Instance_name
 from [dbo].[TEMP_InstanceByMap] 
 order by Instance_name

 