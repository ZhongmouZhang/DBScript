 use master
go

-- kill all the connections to CAP
DECLARE @spidstr varchar(8000)
DECLARE @ConnKilled smallint
DECLARE @DBName varchar(50)

SET @ConnKilled=0
SET @spidstr = ''
SET @DBName='CAP'

SELECT @spidstr=coalesce(@spidstr,',' )+'kill '+convert(varchar, spid)+ '; '
FROM master..sysprocesses WHERE dbid=db_id(@DBName)
IF LEN(@spidstr) > 0 
BEGIN
--	Print @spidstr
	EXEC(@spidstr)
END
go

-- Restore CAP
RESTORE database CAP 
FROM DISK = '\\srvcapharmdb01\backup$\NewPolicy\CAP_FULL_.bak' 
WITH MOVE 'CAP' TO 'e:\Program Files\Microsoft SQL Server\MSSQL\Data\CAP_Data.mdf', 
	MOVE 'CAP_Log' TO 'e:\Program Files\Microsoft SQL Server\MSSQL\Data\CAP_Log.ldf',
	replace

if (@@error != 0)
begin
	EXEC usp_sendcdomail
		@From = 'dbserver@phsa.ca', 
		@To = 'phsaimitmonitor@phsa.ca;jzhang2@phsa.ca;rgrover2@phsa.ca',
		@Subject = 'Restore CAP on SERVER11B failed', 
		@Body = 'Please check job'
end
go

-- Security setting
use CAP
go
delete from sysusers where name like 'PHSABC\%' or name = 'cap'
EXEC sp_grantdbaccess 'PHSABC\WG_CAP_warehouse'
EXEC [sp_addrolemember]
	@rolename = 'db_datareader',
	@membername = 'PHSABC\WG_CAP_warehouse'


