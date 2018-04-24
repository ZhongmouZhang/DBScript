    
/********

exec HSP_GeneratingScript_CreateAllFK

***************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].HSP_GeneratingScript_CreateAllFK') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].HSP_GeneratingScript_CreateAllFK
GO

CREATE         proc dbo.HSP_GeneratingScript_CreateAllFK
as
declare @tbl_name varchar(100), @fk_name varchar(100)
declare fk_all_cur cursor for
select distinct object_name(parent_object_id) from sys.foreign_keys
order by object_name(parent_object_id)

print '/******************************************************************************'
print ''
print '            Re-create all the foreign keys  '
print ''
print '*******************************************************************************/'

open fk_all_cur
fetch next from fk_all_cur into @tbl_name
while @@fetch_status = 0
begin
	exec HSP_GeneratingScript_FK 'SPR_STG', 'dbo',@tbl_name
	fetch next from fk_all_cur into @tbl_name
end

close fk_all_cur
deallocate fk_all_cur

