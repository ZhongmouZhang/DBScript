using System;
using System.Data;
using System.Data.SqlClient;

namespace SqlServerProject
{
    public enum DBGeneralType
    {
        gtString,
        gtInt,
        gtReal,
        gtBit,
        gtDate,
        gtBinary,
        gtOther
    }

    public static class SqlTableGenerator
    {
        public static string GetCreateSQLFromDataTable(string tableName, DataTable table)
        {
            string sql = "CREATE TABLE [" + tableName + "] (\n";
            // columns
            foreach (DataColumn column in table.Columns)
            {
                sql += "[" + column.ColumnName + "] " + SQLGetType(column) + ",\n";
            }
            sql = sql.TrimEnd(new[] { ',', '\n' }) + "\n";
            // primary keys
            if (table.PrimaryKey.Length > 0)
            {
                sql += "CONSTRAINT [PK_" + tableName + "] PRIMARY KEY CLUSTERED (";
                foreach (DataColumn column in table.PrimaryKey)
                {
                    sql += "[" + column.ColumnName + "],";
                }
                sql = sql.TrimEnd(new[] { ',' }) + "))\n";
            }

            //if not ends with ")"
            if ((table.PrimaryKey.Length == 0) && (!sql.EndsWith(")")))
            {
                sql += ")";
            }

            return sql;
        }

        public static string GetSQLColumnListFromDataReader(SqlDataReader reader)
        {
            //string sql = "CREATE TABLE [" + tableName + "] (\n";
            string sql = " (\n";

            //Retrieve column schema into a DataTable.
            DataTable schemaTable = reader.GetSchemaTable();

            int unknown_column_id = 1;
            // columns
            foreach (DataRow row in schemaTable.Rows)
            {
                string columnName = System.Convert.ToString(row["ColumnName"]);
                if (columnName == string.Empty)
                {
                    columnName = string.Format("Column_{0}", unknown_column_id);
                    unknown_column_id++;
                }
                sql += "[" + columnName + "] " + SQLGetType(row) + ",\n";
            }
            sql = sql.TrimEnd(new[] { ',', '\n' }) + "\n";
            sql += ")";

            return sql;
        }


        // Return T-SQL data type definition, based on schema definition for a column
        public static string SQLGetType(object type, int columnSize, int numericPrecision, int numericScale)
        {
            switch (type.ToString())
            {
                case "System.String":
                    return "NVARCHAR(" + ((columnSize == -1) ? "MAX" : (columnSize > 8000) ? "MAX" : columnSize.ToString()) + ")";

                case "System.Decimal":
                    if (numericScale > 0)
                        return "DECIMAL(20, 2)";
                    if (numericPrecision > 10)
                        return "BIGINT";
                    return "INT";

                case "System.Double":
                case "System.Single":
                    return "REAL";

                case "System.Int64":
                    return "BIGINT";

                case "System.Byte":
                case "System.Int16":
                case "System.Int32":
                    return "INT";

                case "System.DateTime":
                    return "DATETIME";

                case "System.Boolean":
                    return "BIT";

                case "System.Byte[]":
                    return "VARBINARY(" + ((columnSize == -1) ? "MAX" : (columnSize > 8000) ? "MAX" : columnSize.ToString()) + ")";

                case "System.Guid":
                    return "UNIQUEIDENTIFIER";

                case "System.Object":
                    return "sql_variant";

                default:
                    throw new Exception("SqlTableGenerator.SQLGetType: " + type.ToString() + " not implemented.");
            }
        }

        // Overload based on row from schema table
        public static string SQLGetType(DataRow schemaRow)
        {
            return SQLGetType(schemaRow["DataType"],
                                int.Parse(schemaRow["ColumnSize"].ToString()),
                                int.Parse(schemaRow["NumericPrecision"].ToString()),
                                int.Parse(schemaRow["NumericScale"].ToString()));
        }

        // Overload based on DataColumn from DataTable type
        public static string SQLGetType(DataColumn column)
        {
            return SQLGetType(column.DataType, column.MaxLength, 10, 2);
        }

        public static DBGeneralType GetDBGeneralType(Type valueType)
        {
            DBGeneralType dbGeneralType = DBGeneralType.gtOther;
            switch (valueType.Name)
            {
                case "String":
                case "nchar":
                case "ntext":
                case "char":
                case "text":
                case "varchar":
                case "nvarchar":
                case "sysname":
                case "xml":
                case "uniqueidentifier":
                    dbGeneralType = DBGeneralType.gtString;
                    break;
                case "bigint":
                case "Int16":
                case "Int32":
                case "Int64":
                case "smallint":
                case "tinyint":
                case "Byte":
                    dbGeneralType = DBGeneralType.gtInt;
                    break;
                case "bit":
                case "Boolean":
                    dbGeneralType = DBGeneralType.gtBit;
                    break;
                case "DateTime":
                case "smalldatetime":
                    dbGeneralType = DBGeneralType.gtDate;
                    break;
                case "real":
                case "money":
                case "smallmoney":
                case "Numeric":
                case "Decimal":
                case "Float":
                case "Double":
                    dbGeneralType = DBGeneralType.gtReal;
                    break;
                case "binary":
                case "varbinary":
                case "image":
                case "timestamp":
                    dbGeneralType = DBGeneralType.gtBinary;
                    break;
                default:
                    // sql_variant
                    dbGeneralType = DBGeneralType.gtOther;
                    break;
            }
            return dbGeneralType;
        }
    }
}
