
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].FN_GetName'))
drop function [dbo].FN_GetName
GO

Create Function FN_GetName (@name varchar(500),@type char(1))
-- @type: 'F': first name; 'L': last name
returns varchar(500)
as
begin
	set @name = ltrim(rtrim(@name))
	declare @v_return varchar(500)
	if @name is null or @name=''
		set @v_return = ''
	else
	begin
		if (charindex(',', @name) > 0)
			set @v_return = case @type when 'F' then substring (@name, charindex (',', @name)+1, len(@name)-charindex (',', @name))
									   when 'L' then substring (@name, 1, charindex (',', @name)-1)
									   else ''
							end
	   else if (charindex(' ', @name) > 0)
			set @v_return = case @type when 'L' then substring (@name, charindex (' ', @name)+1, len(@name)-charindex (' ', @name))
									   when 'F' then substring (@name, 1, charindex (' ', @name)-1)
									   else ''
							end
		else
			set @v_return = ''
	end

	return ltrim(rtrim(@v_return))
end
 