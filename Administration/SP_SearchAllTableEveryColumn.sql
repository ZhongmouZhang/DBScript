--SEARCHALLTABLES 'salewis' 

alter PROC SEARCHALLTABLES(
           @SearchStr NVARCHAR(100))
AS
  BEGIN
  -- Copyright © 2002 Narayana Vyas Kondreddi. All rights reserved.
  -- Purpose: To search all columns of all tables for a given search string
  -- Written by: Narayana Vyas Kondreddi
  -- Site: http://vyaskn.tripod.com
  -- Tested on: SQL Server 7.0 and SQL Server 2000
  -- Date modified: 28th July 2002 22:50 GMT
    CREATE TABLE #RESULTS (
      COLUMNNAME  NVARCHAR(370),
      COLUMNVALUE NVARCHAR(3630))
    SET NOCOUNT  ON
    DECLARE  @TableName  NVARCHAR(256),
             @ColumnName NVARCHAR(128),
             @SearchStr2 NVARCHAR(110)
    SET @TableName = ''
    SET @SearchStr2 = QUOTENAME('%' + @SearchStr + '%','''')
    WHILE @TableName IS NOT NULL 
      BEGIN
        SET @ColumnName = ''
        SET @TableName = (SELECT MIN(QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME))
                          FROM   INFORMATION_SCHEMA.TABLES
                          WHERE  TABLE_TYPE = 'BASE TABLE'
                                 AND QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME) > @TableName
                                 AND OBJECTPROPERTY(OBJECT_ID(QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME)),
                                                    'IsMSShipped') = 0)
        WHILE (@TableName IS NOT NULL )
              AND (@ColumnName IS NOT NULL )
          BEGIN
            SET @ColumnName = (SELECT MIN(QUOTENAME(COLUMN_NAME))
                               FROM   INFORMATION_SCHEMA.COLUMNS
                               WHERE  TABLE_SCHEMA = PARSENAME(@TableName,2)
                                      AND TABLE_NAME = PARSENAME(@TableName,1)
                                      AND DATA_TYPE IN ('char',
                                                        'varchar',
                                                        'nchar',
                                                        'nvarchar',
														'ntext', 'text')
                                      AND QUOTENAME(COLUMN_NAME) > @ColumnName)
            IF @ColumnName IS NOT NULL 
              BEGIN
                INSERT INTO #RESULTS
                EXEC( 'SELECT ''' + @TableName + '.' + @ColumnName + ''', ' + @ColumnName + ' FROM ' + @TableName + ' (NOLOCK) ' + ' WHERE ' + @ColumnName + ' LIKE ' + @SearchStr2)
              END
          END
      END
    SELECT COLUMNNAME,
           COLUMNVALUE
    FROM   #RESULTS
  END

