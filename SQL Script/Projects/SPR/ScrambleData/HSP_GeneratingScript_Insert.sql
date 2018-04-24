  
/********

exec HSP_GeneratingScript_Insert 'SPR_STG', 'dbo', 'md_quik_info'

***************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].HSP_GeneratingScript_Insert') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].HSP_GeneratingScript_Insert
GO

CREATE         proc dbo.HSP_GeneratingScript_Insert
@dbname varchar(100), @schemaname varchar(20), @tblname varchar(100)
as

Declare @colname varchar(100), @indexname varchar(500)
declare @fullname varchar(200), @newfullname varchar(200), @ordinal_posi int , @datatype varchar(30)

set @fullname = '['+@dbname+ '].'+'['+@schemaname+ '].'+'['+@tblname+ ']'
set @newfullname = '['+@dbname+ '].'+'['+@schemaname+ '].'+'['+@tblname+ '_CH]'

print 'insert into ' + @newfullname

declare col_cur scroll cursor for
	select ordinal_position, column_name, data_type from SPR_STG.INFORMATION_SCHEMA.COLUMNS 
	where table_catalog = @dbname and table_schema = @schemaname and table_name = @tblname
	order by ordinal_position
	open col_cur

	-- Insert column list
fetch next from col_cur into @ordinal_posi, @colname, @datatype
while @@fetch_status = 0
begin
	if @ordinal_posi = 1
		print '        ('  + @colname
	else 
		print '        ,' + @colname
	fetch next from col_cur into @ordinal_posi, @colname, @datatype
end
print '        )'

-- select column list 
fetch first from col_cur into @ordinal_posi, @colname, @datatype
while @@fetch_status = 0
begin
	if @ordinal_posi = 1
	begin 
		if exists (select * from Metadata.dbo.ScramblingTable 
					where TableName=@tblname and ColumnName=@colname and IsAnonymized = 1)  -- need to be scrambled
		begin
			if @datatype = 'datetime'
				print 'SELECT Metadata.dbo.[HFn_GetScrambledDate](' + @colname + ')'
			else
				print 'SELECT Metadata.dbo.[HFn_GetScrambledString](' + @colname + ')'
		end
		else
			print 'SELECT ' + @colname
	end
	else
	begin 
		if exists (select * from Metadata.dbo.ScramblingTable 
					where TableName=@tblname and ColumnName=@colname and IsAnonymized = 1)  -- need to be scrambled
		begin
			if @datatype = 'datetime'
				print '      ,Metadata.dbo.[HFn_GetScrambledDate](' + @colname + ')'
			else
				print '      ,Metadata.dbo.[HFn_GetScrambledString](' + @colname + ')'
		end
		else
			print '      ,' + @colname
	end
	fetch next from col_cur into @ordinal_posi, @colname, @datatype
end
close col_cur
deallocate col_cur

print 'FROM ' + @fullname
print ''

