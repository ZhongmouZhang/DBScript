 -- create the temp table
 CREATE TABLE [dbo].[loading_excel_1](
	[sequence] [int] IDENTITY(1,1) NOT NULL,
	[form_type] [int] NULL,
	[left_line_number] [varchar](255) NULL,
	[right_line_number] [int] NULL,
	[column_number] [varchar](255) NULL,
	[value_source] [nvarchar](255) NULL,
	[value_type] [nvarchar](255) NULL,
	[relative_expression ] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[Box] [nvarchar](255) NULL,
	[id] [int] NULL
) ON [PRIMARY]


-- loading the definition inot temp table

INSERT INTO [TR].[dbo].[loading_excel_1]
           ([form_type]
           ,[left_line_number]
           ,[right_line_number]
           ,[column_number]
           ,[value_source]
           ,[value_type]
           ,[relative_expression ]
           ,[description]
           ,[Box]
           )
SELECT [form_type]
      ,isnull([left_line_number],'0')
      ,isnull([right_line_number],'0')
      ,isnull([column_number],'0')
      ,[value_source]
      ,[value_type]
      ,''
      ,[Description]
      ,isnull([Box],'')
  FROM dbo.T5003$
  
    union
  
  SELECT [form_type]
      ,isnull([left_line_number],'0')
      ,isnull([right_line_number],'0')
      ,isnull([column_number],'0')
      ,[value_source]
      ,[value_type]
      ,''
      ,[Description]
      ,isnull([Box],'')
  FROM dbo.T5013$
  
      union
  
  SELECT [form_type]
      ,isnull([left_line_number],'0')
      ,isnull([right_line_number],'0')
      ,isnull([column_number],'0')
      ,[value_source]
      ,[value_type]
      ,''
      ,[Description]
      ,isnull([Box],'')
  FROM dbo.T5013A$
  
  union
  
  SELECT [form_type]
      ,isnull([left_line_number],'0')
      ,isnull([right_line_number],'0')
      ,isnull([column_number],'0')
      ,[value_source]
      ,[value_type]
      ,''
      ,[Description]
      ,isnull([Box],'')
  FROM dbo.T5008$
   
  
  
  update [loading_excel_1]
  set [id] = form_type*1000 + right_line_number
GO



-- insert the definition from the temp table

INSERT INTO [TR].[dbo].[tbl_cell_in_form]
           ([id]
           ,[form_type_id]
           ,[left_line_number]
           ,[right_line_number]
           ,[column_number]
           ,[value_source]
           ,[value_type]
           ,[relative_expression]
           ,[absolute_expression]
           ,[note])
SELECT [id]
      ,[form_type]
      ,[left_line_number]
      ,[right_line_number]
      ,[column_number]
      ,[value_source]
      ,[value_type]
      ,[relative_expression ]
      ,''
      ,''
  FROM [TR].[dbo].[loading_excel_1]
GO



INSERT INTO [TR].[dbo].[tbl_cell_in_slip]
           ([id]
           ,[description]
           ,[box])
SELECT [id]
      ,[description]
      ,isnull([Box],'')
  FROM [TR].[dbo].[loading_excel_1]
GO


truncate table loading_excel_1
