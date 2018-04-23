declare @retry int
declare @destFolder varchar(500)
declare @sourceFile varchar(500)
declare @returnedCode int
declare @subject_str varchar(500)
declare @From_str varchar(500)
declare @sttm_str varchar (5000)
declare @switchHr int 

select @switchHr=convert(int, substring(path,1,2)) 
from master.dbo.BackupParameter
where dbname = 'LogSwitch_FullBackup'

if (datepart(hour, getdate()) = @switchHr)
begin 
	set @retry = 0
	set @returnedCode = 0
	set @sourceFile = 'D:\MSSQL\Backup\XtendConsole_Full_'  + convert(varchar,getdate(),112)+ '.bak'
	set @destFolder = '\\svmxtendif\c$\MSSQL\Restore\XtendConsole_Full_.bak'
	-- try the copy three time
--	while (@retry < 3)
	WAITFOR Delay '00:15:00'
	begin
		set @sttm_str = 'copy ' + @sourceFile + '  ' + @destFolder
		-- print @sttm_str
		EXEC master.dbo.xp_cmdshell @sttm_str
		set @returnedCode = @@error
	end
	if (@returnedCode != 0)
	begin
		set @subject_str = 'Non-patient database copy to ' + @destFolder + ' failed'
		set @From_str = @@Servername + '@phsa.ca'
		EXEC master.dbo.usp_sendcdomail
			@From = @From_str, 
			@To = 'jzhang2@phsa.ca',
			@Subject = @subject_str, 
			@Body = 'Please check the workstatation'
	end
end
