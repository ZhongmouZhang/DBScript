if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].FreeDiskSpaceOnServer') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].FreeDiskSpaceOnServer
GO

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO


/****** Object:  LinkedServer [ZVMSQL01]    Script Date: 09/07/2006 15:39:05 ******/

create proc [dbo].FreeDiskSpaceOnServer
as

declare myCur cursor for 
select name from master.sys.servers
where name != '76421XP'

declare @Srvname varchar(50)
declare @stt nvarchar(1024)

truncate table Metadata.dbo.FreeDiskSpace

open myCur
Fetch next from myCur into @Srvname

while @@fetch_status = 0
begin
	set @srvname = rtrim(@srvname)
	set @stt = 	'insert into Metadata.dbo.FreeDiskSpace(Srvname, drive, MBFree) ' + 
				'select convert(varchar,getdate(),102), ''' + @Srvname + ''', * from openquery([' + @srvname + '], ''select name,dbid,status,status2,crdate,cmptlevel, filename from master.dbo.sysdatabases'') ' +
				'where name not in (''master'', ''model'', ''msdb'', ''tempdb'', ''distribution'')'

	exec sp_executesql @stt
	if (@@error!=0)
		print @stt
	--print @stt
	Fetch next from myCur into @Srvname
end
close myCur
deallocate myCur




