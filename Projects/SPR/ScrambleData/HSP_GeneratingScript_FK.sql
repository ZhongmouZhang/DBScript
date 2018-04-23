  
/********

exec HSP_GeneratingScript_FK 'SPR_STG', 'dbo', 'spr_md'

***************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].HSP_GeneratingScript_FK') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].HSP_GeneratingScript_FK
GO

CREATE         proc dbo.HSP_GeneratingScript_FK
@dbname varchar(100), @schemaname varchar(20), @tblname varchar(100)
as
declare @fk_name varchar(100), @parent_tbl_name varchar(100), @referenced_tbl_name varchar(100)
declare @parent_col_str varchar(500), @referenced_col_str varchar(500)
declare @fullname varchar(200), @newfullname varchar(200)
declare @fk_object_id int

set @fullname = '['+@dbname+ '].'+'['+@schemaname+ '].'+'['+@tblname+ ']'
set @newfullname = '['+@dbname+ '].'+'['+@schemaname+ '].'+'['+@tblname+ '_CH]'

declare FK_cur cursor for 
select  object_id
from sys.foreign_keys 
where parent_object_id = object_id(@fullname) 
order by object_id

open FK_cur
fetch next from FK_cur into @fk_object_id
while @@fetch_status = 0
begin
	-- FK name; parent table name, reference table name
	select top 1 @fk_name = fk.name, 
			@parent_tbl_name = object_name(fkc.parent_object_id), 
			@referenced_tbl_name = object_name(fkc.referenced_object_id)
	from sys.foreign_keys fk join sys.foreign_key_columns fkc 
		on fk.object_id = fkc.constraint_object_id
	where fk.object_id = @fk_object_id
	
	select @parent_col_str = '', @referenced_col_str = ''
	 -- parent column string
	select @parent_col_str = @parent_col_str + c.name + ','
	from sys.foreign_keys fk join sys.foreign_key_columns fkc 
		on fk.object_id = fkc.constraint_object_id
		join sys.columns c on c.object_id = fkc.parent_object_id and c.column_id = fkc.parent_column_id
	where fk.object_id = @fk_object_id 
	order by constraint_object_id,constraint_column_id
	set @parent_col_str = substring(@parent_col_str,1,len(@parent_col_str)-1)

	-- reference column string 
	select @referenced_col_str = @referenced_col_str + c.name + ','
	from sys.foreign_keys fk join sys.foreign_key_columns fkc 
		on fk.object_id = fkc.constraint_object_id
		join sys.columns c on c.object_id = fkc.referenced_object_id and c.column_id = fkc.referenced_column_id
	where fk.object_id = @fk_object_id 
	order by constraint_object_id,constraint_column_id
	set @referenced_col_str = substring(@referenced_col_str,1,len(@referenced_col_str)-1)


	print 'ALTER TABLE ' + @fullname + ' with nocheck '
	print 'ADD  CONSTRAINT ' + @fk_name + '_CH'
	print 'FOREIGN KEY(' + @parent_col_str + ')'
	print 'REFERENCES ' + '['+@dbname+ '].['+@schemaname+ '].[' + @referenced_tbl_name + '] '
	print '    (' + @referenced_col_str + ')'
	print ''
	fetch next from FK_cur into @fk_object_id
end

close FK_cur
deallocate FK_cur




