-- hsp_DeletetblFullDetailsWithIDRange 2007,99,99,2007,10,12

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_DeletetblFullDetailsWithIDRange') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_DeletetblFullDetailsWithIDRange
GO

CREATE         proc dbo.hsp_DeletetblFullDetailsWithIDRange
@FY int, @PER int,@PERB int, @FY2 int,@PER2 int, @PERB2 int
as

declare @beginID bigint, @endID bigint, @RangeLow bigint, @RangeHigh bigint
declare @range int
declare @rownumber int


-- select @FY, @PER, @PERB, @FY2, @PER2, @PERB2
set nocount on
		
set @Range = 10000
select @beginID = isnull (min(id), 0), @endID= isnull(max(id),0) from dbo.tblFullDetails 
where 	(FISCAL_YEAR = @FY AND ACCOUNTING_PERIOD between @PER and @PERB)
			OR (FISCAL_YEAR = @FY2 AND ACCOUNTING_PERIOD BETWEEN @PER2 AND @PERB2)

-- no records need to be deleted
if (@beginID=0)  return

set @RangeLow = @beginID
set @RangeHigh = @RangeLow + @Range-1
if (@RangeHigh>@endID) set @RangeHigh = @endID
while (@Rangelow <= @endID)
begin
	delete from dbo.tblFullDetails 
	Where id between @rangelow and @rangehigh 
		and 
		(
			(FISCAL_YEAR = @FY AND ACCOUNTING_PERIOD between @PER and @PERB)
			OR (FISCAL_YEAR = @FY2 AND ACCOUNTING_PERIOD BETWEEN @PER2 AND @PERB2)

		)
	set @rownumber = @@rowcount
	if (@rownumber > 0)
	begin
		print 'low=' + convert(varchar(30),@Rangelow) + 
			  '  high=' + convert(varchar(30),@RangeHigh)  +  
			  '  rownumber=' + convert(varchar(30),@rownumber)
	end

	set @rangelow = @rangehigh + 1
	set @rangehigh = @rangelow + @range -1
	if (@RangeHigh>@endID) set @RangeHigh = @endID
end

