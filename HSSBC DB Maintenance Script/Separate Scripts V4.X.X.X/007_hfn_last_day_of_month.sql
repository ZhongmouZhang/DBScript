if exists (select * from dbo.sysobjects where id = object_id(N'hfn_last_day_of_month'))
drop function hfn_last_day_of_month
GO


CREATE function    hfn_last_day_of_month

(
    @Date DATETIME
)
RETURNS DATETIME
AS
BEGIN

    RETURN DATEADD(d, -1, DATEADD(m, DATEDIFF(m, 0, @Date) + 1, 0))

END


go


