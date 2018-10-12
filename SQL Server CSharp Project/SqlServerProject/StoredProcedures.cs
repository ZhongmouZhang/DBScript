using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;


namespace SqlServerProject
{
    public partial class StoredProcedures
    {
        //string sqlquery = /* "WAITFOR DELAY '00:00:01' \r\n" */ "SELECT @@VERSION";

        private struct ServerInfo
        {
            public string ServerName;
            public int ServerId;

            public ServerInfo(string _serverName, int _serverId)
            {
                ServerName = _serverName;
                ServerId = _serverId;
            }
        }

        [Microsoft.SqlServer.Server.SqlProcedure]
        public static void sp_GetIPHosts(string serverNames)
        {
            if (serverNames != null)
            {
                RunDnsCommandOnMultipleServers(serverNames, DnsRequestType.GetIP);
            }
        }

        [Microsoft.SqlServer.Server.SqlProcedure]
        public static void sp_GetFQNHosts(string serverNames)
        {
            if (serverNames != null)
            {
                RunDnsCommandOnMultipleServers(serverNames, DnsRequestType.GetFQN);
            }
        }

        [Microsoft.SqlServer.Server.SqlProcedure]
        public static void sp_PingHosts(string serverNames)
        {
            if (serverNames != null)
            {
                RunDnsCommandOnMultipleServers(serverNames, DnsRequestType.Ping);
            }
        }

        private static void RunDnsCommandOnMultipleServers(string serverNames, DnsRequestType requestType)
        {
            List<ServerInfo> servers;
            SqlPipe sp = SqlContext.Pipe;
            string contextConnectionString = "context connection=true";

            servers = ParseSQLServerList(serverNames, contextConnectionString);

            if (servers == null) return;

            // Create list of database requests for each SQL Server
            List<DnsRequest> requests = new List<DnsRequest>();
            foreach (ServerInfo si in servers)
            {
                requests.Add(new DnsRequest(si.ServerName, si.ServerId, requestType));
            }

            if (requests.Count > 0)
            {
                DnsRequestProcessor requestProc = new DnsRequestProcessor();
                requests = requestProc.ExecuteParallel(requests);
            }

            // Create the record and specify the metadata for the columns.
            SqlDataRecord record = new SqlDataRecord(
               new SqlMetaData("ServerName", SqlDbType.NVarChar, 200),
               new SqlMetaData("ServerID", SqlDbType.Int),
               new SqlMetaData("Result", SqlDbType.VarChar, 4000));
            sp.SendResultsStart(record);

            foreach (DnsRequest request in requests)
            {
                if (request.ServerId != -1)
                {
                    record.SetValues(request.ServerName, request.ServerId, request.Result.ToString());
                }
                else
                {
                    record.SetValues(request.ServerName, DBNull.Value, request.Result.ToString());
                }
                sp.SendResultsRow(record);
                // Mark the end of the result-set.
            }
            // Mark the end of the result-set.
            sp.SendResultsEnd();
            //}
        }

        [Microsoft.SqlServer.Server.SqlProcedure]

        public static void sp_PingSQLServers(string serverNames/*, SqlString targetTable*/)
        {
            //string str_targetTable = string.Empty;

            //if (!targetTable.IsNull)
            //{
            //    str_targetTable = (string)targetTable;
            //}

            //str_targetTable = str_targetTable.Replace("[", "").Replace("]", "");

            //RunPingOnMultipleServers(serverNames, str_targetTable);

            RunPingOnMultipleServers(serverNames);
        }

        private static void RunPingOnMultipleServers(string serverNames)
        {
            List<ServerInfo> servers;
            SqlPipe sp = SqlContext.Pipe;
            string contextConnectionString = "context connection=true";

            servers = ParseSQLServerList(serverNames, contextConnectionString);

            if (servers == null) return;

            // Get current connection
            //using (SqlConnection contextConnection = new SqlConnection(contextConnectionString))
            //{
            //    // Check if output tables are exist
            //    contextConnection.Open();
            //    if ((targetTableName != string.Empty) && (Utils.IsTableExists(contextConnection, targetTableName)))
            //    {
            //        throw new Exception(string.Format("Table {0} already exist. Please drop the table first.", targetTableName));
            //    }
            //    contextConnection.Close();
            //}

            // Create list of database requests for each SQL Server
            List<DatabaseRequest> requests = new List<DatabaseRequest>();
            foreach (ServerInfo si in servers)
            {
                requests.Add(new DatabaseRequest(si.ServerName, si.ServerId, "master"));
            }

            if (requests.Count > 0)
            {
                DatabaseRequestProcessor requestProc = new DatabaseRequestProcessor();
                requests = requestProc.ExecuteParallel(requests);
            }

            //if (targetTableName == string.Empty)
            //{
                // Create the record and specify the metadata for the columns.
                SqlDataRecord record = new SqlDataRecord(
                   new SqlMetaData("ServerName", SqlDbType.NVarChar, 200),
                   new SqlMetaData("ServerID", SqlDbType.Int),
                   new SqlMetaData("Status", SqlDbType.VarChar, 100),
                   new SqlMetaData("ErrorMessage", SqlDbType.VarChar, 1000));
                sp.SendResultsStart(record);

                foreach (DatabaseRequest request in requests)
                {
                    if (request.ServerId != -1)
                    {
                        record.SetValues(request.ServerName, request.ServerId, request.State.ToString(), request.ErrorMessage);
                    }
                    else
                    {
                        record.SetValues(request.ServerName, DBNull.Value, request.State.ToString(), request.ErrorMessage);
                    }
                    sp.SendResultsRow(record);
                    // Mark the end of the result-set.
                }
                // Mark the end of the result-set.
                sp.SendResultsEnd();
            //}
        }

        [Microsoft.SqlServer.Server.SqlProcedure]
        public static void sp_RunQuerySQLServers(string serverNames, string sqlquery, SqlString targetTable, SqlString targetErrorTable)
        {
            string str_targetTable = (string)targetTable;
            string str_targetErrorTable = string.Empty;

            if (!targetErrorTable.IsNull)
            {
                str_targetErrorTable = (string)targetErrorTable;
            }

            str_targetErrorTable = str_targetErrorTable.Replace("[", "").Replace("]", "");

            RunQueryOnMultipleServers(serverNames, sqlquery, str_targetTable, str_targetErrorTable, false);
        }

        [Microsoft.SqlServer.Server.SqlProcedure]
        public static void sp_RunQuerySQLServersForEachDB(string serverNames, string sqlquery, SqlString targetTable, SqlString targetErrorTable)
        {
            string str_targetTable = (string)targetTable;
            string str_targetErrorTable = string.Empty;

            if (!targetErrorTable.IsNull)
            {
                str_targetErrorTable = (string)targetErrorTable;
            }

            str_targetErrorTable = str_targetErrorTable.Replace("[", "").Replace("]", "");

            RunQueryOnMultipleServers(serverNames, sqlquery, str_targetTable, str_targetErrorTable, true);
        }

        private static void RunQueryOnMultipleServers(string servers, string sqlquery)
        {
            RunQueryOnMultipleServers(servers, sqlquery, string.Empty, string.Empty, false);
        }

        /* Main function */
        private static void RunQueryOnMultipleServers(string serverNames, string sqlquery, string targetTableName, string targetErrorTableName, bool forEachDB)
        {
            List<ServerInfo> servers;
            SqlPipe sp = null;// = SqlContext.Pipe;
            string contextConnectionString = string.Empty;
            TargetObject target = new TargetObject();
            target.TableName = targetTableName;

            SetConnectionSettigns(ref target, ref sp, ref contextConnectionString);

            //sp.Send("test 1");

            servers = ParseSQLServerList(serverNames, contextConnectionString);
            if (servers.Count == 0)
            {
                sp.Send("No Servers to process!");
                return;
            }
            //sp.Send("test 2");

            bool isTargetErrorTableNameExists = CheckIfTargetTablesExist(contextConnectionString, targetTableName, targetErrorTableName);

            //sp.Send("test 3");
            // Create list of database requests for each SQL Server
            List<DatabaseRequest> requests = new List<DatabaseRequest>();
            foreach (ServerInfo si in servers)
            {
                requests.Add(new DatabaseRequest(si.ServerName, si.ServerId, (forEachDB ? string.Empty : "master"), sqlquery, null));
            }
            //sp.Send("test 4");
            DatabaseRequestProcessor requestProc = new DatabaseRequestProcessor();
            requests = requestProc.ExecuteParallel(requests, target);

            if (requests != null)
            {
                if ((sp != null) && (targetErrorTableName == string.Empty))
                {
                    SendErrorsToSqlPipe(sp, requests);
                }
                else if (targetErrorTableName != string.Empty)
                {
                    SendErrorsToTable(target, isTargetErrorTableNameExists, targetErrorTableName, requests);
                }
            }
            else
            {
                sp.Send("requests = null");
            }
        }

        private static List<ServerInfo> ParseSQLServerList(string serverNames, string contextConnectionString)
        {
            List<ServerInfo> servers;

            int idx_id_column = -1;
            // If server list looks like a SELECT query or EXEC sp
            if ((serverNames.TrimStart().ToUpper().StartsWith("SELECT"))
                || (serverNames.TrimStart().ToUpper().StartsWith("EXEC")))
            {
                servers = new List<ServerInfo>();
                string serverName = string.Empty;
                int serverId = -1;

                // run a query and get a list of SQL Servers from 1st column
                using (SqlConnection contextConnection = new SqlConnection(contextConnectionString))
                {
                    using (SqlCommand comm = new SqlCommand(serverNames, contextConnection))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(comm))
                        {
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            idx_id_column = ds.Tables[0].Columns.IndexOf("id");
                            foreach (DataRow row in ds.Tables[0].Rows)
                            {
                                serverName = Convert.ToString(row[0]).Trim();
                                if (idx_id_column != -1)
                                {
                                    serverId = Convert.ToInt32(row[idx_id_column]);
                                }
                                else
                                {
                                    serverId = -1;
                                }
                                servers.Add(new ServerInfo(serverName, serverId));
                            }
                        }
                    }
                }
            }
            else
            {
                servers = new List<ServerInfo>();
                // Parse list using [;] or [TAB] as a separator
                List<string> str_servers = Utils.ParseSQLServerDelimitedList(serverNames);
                foreach (string server in str_servers)
                {
                    servers.Add(new ServerInfo(server, -1));
                }
            }

            return servers;
        }

        private static void SetConnectionSettigns(ref TargetObject target, ref SqlPipe sp, ref string contextConnectionString)
        {
            // If run insude SQL Sever Process. (if it's not - DEBUG mode)
            if (SqlContext.IsAvailable)
            {
                sp = SqlContext.Pipe;
                contextConnectionString = "context connection=true";

                // Get current serer name and database
                using (SqlConnection contextConnection = new SqlConnection(contextConnectionString))
                {
                    contextConnection.Open();
                    string sqlGetSrvName = "SELECT SERVERPROPERTY('SERVERNAME')";
                    string sqlGetDBName = "SELECT DB_NAME()";
                    SqlCommand cmd = new SqlCommand(sqlGetSrvName, contextConnection);
                    target.ServerName = Convert.ToString(cmd.ExecuteScalar());
                    cmd = new SqlCommand(sqlGetDBName, contextConnection);
                    target.DatabaseName = Convert.ToString(cmd.ExecuteScalar());
                    contextConnection.Close();
                }
            }
            else
            {
                // DEBUG
                target.ServerName = "VCHDBCMSP01";
                target.DatabaseName = "master";
                contextConnectionString = Utils.MakeConnectionString(target.ServerName, target.DatabaseName, "", "", true, 10);
            }
        }

        private static bool CheckIfTargetTablesExist(string contextConnectionString, string targetTableName, string targetErrorTableName)
        {
            bool isTargetErrorTableNameExists = false;

            // Get current connection
            using (SqlConnection contextConnection = new SqlConnection(contextConnectionString))
            {
                // Check if output tables are exist
                contextConnection.Open();
                if ((targetTableName != string.Empty) && (Utils.IsTableExists(contextConnection, targetTableName)))
                {
                    throw new Exception(string.Format("Table {0} already exist. Please drop the table first.", targetTableName));
                }
                if ((targetErrorTableName != string.Empty) && (Utils.IsTableExists(contextConnection, targetTableName)))
                {
                    isTargetErrorTableNameExists = true;
                    //throw new Exception(string.Format("Table {0} already exist. Please drop the table first.", targetErrorTableName));
                }
                contextConnection.Close();
            }
            return isTargetErrorTableNameExists;
        }

        private static void SendErrorsToSqlPipe(SqlPipe sp, List<DatabaseRequest> requests)
        {
            SqlDataRecord record_error = null;

            //if (idx_id_column != -1)
            //{
            record_error = new SqlDataRecord(
            new SqlMetaData("ServerName", SqlDbType.NVarChar, 200),
            new SqlMetaData("ServerID", SqlDbType.Int),
            new SqlMetaData("DatabaseName", SqlDbType.NVarChar, 200),
            new SqlMetaData("ErrorMessage", SqlDbType.VarChar, 4000));
            //}
            //else
            //{
            //    record_error = new SqlDataRecord(
            //    new SqlMetaData("ServerName", SqlDbType.NVarChar, 200),
            //    new SqlMetaData("DatabaseName", SqlDbType.NVarChar, 200),
            //    new SqlMetaData("ErrorMessage", SqlDbType.VarChar, 4000));
            //}


            // Mark the begining of the result-set.
            sp.SendResultsStart(record_error);

            foreach (DatabaseRequest request in requests)
            {
                if (request.State != StateType.Success)
                {
                    // output errors to a result
                    //if (idx_id_column != -1)
                    if (request.ServerId != -1)
                    {
                        record_error.SetValues(request.ServerName, request.ServerId, request.DatabaseName, request.ErrorMessage);
                    }
                    else
                    {
                        record_error.SetValues(request.ServerName, DBNull.Value, request.DatabaseName, request.ErrorMessage);
                    }
                    sp.SendResultsRow(record_error);
                }
            }
            // Mark the end of the result-set.
            sp.SendResultsEnd();
        }

        private static void SendErrorsToTable(TargetObject target, bool isTargetErrorTableNameExists, string targetErrorTableName, List<DatabaseRequest> requests)
        {
            // Prepeare output error table
            //DataTable dt = null;

            if (requests == null)
            {
                throw new NullReferenceException("requests");
            }

            string targetConnStr = Utils.MakeConnectionString(target.ServerName, target.DatabaseName, "", "", true, 10);
            using (SqlConnection targetConn = new SqlConnection(targetConnStr))
            {
                targetConn.Open();

                DataTable dt = SendErrorsToTable1(targetConn, isTargetErrorTableNameExists, targetErrorTableName);

                foreach (DatabaseRequest request in requests)
                {
                    // output errors to a table
                    SendErrorsToTable2(request, dt);
                }
                // Upload to the server
                Utils.UploadTable(targetConn, targetErrorTableName, dt);
                targetConn.Close();
            }
        }

        private static DataTable SendErrorsToTable1(SqlConnection targetConn, bool isTargetErrorTableNameExists, string targetErrorTableName)
        {
            DataTable dt = null;
            // Create table for errors if it doesnt exists
            if (!isTargetErrorTableNameExists)
            {
                string sqlColumnList = string.Empty;
                //if (idx_id_column != -1)
                //{
                sqlColumnList = "(ServerName NVARCHAR(128), ServerID int, DatabaseName NVARCHAR(128), ErrorMessage NVARCHAR(4000))";
                //}
                //else
                //{
                //    sqlColumnList = "(ServerName NVARCHAR(128), DatabaseName NVARCHAR(128), ErrorMessage NVARCHAR(4000))";
                //}
                Utils.CreateTable(targetConn, targetErrorTableName, sqlColumnList, Utils.TableRefreshMode.AddToTable);
            }

            dt = new DataTable(targetErrorTableName);
            dt.Columns.Add("ServerName", Type.GetType("System.String"));
            //if (idx_id_column != -1)
            //{
            dt.Columns.Add("ServerID", Type.GetType("System.Int32"));
            //}
            dt.Columns.Add("DatabaseName", Type.GetType("System.String"));
            dt.Columns.Add("ErrorMessage", Type.GetType("System.String"));
            return dt;
        }
        private static void SendErrorsToTable2(DatabaseRequest request, DataTable dt)
        {
            string serverName = request.ServerName != null ? request.ServerName : "<No Server Name>";
            string databaseName = request.DatabaseName != null ? request.DatabaseName : "<No Database Name>";
            string errorMessage = request.ErrorMessage != null ? request.ErrorMessage : "<No Error Message>";

            if (errorMessage.Length > 4000)
            {
                errorMessage = errorMessage.Substring(0, 4000);
            }
            //errorMessage = string.Format("ErrorMessage.Length {0}", errorMessage.Length.ToString());
            if (request.State != StateType.Success)
            {
                //if (idx_id_column != -1)
                if (request.ServerId != -1)
                {
                    dt.Rows.Add(serverName, request.ServerId, databaseName, errorMessage);
                }
                else
                {
                    dt.Rows.Add(serverName, DBNull.Value, databaseName, errorMessage);
                }
            }
        }

        //private static void CreateSqlDataRecord(List<DatabaseRequest>  requests, SqlPipe sp)
        //{
        //    SqlDataRecord record = null;
        //    foreach (DatabaseRequest request in requests)
        //    {
        //        SqlMetaData[] metaColumns;
        //        if ((request.State == StateType.Success) && (request.ResultTable != null))
        //        {

        //            //sp.Send("test2.5");
        //            metaColumns = new SqlMetaData[request.ResultTable.Columns.Count + 3];
        //            metaColumns[0] = new SqlMetaData("ServerName", SqlDbType.NVarChar, 200);
        //            metaColumns[1] = new SqlMetaData("Status", SqlDbType.VarChar, 100);
        //            metaColumns[2] = new SqlMetaData("ErrorMessage", SqlDbType.VarChar, 1000);

        //            int colIndex = 3;
        //            foreach (DataColumn col in request.ResultTable.Columns)
        //            {
        //                if (col.DataType == typeof(string))
        //                {
        //                    metaColumns[colIndex] = new SqlMetaData(col.ColumnName, SqlDbType.NVarChar, col.MaxLength);
        //                }
        //                else if (col.DataType == typeof(Object))
        //                {
        //                    metaColumns[colIndex] = new SqlMetaData(col.ColumnName, SqlDbType.Variant);
        //                }
        //                else if (col.DataType == typeof(Int32))
        //                {
        //                    metaColumns[colIndex] = new SqlMetaData(col.ColumnName, SqlDbType.Int);
        //                }
        //                else if (col.DataType == typeof(Int64))
        //                {
        //                    metaColumns[colIndex] = new SqlMetaData(col.ColumnName, SqlDbType.BigInt);
        //                }
        //                else
        //                {
        //                    throw new NotImplementedException(col.DataType.ToString());
        //                }
        //                colIndex++;
        //            }

        //            record = new SqlDataRecord(metaColumns);
        //            break;
        //        }
        //    }

        //    if (record != null)
        //    {
        //        // Mark the begining of the result-set.
        //        if (sp != null)
        //        {
        //            sp.SendResultsStart(record);
        //        }
        //        foreach (DatabaseRequest request in requests)
        //        {
        //            if (request.State == StateType.Success)
        //            {
        //                if (request.ResultTable != null)
        //                {
        //                    // Check type for each dataset
        //                    foreach (DataRow row in request.ResultTable.Rows)
        //                    {
        //                        record.SetString(0, request.ServerName);
        //                        record.SetString(1, request.State.ToString());
        //                        record.SetString(2, string.Empty);
        //                        int colIndex = 0;
        //                        foreach (DataColumn col in request.ResultTable.Columns)
        //                        {
        //                            record.SetValue(colIndex + 3, row[colIndex]);
        //                            //if (col.DataType == typeof(string))
        //                            //{
        //                            //    record.SetString(colIndex + 3, (string)row[colIndex]);
        //                            //}
        //                            //else if (col.DataType == typeof(Object))
        //                            //{
        //                            //    record.SetValue(colIndex + 3, (Object)row[colIndex]);
        //                            //}
        //                            //else if (col.DataType == typeof(Int32))
        //                            //{
        //                            //    record.SetSqlInt32(colIndex + 3, (Int32)row[colIndex]);
        //                            //}
        //                            //else if (col.DataType == typeof(Int64))
        //                            //{
        //                            //    record.SetSqlInt64(colIndex + 3, (Int64)row[colIndex]);
        //                            //}

        //                            colIndex++;
        //                        }
        //                        if (sp != null)
        //                        {
        //                            sp.SendResultsRow(record);
        //                        }
        //                    }
        //                    //                            record.SetValues(request.ServerName, request.State.ToString(), request.Result);
        //                }
        //                //System.Diagnostics.Debug.WriteLine(request.Result);
        //            }
        //            else
        //            {
        //                record.SetValues(request.ServerName, request.State.ToString(), request.ErrorMessage);
        //                for (int i = 3; i < record.FieldCount; i++)
        //                {
        //                    record.SetValue(i, null);
        //                }

        //                sp.SendResultsRow(record);
        //                //System.Diagnostics.Debug.WriteLine(request.ErrorMessage);
        //            }
        //        }
        //        //sp.Send("test5");
        //        // Mark the end of the result-set.
        //        if (sp != null)
        //        {
        //            sp.SendResultsEnd();
        //        }
        //    }
        //}

    }


}