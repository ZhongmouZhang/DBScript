' exec sp_configure 'show advanced option', '1'
reconfigure
go
exec sp_configure 'Ole Automation Procedures', '1'
exec sp_configure 'xp_cmdshell', '1'
reconfigure
go 

 	declare @SubStr varchar(500)
 	set @SubStr = 'Testing email from ' + @@Servername
 	EXEC usp_sendcdomail
			@From = 'dbserver@phsa.ca', 
			@To = 'jzhang2@phsa.ca',
			@Subject = @SubStr, 
			@Body = ''
