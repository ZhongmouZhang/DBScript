
print '==========================================================================='
print 'Server name: ' + @@servername
print 'Restore Start At: ' + convert(varchar(30),getdate())


use master
go

declare @SubStr varchar(100)
declare @retCode int

if ( @@servername in ('79516PHSAIT', '79404CW','79405CW','79406CW','79415CW','79416CW','79417CW'))
begin
	-- exec master.dbo.usp_killDBConnections 'XtendConsole'

	restore database XtendConsole
	from disk = '\\srvnetapp03\SQL_Back$\VSQLS2K5\NonPatientXtendConsole.bak'
	with move 'XtendConsole' to 'C:\MSSQL\data\NonPatientXtendConsole_data.mdf',
		 move 'XtendConsole_Log'  to 'C:\MSSQL\data\NonPatientXtendConsole_log.ldf',replace, stats
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

	IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE name = N'XNAdmin')
	BEGIN
	EXEC master.dbo.sp_addlogin @loginame = N'XNAdmin', @passwd = 'xtdsql', @defdb = N'XtendConsole', @deflanguage = N'us_english'
	END
	IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE name = N'XNUser')
	BEGIN
	EXEC master.dbo.sp_addlogin @loginame = N'XNUser', @passwd = 'xtdsql', @defdb = N'XtendConsole', @deflanguage = N'us_english'
	END
end
go

use XtendConsole
go

EXEC sp_change_users_login 'Update_One', 'XNAdmin', 'XNAdmin'
EXEC sp_change_users_login 'Update_One', 'XNUser', 'XNUser'
go

print 'Restore End At: ' + convert(varchar(30),getdate())
print '============================================================================='
print ''
print ''
print ''
