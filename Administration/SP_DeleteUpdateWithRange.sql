  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_DeleteUpdateWithRange') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].SP_DeleteUpdateWithRange
GO

CREATE         proc dbo.SP_DeleteUpdateWithRange
@stt nvarchar(3000), @beginid bigint, @endid bigint, @range int

as

declare @RangeLow bigint, @RangeHigh bigint
declare @rownumber int

set nocount on
		
set @RangeLow = @beginID
set @RangeHigh = @RangeLow + @Range-1
if (@RangeHigh>@endID) set @RangeHigh = @endID
while (@Rangelow <= @endID)
begin
	exec sp_executesql @stt, N'@RangeB bigint, @RangeE bigint', @RangeB=@Rangelow, @RangeE=@RangeHigh
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

