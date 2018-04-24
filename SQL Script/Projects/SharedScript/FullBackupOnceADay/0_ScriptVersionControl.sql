use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_ScriptVersionControl') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_ScriptVersionControl
GO

-- hsp_scriptversioncontrol 'Backup script', '1.0'

CREATE         proc dbo.hsp_ScriptVersionControl
@script_name varchar(64),
@version varchar(16)
as
if not exists (select * from sysobjects where id = object_id(N'tbl_maint') and xtype='U')
begin 

	create table tbl_maint
	(
		script_name varchar(64),
		version varchar(16),
		created_by varchar(32),
		date_time datetime,
		active char(1)
	)
	
end


update tbl_maint set active = 'N' where script_name = @script_name
insert into tbl_maint values (@script_name, @version, SUSER_NAME(), getdate(),'Y')

go
