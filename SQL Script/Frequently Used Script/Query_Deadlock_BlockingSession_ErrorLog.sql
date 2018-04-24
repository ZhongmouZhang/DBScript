-- deadlock

WITH SystemHealth
AS (
SELECT CAST(target_data AS xml) AS SessionXML
FROM sys.dm_xe_session_targets st
INNER JOIN sys.dm_xe_sessions s ON s.address = st.event_session_address
WHERE name = 'system_health'
)
SELECT Deadlock.value('@timestamp', 'datetime') AS DeadlockDateTime
,CAST(REPLACE(REPLACE(Deadlock.value('(data/value)[1]', 'varchar(max)'),
'<victim-list>', '<deadlock><victim-list>'),
'<process-list>','</victim-list><process-list>')
as xml) as DeadlockGraph
FROM SystemHealth s
CROSS APPLY SessionXML.nodes ('//RingBufferTarget/event') AS t (Deadlock)
WHERE Deadlock.value('@name', 'nvarchar(128)') = 'xml_deadlock_report';



---------Blocking Process
-- create extended event session first

CREATE EVENT SESSION BlockingTransactions ON SERVER
ADD EVENT sqlserver. locks_lock_timeouts (
ACTION (sqlserver.sql_text, sqlserver.tsql_stack)
)
,ADD EVENT sqlserver. locks_lock_waits (
ACTION (sqlserver.sql_text, sqlserver.tsql_stack)
)
ADD TARGET package0.ring_buffer
WITH (MAX_DISPATCH_LATENCY = 30 SECONDS);
GO
ALTER EVENT SESSION BlockingTransactions ON SERVER STATE = START;
GO

-- then query the blocking process
WITH BlockingTransactions
AS (
SELECT CAST(target_data AS xml) AS SessionXML
FROM sys.dm_xe_session_targets st
INNER JOIN sys.dm_xe_sessions s ON s.address = st.event_session_address
WHERE name = 'BlockingTransactions'
)
SELECT
block.value('@timestamp', 'datetime') AS event_timestamp
,block.value('@name', 'nvarchar(128)') AS event_name
,block.value('(data/value)[1]', 'nvarchar(128)') AS event_count
,block.value('(data/value)[1]', 'nvarchar(128)') AS increment
,mv.map_value AS lock_type
,block.value('(action/value)[1]', 'nvarchar(max)') AS sql_text
,block.value('(action/value)[2]', 'nvarchar(255)') AS tsql_stack
FROM BlockingTransactions b
CROSS APPLY SessionXML.nodes ('//RingBufferTarget/event') AS t(block)
INNER JOIN sys.dm_xe_map_values mv ON block.value('(data/value)[3]', 'nvarchar(128)') = mv.map_key AND name = 'lock_mode'
WHERE block.value('@name', 'nvarchar(128)') = 'locks_lock_waits'
UNION ALL
SELECT
block.value('@timestamp', 'datetime') AS event_timestamp
,block.value('@name', 'nvarchar(128)') AS event_name
,block.value('(data/value)[1]', 'nvarchar(128)') AS event_count
,NULL
,mv.map_value AS lock_type
,block.value('(action/value)[1]', 'nvarchar(max)') AS sql_text
,block.value('(action/value)[2]', 'nvarchar(255)') AS tsql_stack
FROM BlockingTransactions b
CROSS APPLY SessionXML.nodes ('//RingBufferTarget/event') AS t(block)
INNER JOIN sys.dm_xe_map_values mv ON block.value('(data/value)[2]', 'nvarchar(128)') = mv.map_key AND name = 'lock_mode'
WHERE block.value('@name', 'nvarchar(128)') = 'locks_lock_timeouts';



