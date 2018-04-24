-- population date range
declare @Sales table (TrDate datetime, Amount money)
insert @Sales select '20060501', 200
insert @Sales select '20060501', 400
insert @Sales select '20060502', 1200
;with MyCTE(d) as 
(select d = convert(datetime,'20060101')
union all 
select d = d + 1 
from MyCTE where d < '20061231')

select [day] = d.d, sum(coalesce(s.amount,0))
from MyCTE dleft join @sales son s.TrDate = d.d 
group by d.d 
order by d.doption (maxrecursion 1000)


-- parsing CVS string
declare @s varchar(1000)
select @s = 'a,b,cd,ef,zzz,hello'

;with csvtbl(i,j)as
(select i=1, j=charindex(',',@s+',')
union allselect i=j+1, j=charindex(',',@s+',',j+1) 
from csvtbl   where charindex(',',@s+',',j+1) <> 0)

select substring(@s,i,j-i)from csvtbl 