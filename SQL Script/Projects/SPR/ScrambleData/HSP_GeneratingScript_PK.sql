  
/********

exec HSP_GeneratingScript_PK 'SPR_STG', 'dbo', 'md_quik_info'

***************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].HSP_GeneratingScript_PK') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].HSP_GeneratingScript_PK
GO

CREATE         proc dbo.HSP_GeneratingScript_PK
@dbname varchar(100), @schemaname varchar(20), @tblname varchar(100)
as

-- generating Create PK statement
declare @pk_name varchar(200), @index_col_id int, @colname varchar(200)
declare @fullname varchar(200), @newfullname varchar(200)
set @fullname = '['+@dbname+ '].'+'['+@schemaname+ '].'+'['+@tblname+ ']'
set @newfullname = '['+@dbname+ '].'+'['+@schemaname+ '].'+'['+@tblname+ '_CH]'

declare  col_cur scroll cursor for
select PK_name,column_name, index_column_id from 
(
	select column_name,Ordinal_position
	from SPR_STG.INFORMATION_SCHEMA.COLUMNS 
	where table_catalog = @dbname and table_schema = @schemaname and table_name = @tblname
) cn
join 
(
	select i.name PK_NAME, c.object_id, index_column_id, column_id,key_ordinal 
	from SPR_STG.sys.index_columns c join SPR_STG.sys.indexes i on c.object_id = i.object_id   -- both the object_id are table ID
	where i.object_id =  object_id(@dbname+'.'+@schemaname+'.'+@tblname) 
		and i.index_id=1 and c.index_id = 1  -- PK
) PK_ID on cn.ordinal_position = PK_ID.column_id
order by index_column_id

open col_cur
fetch next from col_cur into @pk_name, @colname, @index_col_id
while @@fetch_status = 0
begin
	if @index_col_id = 1
	begin 
		print 'ALTER TABLE ' + @newfullname
		print 'ADD CONSTRAINT ' +@pk_name + '_CH'
		print 'PRIMARY KEY CLUSTERED '
		print '('
		print '    ' + @colname
	end
	else
		print '   ,' + @colname
	fetch next from col_cur into @pk_name, @colname, @index_col_id
end
	-- decide if there is a PK
fetch first from col_cur into @pk_name, @colname, @index_col_id
if @@fetch_status = 0 
	print ')'
close col_cur
deallocate col_cur
