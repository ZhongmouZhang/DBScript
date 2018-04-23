use master
go

-- select * from hfn_parse_disk_threshold_string('H>1024; I> 2048; J> 10000',';','>')


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hfn_parse_disk_threshold_string'))
drop function [dbo].hfn_parse_disk_threshold_string
GO

Create Function dbo.hfn_parse_disk_threshold_string 
(@string varchar(500), @row_delimit char(1) = ';' ,@column_delimit char(1) = '>' )
returns @disk_limit TABLE
   (
    hd_id     varchar(3),
    disk_threshold int
   )
as
begin
	declare @disk_threshold_mb varchar(20)
	declare @drive_id varchar(5)

	declare @pos int
	declare @piece varchar(500)

	if right(rtrim(@string),1) <> @row_delimit
		set @string = @string  + @row_delimit
	set @string = replace (@string, ' ' , '')

	set @pos =  patindex('%'+ @row_delimit +'%' , @string)
	while @pos <> 0 
	begin
		set @piece = left(@string, @pos-1)
	 
		--print cast(@piece as varchar(500))
		set @drive_id = left (@piece, patindex('%' + @column_delimit+ '%', @piece)-1)
		set @disk_threshold_mb = right (@piece, len(@piece)- patindex('%' + @column_delimit+ '%', @piece))
		insert into @disk_limit values (@drive_id,@disk_threshold_mb)
		-- print @drive_id + '----------' + @disk_threshold_mb
		set @string = stuff(@string, 1, @pos, '')
		set @pos =  patindex('%'+ @row_delimit +'%' , @string)
	end
	return
end
