USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_schedule_defaul_action') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_schedule_defaul_action
GO


create   proc [dbo].hsp_schedule_defaul_action
@id int,
@action varchar(32),
@freq_type varchar(16),
@freq_interval int,
@freq_week_interval int,
@start_time varchar(16)

as

if not exists (select * from tbl_maint_action where [action]= @action)
begin 
	insert into tbl_maint_action (action_id, [action], database_name, freq_type, freq_interval, freq_week_interval, start_time )
	values (@id, @action,'default', @freq_type, @freq_interval, @freq_week_interval, @start_time)
end


go
