 -- TEST_DataCloset.dbo.hsp_DeleteDataCloset_audit 100000, 1, 5003190
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_DeleteDataCloset_audit') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_DeleteDataCloset_audit
GO

CREATE         proc dbo.hsp_DeleteDataCloset_audit
@Range int, @beginid bigint, @endid bigint

as
 
declare @RangeLow bigint, @RangeHigh bigint
declare @rownumber int

if (@endid > 5003190)
begin
	print 'Deleting the records of 2007 is not allowed'
	return
end

set @RangeLow = @beginID
set @RangeHigh = @RangeLow + @Range-1
if (@rangehigh > @endid)
	set @rangehigh = @endid

while (@Rangelow <= @endID)
begin

	delete 
	from audit
	Where MessageID between @rangelow and @rangehigh 

	set @rownumber = @@rowcount
	if (@rownumber > 0)
	begin
		print 'low=' + convert(varchar(30),@Rangelow) + 
			  '  high=' + convert(varchar(30),@RangeHigh)  +  
			  '  rownumber=' + convert(varchar(30),@rownumber)
	end
	Waitfor delay '00:00:01'
	set @rangelow = @rangehigh + 1
	set @rangehigh = @rangelow + @range-1
	if (@rangehigh > @endid)
		set @rangehigh = @endid
end

