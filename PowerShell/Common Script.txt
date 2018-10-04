 
 ## delete the files in the specified folder and subfolders
 get-childitem * -path K:\SQL_Backup -include *.trn -recurse | remove-item
 
 ## list the files order by file size
 Get-ChildItem -Path c:\ -Recurse | Sort-Object Length -Descending | Select-Object length,name,directory -First 100 | Format-Table -AutoSize

 Get-ChildItem -Path C:\Users\jzhang2\Documents -Recurse | Sort-Object Length -Descending | Select-Object @{N='SizeInMb';E={[double]('{0:N2}' -f ($_.Length/1mb))}}, name,directory -First 10 | Format-Table -AutoSize

# add some for test  
 