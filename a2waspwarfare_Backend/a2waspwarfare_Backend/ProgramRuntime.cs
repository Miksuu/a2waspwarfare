using System;
using System.Diagnostics;
using System.ServiceProcess;

class ProgramRuntime
{
    // Args[0] = restart server, true or false
    public static async Task InitBackend(string[] _args)
    {
        if (_args[0] == "true")
        {
            ServerManager.RestartServer();
        }
    }
}