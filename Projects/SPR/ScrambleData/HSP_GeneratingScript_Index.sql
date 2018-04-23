   
/********

exec HSP_GeneratingScript_index 'SPR_STG', 'dbo', 'spr_bp_feedback_head'

***************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].HSP_GeneratingScript_Index') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].HSP_GeneratingScript_index
GO

CREATE         proc dbo.HSP_GeneratingScript_Index
@db_name varchar(100), @schema_name varchar(20), @tbl_name varchar(100)
as

declare @index_name varchar(200), @index_id int, @index_col_str varchar(1000), @included_col_str varchar(1000)
declare @type int, @is_primary_key int, @is_unique int
declare @full_name varchar(200), @newfull_name varchar(200)

set @full_name = '['+@db_name+ '].'+'['+@schema_name+ '].'+'['+@tbl_name+ ']'
set @newfull_name = '['+@db_name+ '].'+'['+@schema_name+ '].'+'['+@tbl_name+ '_CH]'

declare index_id_cur cursor for 
select distinct index_id from sys.indexes 
where object_id = object_id (@full_name) and type !=  0 
order by index_id

open index_id_cur
fetch next from index_id_cur into @index_id
while @@fetch_status = 0
begin
	select @index_col_str = '', @included_col_str = ''

	-- index column string
	select @index_col_str = @index_col_str + c.name
		+ case is_descending_key when 0 then ' ASC, ' else ' DESC, ' end
	from sys.indexes i join sys.index_columns ic 
	on i.object_id=ic.object_id and i.index_id = ic.index_id
	join sys.columns c on ic.object_id = c.object_id and ic.column_id=c.column_id
	where i.object_id = object_id (@full_name)
		and i.index_id = @index_id and ic.is_included_column = 0
	order by index_column_id
	if (len(@index_col_str) > 1) 
		set @index_col_str = substring (@index_col_str, 1, len(@index_col_str)-1)

	-- index included column string 
	select @included_col_str = @included_col_str + c.name + ', '
	from sys.indexes i join sys.index_columns ic 
	on i.object_id=ic.object_id and i.index_id = ic.index_id
	join sys.columns c on ic.object_id = c.object_id and ic.column_id=c.column_id
	where i.object_id = object_id (@full_name)
		and i.index_id = @index_id and ic.is_included_column = 1
	order by index_column_id
	if (len(@included_col_str) > 1) 
		set @included_col_str = substring (@included_col_str, 1, len(@included_col_str)-1)

	-- index name
	select @index_name = name, @type = type,   -- 0: heap  1: clustered  2: nonclustered
			@is_unique = is_unique, @is_primary_key = is_primary_key
	from sys.indexes 
	where object_id = object_id (@full_name)
		and index_id = @index_id 
		
	if (@is_primary_key = 1)
	begin
		print 'ALTER TABLE ' + @newfull_name
		print 'ADD CONSTRAINT ' +@index_name + '_CH'
		print 'PRIMARY KEY CLUSTERED '
		print '('
		print  @index_col_str
		print ')'
		print ''
	end
	else  -- no PK
	begin
		print 'Create ' + case @is_unique when 1 then 'UNIQUE ' else '' end
				+ case @type when 1 then 'CLUSTERED ' else 'NONCLUSTERED ' end + 'INDEX '
				+@index_name + '_CH'
		print 'ON ' + @newfull_name
		print '('
		print @index_col_str
		print ')'
		if (len(@included_col_str) > 0) 
		begin
			print 'INCLUDE'
			print '('
			print @included_col_str
			print ')'
		end
	end
	print ''
	fetch next from index_id_cur into @index_id
end

close index_id_cur
deallocate index_id_cur
