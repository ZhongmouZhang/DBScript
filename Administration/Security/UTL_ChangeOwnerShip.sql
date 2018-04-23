declare myCur cursor for 
--select table_name from INFORMATION_SCHEMA.TABLES
select u.name + '.' + o.name  
from sysobjects o join sysusers u on o.uid=u.uid where xtype='U'

declare @tablename  varchar(1000)

open myCur
Fetch next from myCur into @tablename

while @@fetch_status = 0
begin
	-- exec sp_changeobjectowner @tablename, 'dbo'
	print 'exec sp_changeobjectowner ''' + @tablename + ''', ''dbo'''
	Fetch next from myCur into @tablename
end

close myCur
deallocate myCur
