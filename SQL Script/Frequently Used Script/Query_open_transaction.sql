 -- select @@trancount

SELECT DB_NAME(dbid) AS DBNAME, (SELECT text FROM sys.dm_exec_sql_text(sql_handle)) AS SQLSTATEMENT
	, *
FROM master..sysprocesses 
WHERE open_tran > 0