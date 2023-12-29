using System;
using System.Diagnostics;
using System.ServiceProcess;

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
                Process.Start(new ProcessStartInfo
                {
                    FileName = "a2waspwarfare_Backend.exe",
                    WorkingDirectory = @"C:\a2waspwarfare_Backend",
                    Arguments = "true"
                });
            }
        }
        catch (Exception _ex)
        {
            Log.WriteLine(_ex.Message, LogLevel.CRITICAL);
            throw new InvalidOperationException(_ex.Message);
        }
    }
}