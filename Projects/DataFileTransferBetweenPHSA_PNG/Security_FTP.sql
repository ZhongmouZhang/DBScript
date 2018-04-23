 REM pscp -pw mOrpheus! svcftpdbres@%source_server%:/%Source_dir%/CDR_Full*.bak %Dest_dir%/CDRFULL.bak
 
 REM pscp -pw mOrpheus! svcftpdbres@10.1.78.91:/DB_REstoreVPNGSQA02/CDR_Full*.bak D:%Dest_dir%/CDRFULL.bak
 
 pscp -pw dbres2007 svcftpdbres@10.1.78.91:/dbrest/CDR_Full*.bak D:\MSSQL\Restore

 

rem ********************************************
rem name: copy_pnglabresults.bat
rem created : Mar 2007
rem purpose: This script will copy TADIS Lab results from ftp server in png 
Rem (folder tadistest_labresults) to tadis test db server in phsabc domain

rem Dependencies : 1) Script use username svc_tadislabresults with given password
Rem 2) user svc_tadislabresults should have read/write access to source/destination folders 
rem 3) script is using ip address of gateway to connect with ftp server.

Rem **************************************
Rem Specify source (on ftp server) and destination ( on Oracle test db server)
Rem  for file transfer and log file
Rem ****************************
Rem 10.1.78.91 is the IP address of the gateway.

set source_server=10.1.78.91
set cmd_loc=c:\bin
set log_file=C:\bin\cplog.log

set source_dir=db_restore (virtual folder name)
set dest_dir=D:\MSSQL\Restore

rem ***********************************
rem start log file
rem ***********************************

echo ************************* > %log_file%
echo Logs of pscp >> %log_file%
echo ************************* >> %log_file%


rem *****************************
rem Display current date/time to log
rem ********************************

c:
cd \
cd bin

DATE /T >> %log_file%
Time /T >> %log_file%

echo. >> %log_file%

Rem display error and continue

Rem **** verify Destination folders and display error if not found

if not exist %DEST_DIR% goto destlocerror

if not %errorlevel% equ 0 goto COPYFILES

:COPYFILES

echo. >> %log_file%
echo starting Copy to get files from SOURCE DIR >>%log_file%
Echo. >> %log_file%


rem *************************************************************
rem start pscp using command line
rem **************************************************************

pscp -pw paswd123 svcftpdbres@%source_server%:/%Source_dir%/CDR_Full*.bak %Dest_dir%/CDRFULL.bak

if %errorlevel% equ 0 goto onsuccess 
goto oncopyerror

Echo ************************************ >> %log_file%
Echo ********* status of copy ************ >> %log_file%
Echo ************************************ >> %log_file%

echo. >> %log_file%

:onsuccess

echo. >> %log_file%
echo *** Files Copied successfully. *** >> %log_file%
echo. >> %log_file%

if not %errorlevel% equ 0 goto endscript
::
goto oncreatetaberror


:endscript
echo. >> %log_file%
start sendmsg mail cpdbbackup_logs
exit


Rem ****************************
rem On error , exit and return 1
rem *****************************

:oncopyerror

echo. >> %log_file%
echo *** Error Occured during copy.***>> %log_file%
echo. >> %log_file%
start sendmsg mail cpdbbackup_logs

exit 1

:destlocerror

echo. >> %log_file%
echo ************************** >>%log_file%
echo Error - verify destination folder >> %log_file%
echo ************************** >> %log_file%
echo. >> %log_file%
start sendmsg mail cpdbbackup_logs
exit 1

