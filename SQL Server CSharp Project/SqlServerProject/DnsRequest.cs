using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace SqlServerProject
{
    public enum DnsRequestType { GetIP, GetFQN, Ping };

    struct DnsRequest
    {
        public delegate void DnsRequestCompletedCallBack(string serverName, int result);

        private string serverName;
        private int serverId;
        private DnsRequestType requestType;

        private string result;
//        private string errorMessage;


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

        public DnsRequestType RequestType
        {
            get
            {
                return requestType;
            }

            set
            {
                requestType = value;
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

        //public string ErrorMessage
        //{
        //    get
        //    {
        //        return errorMessage;
        //    }

        //    set
        //    {
        //        errorMessage = value;
        //    }
        //}

        public DnsRequest(string _serverName, int _serverId, DnsRequestType _requestType)
        {
            serverName = _serverName;
            serverId = _serverId;
            requestType = _requestType;
            result = string.Empty;
//            errorMessage = string.Empty;
        }

    }
}
