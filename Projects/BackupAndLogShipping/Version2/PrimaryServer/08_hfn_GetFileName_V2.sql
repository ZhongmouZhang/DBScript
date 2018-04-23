 if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hfn_GetFileName_V2') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].hfn_GetFileName_V2
GO

CREATE   function dbo.hfn_GetFileName_V2 ( @source varchar(100))
returns varchar(100)
as
begin
	declare @loop int

	set @loop = len(@source)
	while (substring(@source, @loop,1)!= '\')
			set @loop =@loop - 1
	return substring(@source, @loop+1, len(@source)-@loop)
end

