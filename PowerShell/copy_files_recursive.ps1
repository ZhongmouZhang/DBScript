<#

###  Old Version

$Source = '\\SPDBS011\k$\SQL_Backup'
$Destination = '\\10.251.219.1\hssbc_dbs\Adhoc_backup\SPDBS011'

get-childitem -Path $src -recurse | where-object {$_.LastWriteTime -gt (get-date).AddDays(-1)} | ForEach {
    $Path = ($_.DirectoryName + "\") -Replace [Regex]::Escape($Source), $Destination
    If(!(Test-Path $Path)){New-Item -ItemType Directory -Path $Path -Force | Out-Null }
    Copy-Item $_.FullName -Destination $Path -Force
}

#>

## copy the latest full backups in all the subfolder

# Find newest file of each subfolder
$source = 'K:\SQL_backup'
$destination = '\\10.251.219.1\hssbc_dbs\Adhoc_backup\SPDBS010'

#Grab a recursive list of all subfolders
$SubFolders = dir $source -Recurse | Where-Object {$_.PSIsContainer} | ForEach-Object -Process {$_.FullName}
 
#Iterate through the list of subfolders and grab the first file in each
ForEach ($Folder in $SubFolders)
    {
    dir $Folder | Where-Object {!$_.PSIsContainer -AND $_.Name -LIKE '*_FULL_*.bak'} | 
        Sort-Object {$_.LastWriteTime} -Descending | Select-Object -First 1 | 
        ForEach {
            $Path = ($_.DirectoryName + "\") -Replace [Regex]::Escape($source), $destination
            If(!(Test-Path $Path)) { New-Item -ItemType Directory -Path $Path -Force | Out-Null }
            Copy-Item $_.FullName -Destination $Path -Force
        }
    }
















## copy files if not exists
$Source = "\\SPDBS011\k$\SQL_Backup"
$Destination = "\\10.251.219.1\hssbc_dbs\Adhoc_backup\SPDBS011"

Get-ChildItem $Source -Recurse  | where-object {$_.LastWriteTime -gt (get-date).AddDays(-1)} | ForEach {
    $ModifiedDestination = $($_.FullName).Replace("$Source","$Destination")
    If ((Test-Path $ModifiedDestination) -eq $False) {
        Copy-Item $_.FullName $ModifiedDestination
    }
}


## copy yesterday's full backup
$source = 'K:\SQL_backup'
$destination = '\\10.251.219.1\hssbc_dbs\Adhoc_backup\SPDBS010'
Get-ChildItem $source -Recurse | Where-Object { $_.FullName -like '*_full_*.bak' -and $_.LastWriteTime -gt (get-date).AddDays(-1) } | ForEach {
    $Path = ($_.DirectoryName + "\") -Replace [Regex]::Escape($source), $destination
    If(!(Test-Path $Path)){New-Item -ItemType Directory -Path $Path -Force | Out-Null }
    Copy-Item $_.FullName -Destination $Path -Force
}



## copy log backup
$source = 'K:\SQL_backup'
$destination = '\\10.251.219.1\hssbc_dbs\Adhoc_backup\SPDBS010'
Get-ChildItem $source -Recurse | Where-Object { $_.FullName -like '*_log_*.bak'  -and $_.LastWriteTime -gt (get-date).AddDays(-1) } |  ForEach {
    $ModifiedDestination = $($_.FullName).Replace("$source","$destination")
    If ((Test-Path $ModifiedDestination) -eq $False) {
        Copy-Item $_.FullName $ModifiedDestination
    }
}


