/******************************************************
	select dbo.fn_replacepath ('C:\zzm\zzm\test.mdf', 'D:\test\')

*******************************************************/ 


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].FN_Replacepath'))
drop function [dbo].FN_Replacepath
GO

Create Function FN_Replacepath (@srcstring varchar(500),@destpath varchar(500))
returns varchar(500)
as
begin
	declare @posi int, @len int

	set @len = len(@srcstring)
	set @posi = @len

	while (substring(@srcstring,@posi,1)!='\')
		set @posi = @posi -1
		
	return (@destpath + substring (@srcstring, @posi+1, @len-@posi))
end
 