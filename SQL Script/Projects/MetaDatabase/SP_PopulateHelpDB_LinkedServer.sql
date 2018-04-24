 /****** Object:  LinkedServer [ZVMSQL01]    Script Date: 09/07/2006 15:39:05 ******/
  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_PopulateHelpDB_LinkedServer') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].SP_PopulateHelpDB_LinkedServer
GO

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO



create proc SP_PopulateHelpDB_LinkedServer
as

declare myCur cursor for 
select servername from ServerList
where Groupname != 'PNG' and Comment is null
	and not exists (select * from master.sys.servers s where s.name=Serverlist.servername)  -- the linked server has not been created


declare @Srvname varchar(50)
declare @device varchar(50)
declare @stt nvarchar(1024)

open myCur
Fetch next from myCur into @Srvname

while @@fetch_status = 0
begin
	set @stt = 'EXEC master.dbo.sp_addlinkedserver @server = N''' + rtrim(@Srvname) + ''', @srvproduct=N''SQL Server'''
	exec sp_executesql @stt
	if (@@error!=0)
		print @stt
	--print @stt
	Fetch next from myCur into @Srvname
end
close myCur
deallocate myCur
GO
