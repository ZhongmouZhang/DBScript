IF OBJECT_ID('Employees', 'U') IS NOT NULL
DROP TABLE dbo.Employees
GO
CREATE TABLE dbo.Employees
(
  EmployeeID int NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  ManagerID int NULL
)
GO
INSERT INTO Employees VALUES (101, 'Ken', 'Sánchez', NULL)
INSERT INTO Employees VALUES (102, 'Terri', 'Duffy', 101)
INSERT INTO Employees VALUES (103, 'Roberto', 'Tamburello', 101)
INSERT INTO Employees VALUES (104, 'Rob', 'Walters', 102)
INSERT INTO Employees VALUES (105, 'Gail', 'Erickson', 102)
INSERT INTO Employees VALUES (106, 'Jossef', 'Goldberg', 103)
INSERT INTO Employees VALUES (107, 'Dylan', 'Miller', 103)
INSERT INTO Employees VALUES (108, 'Diane', 'Margheim', 105)
INSERT INTO Employees VALUES (109, 'Gigi', 'Matthew', 105)
INSERT INTO Employees VALUES (110, 'Michael', 'Raheem', 106)



WITH
  cteReports (EmpID, FirstName, LastName, MgrID, EmpLevel)
  AS
  (
    SELECT EmployeeID, FirstName, LastName, ManagerID, 1
    FROM Employees
    WHERE ManagerID IS NULL
    UNION ALL
    SELECT e.EmployeeID, e.FirstName, e.LastName, e.ManagerID,
      r.EmpLevel + 1
    FROM Employees e
      INNER JOIN cteReports r
        ON e.ManagerID = r.EmpID
  )
SELECT
  FirstName + ' ' + LastName AS FullName,
  EmpLevel,
  (SELECT FirstName + ' ' + LastName FROM Employees
    WHERE EmployeeID = cteReports.MgrID) AS Manager
FROM cteReports
ORDER BY EmpLevel, MgrID