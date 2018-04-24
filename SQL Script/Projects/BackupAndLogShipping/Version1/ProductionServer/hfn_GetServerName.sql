 if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hfn_GetServerName') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].hfn_GetServerName
GO

CREATE   function dbo.hfn_GetServerName ( @source varchar(100))
returns varchar(100)
as
begin
	return substring(@source, 3, charindex('\',@source, 3)-3)
end

