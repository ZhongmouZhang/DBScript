 /**************************************************************
	Grant a specific user the privileges to execute all the stored procedure
	
*******************************************************************************/
--create proc [dbo].[GrantUserForExecuteAllSpro]

--as

declare myCur cursor for 
select name from sysobjects where xtype in ('P','FN')

declare @stt nvarchar(1024)
declare @object varchar(500)
declare @username  varchar(100)

set @username = 'maauser'

open myCur
Fetch next from myCur into @object

while @@fetch_status = 0
begin
	set @object = rtrim(@object)
	set @stt = 	'grant execute on ' + @object + ' to [' + @username + ']'

	exec sp_executesql @stt
	if (@@error!=0)
		print @stt
	--print @stt
	Fetch next from myCur into @object
end
close myCur
deallocate myCur
