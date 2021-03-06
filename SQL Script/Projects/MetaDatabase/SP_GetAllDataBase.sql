 if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_GetAllDatabase') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_GetAllDatabase]
GO

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO


/****** Object:  LinkedServer [ZVMSQL01]    Script Date: 09/07/2006 15:39:05 ******/

create proc [dbo].[SP_GetAllDatabase]
as

declare myCur cursor for 
select name from master.sys.servers
where name != '76421XP'

declare @Srvname varchar(50)
declare @stt nvarchar(1024)

truncate table Metadata.dbo.databaselist

open myCur
Fetch next from myCur into @Srvname

while @@fetch_status = 0
begin
	set @srvname = rtrim(@srvname)
	if ((select is_linked from master.sys.servers where name=@srvname) = 0)   -- Local server
	begin
		insert into Metadata.dbo.databaselist(eventdate, Srvname, dbname, dbid, status1,status2,created,compatibility, filename) 
		select getdate(), @Srvname , name,dbid,status,status2,crdate,cmptlevel, filename 
		from master.dbo.sysdatabases
		where name not in ('master', 'model', 'msdb', 'tempdb', 'distribution')
	end
	else
	begin
		set @stt = 	'insert into Metadata.dbo.databaselist(eventdate, Srvname, dbname, dbid, status1,status2,created,compatibility, filename) ' + 
					'select getdate(), ''' + @Srvname + ''', * from openquery([' + @srvname + '], ''select name,dbid,status,status2,crdate,cmptlevel, filename from master.dbo.sysdatabases'') ' +
					'where name not in (''master'', ''model'', ''msdb'', ''tempdb'', ''distribution'')'

		exec sp_executesql @stt
	end 

	if (@@error!=0)
		print @stt
	--print @stt
	Fetch next from myCur into @Srvname
end
close myCur
deallocate myCur

exec Metadata.dbo.SP_GetDatabaseSize



