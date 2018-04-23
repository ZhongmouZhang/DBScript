
/****** Object:  Table [dbo].[lu_form_type]    Script Date: 02/16/2012 13:45:46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[lu_form_type]') AND type in (N'U'))
DROP TABLE [dbo].[lu_form_type]
CREATE TABLE [dbo].[lu_form_type](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	[form_type] [varchar](32) NOT NULL,
	parent_for_id int,
	[note] [varchar](256) NULL
)

GO


/****** Object:  Table [dbo].[tbl_cell_in_form]    Script Date: 02/16/2012 13:46:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_cell_in_form]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_cell_in_form]
CREATE TABLE [dbo].[tbl_cell_in_form](
	[id] [int] NOT NULL PRIMARY KEY CLUSTERED,
	[form_type_id] [int] NOT NULL,
	[left_line_number] [varchar](8) NOT NULL,
	[right_line_number] [varchar](8) NOT NULL,
	[column_number] [varchar](3) NOT NULL,
	value_source char(1) not null,  -- F: fixed value; C: Calculate; I: Input
	value_type [char](1) NOT NULL,  -- A: Data; B: Boolean; D: Decimal; I: Integer; S: String
	[relative_expression] [varchar](1024) NULL,
	[absolute_expression] [varchar](1024) NULL,
	[note] [varchar](1024) NULL,
)
GO

-------------------------------------------------------------------------------
--
--
--   Load the excel form definition to temp table then to tbl_cell_in_form
--
--
-----------------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[temp_tbl_cell_in_form]') AND type in (N'U'))
DROP TABLE [dbo].[temp_tbl_cell_in_form]
CREATE TABLE [dbo].[temp_tbl_cell_in_form](
	[id] [int] identity(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	[form_type_id] [int] ,
	[left_line_number] [varchar](8),
	[right_line_number] [varchar](8),
	[column_number] [varchar](3),
	value_source char(1),  -- F: fixed value; C: Calculate; I: Input
	value_type [char](1),  -- A: Data; B: Boolean; D: Decimal; I: Integer; S: String
	[relative_expression] [varchar](1024) NULL,
	[absolute_expression] [varchar](1024) NULL,
	[note] [varchar](1024) NULL,
)
GO

update temp_tbl_cell_in_form
set form_type_id = 100, 
	left_line_number = case when left_line_number IS null then 0 else left_line_number end,
	right_line_number= case when right_line_number IS null then 0 else right_line_number end,
	column_number = case when column_number IS null then 0 else column_number end,
	relative_expression = case when relative_expression IS null then '' else relative_expression end,
	note = case when note IS null then '' else note end
	
select * from dbo.temp_tbl_cell_in_form

--------------------------------------------------------------------------------
declare @id int
declare @form_type_id int
declare @left_line_number varchar(8)
declare @right_line_number varchar(8)
declare @column_number varchar(3)
declare @value_source char(1)
declare @value_type char(1)
declare @relative_expression varchar(1024)
declare @note varchar(1024)


set @id = 0
while 1=1
begin
	select @id=min(id) 
	from dbo.temp_tbl_cell_in_form
	where id > @id 
	
	SELECT @form_type_id=[form_type_id]
      ,@left_line_number = [left_line_number]
      ,@right_line_number=[right_line_number]
      ,@column_number = [column_number]
      ,@value_source = [value_source]
      ,@value_type = [value_type]
      ,@relative_expression = [relative_expression]
      ,@note = [note]
	FROM [TR].[dbo].[temp_tbl_cell_in_form]
	where id = @id 

    if @id is null break

	insert into tbl_cell_in_form 
	values 
	(	[dbo].[generate_id_of_cell_in_form] (@form_type_id)
		,@form_type_id
		,@left_line_number 
		,@right_line_number
		,@column_number
		,@value_source
		,@value_type 
		,@relative_expression 
		,''
		,@note 
    )
	
end



