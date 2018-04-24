if exists (select * from dbo.sysobjects where id = object_id(N'hfn_week_number_in_month'))
drop function hfn_week_number_in_month
GO


CREATE function    hfn_week_number_in_month
( @date datetime )
returns int
begin
	return (select datediff(week, dateadd(week, datediff(week, 0, dateadd(month, datediff(month, 0, @date), 0)), 0), @date - 1) + 1)
end

go


