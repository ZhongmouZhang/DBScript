
SELECT
wt.wait_duration_ms,
wt.wait_type,
s_text.text,
DB_NAME(req.database_id) DatabaseName,
req.wait_resource,
session.login_name,
req.last_wait_type
FROM sys.dm_os_waiting_tasks wt
INNER JOIN sys.dm_exec_requests req ON wt.session_id = req.session_id
INNER JOIN sys.dm_exec_sessions session ON session.session_id = req.session_id CROSS apply sys.dm_exec_sql_text (req.sql_handle) s_text
CROSS APPLY sys.dm_exec_query_plan (req.plan_handle) qp
WHERE session.is_user_process = 1
GO