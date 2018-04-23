 -- find any object referred in a stored procedure or a view
 
 SELECT DISTINCT o.name
FROM syscomments c JOIN sysobjects o ON c.id=o.id
WHERE c.TEXT LIKE '%tblTeams%'


SELECT DISTINCT o.name, o.xtype
FROM syscomments c
INNER JOIN sysobjects o ON c.id=o.id
WHERE c.TEXT LIKE '%tblTeams%'
