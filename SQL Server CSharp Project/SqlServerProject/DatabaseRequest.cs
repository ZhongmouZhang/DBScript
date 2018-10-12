using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;


namespace SqlServerProject
{
    public enum StateType { NotRun, Success, Failure, Timeout };

    struct TargetObject
    {
        public string ServerName;
        public string DatabaseName;
        public string TableName;

        //public TargetObject()
        //{
        //    ServerName = string.Empty;
        //    DatabaseName = string.Empty;
        //    Table = string.Empty;
        //}
    }
    struct DatabaseRequest
    {
        public delegate void DatabaseRequestCompletedCallBack(string serverName, int result);

        private string serverName;
        private int serverId;
        private string databaseName;
        private string sqlQuery;
        private DatabaseRequestCompletedCallBack completedCallBack;

        private string result;
        private DataTable resultTable;
        private StateType state;
        private string errorMessage;


        public string ServerName
        {
            get
            {
                return serverName;
            }

            set
            {
                serverName = value;
            }
        }

        public int ServerId
        {
            get
            {
                return serverId;
            }

            set
            {
                serverId = value;
            }
        }

        public string DatabaseName
        {
            get
            {
                return databaseName;
            }

            set
            {
                databaseName = value;
            }
        }

        public string SqlQuery
        {
            get { return sqlQuery; }
            set { sqlQuery = value; }
        }

        internal DatabaseRequestCompletedCallBack CompletedCallBack
        {
            get { return completedCallBack; }
            set { completedCallBack = value; }
        }

        public DataTable ResultTable
        {
            get
            {
                return resultTable;
            }

            set
            {
                resultTable = value;
            }
        }

        public string Result
        {
            get
            {
                return result;
            }

            set
            {
                result = value;
            }
        }

        public StateType State
        {
            get
            {
                return state;
            }

            set
            {
                state = value;
            }
        }

        public string ErrorMessage
        {
            get
            {
                return errorMessage;
            }

            set
            {
                errorMessage = value;
            }
        }

        public DatabaseRequest(string _serverName, int _serverId, string _databaseName)
        {
            serverName = _serverName;
            serverId = _serverId;
            databaseName = _databaseName;
            sqlQuery = string.Empty;
            result = string.Empty;
            resultTable = null;
            state = StateType.NotRun;
            errorMessage = string.Empty;
            completedCallBack = null;
        }

        public DatabaseRequest(string _serverName, int _serverId, string _databaseName, string _sqlQuery, DatabaseRequestCompletedCallBack _completedCallBack)
        {
            serverName = _serverName;
            serverId = _serverId;
            databaseName = _databaseName;
            sqlQuery = _sqlQuery;
            completedCallBack = _completedCallBack;

            result = string.Empty;
            resultTable = null;
            state = StateType.NotRun;
            errorMessage = string.Empty;
        }

    }
}
