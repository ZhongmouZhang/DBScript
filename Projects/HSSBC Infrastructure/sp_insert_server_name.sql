
if exists (select * from dbo.sysobjects where id = object_id(N'hsp_insert_server_name') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_insert_server_name
GO


 create proc hsp_insert_server_name
@server_name varchar(64),
@range int
as
declare @current_time datetime
declare @seq_num int
declare @server_pattern varchar(64)
set @current_time = getdate()
set @server_pattern = substring (@server_name, 1, LEN (@server_name) - 3)

if @range <= 0 
 return 0 
 
begin tran
while @range > 0
begin
	insert into generated_server_name(server_name,status,date_time)
	values (@server_name, 'reserved', @current_time)
	if (@@ERROR != 0)
	begin
		rollback tran
		select -1
		return
	end
	set @seq_num = convert(int, RIGHT(@server_name,3)) + 1
	set @server_name = @server_pattern + RIGHT('000' + convert(varchar,@seq_num),3)
	set @range = @range -1
end

commit tran
return

go
