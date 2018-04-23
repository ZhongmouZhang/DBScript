 IF OBJECT_ID ('HFn_GetScrambledDate') IS NOT NULL
  DROP function HFn_GetScrambledDate
GO

create function [dbo].HFn_GetScrambledDate (@datestr datetime)
returns datetime
as
begin 
declare @i datetime

if (@datestr is null ) 
	set @i = null
else select @i =
		convert(datetime, 
		convert(varchar,convert(int,Metadata.[dbo].[HFn_GetScrambledString](datepart(year,@datestr)))%2000 + 2000) 
		+ '-'
		+ convert(varchar,convert(int,Metadata.[dbo].[HFn_GetScrambledString](datepart(month,@datestr)))%12 + 1)
		+ '-'
		+ convert(varchar,convert(int,Metadata.[dbo].[HFn_GetScrambledString](datepart(day,@datestr)))%28 + 1)
		+ ' '
		+ convert(varchar,convert(int,Metadata.[dbo].[HFn_GetScrambledString](datepart(hour,@datestr)))%24 + 1)
		+ ':'
		+ convert(varchar,convert(int,Metadata.[dbo].[HFn_GetScrambledString](datepart(minute,@datestr)))%60 + 1)
		+ ':'
		+ convert(varchar,convert(int,Metadata.[dbo].[HFn_GetScrambledString](datepart(second,@datestr)))%60 + 1)
		)
		
return @i

end