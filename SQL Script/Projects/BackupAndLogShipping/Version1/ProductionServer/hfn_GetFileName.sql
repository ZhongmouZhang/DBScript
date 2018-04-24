if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hfn_GetFileName') and OBJECTPROPERTY(id, N'IsScalarFunction') = 1)
drop function [dbo].hfn_GetFileName
GO

CREATE   function dbo.hfn_GetFileName ( @source varchar(100))
returns varchar(100)
as
begin
	declare @loop int

	set @loop = len(@source)
	while (substring(@source, @loop,1)!= '\')
			set @loop =@loop - 1
	return substring(@source, @loop+1, len(@source)-@loop)
end

