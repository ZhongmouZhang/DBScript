/*************************************************************

This script is for grant the same permission on the current database

****************************************************************/


declare @source_login varchar(64)
declare @dest_login varchar(64)  
declare @database_name varchar(128)
declare @stt varchar(2048)

set @source_login = 'PHSABC\x-james'
set @dest_login = 'PHSABC\jzhang2'

-- create a login for @dest_login
IF NOT EXISTS(SELECT name FROM sys.server_principals WHERE name = @dest_login)
BEGIN
	set @stt = 'CREATE LOGIN [' + @dest_login + '] FROM WINDOWS'
	exec (@stt)                        
END

-- create a database user on a specific database
if not exists(select * from sys.database_principals where name = @dest_login)
begin
	set @stt = 'CREATE USER [' + @dest_login + '] FOR login [' + @dest_login + ']'
	exec( @stt)
end

-- add into the same role as the source account
set @stt = ''
SELECT  @stt = @stt + 'EXEC sp_addrolemember @rolename ='
    + SPACE(1) + QUOTENAME(USER_NAME(rm.role_principal_id), '''') + ', @membername =' 
	+ SPACE(1) + QUOTENAME(@dest_login, '''') + ';
'
FROM    sys.database_role_members AS rm
WHERE   USER_NAME(rm.member_principal_id) = @source_login

-- print '@stt=' + @stt
exec (@stt)

-- grant object level permission
/*********************************************/
/*********  OBJECT LEVEL PERMISSIONS *********/
/*********************************************/
set @stt = ''
SELECT  @stt = @stt + CASE 
            WHEN perm.state <> 'W' THEN perm.state_desc 
            ELSE 'GRANT'
        END
        + SPACE(1) + perm.permission_name + SPACE(1) + 'ON ' + QUOTENAME(SCHEMA_NAME(obj.schema_id)) + '.' + QUOTENAME(obj.name) --select, execute, etc on specific objects
        + CASE
                WHEN cl.column_id IS NULL THEN SPACE(0)
                ELSE '(' + QUOTENAME(cl.name) + ')'
          END
        + SPACE(1) + 'TO' + SPACE(1) + '[' + @dest_login + ']' COLLATE database_default
        + CASE 
                WHEN perm.state <> 'W' THEN SPACE(0)
                ELSE SPACE(1) + 'WITH GRANT OPTION'
          END
            
FROM    
    sys.database_permissions AS perm
        INNER JOIN
    sys.objects AS obj
            ON perm.major_id = obj.[object_id]
        INNER JOIN
    sys.database_principals AS usr
            ON perm.grantee_principal_id = usr.principal_id
        LEFT JOIN
    sys.columns AS cl
            ON cl.column_id = perm.minor_id AND cl.[object_id] = perm.major_id
WHERE usr.name = @source_login

-- print @stt
exec (@stt)
