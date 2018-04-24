 if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].UTL_ReadErrorLog') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].UTL_ReadErrorLog
GO

CREATE         proc dbo.UTL_ReadErrorLog
as
if PATINDEX ( '%2005%' , @@version )!=22 
		and PATINDEX ( '%2000%' , @@version )!=23 
		and PATINDEX ( '%7.00%' , @@version )!=23
	return
	
if PATINDEX ( '%2005%' , @@version ) = 22  -- SQL 2005
begin	
	exec master.dbo.sp_readerrorlog
	return
end

-- processing SQL 2000 and SQL 7 error log
create table #temp
( errorlog varchar(7500), continuationRow int )
insert #temp
exec master.dbo.sp_readerrorlog

create table #temp1
( LogDate datetime, Processinfo varchar(100), ErrorMessage varchar(7500) )

declare @errorlogline varchar(8000), @errorlogpart varchar(500), @ContinuationRow int
declare MyCur cursor for select errorlog, continuationRow from #temp
declare @dateindex int, @pinfoindex int

open mycur
fetch next from mycur into  @errorlogline, @ContinuationRow  -- first line
fetch next from mycur into  @errorlogpart, @ContinuationRow  -- second line
while @@fetch_status = 0
begin 
	if @ContinuationRow = 1
	begin
		set @errorlogline = @errorlogline + @errorlogpart
	end
	else
	begin
		if substring(@errorlogline,1,2) = '20'       -- error line has time stamp
		begin
			set @dateindex = charindex(' ', @errorlogline,  15)
			set @pinfoindex = charindex(' ', @errorlogline, @dateindex + 1)
			insert into #temp1 
			values (substring(@errorlogline, 1, @dateindex-1),
					substring(@errorlogline,@dateindex+1, @pinfoindex-@dateindex),
					ltrim(substring(@errorlogline, @pinfoindex+1, len(@errorlogline)-@pinfoindex)))
		end
		else
			insert into #temp1 values (null, 'Server', @errorlogline)
		
		set @errorlogline=@errorlogpart
	end		
	fetch next from mycur into  @errorlogpart, @ContinuationRow  
end
		
if substring(@errorlogline,1,2) = '20'       -- error line has time stamp
begin
	set @dateindex = charindex(' ', @errorlogline,  15)
	set @pinfoindex = charindex(' ', @errorlogline, @dateindex + 1)
	insert into #temp1 
	values (substring(@errorlogline, 1, @dateindex-1),
			substring(@errorlogline,@dateindex+1, @pinfoindex-@dateindex),
			ltrim(substring(@errorlogline, @pinfoindex+1, len(@errorlogline)-@pinfoindex)))
end
else
	insert into #temp1 values (null, 'Server', @errorlogline)

close mycur
deallocate mycur

select * from #temp1




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

