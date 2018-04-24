 	SELECT filename, groupid, size/128.0 [File_Size(MB)], size/128.0-CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 [Free_Space (MB)]
	FROM dbo.sysfiles 
