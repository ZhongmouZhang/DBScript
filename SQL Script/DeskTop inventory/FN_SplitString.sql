

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].splitstring'))
	drop function [dbo].splitstring
go 

CREATE FUNCTION dbo.splitstring ( @stringToSplit VARCHAR(MAX),@delimiter char(1) )
RETURNS
 @returnList TABLE ([Name] [nvarchar] (500))
AS
BEGIN

 DECLARE @name NVARCHAR(255)
 DECLARE @pos INT

 WHILE CHARINDEX(@delimiter, @stringToSplit) > 0
 BEGIN
  SELECT @pos  = CHARINDEX(@delimiter, @stringToSplit)  
  SELECT @name = SUBSTRING(@stringToSplit, 1, @pos-1)

  INSERT INTO @returnList 
  SELECT @name

  SELECT @stringToSplit = SUBSTRING(@stringToSplit, @pos+1, LEN(@stringToSplit)-@pos)
 END

 if rtrim(ltrim(@stringToSplit)) !=''
	 INSERT INTO @returnList 	 SELECT @stringToSplit

 RETURN
END

go 
--SELECT * FROM dbo.splitstring('91,12,65,78,56,789', ',')