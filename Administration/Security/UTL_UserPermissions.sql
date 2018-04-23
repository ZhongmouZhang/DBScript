 -------------------- All User Permissions ----------------------------
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
GO

create table #temp
(
	UserID int, 
	UserName varchar(100),
	RoleName varchar(100),
	ObjectName varchar(500),
	Objecttype varchar(100),
	Permission varchar(30)
)

insert into #temp
select * 
from 
(
	(
		-- User stand alone permissions
		select b.uid UserID, b.name UserName, ' ' RoleName, c.name ObjectName, 
			case c.xtype 
				when 'U' then 'User table'
				when 'V' then 'View'
				when 'P' then 'Stored Procedure'
				when 'S' then 'System table'
				when 'FN' then 'Scalar function'
				when 'TF' then 'Table function'
				when 'IF' then 'Inlined table-function'
				when 'X' then 'Extened stored procedure'
				else xtype
			end Objecttype,
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
		where b.issqlrole = 0 
	)  -- User_StandAlone_Permissions

	union all
	
	-- Public Role Permissions
	(  
		select *
		from 
		(
			select  uid UserID, suser_sname(sid) UserName   
			from dbo.sysusers 
			where issqlrole = 0
				and suser_sname(sid) is not null
		) V_AllUsers
		,
		(
		select b.name RoleName, c.name ObjectName, 
			case c.xtype 
				when 'U' then 'User table'
				when 'V' then 'View'
				when 'P' then 'Stored Procedure'
				when 'S' then 'System table'
				when 'FN' then 'Scalar function'
				when 'X' then 'Extened stored procedure'
				when 'TF' then 'Table function'
				when 'IF' then 'Inlined table-function'
				else xtype
			end Objecttype,
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
		where b.issqlrole = 1 and lower(b.name)= 'public'
		) Public_Permissions
	)  -- User_Public_Permissions

	union all

	-- user defined role and database standard role permissions
	(  
		select V_AllUsers.*, V_AllRoles.RoleName, V_AllRoles.ObjectName , V_AllRoles.ObjectType , V_AllRoles.Permission
		from
		(
			select  uid UserID, suser_sname(sid) UserName   
			from dbo.sysusers 
			where issqlrole = 0
				and suser_sname(sid) is not null
		) V_AllUsers
		join dbo.sysmembers s on V_AllUsers.UserID = s.memberuid
		join 
		(
			( -- database standard roles
				select uid RoleID, name RoleName, 'Standard DB Role' ObjectName, 'Default' ObjectType, 'Default' Permission
				from sysusers 
				where name like 'db_%' and issqlrole=1
			)
			union all 
			( -- User defined roles
			select b.uid RoleID, b.name RoleName, c.name ObjectName, 
				case c.xtype 
					when 'U' then 'User table'
					when 'V' then 'View'
					when 'P' then 'Stored Procedure'
					when 'S' then 'System table'
					when 'FN' then 'Scalar function'
					when 'X' then 'Extened stored procedure'
					when 'TF' then 'Table function'
					when 'IF' then 'Inlined table-function'
					else xtype
				end Objecttype,
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
			where b.issqlrole = 1 
			--order by b.name
			)
		) V_AllRoles on s.groupuid=V_AllRoles.RoleID
	) -- User_Role_Permissions
) User_Permissions
--order by UserID

select * from #temp where Objecttype = 'User table' and RoleName = '' order by UserName, ObjectName


select RoleName, count(*) from #temp group by RoleName