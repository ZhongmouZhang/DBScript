
---  Find Orphan database user in the current database

-------------  SQL 2005 and above     -----------------------
select b.*
from master.sys.syslogins a right join sys.database_principals b on a.sid=b.sid
where a.sid is null and b.type in ('S', 'U') 
 
 
 ------------- SQL 2000 and below  ------------------------------
 
 select b.name
from master.dbo.sysxlogins a right join dbo.sysusers b on a.sid=b.sid
where a.sid is null and b.issqluser=1 
	and not exists (select * from master.dbo.sysxlogins c where c.name=b.name)
order by b.name