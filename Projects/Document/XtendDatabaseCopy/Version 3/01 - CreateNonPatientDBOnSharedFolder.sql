 --step 1
-- step 1 create non-patient backup 

declare @From_str varchar(500)

backup database XtendConsole to Disk='J:\MSSQL.1\MSSQL\Backup\XtendConsole_Full.bak' with init,STATS 

restore database temp_XtendConsole
from disk = 'J:\MSSQL.1\MSSQL\Backup\XtendConsole_Full.bak'
with move 'XtendConsole' to 'J:\MSSQL.1\MSSQL\Data\temp_XtendConsole_data.mdf',
	 move 'XtendConsole_Log'  to 'J:\MSSQL.1\MSSQL\Data\temp_XtendConsole_log.ldf',replace, stats

if (@@error != 0)
begin
		set @From_str = @@Servername + '@phsa.ca'
		EXEC usp_sendcdomail
			@From = @From_str, 
			@To = 'jzhang2@phsa.ca',
			@Subject = 'The restoration of temp_XtendConsole database failed' , 
			@Body = 'Please check the prepare non-patient database job on the server'
end

alter database temp_XtendConsole set  RECOVERY SIMPLE 
go

use temp_XtendConsole
go

delete from temp_XtendConsole.dbo.xkm where format=9
truncate table temp_XtendConsole.dbo.Statistic
go

waitfor delay '00:00:20'
use master
go

dbcc shrinkdatabase (TEMP_XtendConsole, 0)
go

declare @From_str varchar(100)
backup database temp_XtendConsole
to disk = '\\srvnetapp03\SQL_Back$\VSQLS2K5\NonPatientXtendConsole.bak'
with init,stats

if (@@error != 0)
begin
		set @From_str = @@Servername + '@phsa.ca'
		EXEC usp_sendcdomail
			@From = @From_str, 
			@To = 'jzhang2@phsa.ca',
			@Subject = 'The backup of temp_XtendConsole database failed' , 
			@Body = 'Please check the prepare non-patient database job on the server'
end
go

use master
go

drop database temp_XtendConsole
go 

