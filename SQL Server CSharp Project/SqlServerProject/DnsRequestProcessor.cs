using System;
using System.Collections.Generic;
using System.Threading;
using System.Net.NetworkInformation;
using System.Data;


namespace SqlServerProject
{
    class DnsRequestProcessor
    {
        const int MAX_THREADS = 64;
        /// 
        /// Executes a set of methods in parallel and returns the results
        /// from each in an array when all threads have completed.  The methods
        /// must take no parameters and have no return value.

        public List<DnsRequest> ExecuteParallel(List<DnsRequest> list)
        {
            int totalThreads = list.Count < MAX_THREADS ? list.Count : MAX_THREADS;

            //Microsoft.SqlServer.Server.SqlContext.Pipe.Send(string.Format("totalThreads: {0}", totalThreads));
            List<DnsRequest> result = new List<DnsRequest>();

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
                        DnsRequest req;
                        List<DnsRequest> reqs;
                        req = RunRequest(list[actionIndex]);
                        result.Add(req);
                        iteration++;
                        actionIndex = iteration * totalThreads + threadIndex;
                    }
                    // Tell the calling thread that we're done
                    resetEvents[threadIndex].Set();
                }), i);
            }

            //Microsoft.SqlServer.Server.SqlContext.Pipe.Send(string.Format("Wait"));
            int timeout_minutes = Convert.ToInt32(1.0 * list.Count / totalThreads); // Wait 1 minute for every task divided by total number of threads
            // Wait for all threads to execute
            if (!WaitHandle.WaitAll(resetEvents, new TimeSpan(0, timeout_minutes, 0)))
            {
                throw new TimeoutException(string.Format("DnsRequestProcessor.ExecuteParallel: Timeout exception after waiting for {0} minutes for {1} thread to complete the work", timeout_minutes, totalThreads));
            }
            //SqlConnection.ClearAllPools();
            return result;
        }

        private static DnsRequest RunRequest(DnsRequest request)
        {
            string serverName = request.ServerName;

            switch (request.RequestType)
            {
                case DnsRequestType.GetIP:
                    request.Result = RunGetIP(request.ServerName);
                    break;
                case DnsRequestType.GetFQN:
                    request.Result = RunGetFQN(request.ServerName);
                    break;
                case DnsRequestType.Ping:
                    request.Result = RunPing(request.ServerName);
                    break;
                default:
                    request.Result = "Invalid Type";
                    break;
            }
            return request;
        }


        private static string RunGetIP(string serverName)
        {
            string ipAddress;

            Ping pinger = new Ping();
            try
            {
                ipAddress = System.Net.Dns.GetHostEntry((string)serverName).AddressList[0].ToString();
            }
            catch (Exception e)
            {
                ipAddress = "0.0.0.0";
            }
            return ipAddress;
        }
        private static string RunGetFQN(string serverName)
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
            return fqn;
        }

        private static string RunPing(string serverName)
        {
            string result;
            Ping pinger = new Ping();
            try
            {
                PingReply reply = pinger.Send((String)serverName);
                result = reply.Status.ToString();
            }
            catch (Exception e)
            {
                result = e.Message;
            }
            return result;
        }

    }
}
