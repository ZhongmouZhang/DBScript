use master
go
if exists (select * from sys.tables where name = 'tbl_login_audit')
	drop table tbl_login_audit
go

create table tbl_login_audit
(
id int identity (1,1) primary key,
login_name varchar(512),
[login_type] varchar(32),
login_time datetime,
spid int,
client_host varchar(512),
)

grant insert,select on tbl_login_audit to public

---------------------------------------------------------------
if exists (select * from  Master.sys.server_triggers where name = 'login_audit_trigger')
	drop trigger login_audit_trigger
	ON ALL SERVER 
go

CREATE TRIGGER login_audit_trigger
ON ALL SERVER WITH EXECUTE AS 'sa'
for LOGON
AS
BEGIN
		--print 'good to go'
		if exists (select * from master.sys.tables where name = 'tbl_login_audit')
		begin
			insert into master.dbo.tbl_login_audit (login_name, [login_type],login_time,spid,client_host)
			SELECT --system_user, @@spid, getdate()
			EVENTDATA().value('(/EVENT_INSTANCE/LoginName)[1]','varchar(256)')
			, EVENTDATA().value('(/EVENT_INSTANCE/LoginType)[1]','varchar(32)')
			, EVENTDATA().value('(/EVENT_INSTANCE/PostTime)[1]','datetime')
			, EVENTDATA().value('(/EVENT_INSTANCE/SPID)[1]','int')
			, EVENTDATA().value('(/EVENT_INSTANCE/ClientHost)[1]','varchar(256)')
		end
END;


------------------------  only audit SA account

if exists (select * from  Master.sys.server_triggers where name = 'login_audit_trigger')
	drop trigger login_audit_trigger
	ON ALL SERVER 
go

CREATE TRIGGER login_audit_trigger
ON ALL SERVER WITH EXECUTE AS 'sa'
for LOGON
AS
BEGIN
		--print 'good to go'
		if (exists (select * from master.sys.tables where name = 'tbl_login_audit')) and 
			(exists (select * from master.dbo.syslogins where sysadmin = 1 
						and name = EVENTDATA().value('(/EVENT_INSTANCE/LoginName)[1]','varchar(256)')))
		begin
			insert into master.dbo.tbl_login_audit (login_name, [login_type],login_time,spid,client_host)
			SELECT --system_user, @@spid, getdate()
			EVENTDATA().value('(/EVENT_INSTANCE/LoginName)[1]','varchar(256)')
			, EVENTDATA().value('(/EVENT_INSTANCE/LoginType)[1]','varchar(32)')
			, EVENTDATA().value('(/EVENT_INSTANCE/PostTime)[1]','datetime')
			, EVENTDATA().value('(/EVENT_INSTANCE/SPID)[1]','int')
			, EVENTDATA().value('(/EVENT_INSTANCE/ClientHost)[1]','varchar(256)')
		end
END;