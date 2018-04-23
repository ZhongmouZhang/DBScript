

	--update [CMDB].[dbo].tbl_instance_info set info_update_date = '2000-01-01'
	

use cmdb
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
		and id not in (select id from dbo.tbl_instance_phsa_account_only)
		and datediff (day, info_update_date,getdate())>0
 		
	if @instance_id is null 
		break
	else
		select 	@connection_string = connection_string from tbl_instance_info where id=@instance_id

	-- start to collect the database information
	update [CMDB].[dbo].tbl_instance_info
	set info_update_status = 'SA_Info', info_update_date = getdate()
	where id = @instance_id
	
	delete from dbo.tbl_instance_sa_account where instance_id = @instance_id
	set @stt = 'insert into dbo.tbl_instance_sa_account (instance_id, account_name) select '  
		+ convert(varchar(15), @instance_id ) +  ', name from openquery([' 
		+   @connection_string + '], ''select name from master.dbo.syslogins where sysadmin = 1'')'
--print @stt
		
	exec (@stt)
	
	update [CMDB].[dbo].tbl_instance_info
	set info_update_status = 'Success_of_SA_Info', info_update_date = getdate()
	where connection_string=@connection_string
	
end