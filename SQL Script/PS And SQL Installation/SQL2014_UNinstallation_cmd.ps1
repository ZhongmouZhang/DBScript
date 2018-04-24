$sqlInstances = gwmi win32_service -computerName localhost | ? { $_.Name -match "mssql*" -and $_.PathName -match "sqlservr.exe" } | % { $_.Caption }
$res = $sqlInstances -ne $null -and $sqlInstances -gt 0
$vals = @{ 
    Installed = $res; 
    InstanceCount = $sqlInstances.count 
}
if ( $vals.Installed)  {
    & "\\10.251.219.1\hssbc_dbs\SQL Installation Media\SQL 2014\SQL 2014 ent core 64bit\setup.exe"  /ConfigurationFile="\\10.251.219.1\hssbc_dbs\Unattended_installation\ConfigurationFile_uninstall.ini"    
    Remove-Item h:\SQL_Data -Recurse
    Remove-Item i:\SQL_Log -Recurse
    Remove-Item j:\SQL_TempDB -Recurse
    Remove-Item k:\SQL_Backup -Recurse
}