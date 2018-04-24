# Uninstall-WindowsFeature Net-Framework-Core

$setupDriveLetter = (Mount-DiskImage -ImagePath "\\10.251.219.1\hssbc_dbs\SQL Installation Media\Windows 2012\SW_DVD5_Windows_Svr_Std_and_DataCtr_2012_R2_64Bit_English_Core_MLF_X19-05182.ISO" -PassThru | Get-Volume).DriveLetter + ":"
 if ($setupDriveLetter -eq $null) {
    throw "Could not mount SQL install iso"
 }
 write-Verbose "Drive letter for iso is: $setupDriveLetter" -Verbose
 
 Install-WindowsFeature Net-Framework-Core -source $setupDriveLetter\sources\sxs
 Install-WindowsFeature Net-Framework-45-Core -source $setupDriveLetter\sources\sxs

 Dismount-DiskImage  -ImagePath "\\10.251.219.1\hssbc_dbs\SQL Installation Media\Windows 2012\SW_DVD5_Windows_Svr_Std_and_DataCtr_2012_R2_64Bit_English_Core_MLF_X19-05182.ISO"

$sqlInstances = gwmi win32_service -computerName localhost | ? { $_.Name -match "mssql*" -and $_.PathName -match "sqlservr.exe" } | % { $_.Caption }
$res = $sqlInstances -ne $null -and $sqlInstances -gt 0
$vals = @{ 
    Installed = $res; 
    InstanceCount = $sqlInstances.count 
}
if ( -not( $vals.Installed))  {
    & "\\10.251.219.1\hssbc_dbs\SQL Installation Media\SQL 2014\SQL 2014 ent core 64bit\setup.exe"  /ConfigurationFile="\\10.251.219.1\hssbc_dbs\Unattended_installation\ConfigurationFile.ini"    
}

# installing Maintenance script

$timestamp=$(Get-Date -f yyyyMMdd_HHmmss)

sqlcmd -i "\\10.251.219.1\hssbc_dbs\Unattended_installation\Maintenance Script\01_setup_database_mail_sql_agent_alert.sql" >> "\\10.251.219.1\hssbc_dbs\Unattended_installation\log\$($env:COMPUTERNAME)_output_$timestamp.log"
sqlcmd -i "\\10.251.219.1\hssbc_dbs\Unattended_installation\Maintenance Script\02_db_maint_script_package_V4.sql"  >> "\\10.251.219.1\hssbc_dbs\Unattended_installation\log\$($env:COMPUTERNAME)_output_$timestamp.log"
sqlcmd -i "\\10.251.219.1\hssbc_dbs\Unattended_installation\Maintenance Script\03_post_installation.sql"  >> "\\10.251.219.1\hssbc_dbs\Unattended_installation\log\$($env:COMPUTERNAME)_output_$timestamp.log"

# restart SQL Server and SQL Agent
Restart-Service MSSQLSERVER -Force
Restart-Service SQLSERVERAGENT