using System;
using System.Diagnostics;
using System.ServiceProcess;
using System.IO.Pipes;

class ProgramRuntime
{
    // Args[0] = restart server, true or false
    public static async Task InitBackend(string[] _args)
    {
        if (_args[0] == "true")
        {
            ServerManager.RestartServer();
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
                        Console.WriteLine("Received from client: {0}", temp);
                    }
                }
            }
        }
    }
}