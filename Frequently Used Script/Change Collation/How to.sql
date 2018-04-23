1. rebuild master database
	1) SELECT SERVERPROPERTY(N'Collation')

	2) SELECT * FROM sys.configurations;
			-- OR
		EXEC SP_CONFIGURE
	3) script job and login 
	4) detach the user databases 
	5) rebuild system databases
		Setup /QUIET /ACTION=REBUILDDATABASE /INSTANCENAME=MANVENDRA /SQLSYSADMINACCOUNTS=gourang\hariom /SAPWD= M@nVendr4 /SQLCOLLATION=SQL_Latin1_General_CP1_CI_AI

		Setup /QUIET /ACTION=REBUILDDATABASE /INSTANCENAME=MSSQLSERVER /SQLSYSADMINACCOUNTS=HealthBC\JZ1337_SA

	6) attach user databasbes


2. not working somehow

	in folder C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\Binn
	sqlservr -m -T4022 -T3659 -s"SQLEXP2014" -q"SQL_Latin1_General_CP1_CI_AI"

	Parameters used: 
		[-m] single user admin mode 
		[-T] trace flag turned on at startup 
		[-s] sql server instance name 
		[-q] new collation to be applied


		sqlservr -m -T4022 -T3659 -q"Latin_General_CI_AS"