if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_UserWithFixedServerRoles') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].SP_UserWithFixedServerRoles
GO

CREATE         proc dbo.SP_UserWithFixedServerRoles
as

create table #temp
(ServerRole varchar(50), MemberName varchar(500), MemberSID varbinary(100))
insert into #temp
EXEC sp_helpsrvrolemember 'sysadmin'

insert into #temp
EXEC sp_helpsrvrolemember 'securityadmin'

insert into #temp
EXEC sp_helpsrvrolemember 'serveradmin'

insert into #temp
EXEC sp_helpsrvrolemember 'setupadmin'

insert into #temp
EXEC sp_helpsrvrolemember 'processadmin'

insert into #temp
EXEC sp_helpsrvrolemember 'diskadmin'

insert into #temp
EXEC sp_helpsrvrolemember 'dbcreator'

insert into #temp
EXEC sp_helpsrvrolemember 'bulkadmin'

select * from #temp

drop table #temp
