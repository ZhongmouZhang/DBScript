 if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_GetDatabaseSize') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_GetDatabaseSize]
GO

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO


/****** Object:  LinkedServer [ZVMSQL01]    Script Date: 09/07/2006 15:39:05 ******/

Create proc [dbo].[SP_GetDatabaseSize]
as

declare myCur cursor for 
select srvname, dbname from metadata.dbo.databaselist 
where status1 & 512 = 0

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
		set @stt = 	'update databaselist ' +
				'set dbsize = a.size ' +
				'from (select convert(decimal(9,2),sum(size)*1.0/128) size from [' + @dbname + '].dbo.sysfiles) a ' + 
				'where srvname=''' + @srvname + ''' and dbname=''' + @dbname + ''''
		exec sp_executesql @stt
	end
	else
	begin
		set @stt = 	'update databaselist ' +
				'set dbsize = a.size ' +
				'from openquery([' + @srvname + '],''select convert(decimal(9,2),sum(size)*1.0/128) size from [' + @dbname + '].dbo.sysfiles'') a ' + 
				'where srvname=''' + @srvname + ''' and dbname=''' + @dbname + ''''
		exec sp_executesql @stt
	end 
	if (@@error!=0)
		print @stt
	print @stt
	Fetch next from myCur into @Srvname, @dbname
end
close myCur
deallocate myCur


