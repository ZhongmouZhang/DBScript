/****** Object:  UserDefinedFunction [dbo].[Fn_getACharFromAString]    Script Date: 09/17/2008 11:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID ('HFn_getACharPositionFromAString') IS NOT NULL
  DROP function HFn_getACharPositionFromAString
GO

create function [dbo].[HFn_getACharPositionFromAString] (@string varchar(500), @len int, @seed float)
returns int

as
begin 
	declare @posspost int, @initpost int
	set @posspost = @len * @seed+1
	set @initpost = @posspost
	while (substring(@string,@posspost,1) = 0x80 )
	begin
		set @posspost = (@posspost + 1)%(@len+1)
		if @posspost = 0 
			set @posspost = 1
		if @posspost = @initpost
			break
	end
	return @posspost
end