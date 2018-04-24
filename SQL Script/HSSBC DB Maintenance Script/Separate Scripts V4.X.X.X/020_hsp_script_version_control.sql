 /*************************************************************************

	Version Control Stored procedure
	
**************************************************************************/
USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_script_version_control') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_script_version_control
GO


create   proc [dbo].hsp_script_version_control
@version varchar(16),
@descript varchar(6000)
as

if exists (select * from sysobjects where id = object_id(N'tbl_maint') and xtype='U')   -- version 1 table
begin 
	insert into tbl_maint_version_info (script_name, version, created_by, date_time)
	select script_name, version, created_by, date_time from tbl_maint
	
	drop table tbl_maint
end

if not exists (select * from tbl_maint_version_info where version = @version)
	insert into tbl_maint_version_info values ('DB Maintenance Scripts', @version, SUSER_NAME(), getdate(),@descript)

go


