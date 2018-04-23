
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].HSP_GeneratingScript') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].HSP_GeneratingScript
GO

CREATE         proc dbo.HSP_GeneratingScript
as
Declare @dbname varchar(100), @schemaname varchar(20), @tblname varchar(100), @colname varchar(100), @indexname varchar(500)
declare @fullname varchar(200), @newfullname varchar(200), @ordinal_posi int , @datatype varchar(30)
declare @count int

select @dbname = 'SPR_STG', @schemaname = 'dbo'

/***********************************************************
		Drop all the foreign keys 
************************************************************/
exec HSP_GeneratingScript_DropAllFK

/************************************************************
		iterate all the tables which need to be scrambled.
************************************************************/
declare tab_cur scroll cursor for 
select distinct TableName from metadata.dbo.ScramblingTable order by TableName
open tab_cur
fetch next from tab_cur into @tblname
set @count = 1
while @@fetch_status = 0
begin
	set @fullname = '['+@dbname+ '].'+'['+@schemaname+ '].'+'['+@tblname+ ']'
	set @newfullname = '['+@dbname+ '].'+'['+@schemaname+ '].'+'['+@tblname+ '_CH]'

	print ' /************************************************  '
	print ''
	print '     ' + convert(varchar,@count) + ') Scrambling ' + @fullname + '....' 
	print ''
	print ' ***************************************************/'


	print 'print ''' + convert(varchar,@count) + ': Scrambling ' + @fullname + '....' + ''''
	print 'IF OBJECT_ID ( ''' + @newfullname + ''' ) IS NOT NULL' 
	print '    drop table ' + @newfullname
	print ''
	print 'select * into ' + @newfullname + ' from ' + @fullname + ' where 1=2 '
	
	-- set identity_insert to on
	print 'IF exists (select * from ' + @dbname + '.sys.identity_columns where object_id = object_id('''
		+ @fullname + '''))'
	print '    set identity_insert ' + @newfullname + ' on'
	print ''

	-- generating insert into select statement
	exec HSP_GeneratingScript_Insert @dbname, @schemaname, @tblname

	-- set identity_insert to off
	print ''
	print 'IF exists (select * from ' + @dbname + '.sys.identity_columns where object_id = object_id('''
		+ @fullname + '''))'
	print '    set identity_insert ' + @newfullname + ' off'
	print ''
	
	-- generating Create index statements
	exec HSP_GeneratingScript_Index @dbname, @schemaname, @tblname
	
	-- rename the scrumbled table to the original name
	print 'drop table ' + @fullname
	print 'exec sp_rename ''' + @tblname + '_CH'', ''' + @tblname + ''''
	print ''
	
	-- iterate the next table
	fetch next from tab_cur into @tblname
	set @count = @count + 1
end


close tab_cur
deallocate tab_cur


/***********************************************************
		Create all the foreign keys 
************************************************************/
exec HSP_GeneratingScript_CreateAllFK

print 'go'

/***********************************************************
		Create all the triggers which are on the scrambled table
*****************************************************************/
exec HSP_GeneratingScript_Trigger


