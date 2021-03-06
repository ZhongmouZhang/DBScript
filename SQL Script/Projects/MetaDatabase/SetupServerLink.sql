/****** Object:  LinkedServer [ZVMSQL01]    Script Date: 09/07/2006 15:39:05 ******/

alter proc SetUpServerLink
as

declare myCur cursor for 
select servername from ServerStatus
where CannotConnect is null

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
