 -- truncate table DASE
bulk insert dbo.DASE
from 'C:\Temp\ITGAudit\extractData_0901-0907\dase.txt'
with
(
        FIELDTERMINATOR = '|'
)

-- truncate table dbo.DCPE
bulk insert dbo.DCPE
from 'C:\Temp\ITGAudit\extractData_0901-0907\DCPE.txt'
with
(
        FIELDTERMINATOR = '|'
)

-- truncate table dbo.ETCA
bulk insert dbo.ETCA
from 'C:\Temp\ITGAudit\ExtractData\ETCA.txt'
with
(
        FIELDTERMINATOR = '|'
)

-- truncate table dbo.STDY
bulk insert dbo.STDY
from 'C:\Temp\ITGAudit\extractData_0901-0907\STDY.txt'
with
(
        FIELDTERMINATOR = '|'
)


