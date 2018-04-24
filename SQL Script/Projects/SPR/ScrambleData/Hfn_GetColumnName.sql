  IF OBJECT_ID ('HFn_GetColumnName') IS NOT NULL
  DROP function HFn_GetColumnName
GO

create function [dbo].HFn_GetColumnName (@tbl_id int, @col_id int)
returns varchar
as
begin
return (select column_name from INFORMATION_SCHEMA.COLUMNS
where object_id (TABLE_CATALOG+'.'+TABLE_SCHEMA+'.'+TABLE_NAME) = @tbl_id 
	and Ordinal_position = @col_id)
end