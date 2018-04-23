 USE [Metadata]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllSQLServerVersion]    Script Date: 03/15/2007 16:08:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Object:  LinkedServer [ZVMSQL01]    Script Date: 09/07/2006 15:39:05 ******/

ALTER proc [dbo].[SP_GetAllSQLServerVersion]
as

declare myCur cursor for 
select name from master.sys.servers
where name != '76421XP'

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

	if (@@error!=0)
        print @stt
	Fetch next from myCur into @Srvname
end
close myCur
deallocate myCur




