-- exec hsp_create_login_grant_all_db_role_permission 'HealthBC\JZ1337_SA', 'db_owner'

use master
go



if exists (select * from dbo.sysobjects where id = object_id(N'hsp_create_login_grant_all_db_role_permission') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_create_login_grant_all_db_role_permission
GO

CREATE         proc dbo.hsp_create_login_grant_all_db_role_permission
@login varchar(64),
@role varchar(64)
as

	declare @current_db varchar(128) 
	declare @stt nvarchar(2048)

	if not exists (SELECT * FROM master.sys.syslogins where name = @login)
	begin
		set @stt = 'CREATE LOGIN [' + @login + '] FROM WINDOWS;'
		exec (@stt)  
	end

	set @current_db = ''
	while 1=1
	begin
		select @current_db = min(name) 
		from master.sys.databases 
		where name not in ('tempdb','distribution', 'master', 'model', 'msdb')
			and name>@current_db

		if @current_db is null
			break

		
			
		set @stt = 'use ' + @current_db + ';' + 'if not exists (SELECT * FROM master.sys.syslogins l join sys.database_principals u on l.sid=u.sid where l.name = '''+ @login +''') ' +'CREATE USER [' + @login + '] FOR LOGIN [' +@login + '];' 
				+ 'alter role ' + @role + ' add member [' + @login + ']'
		print (@stt)
		exec (@stt)
	end

