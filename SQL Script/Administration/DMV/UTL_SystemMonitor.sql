SELECT object_name
, counter_name
, instance_name
, cntr_value 
FROM sys.dm_os_performance_counters 
WHERE counter_name 
 IN('Buffer cache hit ratio'
 , 'User Connections'
 , 'Transactions'
 , 'Average Wait Time (ms)'
 , 'Transactions/sec'
 , 'Errors/sec'
 , 'Target Server Memory (KB)'
 , 'Total Server Memory (KB)'
 )
ORDER BY object_name, counter_name
GO

-- who use the most resource
SELECT session_id
 , login_name
 , cpu_time
 , memory_usage
 , status
FROM
 sys.dm_exec_sessions
WHERE
 session_id >= 51
GO

-- find out the statement for a specific session
SELECT T.text
FROM  sys.dm_exec_requests R
CROSS APPLY sys.dm_exec_sql_text(sql_handle) AS T
WHERE r.session_id = 57
GO