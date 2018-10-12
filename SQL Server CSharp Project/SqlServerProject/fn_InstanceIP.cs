using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Net.NetworkInformation;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlString fn_InstanceIP(SqlString serverName)
    {
        string ipAddress;

        Ping pinger = new Ping();
        try
        {
            PingReply reply = pinger.Send((String) serverName);
            if (reply.Status == IPStatus.Success)
            {
                ipAddress = System.Net.Dns.GetHostEntry((string)serverName).AddressList[0].ToString();
            }
            else
                ipAddress = "0.0.0.0";
        }
        catch (Exception e)
        {
            ipAddress = "0.0.0.0";
        }
        return new SqlString(ipAddress);
    }

    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlString fn_InstanceFqn(SqlString serverName)
    {
        // Put your code here
        string fqn;
        try
        {
            fqn = System.Net.Dns.GetHostEntry((string)serverName).HostName.ToString();
        }
        catch (Exception e)
        {
            fqn = "UNKNOWN";
        }
        return new SqlString(fqn);
    }

    [Microsoft.SqlServer.Server.SqlFunction(SystemDataAccess = SystemDataAccessKind.Read, DataAccess = DataAccessKind.Read)]
    public static SqlString fn_PingSQL(SqlString serverName)
    {
        string connetionString = null;
        SqlString returnValue;
        SqlConnection cnn;

        connetionString = "Data Source=" + (string)serverName + ";DataBase=master;Integrated Security=SSPI";
        cnn = new SqlConnection(connetionString);
        try
        {
            cnn.Open();
            cnn.Close();
            returnValue = "Success";
        }
        catch (Exception ex)
        {
            returnValue = ex.Message;
        }

        return returnValue;
    }



};

