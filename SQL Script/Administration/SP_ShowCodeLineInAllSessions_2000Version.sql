  USE master
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_ShowCodeLineInAllSessions') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].SP_ShowCodeLineInAllSessions
GO


Create proc SP_ShowCodeLineInAllSessions
as
begin
	set nocount on
	declare @currSID int
	declare @tsqlText varchar(8000)
	declare @sqlHndl varbinary(20)
	declare c_spids CURSOR For
			SELECT spid from sysprocesses

	create table #currSQLinfo(spid int, sqltext varchar(8000))
	open c_spids
	fetch c_spids into @currSID
	while @@fetch_status = 0
	begin
		SELECT @sqlHndl = sql_handle
		From sysprocesses
		WHERE spid = @currSID

		SELECT @tsqlText = convert(varchar(8000), [text])
		FROM ::fn_get_sql(@sqlHndl)
		IF ISNULL(@tsqlText,'*') != '*'
		Begin
			insert #currSQLinfo values (@currSID, @tsqlText)
		end

		select @tsqlText = ''
		fetch c_spids into @currSID
	end
	close c_spids
	deallocate c_spids

	select * from #currSQLinfo where sqltext != ''
end