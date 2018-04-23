
$dir = "C:\work\DBScript\HSSBC DB Maintenance Script\Separate Scripts V4.X.X.X"
$outFile = "C:\work\DBScript\HSSBC DB Maintenance Script\Version 4.X.X.X For SQL 2005 and Up\02_db_maint_script_package_V4031.sql"

# Build the file list
$fileList = Get-ChildItem -Path $dir -Filter *.sql -File | % { $_.FullName}

# Get the header info from the first file
# Get-Content -Path $fileList[0] | Out-File -FilePath $outfile -Encoding ascii
# Cycle through and get the data (sans header) from all the files in the list

"------------Merging Date and Time: $(Get-Date) --------------------" | Out-File -FilePath $outfile -Encoding ascii 

foreach ($file in $filelist)
{
    "`r`n`r`n`r`n" | Out-File -FilePath $outfile -Encoding ascii -Append
    "---------------------------- $file --------------------" | Out-File -FilePath $outfile -Encoding ascii -Append

    Get-Content $file | Out-File -FilePath $outfile -Encoding ascii -Append
}

