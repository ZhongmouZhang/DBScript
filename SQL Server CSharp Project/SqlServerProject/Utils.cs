using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace SqlServerProject
{
    class Utils
    {

        public enum TableRefreshMode
        {
            TruncateTable,
            DropTable,
            AddToTable
        }

        public static string GetQuotedTableName(string tableName)
        {
            if (tableName.StartsWith("#"))
            {
                tableName = string.Format("[{0}]", tableName.Replace("]", "]]"));
            }
            else
            {
                string[] tableNameParts = tableName.Split('.');
                tableName = string.Empty;
                foreach (string tableNamePart in tableNameParts)
                {
                    if (tableName != string.Empty)
                    {
                        tableName += ".";
                    }
                    tableName += string.Format("[{0}]", tableNamePart.Replace("]", "]]"));
                }
            }
            return tableName;
        }

        public static Boolean IsTableExists(SqlConnection contextConnection, string tableName)
        {
            string sql = string.Empty;
            if (tableName.StartsWith("#"))
            {
                tableName = GetQuotedTableName(tableName);
                sql = string.Format("SELECT OBJECT_ID('tempdb..{0}')", tableName);
            }
            else
            {
                tableName = GetQuotedTableName(tableName);
                sql = string.Format("SELECT OBJECT_ID('{0}')", tableName);
            }

            try
            {

                SqlCommand comm = new SqlCommand(sql);
                comm.Connection = contextConnection;
                object ret = comm.ExecuteScalar();
                int object_id = DBConvertToInt(ret);
                return (object_id != 0);
            }
            catch (SqlException exSql)
            {
                // MessageBox.Show(exSql.Message, exSql.Source, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

        }

        //public static void UploadTable(string tableName, DataTable dataTable, TableRefreshMode tableRefreshMode)
        //{
        //    string sqlCreateTable = SqlTableGenerator.GetCreateSQLFromDataTable(tableName, dataTable);
        //    UploadTable(tableName, dataTable, tableRefreshMode, sqlCreateTable);
        //}

        //public static void UploadTable(string tableName, DataTable dataTable, TableRefreshMode tableRefreshMode, string sqlCreateTable)
        //{
        //    using (SqlConnection contextConnection = new SqlConnection("context connection=true"))
        //    {
        //        contextConnection.Open();

        //        string sql = string.Empty;
        //        if (IsTableExists(contextConnection, tableName))
        //        {
        //            if (tableRefreshMode == TableRefreshMode.DropTable)
        //            {
        //                sql = "DROP TABLE {0}" + Environment.NewLine + sqlCreateTable;
        //            }
        //            else if (tableRefreshMode == TableRefreshMode.TruncateTable)
        //            {
        //                sql = "TRUNCATE TABLE {0}";
        //            }
        //        }
        //        else
        //        {
        //            sql = sqlCreateTable;
        //        }
        //        sql = string.Format(sql, QuoteName(tableName));

        //        // Create/truncate table
        //        if (sql != string.Empty)
        //        {
        //            try
        //            {
        //                SqlCommand comm = new SqlCommand(sql, contextConnection);
        //                comm.ExecuteNonQuery();
        //            }
        //            catch
        //            {
        //                return;
        //            }
        //        }

        //        using (SqlBulkCopy bulkCopy = new SqlBulkCopy(contextConnection))
        //        {
        //            bulkCopy.DestinationTableName = QuoteName(tableName);
        //            try
        //            {
        //                bulkCopy.WriteToServer(dataTable);
        //            }
        //            catch (SqlException exSql)
        //            {
        //                //MessageBox.Show(exSql.Message, exSql.Source, MessageBoxButtons.OK, MessageBoxIcon.Error);
        //            }
        //            catch (Exception ex)
        //            {
        //                //MessageBox.Show(ex.Message, ex.Source, MessageBoxButtons.OK, MessageBoxIcon.Error);
        //            }
        //            finally
        //            {
        //                if (contextConnection.State == ConnectionState.Open)
        //                {
        //                    contextConnection.Close();
        //                }
        //            }
        //        }
        //    }
        //}

        public static string GetSQLColumnListFromDataReader(SqlDataReader dataReader)
        {
            return SqlTableGenerator.GetSQLColumnListFromDataReader(dataReader);
        }

        public static void CreateTable(SqlConnection conn, string tableName, string sqlColumnList, TableRefreshMode tableRefreshMode)
        {
            string sql = string.Empty;
            sqlColumnList = "CREATE TABLE {0}" + sqlColumnList;
            if (IsTableExists(conn, tableName))
            {
                if (tableRefreshMode == TableRefreshMode.DropTable)
                {
                    sql = "DROP TABLE {0}" + Environment.NewLine + "CREATE TABLE {0}" + sqlColumnList;
                }
                else if (tableRefreshMode == TableRefreshMode.TruncateTable)
                {
                    sql = "TRUNCATE TABLE {0}";
                }
            }
            else
            {
                sql = sqlColumnList;
            }
            sql = string.Format(sql, GetQuotedTableName(tableName));

            // Create/truncate table
            if (sql != string.Empty)
            {
                SqlCommand comm = new SqlCommand(sql, conn);
                comm.ExecuteNonQuery();
            }
        }

        public static void UploadTable(SqlConnection conn, string tableName, SqlDataReader dataReader)
        {
            UploadTable(conn, tableName, dataReader, null);
        }

        public static void UploadTable(SqlConnection conn, string tableName, SqlDataReader dataReader, SqlCommand cmd)
        {
            bool isTryDataTable = false;
            string errorMessage = string.Empty;
            try
            {
                using (SqlBulkCopy bulkCopy = new SqlBulkCopy(conn))
                {
                    bulkCopy.DestinationTableName = GetQuotedTableName(tableName);
                    //bulkCopy

                    DataTable schemaTable = dataReader.GetSchemaTable();
                    foreach (DataRow row in schemaTable.Rows)
                    {
                        string columnName = Convert.ToString(row["ColumnName"]);
                        bulkCopy.ColumnMappings.Add(columnName, columnName);
                    }

                    bulkCopy.BulkCopyTimeout = 60 * 10;
                    bulkCopy.WriteToServer(dataReader);
                }
            }
            catch (InvalidOperationException ioe)
            {
                if (ioe.Source == "System.Data")
                {
                    errorMessage = ioe.Message;
                    isTryDataTable = true;
                }
            }

            if ((isTryDataTable) && (cmd != null))
            {
                //if (dataReader.RecordsAffected > 0)
                using (SqlConnection source_conn = new SqlConnection(cmd.Connection.ConnectionString))
                {
                    int rowLimit = 100000;
                    SqlCommand new_cmd = new SqlCommand(cmd.CommandText, source_conn);
                    SqlDataAdapter da = new SqlDataAdapter(new_cmd);
                    DataTable dt = new DataTable();
                    da.Fill(0, rowLimit + 1, dt);

                    if (dt.Rows.Count <= rowLimit)
                    {
                        UploadTable(conn, tableName, dt);
                    }
                    else
                    {
                        throw new Exception(string.Format("ResultSet is too big for a DataTable (Limit {0} records). Cannot use SqlDataReader because: {1}", rowLimit, errorMessage));
                    }
                }
            }
        }

        public static void UploadTable(SqlConnection conn, string tableName, DataTable dataTable)
        {
            using (SqlBulkCopy bulkCopy = new SqlBulkCopy(conn))
            {
                bulkCopy.DestinationTableName = GetQuotedTableName(tableName);
                bulkCopy.BulkCopyTimeout = 60 * 10;
                bulkCopy.WriteToServer(dataTable);
            }
        }

        public static List<string> ParseSQLServerList(SqlXml serverNames)
        {
            List<string> list = new List<string>();
            using (XmlReader reader = serverNames.CreateReader())
            {
                XmlWriterSettings ws = new XmlWriterSettings();
                ws.Indent = true;

                // Parse the file and display each of the nodes.
                while (reader.Read())
                {
                    switch (reader.NodeType)
                    {
                        case XmlNodeType.Element:
                            string elementName = reader.Name;
                            if (elementName == "Server")
                            {
                                reader.MoveToFirstAttribute();
                                while (1 == 1)
                                {
                                    string attrName = reader.Name;
                                    string attrValue = reader.Value;
                                    if (attrName == "Name")
                                    {
                                        list.Add((string)attrValue);
                                    }
                                    if (!reader.MoveToNextAttribute()) break;
                                }
                            }
                            break;
                        case XmlNodeType.Text:
                            //                                writer.WriteString(reader.Value);
                            break;
                        case XmlNodeType.XmlDeclaration:
                        case XmlNodeType.ProcessingInstruction:
                            //                                writer.WriteProcessingInstruction(reader.Name, reader.Value);
                            break;
                        case XmlNodeType.Comment:
                            //                                writer.WriteComment(reader.Value);
                            break;
                        case XmlNodeType.EndElement:
                            //                                writer.WriteFullEndElement();
                            break;
                    }
                }
            }
            return list;
        }

        public static List<string> ParseSQLServerDelimitedList(string serverNames)
        {
            List<string> list = new List<string>();

            serverNames = serverNames.Replace("\r", ";");
            serverNames = serverNames.Replace("\n", ";");
            serverNames = serverNames.Replace("\t", ";");
            string[] servers = serverNames.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);

            foreach (string serverName in servers)
            {
                list.Add(serverName.Trim());
            }

            return list;
        }

        /// </summary>
        /// <param name="name">sysname, limited to 128 characters.</param>
        /// <returns>An escaped identifier, no longer than 258 characters.</returns>
        public static string QuoteName(string name) { return QuoteName(name, '['); }

        /// <summary>
        /// Returns a string with the delimiters added to make the input string
        /// a valid SQL Server delimited identifier. Unlike the T-SQL version,
        /// an ArgumentException is thrown instead of returning a null for
        /// invalid arguments.
        /// </summary>
        /// <param name="name">sysname, limited to 128 characters.</param>
        /// <param name="quoteCharacter">Can be a single quotation mark ( ' ), a
        /// left or right bracket ( [] ), or a double quotation mark ( " ).</param>
        /// <returns>An escaped identifier, no longer than 258 characters.</returns>
        public static string QuoteName(string name, char quoteCharacter)
        {
            name = name ?? String.Empty;
            const int sysnameLength = 128;
            if (name.Length > sysnameLength)
            {
                throw new ArgumentException(String.Format(
                    "name is longer than {0} characters", sysnameLength));
            }
            switch (quoteCharacter)
            {
                case '\'':
                    return String.Format("'{0}'", name.Replace("'", "''"));
                case '"':
                    return String.Format("\"{0}\"", name.Replace("\"", "\"\""));
                case '[':
                case ']':
                    return String.Format("[{0}]", name.Replace("]", "]]"));
                default:
                    throw new ArgumentException(
                        "quoteCharacter must be one of: ', \", [, or ]");
            }
        }

        public static int DBConvertToInt(object value)
        {
            try
            {
                if (Convert.IsDBNull(value))
                {
                    return 0;
                }
                else
                {
                    return Convert.ToInt32(value);
                }
            }
            catch
            {
                return 0;
            }
        }

        public static string MakeConnectionString(string strServerIP, string strDBName, string strUserName, string strPassword, bool blnTrusted_Connection, int connectionTimeout)
        {
            return string.Format("Data Source={0};Initial Catalog= {1};User Id={2};Password={3};Trusted_Connection={4};Connection Timeout={5};Application Name=CLR SQL Collector", strServerIP, strDBName, strUserName, strPassword, blnTrusted_Connection, connectionTimeout);
        }

        public static string MakeConnectionString(string strServerIP, string strUserName, string strPassword, bool blnTrusted_Connection, int connectionTimeout)
        {
            return string.Format("Data Source={0};User Id={1};Password={2};Trusted_Connection={3};Connection Timeout={4};Application Name=CLR SQL Collector", strServerIP, strUserName, strPassword, blnTrusted_Connection, connectionTimeout);
        }
    }
}
