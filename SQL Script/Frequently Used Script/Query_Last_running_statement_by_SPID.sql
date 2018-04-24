SELECT @@SPID
GO

DBCC INPUTBUFFER(61)
GO

--------------------------------------------

DECLARE @sqltext VARBINARY(128)
SELECT @sqltext = sql_handle
FROM sys.sysprocesses
WHERE spid = 61
SELECT TEXT
FROM sys.dm_exec_sql_text(@sqltext)
GO


------------------------------------------------------------

DECLARE @sqltext VARBINARY(128)
SELECT @sqltext = sql_handle
FROM sys.sysprocesses
WHERE spid = 61
SELECT TEXT
FROM ::fn_get_sql(@sqltext)
GO


