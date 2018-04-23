 
-- select * from dbo.fn_Split ('tetst,2222,3333,',',')
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].FN_Split'))
drop function [dbo].FN_Split
GO


CREATE FUNCTION FN_Split(
@IDValues as varchar(5000),
@Delimeter as varchar(1)
)
RETURNS @tValues TABLE(parameter varchar(500))
AS
BEGIN
	DECLARE @I AS INT, @Aux AS INT
	SET @I = 1
	SET @Aux = 1
	WHILE @I <= LEN(@IDValues)
	BEGIN
		IF SUBSTRING(@IDValues,@I,1)= @Delimeter
		BEGIN
			INSERT INTO @tValues (parameter) VALUES (SUBSTRING(@IDValues,@Aux,(@I-@Aux)))
			SET @Aux = @i + 1
		END
		SET @i = @i + 1
	END
RETURN
END

