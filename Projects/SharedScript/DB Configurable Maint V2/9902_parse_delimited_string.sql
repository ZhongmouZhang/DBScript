 --select * from hfn_parse_delimited_string('H>1024; I> 2048; J> 10000',';')

use master;
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hfn_parse_delimited_string'))
drop function [dbo].hfn_parse_delimited_string
GO

Create Function dbo.hfn_parse_delimited_string 
(@string varchar(5000), @delimitor char(1))
returns @list TABLE
   (
    val     varchar(5000)
   )
as
begin
	declare @pos int
	declare @piece varchar(500)

	if right(rtrim(@string),1) <> @delimitor
		set @string = @string  + @delimitor
	set @string = replace (@string, ' ' , '')

	set @pos =  patindex('%'+ @delimitor +'%' , @string)
	while @pos <> 0 
	begin
		set @piece = left(@string, @pos-1)
	 
		--print cast(@piece as varchar(500))
		insert into @list values (@piece)
		-- print @drive_id + '----------' + @disk_threshold_mb
		set @string = stuff(@string, 1, @pos, '')
		set @pos =  patindex('%'+ @delimitor +'%' , @string)
	end
	return
end
