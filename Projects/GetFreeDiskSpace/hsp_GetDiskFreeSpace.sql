 
use master
go
CREATE TABLE DiskFreeSpace (
	DriveLetter CHAR(1) NOT NULL,
	FreeMB INTEGER NOT NULL)
go

 
 
 
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_GetDiskFreeSpace') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[hsp_GetDiskFreeSpace]
GO

CREATE         proc dbo.hsp_GetDiskFreeSpace 
as
	truncate table DiskFreeSpace
	insert into DiskFreeSpace
	EXEC master..xp_fixeddrives
