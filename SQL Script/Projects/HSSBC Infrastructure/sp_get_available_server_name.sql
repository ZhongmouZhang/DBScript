
if exists (select * from dbo.sysobjects where id = object_id(N'hsp_get_available_server_name') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_get_available_server_name
GO



create proc hsp_get_available_server_name 
@server_name_pattern varchar(64),
@range int = 1,
@generated_server_name varchar (64)  output
									 -- when return 0: it is server name
									 -- when return -1: it is an error message
as
declare @server_name varchar(64)
declare @starting_number int

set @server_name = ''
select @server_name = max(server_name) from dbo.generated_server_name where server_name like @server_name_pattern+'%'
if @server_name is null
begin
	set @generated_server_name = @server_name_pattern + '001'
	select 0
end
else
begin
	set @starting_number = CONVERT(int, right(@server_name,3)) +1
	if @starting_number >= 1000
	begin
		set @generated_server_name = '-1'
		select -1
	end
	else if @starting_number + @range -1 >= 1000
	begin
		set @generated_server_name = '-2'
		select -2
	end
	else
	begin
		set @generated_server_name = @server_name_pattern + right ('000' + CONVERT(varchar,@starting_number),3)
		select 0
	end
end
return

go 
	
		