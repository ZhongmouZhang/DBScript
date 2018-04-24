/******************
update tbl_instance
set info_update_date = '2000-01-01'

*****************************/

use CMDB_V2
go


declare @instance_id int
declare @connection_string varchar(500)
declare @stt nvarchar(2000)

set @instance_id = 0
while 1=1
begin
	select @instance_id=MIN(id)
	from dbo.vw_all_connectable_instance
	where id > @instance_id
		and datediff (day, info_update_date,getdate())>0
		
	if @instance_id is null 
		break
	else
		select 	@connection_string = connection_string from tbl_instance where id=@instance_id
	
	-- start to collect the database information
	update [dbo].tbl_instance
	set info_update_status = 'Add Login HEALTHBC\SVC_HP_uCMDB', info_update_date = getdate()
	where id = @instance_id

	set @stt = '[' + @connection_string + '].master..sp_grantlogin ''HEALTHBC\SVC_HP_uCMDB'''
	print @stt

	exec (@stt)
	if @@ERROR=0
		update [dbo].tbl_instance
		set info_update_status = 'Success of Add Login HEALTHBC\SVC_HP_uCMDB', info_update_date = getdate()
		where id = @instance_id
	
	
end

