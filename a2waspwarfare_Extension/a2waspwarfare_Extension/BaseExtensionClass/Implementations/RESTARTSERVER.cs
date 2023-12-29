using System;
using System.Diagnostics;
using System.IO;
using System.IO.Pipes;

public class RESTARTSERVER : BaseExtensionClass
{
    public override void ActivateExtensionMethodOnTheDerivedClass(string[] _args)
    {
        try
        {
            Log.WriteLine("Restarting server", LogLevel.DEBUG);

            Process[] pname = Process.GetProcessesByName("a2waspwarfare_Backend");
            if (pname.Length == 0)
            {
                // Start a new process that runs a separate application to handle the backend
                ProcessStartInfo startInfo = new ProcessStartInfo
                {
                    FileName = "a2waspwarfare_Backend.exe",
                    WorkingDirectory = @"C:\a2waspwarfare_Backend",
                    Arguments = "true",
                    UseShellExecute = false, // Don't use operating system shell to start the process
                    CreateNoWindow = true, // Don't create a new window
                };

                Process backendProcess = new Process { StartInfo = startInfo };
                backendProcess.Start();
            }
            else
            {
                using (NamedPipeClientStream pipeClient = 
                    new NamedPipeClientStream(".", "testpipe", PipeDirection.Out))
                {
                    pipeClient.Connect();

                    using (StreamWriter sw = new StreamWriter(pipeClient))
                    {
                        sw.WriteLine("restartServer");
                    }
                }
            }
        }
        catch (Exception _ex)
        {
            Log.WriteLine(_ex.Message, LogLevel.CRITICAL);
            throw new InvalidOperationException(_ex.Message);
        }
    }
}