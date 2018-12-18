/*******************************

The reasons of growing Tempdb log could be any of things below:
1. An open transaction in Tempdb that does not much work in terms of data, like there may be few rows which are repeatedly updated again again and again and again.... in a single transaction.
2. A query that may have fetched so many rows from multiple table and joined them hash or merge that it spilled into tempdb and it took a while for it complete.
3. And reindexing operations that sorted in Tempdb.
4. RCSI isolation level.

*****************************/

----  showing current transaction 
select * from sys.dm_tran_session_transactions 


SELECT DB_NAME(dbid) AS DBNAME, (SELECT text FROM sys.dm_exec_sql_text(sql_handle)) AS SQLSTATEMENT
	, *
FROM master..sysprocesses 
WHERE open_tran > 0

-- showing the running session 
select * from sys.dm_exec_sessions where status = 'Running'

-- showing the current running statements
-- connections => session => sql_text 

SELECT SDEC.[most_recent_session_id], DEST.TEXT  
FROM sys.[dm_exec_connections] SDEC 
 CROSS APPLY sys.[dm_exec_sql_text](SDEC.[most_recent_sql_handle]) AS DEST 
WHERE SDEC.[most_recent_session_id] in (select session_id from  sys.dm_exec_sessions where status = 'Running')



/*******************************************
Three commone dm views need to check out

-- sys.dm_db_file_space_usage
-- returns space usage information for each file in the database

-- sys.dm_db_session_file_usage

-- sys.dm_db_task_space_usage
********************************************/

SELECT 
SUM (user_object_reserved_page_count)*8 as usr_obj_kb,
SUM (internal_object_reserved_page_count)*8 as internal_obj_kb,
SUM (version_store_reserved_page_count)*8 as version_store_kb,
SUM (unallocated_extent_page_count)*8 as freespace_kb,
SUM (mixed_extent_page_count)*8 as mixedextent_kb
FROM sys.dm_db_file_space_usage

select * from sys.dm_db_file_space_usage


select * from sys.sysfiles


SELECT --top 5 
* 
FROM sys.dm_db_session_space_usage 
ORDER BY (user_objects_alloc_page_count + 
internal_objects_alloc_page_count) DESC




SELECT top 5 * 
FROM sys.dm_db_task_space_usage
ORDER BY (user_objects_alloc_page_count +
internal_objects_alloc_page_count) DESC

/*********************************************
---Transaction causing logspace filled most

**********************************************/
SELECT tst.[session_id],
s.[login_name] AS [Login Name],
DB_NAME (tdt.database_id) AS [Database],
tdt.[database_transaction_begin_time] AS [Begin Time],
tdt.[database_transaction_log_record_count] AS [Log Records],
tdt.[database_transaction_log_bytes_used] AS [Log Bytes Used],
tdt.[database_transaction_log_bytes_reserved] AS [Log Bytes Rsvd],
SUBSTRING(st.text, (r.statement_start_offset/2)+1, 
((CASE r.statement_end_offset
WHEN -1 THEN DATALENGTH(st.text)
ELSE r.statement_end_offset
END - r.statement_start_offset)/2) + 1) AS statement_text,
st.[text] AS [Last T-SQL Text],
qp.[query_plan] AS [Last Plan]
FROM sys.dm_tran_database_transactions tdt
JOIN sys.dm_tran_session_transactions tst
ON tst.[transaction_id] = tdt.[transaction_id]
JOIN sys.[dm_exec_sessions] s
ON s.[session_id] = tst.[session_id]
JOIN sys.dm_exec_connections c
ON c.[session_id] = tst.[session_id]
LEFT OUTER JOIN sys.dm_exec_requests r
ON r.[session_id] = tst.[session_id]
CROSS APPLY sys.dm_exec_sql_text (c.[most_recent_sql_handle]) AS st
OUTER APPLY sys.dm_exec_query_plan (r.[plan_handle]) AS qp
where DB_NAME (tdt.database_id) = 'tempdb'
ORDER BY [Log Bytes Used] DESC;

/**********************************************
--http://www.microsoft.com/technet/prodtechnol/sql/2005/workingwithtempdb.mspx#EX1AE

***********************************************/
SELECT 
        R1.session_id 
,   R1.user_objects_alloc_page_count 
,   R1.user_objects_dealloc_page_count 
,   R1.internal_objects_alloc_page_count 
,   R1.internal_objects_dealloc_page_count  
,   R3.[text]
,       S.[program_name]
,       S.login_name 
,       S.[status]
,       S.cpu_time 
,       S.memory_usage
,       S.total_scheduled_time
,       S.total_elapsed_time 
,       S.last_request_start_time
,       S.last_request_end_time 
,       S.reads
,       S.writes 
,       S.logical_reads
FROM 
        sys.dm_db_task_space_usage AS R1
INNER JOIN
        sys.dm_exec_sessions AS S
ON
        R1.session_id = S.session_id
LEFT OUTER JOIN sys.dm_exec_requests AS R2
        ON R1.session_id = R2.session_id 
OUTER APPLY sys.dm_exec_sql_text(R2.sql_handle) AS R3
WHERE 
        S.is_user_process = 1
        AND 
        ( 
                R1.user_objects_alloc_page_count > 0
                OR R1.user_objects_dealloc_page_count > 0
                OR R1.internal_objects_alloc_page_count > 0
                OR R1.internal_objects_dealloc_page_count > 0
                OR R3.[text] IS NOT NULL
        );

