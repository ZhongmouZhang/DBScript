SELECT TOP 100
    qs.total_elapsed_time / qs.execution_count / 1000000.0 AS average_seconds,
    qs.total_elapsed_time / 1000000.0 AS total_seconds,
    qs.execution_count,
    SUBSTRING (qt.text,qs.statement_start_offset/2, 
         (CASE WHEN qs.statement_end_offset = -1 
            THEN LEN(CONVERT(NVARCHAR(MAX), qt.text)) * 2 
          ELSE qs.statement_end_offset END - qs.statement_start_offset)/2) AS individual_query,
    o.name AS object_name,
    DB_NAME(qt.dbid) AS database_name
  FROM sys.dm_exec_query_stats qs
    CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) as qt
    LEFT OUTER JOIN sys.objects o ON qt.objectid = o.object_id
where qt.dbid = DB_ID()
  ORDER BY average_seconds DESC;

  