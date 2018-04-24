 create function UTL_GetAPortionFromAString (@string varchar(5000),@delimiter varchar(10), @SectionNum int)
returns varchar (5000)
as
begin 
	declare @loop int, @startposi int, @foundposi int
	select @loop = 1, @foundposi = 0

	if @SectionNum < 1 
		return ''

	while @loop <= @SectionNum
	begin
		set @startposi = @foundposi + 1
		set @foundposi = charindex (@delimiter, @string, @startposi)
		if @foundposi = 0
		begin
			if @loop = @SectionNum
				return substring (@string, @startposi, len(@string)-@startposi +1)
			else 
				return ''
		end
		set @loop = @loop + 1
	end
	return substring (@string, @startposi, @foundposi-@startposi )
end