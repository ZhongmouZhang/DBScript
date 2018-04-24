 
 
   if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_DBSize') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_DBSize
GO

CREATE         proc dbo.sp_DBSize
as

 as
declare @dbsize decimal(9,2), @dbmax decimal(9,2), @logsize decimal(9,2), @logmax decimal(9,2)

select @dbsize=size*1.0/128, @dbmax = maxsize*1.0/128 from sysfiles where groupid=1
select @logsize=size*1.0/128, @logmax = maxsize*1.0/128 from sysfiles where groupid=0

select @dbsize [Current DB Size(MB)], @dbmax [   Max DB Size(MB)]
select @logsize [Current Log Size(MB)], @logmax [   Max Log Size(MB)]

