
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].FN_GetPhoneNumber'))
drop function [dbo].FN_GetPhoneNumber
GO

Create Function FN_GetPhoneNumber (@phone varchar(500),@type char(1))
-- @type: 'D': direct; 'M': mobile
returns varchar(500)
as
begin
	declare @v_return varchar(500)
	set @phone = ltrim(rtrim(@phone))
	if @phone is null or @phone='' or @phone='D:M:'
		set @v_return = ''
	else if charindex('D:', @phone) > 0
	begin
		if @type='D'
		begin 
			if charindex('M:', @phone) > 0
				set @v_return=substring (@phone, charindex ('D:', @phone)+2, charindex('M:', @phone) -charindex ('D:', @phone)-2)
			else 
				set @v_return=substring (@phone, charindex ('D:', @phone)+2, len(@phone) -charindex ('D:', @phone)-2)
		end
		else 
		begin 
			if charindex('M:', @phone) > 0 and charindex ('M:', @phone)+2 < len (@phone)
				set @v_return=substring (@phone, charindex ('M:', @phone)+2, len(@phone) -charindex ('M:', @phone)-2)
			else 
				set @v_return=''
		end
	end
	else
	begin
		if @type='D'
			set @v_return = @phone
		else
			set @v_return = ''
	end
		
	return ltrim(rtrim(@v_return))
end
 