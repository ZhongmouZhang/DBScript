 USE [Metadata]
GO
/****** Object:  StoredProcedure [dbo].[SP_TestAllLinkedServers]    Script Date: 02/26/2008 10:33:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Object:  LinkedServer [ZVMSQL01]    Script Date: 09/07/2006 15:39:05 ******/

alter proc [dbo].[SP_SearchLinkedSrv]
@quysrvname varchar(100) = 'all'

as

set nocount on
declare myCur cursor for 
select name from master.sys.servers order by name

declare @Srvname varchar(50)
declare @stt nvarchar(1024)

declare @datetime varchar(50)
set @datetime=convert(varchar,getdate())

open myCur
Fetch next from myCur into @Srvname

while @@fetch_status = 0
begin
	set @srvname = rtrim(@srvname)
	set @stt = 	' insert into Metadata.dbo.LinkedServerList(EventDate, Srvname, LinkedSrvname) select ''' + @datetime + ''' , ''' + @srvname + ''', datasource from [' + @srvname +'].master.dbo.sysservers'
		--print @stt
		exec sp_executesql @stt
	Fetch next from myCur into @Srvname
end
close myCur
deallocate myCur


	
	



