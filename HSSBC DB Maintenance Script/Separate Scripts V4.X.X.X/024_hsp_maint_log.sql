USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_maint_log') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_maint_log
GO


create   proc [dbo].hsp_maint_log
@is_begin char(1),
@action varchar(64)
as
declare @description_str varchar (5000)
	
if @is_begin = 'Y'
begin
	if @action in ('#full_backup','#check_integrity','#reindex_online_only','#reindex_all','#update_statistics')
	begin 
		set @description_str = 'Database: '
		select @description_str = @description_str + dbname + ';  ' from #temp order by dbname
	end 
	else
		set @description_str = ''
		
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'Starting ' + @action , @description_str)
end
else
	insert into master.dbo.tbl_maint_logging (eventdate, action, description) 
	values (GETDATE(),'End of ' + @action , '')



go



