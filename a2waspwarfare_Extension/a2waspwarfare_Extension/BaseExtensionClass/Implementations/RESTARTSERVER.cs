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
            Log.WriteLine("Starting server restart process", LogLevel.DEBUG);

            Process[] pname = Process.GetProcessesByName("a2waspwarfare_Backend");
            if (pname.Length == 0)
            {
                Log.WriteLine("No existing a2waspwarfare_Backend process found. Starting a new one.", LogLevel.DEBUG);

                // Start a new process that runs a separate application to handle the backend
                ProcessStartInfo startInfo = new ProcessStartInfo
                {
                    FileName = "a2waspwarfare_Backend.exe",
                    WorkingDirectory = @"C:\a2waspwarfare_Backend",
                    Arguments = "true",
                    //UseShellExecute = false, // Don't use operating system shell to start the process
                    //CreateNoWindow = true, // Don't create a new window
                };

                // Print the ProcessStartInfo after it's set
                Log.WriteLine($"ProcessStartInfo set: FileName = {startInfo.FileName}, WorkingDirectory = {startInfo.WorkingDirectory}, Arguments = {startInfo.Arguments}, UseShellExecute = {startInfo.UseShellExecute}, CreateNoWindow = {startInfo.CreateNoWindow}", LogLevel.DEBUG);

                Process backendProcess = new Process { StartInfo = startInfo };
                backendProcess.Start();
                Log.WriteLine("New a2waspwarfare_Backend process started.", LogLevel.DEBUG);
            }
            else
            {
                Log.WriteLine("Existing a2waspwarfare_Backend process found. Sending restart command.", LogLevel.DEBUG);

                using (NamedPipeClientStream pipeClient = 
                    new NamedPipeClientStream(".", "testpipe", PipeDirection.Out))
                {
                    pipeClient.Connect();
                    Log.WriteLine("Connected to pipe.", LogLevel.DEBUG);

                    using (StreamWriter sw = new StreamWriter(pipeClient))
                    {
                        sw.WriteLine("restartServer");
                        Log.WriteLine("Restart command sent.", LogLevel.DEBUG);
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