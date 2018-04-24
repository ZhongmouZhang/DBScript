 if charindex('Microsoft SQL Server 2005',@@version) = 0 
    select name [database], suser_sname(sid) [owner] from master.dbo.sysdatabases 
else 
    select name [database], suser_sname(owner_sid) [owner] from sys.databases 
  