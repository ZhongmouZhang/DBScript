use spr_2
 declare myCur cursor for 
select name from sysobjects where xtype='u'

declare @tablename  varchar(100)
declare @stt nvarchar(300)

open myCur
Fetch next from myCur into @tablename

while @@fetch_status = 0
begin
	set @stt = 'truncate table ' + @tablename
	print @stt
	--exec sp_executesql @stt
	Fetch next from myCur into @tablename
end

close myCur
deallocate myCur

