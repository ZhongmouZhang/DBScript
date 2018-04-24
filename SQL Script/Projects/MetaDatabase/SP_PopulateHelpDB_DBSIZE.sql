  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_PopulateHelpDB_DBSIZE') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_PopulateHelpDB_DBSIZE]
GO

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO


/****** Object:  LinkedServer [ZVMSQL01]    Script Date: 09/07/2006 15:39:05 ******/

Create proc [dbo].[SP_PopulateHelpDB_DBSIZE]
as

declare myCur cursor for 
select servername, dbname from metadata.dbo.HelpDB 
where status1 & 512 = 0 -- Not offline
	and status1 & 32 = 0 -- Not Loading
	and eventdate = (select max(eventdate) from metadata.dbo.helpdb)


declare @Srvname varchar(50)
declare @dbname varchar(50)
declare @stt nvarchar(1024)


open myCur
Fetch next from myCur into @Srvname,@dbname

while @@fetch_status = 0
begin
	set @srvname = rtrim(@srvname)
	if ((select is_linked from master.sys.servers where name=@srvname) = 0)   -- Local server
	begin
		set @stt = 	'update HelpDB ' +
				'set db_size = a.size ' +
				'from (select convert(decimal(9,2),sum(size)*1.0/128) size from [' + @dbname + '].dbo.sysfiles) a ' + 
				'where servername=''' + @srvname + ''' and dbname=''' + @dbname + ''''
		exec sp_executesql @stt
	end
	else
	begin
		set @stt = 	'update HelpDB ' +
				'set db_size = a.size ' +
				'from openquery([' + @srvname + '],''select convert(decimal(9,2),sum(size)*1.0/128) size from [' + @dbname + '].dbo.sysfiles'') a ' + 
				'where servername=''' + @srvname + ''' and dbname=''' + @dbname + ''''
		exec sp_executesql @stt
	end 
	if (@@error!=0)
		print @stt
	Fetch next from myCur into @Srvname, @dbname
end
close myCur
deallocate myCur


