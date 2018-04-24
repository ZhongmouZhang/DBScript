  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].UTL_OrphanUser_MapANDDrop') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].UTL_OrphanUser_MapANDDrop
GO

CREATE         proc dbo.UTL_OrphanUser_MapANDDrop
as
declare @username  varchar(1000)
declare @stt varchar(4000)

/***************************************
	Mapping opphan user
****************************************/
declare MapCur cursor for 
select b.name
from master.dbo.sysxlogins a right join cht_trak.dbo.sysusers b on a.sid=b.sid
where a.sid is null and b.issqluser=1 
	and exists (select * from master.dbo.sysxlogins c where c.name=b.name)
order by b.name
open MapCur
Fetch next from MapCur into @username
while @@fetch_status = 0
begin
	if exists (select name from master.dbo.sysxlogins where name = @username)
	begin 	
		set @stt = 'EXEC sp_change_users_login ''Update_One'', ''' + @username + ''', '''
 + @username + ''''
		print ''
		print @stt
		--EXEC (@stt)
	end
	Fetch next from MapCur into @username
end

close MapCur
deallocate MapCur

/***************************************
	Drop opphan user
****************************************/
declare DropCur cursor for 
select b.name
from master.dbo.sysxlogins a right join cht_trak.dbo.sysusers b on a.sid=b.sid
where a.sid is null and b.issqluser=1 
	and not exists (select * from master.dbo.sysxlogins c where c.name=b.name)
order by b.name

open DropCur
Fetch next from DropCur into @username
while @@fetch_status = 0
begin
	set @stt = 'EXEC sp_dropuser ''' + @username + ''''
	print ''
	print @stt
	--EXEC (@stt)
	Fetch next from DropCur into @username
end

close DropCur
deallocate DropCur


