
-- troubleshooting URL:  http://www.pythian.com/blog/sql-server-troubleshooting-logon-triggers/
-- start SQL Server service with minimal configuration: -f option to work around the connnection issue when 
-- logon trigger goes wrong

-- query the triggers
SELECT Name,parent_class_desc 'Class',tr.Type,tr_ev.Type_desc + '_' + tr.Type_desc 'Trigger_Type_Desc',is_ms_shipped,is_disabled 
FROM Master.sys.server_triggers tr
Inner Join Master.sys.server_trigger_events tr_ev
on tr.object_id = tr_ev.object_id

-- disable all the triggers
Disable Trigger All ON ALL Server;


-- DAC (dedicated Administrative Connection)
sqlcmd –A –d master 
sqlcmd -S URAN123 -U sa -P <xxx> –A

-- enable remote DAC
EXEC sp_configure 'remote admin connections', 1;
GO
RECONFIGURE;
GO
