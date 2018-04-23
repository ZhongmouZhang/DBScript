 /***************************************************************************
	Reindex a database
****************************************************************************/
USE DatabaseName --Enter the name of the database you want to reindex 

DECLARE @TableName varchar(255) 

DECLARE TableCursor CURSOR FOR 
--SELECT table_name FROM information_schema.tables 
--WHERE table_type = 'base table' 
select '[' + u.name + ']' + '.[' + o.name + ']' 
from sysobjects o join sysusers u on o.uid=u.uid where xtype='U'
order by  1


OPEN TableCursor 

FETCH NEXT FROM TableCursor INTO @TableName 
WHILE @@FETCH_STATUS = 0 
BEGIN 
DBCC DBREINDEX(@TableName,'',0) 

print @tablename
print '----------------------'
print ''

FETCH NEXT FROM TableCursor INTO @TableName 
END 

CLOSE TableCursor 

DEALLOCATE TableCursor