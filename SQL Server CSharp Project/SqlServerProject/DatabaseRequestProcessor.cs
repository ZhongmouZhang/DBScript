using System;
using System.Collections.Generic;
using System.Threading;
//using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

using System.Data.SqlClient;

namespace SqlServerProject
{
    class DatabaseRequestProcessor
    {
        const int MAX_THREADS = 64;
        private volatile bool isTableCreated = false;
        // object isTableCreatedLock;
        /// 
        /// Executes a set of methods in parallel and returns the results
        /// from each in an array when all threads have completed.  The methods
        /// must take no parameters and have no return value.

        public List<DatabaseRequest> ExecuteParallel(List<DatabaseRequest> list)
        {
            return ExecuteParallel(list, new TargetObject());
        }
        public List<DatabaseRequest> ExecuteParallel(List<DatabaseRequest> list, TargetObject target)
        {
            int totalThreads = list.Count < MAX_THREADS ? list.Count : MAX_THREADS;

            //Microsoft.SqlServer.Server.SqlContext.Pipe.Send(string.Format("totalThreads: {0}", totalThreads));
            List<DatabaseRequest> result = new List<DatabaseRequest>();

            // Initialize the reset events to keep track of completed threads
            ManualResetEvent[] resetEvents = new ManualResetEvent[totalThreads];
            // Launch each method in it's own thread
            for (int i = 0; i < totalThreads; i++)
            {
                resetEvents[i] = new ManualResetEvent(false);
                ThreadPool.QueueUserWorkItem(new WaitCallback((object index) =>
                {
                    int threadIndex = (int)index;
                    int iteration = 0;
                    int actionIndex = threadIndex;

                    while (actionIndex < list.Count)
                    {
                        // Execute the method
                        DatabaseRequest req;
                        List<DatabaseRequest> reqs;
                        if (target.TableName == string.Empty)
                        {
                            req = RunQuery(list[actionIndex]);
                            result.Add(req);
                        }
                        else
                        {
                            reqs = RunQuery(list[actionIndex], target);
                            result.AddRange(reqs);
                        }
                        iteration++;
                        actionIndex = iteration * totalThreads + threadIndex;
                    }
                    // Tell the calling thread that we're done
                    resetEvents[threadIndex].Set();
                }), i);
            }

            //Microsoft.SqlServer.Server.SqlContext.Pipe.Send(string.Format("Wait"));
            int timeout_minutes = Convert.ToInt32(10.0 * list.Count / totalThreads); // Wait 10 minutes for every task divided by total number of threads
            // Wait for all threads to execute
            if (!WaitHandle.WaitAll(resetEvents, new TimeSpan(0, timeout_minutes, 0)))
            {
                throw new TimeoutException(string.Format("DatabaseRequestProcessor.ExecuteParallel: Timeout exception after waiting for {0} minutes for {1} thread to complete the work", timeout_minutes, totalThreads));
            }
            //SqlConnection.ClearAllPools();
            return result;
        }

        private static DatabaseRequest RunQuery(DatabaseRequest request)
        {
            string serverName = request.ServerName;
            string databaseName = request.DatabaseName;

            string connStr = Utils.MakeConnectionString(serverName, databaseName, "", "", true, 30);

            SqlConnection conn = new SqlConnection(connStr);
            DataSet ds = new DataSet();

            try
            {
                string sql = request.SqlQuery;
                string result = string.Empty;
                if (sql.Length > 0)
                {
                    ds = GetDataSet(conn, sql);

                    if ((ds.Tables.Count == 0) || (ds.Tables[0].Rows.Count == 0))
                    {
                        request.State = StateType.Failure;
                        request.Result = string.Empty;
                        request.ErrorMessage = "No dataset";
                    }
                    //else if ((ds.Tables[0].Rows.Count == 1) && (ds.Tables[0].Columns.Count == 1))
                    //{
                    //    result = Convert.ToString(ds.Tables[0].Rows[0][0]);
                    //    request.State = StateType.Success;
                    //    request.Result = result;
                    //}
                    else
                    {
                        request.State = StateType.Success;
                        request.ResultTable = ds.Tables[0];
                    }
                }
                else
                {
                    conn.Open();
                    conn.Close();
                    request.State = StateType.Success;
                    request.Result = string.Empty;
                }
                return request;
            }
            catch (SqlException exSql)
            {
                string fullErrorMessage = string.Empty;
                foreach (SqlError error in exSql.Errors)
                {
                    fullErrorMessage += (fullErrorMessage != string.Empty ? ";" : "") + error.Message;
                }
                request.State = StateType.Failure;
                request.Result = string.Empty;
                request.ErrorMessage = fullErrorMessage != string.Empty ? fullErrorMessage : exSql.Message.ToString();
                return request;
            }
            catch (Exception ex)
            {
                request.State = StateType.Failure;
                request.Result = string.Empty;
                request.ErrorMessage = ex.Message.ToString();
                return request;
            }
            finally
            {
                SqlConnection.ClearPool(conn);
            }
        }

        private List<DatabaseRequest> RunQuery(DatabaseRequest request, TargetObject target)
        {
            List<DatabaseRequest> result = new List<DatabaseRequest>();
            if (request.DatabaseName != string.Empty)
            {
                result.Add(RunQueryPerDB(request, target, true));
            }
            else
            {
                string serverName = request.ServerName;
                string connStr = Utils.MakeConnectionString(serverName, "master", "", "", true, 30);

                DataTable dt = new DataTable();

                try
                {
                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        conn.Open();
                        SqlDataAdapter da = new SqlDataAdapter("select name from master.dbo.sysdatabases WHERE (status & 512 != 512 AND status & 32 != 32 AND status & 128 != 128 AND status & 32768 != 32768)", conn);
                        da.Fill(dt);
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    request.State = StateType.Failure;
                    request.Result = string.Empty;
                    request.ErrorMessage = string.Format("{0} : {1}", ex.Source, ex.Message.ToString());
                    result.Add(request);
                    return result;
                }

                if (dt != null)
                {
                    int rows = dt.Rows.Count;
                    foreach (DataRow row in dt.Rows)
                    {
                        rows--;
                        request.DatabaseName = Convert.ToString(row["name"]);
                        result.Add(RunQueryPerDB(request, target, (rows == 0 ? true : false)));
                    }
                }
            }

            return result;
        }

        private DatabaseRequest RunQueryPerDB(DatabaseRequest request, TargetObject target)
        {
            return RunQueryPerDB(request, target, true);
        }

        private DatabaseRequest RunQueryPerDB(DatabaseRequest request, TargetObject target, bool lastQueryToServer)
        {
            string serverName = request.ServerName;
            int serverId = request.ServerId;
            string databaseName = request.DatabaseName;

            
            string connStr = Utils.MakeConnectionString(serverName, "master", "", "", true, 30);
            string targetConnStr = Utils.MakeConnectionString(target.ServerName, target.DatabaseName, "", "", true, 10);

            SqlConnection conn = new SqlConnection(connStr);
            SqlConnection targetConn = new SqlConnection(targetConnStr);
           
            try
            {
                string sql = request.SqlQuery;
                string result = string.Empty;
                if (sql.Length > 0)
                {
                    conn.Open();
                    targetConn.Open();
                    if (databaseName != "master")
                    {
                        sql = "USE " + Utils.QuoteName(databaseName) + Environment.NewLine + sql;
                    }
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.CommandTimeout = 600;
                    SqlDataReader reader = cmd.ExecuteReader();
                    string tempTableName = "#" + target.TableName.Replace(".", "_");

                    string sqlCreateTempTable = Utils.GetSQLColumnListFromDataReader(reader);
                    Utils.CreateTable(targetConn, tempTableName, sqlCreateTempTable, Utils.TableRefreshMode.DropTable);
                    Utils.UploadTable(targetConn, tempTableName, reader, cmd);
                    lock (this)
                    {
                        if (!isTableCreated)
                        {
                            string sqlCreateTable = Utils.GetSQLColumnListFromDataReader(reader);
                            int firstCol = sqlCreateTable.IndexOf("(");
                            string specialColumns = "\nServerName NVARCHAR(128),";

                            if (serverId != -1)
                            {
                                specialColumns += "\nServerID int,";
                            }
                            specialColumns += "\nDatabaseName NVARCHAR(128),";
                            sqlCreateTable = sqlCreateTable.Insert(firstCol + 1, specialColumns);

                            Utils.CreateTable(targetConn, target.TableName, sqlCreateTable, Utils.TableRefreshMode.AddToTable);
                            isTableCreated = true;
                        }
                    }
                    reader.Close();

                    string copyQuery = "INSERT {0} SELECT '{1}' AS ServerName, " + (serverId != -1 ? "'{4}' AS ServerID," : "") + " '{2}' AS ServerID, * FROM {3}";
                    sql = string.Format(copyQuery, 
                        Utils.GetQuotedTableName(target.TableName), 
                        serverName, 
                        databaseName,
                        Utils.GetQuotedTableName(tempTableName),
                        serverId
                        );

                    cmd = new SqlCommand(sql, targetConn);
                    cmd.CommandTimeout = 600;
                    cmd.ExecuteNonQuery();
                    request.State = StateType.Success;
                }
                else
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT 1", conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    request.State = StateType.Success;
                    request.Result = string.Empty;
                }
                return request;
            }
            catch (SqlException exSql)
            {
                string fullErrorMessage = string.Empty;
                foreach (SqlError error in exSql.Errors)
                {
                    fullErrorMessage += (fullErrorMessage != string.Empty ? " ; " : "")
                        + string.Format("Msg {0}, Level {1}, State {2}, Line {3} : {4}", error.Number, error.Class, error.State, error.LineNumber, error.Message);
                }
                request.State = StateType.Failure;
                request.Result = string.Empty;
                request.ErrorMessage = string.Format("{0} : {1}", exSql.Source, fullErrorMessage != string.Empty ? fullErrorMessage : exSql.Message.ToString());
                return request;
            }
            catch (Exception ex)
            {
                request.State = StateType.Failure;
                request.Result = string.Empty;
                request.ErrorMessage = string.Format("{0} : {1}",  ex.Source, ex.Message.ToString());
                return request;
            }
            finally
            {
                conn.Close();
                if (targetConn.State != ConnectionState.Closed)
                {
                    conn.Close();
                }
                if (targetConn.State != ConnectionState.Closed)
                {
                    targetConn.Close();
                }
                if (lastQueryToServer)
                {
                    SqlConnection.ClearPool(conn);
                }
                //                SqlConnection.ClearPool(targetConn);
            }
        }

        public static DataSet GetDataSet(SqlConnection conn, string strSQL)
        {
            using (SqlCommand comm = new SqlCommand(strSQL))
            {
                comm.CommandTimeout = 600;
                comm.Connection = conn;
                using (SqlDataAdapter da = new SqlDataAdapter(comm))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    return ds;
                }
            }
        }
    }
}
