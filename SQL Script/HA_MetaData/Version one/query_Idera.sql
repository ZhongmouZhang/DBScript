

select distinct a.InstanceName, c.Name Tag ,d.ip, d.instance_name
from dbo.MonitoredSQLServers a 
	join ServerTags b on a.SQLServerID=b.SQLServerId
	join Tags c on b.TagId = c.Id
	left join VCHDBCMSP01.CMDB.dbo.tbl_instance_info d 
		on (
		case when CHARINDEX (',',a.InstanceName)=0 then a.InstanceName
		 else SUBSTRING(a.InstanceName, 0, charindex (',',a.InstanceName))
		end collate SQL_Latin1_General_CP1_CI_AS
		= 
		case when CHARINDEX (',',d.instance_name)=0 then d.instance_name
		 else SUBSTRING(d.instance_name, 0, charindex (',',d.instance_name))
		end)

where Active=1 
order by  InstanceName, c.Name


