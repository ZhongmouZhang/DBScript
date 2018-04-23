
/************************************************
 AF = Aggregate function (CLR)
C = CHECK constraint
D = DEFAULT (constraint or stand-alone)
F = FOREIGN KEY constraint
PK = PRIMARY KEY constraint
P = SQL stored procedure
PC = Assembly (CLR) stored procedure
FN = SQL scalar function
FS = Assembly (CLR) scalar function
FT = Assembly (CLR) table-valued function
R = Rule (old-style, stand-alone)
RF = Replication-filter-procedure
S = System base table
SN = Synonym
SQ = Service queue
TA = Assembly (CLR) DML trigger
TR = SQL DML trigger
IF = SQL inline table-valued function
TF = SQL table-valued-function
U = Table (user-defined)
UQ = UNIQUE constraint
V = View
X = Extended stored procedure
IT = Internal table


exec UTL_GrantUserViewPermission '[PHSAPNG\kmao]'
***********************************************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].UTL_GrantUserViewPermission') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].UTL_GrantUserViewPermission
GO


create proc [dbo].UTL_GrantUserViewPermission
@username  varchar(100)

as

declare myCur cursor for 
SELECT isnull (OBJECT_NAME(schema_id), 'dbo') + '.' + name 
FROM SPR.sys.objects
WHERE type in ('P','FN', 'U', 'V', 'X')

declare @stt nvarchar(1024)
declare @object varchar(500)

open myCur
Fetch next from myCur into @object

while @@fetch_status = 0
begin
	set @object = rtrim(@object)
	set @stt = 	'use SPR; grant view definition on ' + @object + ' to ' + @username

		--print @stt
		exec (@stt)
	if (@@error!=0)
		print @stt
	Fetch next from myCur into @object
end
close myCur
deallocate myCur
