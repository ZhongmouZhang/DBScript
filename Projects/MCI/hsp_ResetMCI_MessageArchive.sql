/*
set @Range = 1000
set @beginID = 1
set @endid = 4115793   -- last record on 2006-12-15

exec hsp_ResetMCI_MessageArchive 1000, 1005, 2001

*/


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_ResetMCI_MessageArchive') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_ResetMCI_MessageArchive
GO

CREATE         proc dbo.hsp_ResetMCI_MessageArchive
@Range int, @beginid bigint, @endid bigint

as
 
declare @RangeLow bigint, @RangeHigh bigint
declare @rownumber int


set @RangeLow = @beginID
set @RangeHigh = @RangeLow + @Range-1
if (@rangehigh > @endid)
	set @rangehigh = @endid

while (@Rangelow <= @endID)
begin
	update MessageArchive
	set ADTXML = NULL
	Where  MessageArchiveID between @rangelow and @rangehigh 

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

