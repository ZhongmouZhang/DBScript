
1.Detach the damaged msdb. You can't just detach msdb because you're not allowed to detach system databases. 
However, you can if you start the server with trace flag 3608. 
I did this by shutting down the server, navigating to the directory 'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Binn' 
3608and doing the following: start sqlservr.exe -c -m -T3608

2.Move or rename the damaged msdb files (msdbdata.mdf and msdblog.ldf in the 'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data' directory)
  sp_detach-db 'msdb'

3.Run the instmsdb.sql script in the 'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Install' directory

4.Shutdown and restart the server without the 3608 trace flag

5. run the Services package to upgrade to the right one. 
