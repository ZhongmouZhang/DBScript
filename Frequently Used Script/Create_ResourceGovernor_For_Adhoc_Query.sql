use master
go

-- Create Adhoc pool and workload for SSMS connection
CREATE RESOURCE POOL poolAdhoc
WITH (MAX_CPU_PERCENT = 50, MAX_MEMORY_PERCENT = 50);
GO
CREATE WORKLOAD GROUP groupAdhoc
USING poolAdhoc;
GO
ALTER RESOURCE GOVERNOR RECONFIGURE;
GO

-- create adhoc classifier function
create function fn_adhoc_classifier()
returns sysname
with schemabinding
as 
begin
	declare @ret_string sysname
	if app_name() like '%Microsoft SQL Server Management Studio%'
		set @ret_string = 'groupAdhoc'
	else
		set @ret_string =  'default'
	return @ret_string
end
go

-- register the classifier function and update the in-memory configuration, enable resource governor

ALTER RESOURCE GOVERNOR with (CLASSIFIER_FUNCTION = dbo.fn_adhoc_classifier)
ALTER RESOURCE GOVERNOR RECONFIGURE
GO


-- Find out what sessions are in each group by using the following query.
SELECT s.group_id, CAST(g.name as nvarchar(20)), s.session_id, s.login_time, CAST(s.host_name as nvarchar(20)), CAST(s.program_name AS nvarchar(40))
          FROM sys.dm_exec_sessions s
     INNER JOIN sys.dm_resource_governor_workload_groups g
          ON g.group_id = s.group_id
where g.name = 'groupAdhoc'
ORDER BY g.name
GO