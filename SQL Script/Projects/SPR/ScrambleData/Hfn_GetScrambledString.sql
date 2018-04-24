 USE [Metadata]
GO
/****** Object:  UserDefinedFunction [dbo].[Fn_getACharFromAString]    Script Date: 09/17/2008 11:29:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID ('HFn_GetScrambledString') IS NOT NULL
  DROP function HFn_GetScrambledString
GO

create function [dbo].HFn_GetScrambledString (@string varchar(500))
returns varchar (500)
as
begin 
	declare @digitalSeed varchar(10)
	declare @alphebetSeed varchar (26)
	declare @scrambledstring varchar(500)
	declare @strlen int, @loop int, @t int

	if (@string is null ) return NULL
	
	select top 1 @digitalSeed = DigitalSeed, @alphebetSeed=AlphebetSeed from dbo.ScrambleSeed
	set @strlen = len(@string)
	set @loop = 1
	set @scrambledstring = ''
	while (@loop <= @strlen)
	begin
		set @t = ascii(substring (@string, @loop, 1))
		if @t between 48 and 57
			set @scrambledstring = @scrambledstring + substring (@digitalseed, convert(int, @t)-47, 1)
		else if (@t between 65 and 90) 
			set @scrambledstring = @scrambledstring + substring (@alphebetSeed, convert(int, @t)-64, 1)
		else if (@t between 97 and 122)
			set @scrambledstring = @scrambledstring + substring (@alphebetSeed, convert(int, @t)-96, 1)
		else 
			set @scrambledstring = @scrambledstring + char(@t)
		set @loop = @loop + 1
	end
	return @scrambledstring
end
