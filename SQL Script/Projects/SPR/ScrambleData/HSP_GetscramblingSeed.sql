  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].HSP_GetscramblingSeed') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].HSP_GetscramblingSeed
GO

CREATE         proc dbo.HSP_GetscramblingSeed
@source varchar(500) ,
@dest varchar(500) output
as
declare @loop int, @sourcelen int, @posi int

set @loop = 1
set @sourcelen = len(@source)
set @dest = ''

while @loop <= @sourcelen
begin
	set @posi = dbo.[Fn_getACharPositionFromAString](@source, @sourcelen, rand())
	set @dest = @dest + substring (@source, @posi,1)
	set @source = stuff (@source,@posi,1,0x80)
	set @loop = @loop + 1
end
--print @dest
