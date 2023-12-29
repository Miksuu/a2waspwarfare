using System;
using System.Diagnostics;
using System.ServiceProcess;
using System.IO.Pipes;

class ProgramRuntime
{
    // Args[0] = restart server, true or false
    public static async Task InitBackend(string[] _args)
    {
        Log.WriteLine("Starting backend");

        if (_args[0] == "true")
        {
            Log.WriteLine("Restarting server");
            ServerManager.RestartServer();
        }
        else 
        {
            Log.WriteLine("Not restarting server");
        }

        while (true)
        {
            using (NamedPipeServerStream pipeServer = 
                new NamedPipeServerStream("testpipe", PipeDirection.In))
            {
                pipeServer.WaitForConnection();

                using (StreamReader sr = new StreamReader(pipeServer))
                {
                    string temp;
                    while ((temp = sr.ReadLine()) != null)
                    {
                        Log.WriteLine("Received from client: " + temp, LogLevel.DEBUG);
                    }
                }
            }
        }
    }
}