 
 
   if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_RestoreStdbyDBToRecovery') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_RestoreStdbyDBToRecovery
GO

CREATE         proc dbo.hsp_RestoreStdbyDBToRecovery 
as

declare @dbname varchar(50)
declare MyCur cursor for 
select distinct DBname from master.dbo.RestoreLog

open myCur 
fetch next from myCur into @dbname
while @@fetch_status=0
begin
	restore database @dbname
	with recovery
	fetch next from myCur into @dbname
end
close myCur
deallocate myCur


