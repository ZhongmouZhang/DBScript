 use shire06
go

declare myCur cursor for 
--select table_name from INFORMATION_SCHEMA.TABLES
select name from sysobjects where xtype='U'

declare @tablename  varchar(100)
declare @stt nvarchar(1000)

open myCur
Fetch next from myCur into @tablename

while @@fetch_status = 0
begin
	set @stt = 'delete from SHIRE06.dbo.' + @tablename
	-- print @stt
	-- exec sp_executesql @stt
	Fetch next from myCur into @tablename
end

close myCur
deallocate myCur


