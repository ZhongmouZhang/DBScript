  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_PopulateHelpDB') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].SP_PopulateHelpDB
GO

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO


/****** Object:  LinkedServer [ZVMSQL01]    Script Date: 09/07/2006 15:39:05 ******/

create proc [dbo].[SP_PopulateHelpDB]
as

declare myCur cursor for 
select name from master.sys.servers

declare @Srvname varchar(50)
declare @stt nvarchar(1024)

declare @datetime varchar(50)
set @datetime=convert(varchar,getdate())

open myCur
Fetch next from myCur into @Srvname

while @@fetch_status = 0
begin
	set @srvname = rtrim(@srvname)
	if ((select is_linked from master.sys.servers where name=@srvname) = 0)   -- Local server
	begin
		insert into Metadata.dbo.HelpDB(eventdate, Servername, dbname, dbid, owner,status1,status2,created,compatibility_level, filename, version) 
		select @datetime, @Srvname , name,dbid,suser_sname(sid),status,status2,crdate,cmptlevel, filename ,version
		from master.dbo.sysdatabases
		where name not in ('master', 'model', 'msdb', 'tempdb', 'distribution')
	end
	else
	begin
		set @stt = 	'insert into Metadata.dbo.Helpdb (eventdate, servername, dbname, dbid, owner, status1,status2,created,compatibility_level, filename, version) ' + 
					'select ''' +  @datetime + ''', ''' + @Srvname + ''', * from openquery([' + @srvname + '], ''select name,dbid,suser_sname(sid), status,status2,crdate,cmptlevel, filename,version from master.dbo.sysdatabases'') ' +
					'where name not in (''master'', ''model'', ''msdb'', ''tempdb'', ''distribution'')'

		--print @stt
		exec sp_executesql @stt
	end 

	if (@@error!=0)
		print @stt
	--print @stt
	Fetch next from myCur into @Srvname
end
close myCur
deallocate myCur

exec Metadata.dbo.SP_PopulateHelpDB_DBSIZE

update helpdb
set status = case when status1 & 512 = 512 then 'Offline' when status1 & 32 = 32 then 'Loading' else 'Online' end,
	Updateability = case when status1 & 1024 = 1024 then 'ReadOnly' else 'Read_Write' end,
	UserAccess = case when status1 & 2048 = 2048 then 'DBO_User_Only' when status1 & 4096 = 4096 then 'Single_User' else 'Multi_Users' end,
	RecoveryModel = case when status1 & 8 = 8 then 'Simple' when status1 & 4 = 4 then 'Bulk-Logged' else 'Full' end
	
	



