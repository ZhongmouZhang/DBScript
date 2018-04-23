
select * from [dbo].Combine_Sheet_with_id
select * from [tbl_employee]
select * from [ln_computer_employee]




select c.[LegacySystemHostName] ,--*,
	(select [ipaddress] + ';'
	 from tbl_ipaddress
	 where tbl_ipaddress.LegacySystemHostName = c.LegacySystemHostName
	 order by [ipaddress]
	 for XML PATH('')) ip_addresses,

	(select [software] + ';'
	 from [dbo].[tbl_softwarepackage]
	 where [tbl_softwarepackage].LegacySystemHostName = c.LegacySystemHostName
	 order by [software]
	 for XML PATH('')) SoftwarePackages
from [dbo].[tbl_employee] e 
		join [dbo].[ln_computer_employee] l on e.[EULogin]=l.[EULogin]
		join [dbo].[tbl_computer] c on l.[LegacySystemHostName] = c.[LegacySystemHostName]

