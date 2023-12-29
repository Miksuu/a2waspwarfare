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

        //RotationManager.ModifyRotation();

        if (_args != null && _args.Length > 0 && _args[0] == "true")
        {
            await ServerManager.RestartServerAndHeadlessClient();
        }
        else 
        {
            Log.WriteLine("Not restarting server");
        }

        while (true)
        {
            Log.WriteLine("Waiting for client connection...", LogLevel.VERBOSE);

            using (NamedPipeServerStream pipeServer = 
                new NamedPipeServerStream("testpipe", PipeDirection.In))
            {
                Log.WriteLine("Created NamedPipeServerStream", LogLevel.VERBOSE);
                pipeServer.WaitForConnection();
                Log.WriteLine("Client connected", LogLevel.VERBOSE);

                using (StreamReader sr = new StreamReader(pipeServer))
                {
                    Log.WriteLine("Created StreamReader", LogLevel.VERBOSE);
                    string temp;
                    while ((temp = sr.ReadLine()) != null)
                    {
                        Log.WriteLine("Received from client: " + temp, LogLevel.DEBUG);

                        if (temp == "restartServer")
                        {
                            await ServerManager.RestartServerAndHeadlessClient();
                        }
                    }
                }
            }

            // Log.WriteLine("Waiting for 1 second before next iteration", LogLevel.VERBOSE);
            // await Task.Delay(1000); // Wait for 1 second before next iteration
        }
    }
}