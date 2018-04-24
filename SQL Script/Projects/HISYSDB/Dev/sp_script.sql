 USE [Tax_Return]
GO
/****** Object:  UserDefinedFunction [dbo].[generate_id_of_cell_in_form]    Script Date: 02/16/2012 13:43:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[generate_id_of_cell_in_form] (@form_id int)
returns int
as
begin
declare @current_max int
select @current_max = id 
from dbo.tbl_cell_in_form
where [id] > @form_id*1000 and id < (@form_id+1)*1000
return isnull(@current_max,@form_id*1000)+1
end



------------------------------------------------------------------------------------------------------