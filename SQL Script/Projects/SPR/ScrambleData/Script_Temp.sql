 declare @datestr datetime 
-- set @datestr = '2008/09/15 13:15:12'

declare @tempi int	
set @tempi = 2

select dbo.HFn_GetScrambledDate(@datestr)

select convert(datetime, 
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

select Metadata.[dbo].[HFn_GetScrambledString](convert(varchar(50),@datestr,120))
	,Metadata.[dbo].[HFn_GetScrambledString](@tempi)

select * from dbo.ScrambleSeed 

select top 100 Metadata.[dbo].[HFn_GetScrambledString](born_date), born_date
from SPR_STG.dbo.md_quik_info_ORg
where born_date is not null

select top 200* from md_quik_info_ORg

select count(*) from dbo.md_quik_info_org

select top 200 * from dbo.md_quik_info_CH