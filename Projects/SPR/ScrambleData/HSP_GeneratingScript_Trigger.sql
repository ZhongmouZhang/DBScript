   
/********

exec HSP_GeneratingScript_Trigger

***************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].HSP_GeneratingScript_Trigger') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].HSP_GeneratingScript_Trigger
GO

CREATE         proc dbo.HSP_GeneratingScript_Trigger
as

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
( id int identity primary key, text varchar(5000))

set nocount on
-- insert all the triggers' text into a temp table
declare @trigger_name varchar(200), @text varchar(5000)

declare trigger_cur cursor for 
select name 
from sys.triggers
where object_name(parent_id) in (select distinct tablename from Metadata.dbo.ScramblingTable) 
order by object_name(parent_id)

open trigger_cur
fetch next from trigger_cur into @trigger_name
while @@fetch_status = 0
begin
	insert into #temp(text) values ('/*******************************************************  ')
	insert into #temp(text) values ('  ')
	insert into #temp(text) values ('                  Trigger: ' + @trigger_name)
	insert into #temp(text) values ('  ')
	insert into #temp(text) values ('*******************************************************/')
	insert into #temp(text)
	exec sp_helptext @trigger_name
	fetch next from trigger_cur into @trigger_name
	insert into #temp (text) values ('go')
	insert into #temp (text) values ('   ')
end
close trigger_cur
deallocate trigger_cur

-- print out the trigger text
print '/***********************************************************************************'
print ''
print '          Creating all the triggers which are on the scrambled tables'
print ''
print '************************************************************************************/'

declare text_cur cursor for select text from #temp order by id
open text_cur
fetch next from text_cur into @text
while @@fetch_status = 0
begin
	print @text
	fetch next from text_cur into @text
end
close text_cur
deallocate text_cur

 

