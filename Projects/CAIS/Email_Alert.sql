 
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#free_space') and xtype='U')
drop table #free_space
CREATE TABLE #free_space(
 drive char(1), 
 free_mb int)

declare @string varchar(1000)
declare @threshold int
declare @substr varchar(500)

set @threshold = 1024
INSERT INTO #free_space exec xp_fixeddrives

if exists (select * from #free_space where free_mb < @threshold)
begin
	set @string ='The following drive(s) have less than ' + convert (varchar (10), @threshold/1024) + 'GB free space' + char(10)+ char(13)   + '=====================================================' + char(10) + char(13) 
	select @string = coalesce (@string,',')+ drive + ': ' + convert (varchar(20), free_mb) + char(10) + char(13) 
	from #free_space
	where free_mb < @threshold
	--print @string

	set @substr = 'Disk Space Alert From ' + @@servername
 	EXEC usp_sendcdomail
		@From = 'dbserver@phsa.ca', 
		@To = 'jzhang2@phsa.ca;Arthur.Hastings@phsa.ca;Colin.Millard@phsa.ca;Mariano.Zimmermann@phsa.ca;Simon.Cheng@phsa.ca;Hiro.Kurokawa@phsa.ca;Kathy.Mao@phsa.ca;Jeffrey.Chen@phsa.ca',
		@Subject = @substr, 
		@Body = @string
end