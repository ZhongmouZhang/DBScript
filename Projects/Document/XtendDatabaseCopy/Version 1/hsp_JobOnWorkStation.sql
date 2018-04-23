declare @SubStr varchar(100)
declare @retCode int

restore database XtendConsole
from disk = 'C:\MSSQL\Restore\NonPatientXtendConsole.bak'
with move 'XtendConsole_Data' to 'C:\MSSQL\data\NonPatientXtendConsole_data.mdf',
	 move 'XtendConsole_Log'  to 'C:\MSSQL\data\NonPatientXtendConsole_log.ldf'
set @retCode = @@error
if ( @retCode != 0)
begin
		set @SubStr = 'The restoration of XtendConsole database on ' + @@Servername + ' failed. '+ 'ERROR:' + convert(varchar(20),@retCode)
		EXEC master.dbo.usp_sendcdomail
			@From = 'dbserver@phsa.ca', 
			@To = 'jzhang2@phsa.ca',
			@Subject = @SubStr , 
			@Body = 'Please check the workstation restoration job on the workstation'
end
else
begin 
	EXEC master.dbo.xp_cmdshell 'del C:\MSSQL\Restore\NonPatientXtendConsole.bak'
end 
go

IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE name = N'XNAdmin')
BEGIN
EXEC master.dbo.sp_addlogin @loginame = N'XNAdmin', @passwd = 'xtdsql', @defdb = N'XtendConsole', @deflanguage = N'us_english'
END
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE name = N'XNUser')
BEGIN
EXEC master.dbo.sp_addlogin @loginame = N'XNUser', @passwd = 'xtdsql', @defdb = N'XtendConsole', @deflanguage = N'us_english'
END
go

use XtendConsole
go

EXEC sp_change_users_login 'Update_One', 'XNAdmin', 'XNAdmin'
EXEC sp_change_users_login 'Update_One', 'XNUser', 'XNUser'
go

