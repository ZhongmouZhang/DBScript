 
 start /wait setup.exe /qb INSTANCENAME=MSSQLSERVER REINSTALL=SQL_Engine REBUILDDATABASE=1 SAPWD=testtest SQLCOLLATION=SQL_Latin1_General_CP1_CI_AS

-- Setup may fail due to the installation copy is not in the same location as before, it can be fixed 
-- in two ways:
1) Issue the following command to have a new location
 start /wait setup.exe /qb INSTANCENAME=MSSQLSERVER REINSTALL=SQL_Engine REINSTALLMODE=v
 
2) find the original location out from registry

My platform is a SQL 2005 x32 SP2 3168 Ent Edition Active-Active cluster.
I also tried the REINSTALLMODE=v option and that didn't work.

To work around this issue you need to update the registry as follows on ALL nodes in the cluster - or just the single server when running a standalone install.

I reccommend to backup the registry before doing this.

Open regedit
Search for the string "SqlRun_SQL.msi". (the key will be found in several spots in the registry under HKLM and Classes Root)
Where the key is found the registry structure will look something like this (example where D:\ is the DVD drive);
HKLM\SOFTWARE\Classes\Installer\Products\B29A3732C1C117E44B49C59AF769AA91

\Patches

\SourceList

\Media

LastUsedSource = m;1;D:\Setup\

\Net

1 = D:\Setup\

Update the \Media key "LastUsedSource" as the directory path to your new SQL 2005 media location. The rules for the key entry go something like this;
m / n ; # ; <path>

 

Where...

m = media  ...or...   n = network

# = a number that indicates the network path entry that corosponds to the entry under \Net

<path> = the path to the "SqlRun_SQL.msi" file. You need to put a trailing "\" at the end of the path.

Update the \Net key "1" as the <path> element to your new SQL 2005 media location. This just needs to be the directory path only. Sometimes this key does not exist. If not then you dont need to update or add it in. If it does the you need to update it.
So after doing the update in my example from the D:\ DVD drive to my local hard drive, it would look something like this (example)
HKLM\SOFTWARE\Classes\Installer\Products\B29A3732C1C117E44B49C59AF769AA91

\Patches

\SourceList

\Media

LastUsedSource = n;1;C:\Software\SQL2005\Servers\

\Net

1 = C:\Software\SQL2005\Servers\

Search and update the rest of the registry for the search string. NOTE - You may find other search strings (ie such as the SQL 2005 Native Client or BOL install MSI's) but I have found that these do not need to be updated.
Once updated, rerun the SETUP install command.
Done!



