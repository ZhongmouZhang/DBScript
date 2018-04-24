 
declare mycur cursor for 		
select b.name RoleName, c.name ObjectName, 
				case d.action
					when 26  then  'REFERENCES'
					when 178 then 'CREATE FUNCTION'
					when 193 then 'SELECT'
					when 195 then 'INSERT'
					when 196 then 'DELETE'
					when 197 then 'UPDATE'
					when 198 then 'CREATE TABLE'
					when 203 then 'CREATE DATABASE'
					when 207 then 'CREATE VIEW'
					when 222 then 'CREATE PROCEDURE'
					when 224 then 'EXECUTE'
					when 228 then 'BACKUP DATABASE'
					when 233 then 'CREATE DEFAULT'
					when 235 then 'BACKUP LOG'
					when 236 then 'CREATE RULE'
					else 'other'
				end Permission
from syspermissions a join sysusers b on a.grantee = b.uid
				join sysobjects c on a.id=c.id
				join sysprotects d on d.id=c.id and b.uid=d.uid
where b.name like  'Sch_Consultant'

declare @rolename varchar(500), @objectname varchar(50), @permission varchar(50)
open mycur
fetch next from mycur into @rolename, @objectname, @permission

while @@fetch_status = 0
begin
	print 'grant ' + @permission + ' on ' + @objectname + ' to ' + @rolename
	fetch next from mycur into @rolename, @objectname, @permission
end

close mycur
deallocate mycur

