 USE [Metadata]
GO
-- test all the linked servers to see if it exists or no
create proc [dbo].[SP_TestAllLinkedServers]
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
	if ((select is_linked from master.sys.servers where name=@srvname) != 0)   -- not Local server
	begin
		set @stt = 	' if (select count(*) from [' + @srvname + '].master.dbo.sysdatabases) >0  print ''' + @srvname + '''' + ' + '' is available'''
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

	
	



