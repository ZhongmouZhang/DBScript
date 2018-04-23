restore database MCI
from disk = '\\cwdp01\MCI_Backup\MCI_Full_20061216_203800.bak'
with move 'MCI' to 'E:\MSSQL.1\MSSQL\Data\MCI.mdf',
	 move 'MCI_Log' to 'E:\MSSQL.1\MSSQL\Data\MCI_Log.ldf'

