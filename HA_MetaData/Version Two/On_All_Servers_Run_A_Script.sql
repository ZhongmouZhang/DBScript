-- =============================================
-- Script Template
-- =============================================


use CMDB_V2
go


-- initialize the time stamp
/**************

select * FROM dbo.vw_all_connectable_instance
where not info_update_status like 'Success_of_Database_Info' 
order by info_update_date


update tbl_instance
set info_update_date = '2000-01-01'
where not info_update_status like 'Success_of_Database_Info' 

********************/

-- start the refresh database_size table
set nocount on
declare @instance_id int
declare @connection_string varchar(500)
declare @stt nvarchar(2000)

set @instance_id = 0
while 1=1
begin
	select @instance_id=MIN(id)
	from vw_all_connectable_instance
	where id > @instance_id
		and datediff (day, info_update_date,getdate())>0
		
	if @instance_id is null 
		break
	else
		select 	@connection_string = connection_string from tbl_instance where id=@instance_id
	
	
	-- start to collect the database information

	update [dbo].tbl_instance
	set info_update_status = 'Running Script...', info_update_date = getdate()
	where id = @instance_id

	set @stt = 'C:\BatchScript\BatchCmd "' + @connection_string + '" >> C:\BatchScript\output.log'
	print @connection_string
	print ''
	exec xp_cmdshell @stt

	if @@error = 0 
		update [dbo].tbl_instance
		set info_update_status = 'Success of Running Script', info_update_date = getdate()
		where connection_string=@connection_string
	
end



-- select * from #temp
