 
-- Return: LAST_NAME: char(30); 
--         BIRTHDATE: datetime
 if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].PH_GetPersonInfoByEmployeeID') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].PH_GetPersonInfoByEmployeeID
GO

CREATE         proc dbo.PH_GetPersonInfoByEmployeeID
@EmpID int
as
select LAST_NAME, BIRTHDATE
from dbo.PS_PERSONAL_DATA
where EMPLID=@EmpID
go


GRANT  EXECUTE  ON [dbo].PH_GetPersonInfoByEmployeeID  TO gcUser
GO