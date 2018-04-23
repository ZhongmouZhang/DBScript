-- select ascii('1'), ascii('0'), ascii('A'), ascii('F')

create function BinaryToString (@binary varbinary(90), @len int)
returns varchar(180)
as
begin
	declare @DATA_Char varchar(180)
	declare @hc int, @lc int
	
	declare @loop int
	
	-- select top 1 @data_02 = PCF1_Data_02 from PCF1
	set @DATA_Char = ''
	set @loop=1
	while @loop<=@len
	begin
		set @hc = substring (@binary,@loop, 1)/16
		set @lc = substring (@binary,@loop, 1)%16
	    
		set @DATA_Char = @DATA_Char + 
			+ case when @hc<10 then CHAR(@hc+48) else CHAR(@hc+55) end
			+ case when @lc<10 then CHAR(@lc+48) else CHAR(@lc+55) end
	
		set @loop = @loop + 1
	end 
	
	return @DATA_Char
end 
go

-- select @hc, @lc, @DATA_02_Char, @data_02

--select char (65)