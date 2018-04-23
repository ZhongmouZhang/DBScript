  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_GetAllSQLServerVersion') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SP_GetAllSQLServerVersion]
GO

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO


/****** Object:  LinkedServer [ZVMSQL01]    Script Date: 09/07/2006 15:39:05 ******/

create proc [dbo].[SP_GetAllSQLServerVersion]
as

declare myCur cursor for 
select name from master.sys.servers

declare @Srvname varchar(50)
declare @stt nvarchar(1024)
declare @SQLServer varchar(200)
create table #temp
(
	SQLSERVER varchar(200)
)

truncate table Metadata.dbo.SQLServer

open myCur
Fetch next from myCur into @Srvname

while @@fetch_status = 0
begin
	set @srvname = rtrim(@srvname)
	if ((select is_linked from master.sys.servers where name=@srvname) = 0)   -- Local server
	begin
		insert into Metadata.dbo.SQLServer(eventdate, Srvname, SQLServer,SQLVersion,Sp,Edition)
		select getdate(),  
			@srvname , 
			substring (@@version , 1, patindex('%-%', @@version) - 1), 
			convert (varchar(50),SERVERPROPERTY('productversion')), 
			convert (varchar(50),SERVERPROPERTY ('productlevel')), 
			convert (varchar(50),SERVERPROPERTY ('edition'))   
	end
	else
	begin
		truncate table #temp
		set @stt = 	'SELECT substring (version, 1, patindex(''%-%'', version)+10) FROM OPENQUERY(['
					 + @srvname + '], ' + '''SELECT  @@version version'')' 
		insert #temp
		exec sp_executesql @stt
		select @SQLServer = SQLServer from #temp
    -- print @SQLServer
		if (patindex('%2000%',@SQLServer)=0 and patindex('%2005%',@SQLServer)=0)
		begin
			insert into Metadata.dbo.SQLServer(eventdate, Srvname, SQLServer)
			select getdate(), @Srvname, @SQLServer
		end
		else 
		begin
			set @stt = 'insert into Metadata.dbo.SQLServer(eventdate, Srvname, SQLServer,SQLVersion,Sp,Edition) ' +
					'select getdate(), ''' + @srvname + ''', substring (''' + @SQLServer + ''', 1, patindex(''%-%'', ''' +@SQLServer + ''') - 1), ' +
					'convert (varchar(50),SQLVersion), convert (varchar(50),SP), convert (varchar(50),Edition)  FROM OPENQUERY([' + @srvname+ ']  , ''SELECT  SERVERPROPERTY(''''productversion'''') SQLVersion, SERVERPROPERTY (''''productlevel'''') SP, SERVERPROPERTY (''''edition'''') Edition'')' 
			exec sp_executesql @stt
		end
	end

	if (@@error!=0)
        print @stt
	Fetch next from myCur into @Srvname
end
close myCur
deallocate myCur




