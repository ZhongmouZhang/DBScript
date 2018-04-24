   
/********

exec HSP_GeneratingScript_DropAllFK

***************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].HSP_GeneratingScript_DropAllFK') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].HSP_GeneratingScript_DropAllFK
GO

CREATE         proc dbo.HSP_GeneratingScript_DropAllFK
as

declare @tbl_name varchar(100), @fk_name varchar(100)
declare fk_cur cursor for
select object_name(parent_object_id), name from sys.foreign_keys
order by object_name(parent_object_id)

print '/******************************************************************************'
print ''
print '            Drop all the foreign keys  '
print ''
print '*******************************************************************************/'
print ''

open fk_cur
fetch next from fk_cur into @tbl_name,@fk_name
while @@fetch_status = 0
begin
	print 'ALTER TABLE ' + @tbl_name
	print 'DROP  CONSTRAINT ' + @fk_name 
	print ''
	fetch next from fk_cur into @tbl_name,@fk_name
end

close fk_cur
deallocate fk_cur

