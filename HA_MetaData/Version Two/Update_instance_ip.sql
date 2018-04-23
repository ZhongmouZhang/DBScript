-- =============================================
-- Script Template
-- =============================================
update tbl_instance
set ip = v.IP_Address
from 
	(
	select instance_name, connection_string, 
		dbo.fn_InstanceIP(
		case 
			when CHARINDEX('\',instance_name)> 0 then SUBSTRING (instance_name, 1,CHARINDEX('\',instance_name)-1) 
			else instance_name  
		end )  IP_Address  
	from tbl_instance
	) v
where tbl_instance.instance_name = v.instance_name
