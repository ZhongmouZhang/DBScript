

The following system functions can be used for classification: 
	HOST_NAME(), APP_NAME(), SUSER_NAME(), SUSER_SNAME(), IS_SRVROLEMEMBER(), and IS_MEMBER().

go

create function fn_App_classifier()
returns sysname
with schemabinding
as 
begin
	declare @ret_string sysname
	if app_name() like '%Microsoft SQL Server Management Studio%'
		set @ret_string = 'AdhocGroup'
	else
		set @ret_string =  'default'
	return @ret_string
end

go

-- register the classifier function and update the in-memory configuration, enable resource governor

ALTER RESOURCE GOVERNOR with (CLASSIFIER_FUNCTION = dbo.fn_App_classifier)
ALTER RESOURCE GOVERNOR RECONFIGURE
GO

-- disable the classifier function
ALTER RESOURCE GOVERNOR WITH (CLASSIFIER_FUNCTION = NULL)
GO
ALTER RESOURCE GOVERNOR DISABLE
GO

/*************************************
		aboutn Classifier Function
		
***************************************/

--- Get the classifier function Id and state (enabled).
SELECT * FROM sys.resource_governor_configuration
GO
--- Get the classifer function name and the name of the schema
--- that it is bound to.
SELECT 
      object_schema_name(classifier_function_id) AS [schema_name],
      object_name(classifier_function_id) AS [function_name]
FROM sys.dm_resource_governor_configuration



-- Obtain the current runtime data for the resource pools and workload groups by using the following query.
SELECT * FROM sys.dm_resource_governor_resource_pools
SELECT * FROM sys.dm_resource_governor_workload_groups
GO

-- Find out what sessions are in each group by using the following query.
SELECT s.group_id, CAST(g.name as nvarchar(20)), s.session_id, s.login_time, CAST(s.host_name as nvarchar(20)), CAST(s.program_name AS nvarchar(40))
          FROM sys.dm_exec_sessions s
     INNER JOIN sys.dm_resource_governor_workload_groups g
          ON g.group_id = s.group_id
where g.name = 'groupAdhoc'
ORDER BY g.name
GO


-- Find out which requests are in each group by using the following query. Running Status
SELECT r.group_id, g.name, r.status, r.session_id, r.request_id, r.start_time, r.command, r.sql_handle, t.text 
           FROM sys.dm_exec_requests r
     INNER JOIN sys.dm_resource_governor_workload_groups g
            ON g.group_id = r.group_id
     CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) AS t
ORDER BY g.name
GO

-- Find out what requests are running in the classifier by using the following query.
SELECT s.group_id, g.name, s.session_id, s.login_time, s.host_name, s.program_name 
           FROM sys.dm_exec_sessions s
     INNER JOIN sys.dm_resource_governor_workload_groups g
           ON g.group_id = s.group_id
                 AND 'running' = s.status
ORDER BY g.name
GO