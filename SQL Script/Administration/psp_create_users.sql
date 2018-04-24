
/*****************************************************************************

	create the Login users if they are not created in the server
	
******************************************************************************/
create table #users
(
	username varchar(100)
)

insert #users (username) values ('web')
insert #users (username) values ('drobinson')
insert #users (username) values ('jz')
insert #users (username) values ('rradu')
insert #users (username) values ('rarnold')
insert #users (username) values ('jlu')
insert #users (username) values ('Corinne')
insert #users (username) values ('BenF')
insert #users (username) values ('Anna')
insert #users (username) values ('Almir')


insert #users (username) values ('xtian')
insert #users (username) values ('PC')
insert #users (username) values ('lprimgaard')
insert #users (username) values ('rellis')

declare user_cur cursor for select username	from #users

declare @username varchar(100)
declare @cmdStr nvarchar(1000)

open user_cur
fetch next from user_cur into @username

while (@@fetch_status = 0 )
begin
	if not exists (select * from sys.server_principals where name = @username)
	BEGIN
		declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'Peerflix', @loginlang = N'us_english'
		if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
			select @logindb = N'master'
		if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
			select @loginlang = @@language
		exec sp_addlogin @username, 'p@ssword', @logindb, @loginlang
		set @cmdStr = 'create login ' + @username + ' with password = ''p@ssword'' must_change, Check_Expiration=on ' +
			', Default_database = ' + @logindb + ', DEFAULT_LANGUAGE = ' + @loginlang
		exec sp_executesql @cmdStr
	END
	
	fetch next from user_cur into @username
end

close user_cur
deallocate user_cur



/***********************************************************************

	Grant Sysadmin role

************************************************************************/

exec sp_addsrvrolemember N'drobinson', sysadmin
GO

exec sp_addsrvrolemember N'jlu', sysadmin
GO

exec sp_addsrvrolemember N'rarnold', sysadmin
GO

exec sp_addsrvrolemember N'rradu', sysadmin
GO

exec sp_addsrvrolemember N'jz', sysadmin
GO

exec sp_addsrvrolemember N'Corinne', sysadmin
GO

exec sp_addsrvrolemember N'BenF', sysadmin
GO

exec sp_addsrvrolemember N'Anna', sysadmin
GO

exec sp_addsrvrolemember N'Almir', sysadmin
GO

/************************************************************************

	Drop and recreate the database users
	
*************************************************************************/
use peerflix_QA
go

IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'drobinson')
DROP SCHEMA drobinson
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'drobinson')
DROP USER drobinson


IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'jlu')
DROP SCHEMA jlu
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jlu')
DROP USER jlu


IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'rarnold')
DROP SCHEMA rarnold
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'rarnold')
DROP USER rarnold


IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'rradu')
DROP SCHEMA rradu
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'rradu')
DROP USER rradu


IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'jz')
DROP SCHEMA jz
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jz')
DROP USER jz

IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'BenF')
DROP SCHEMA BenF
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'BenF')
DROP USER BenF

IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Anna')
DROP SCHEMA Anna
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Anna')
DROP USER Anna


------------------------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'rshah')
DROP SCHEMA [rshah]
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'rshah')
DROP USER [rshah]

IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'mtait')
DROP SCHEMA mtait
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'mtait')
DROP USER mtait


IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'xtian')
DROP SCHEMA xtian
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'xtian')
DROP USER xtian
CREATE USER xtian FROM LOGIN xtian 
grant Select, update, insert to xtian


IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'lprimgaard')
DROP SCHEMA lprimgaard
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'lprimgaard')
DROP USER lprimgaard
CREATE USER lprimgaard FROM LOGIN lprimgaard 
grant Select to lprimgaard


IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'pc')
DROP SCHEMA pc
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'pc')
DROP USER pc
CREATE USER pc FROM LOGIN pc 
grant Select to pc

IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'rellis')
DROP SCHEMA rellis
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'rellis')
DROP USER rellis
CREATE USER rellis FROM LOGIN rellis 
grant Select to rellis








