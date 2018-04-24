 declare @servername varchar (100)
 set @servername = 'SVMSQ05'
 
 declare @querystring varchar(4096)
 set @querystring='SELECT a.*, b.*
FROM OPENROWSET(''SQLNCLI'', ''Server=' + @servername 
+ ';Trusted_Connection=yes;'',
     ''SELECT name FROM master.sys.databases'' ) AS a 
     full join HA_MetaData.dbo.tbl_database_contact b on a.name=b.database_name
where not a.name in (''master'',''tempdb'',''model'',''msdb'') 
		and ( b.database_name is null or a.name is null)'
 
 exec (@querystring)
