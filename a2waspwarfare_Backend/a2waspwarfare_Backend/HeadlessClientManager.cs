using System;
using System.Diagnostics;
using System.ServiceProcess;

public static class HeadlessClientManager
{
    public static async Task RebootHeadlessClientAndSetItToRealTimePriority()
    {
        Log.WriteLine("Initiating reboot of headless client and setting process to real time priority", LogLevel.VERBOSE);

        // Wait for 2 minutes before killing the headless client and setting the process to real time priority
        await Task.Delay(TimeSpan.FromMinutes(2));

        Process[] armaProcesses = Process.GetProcessesByName("Arma2OA");
        foreach (Process armaProcess in armaProcesses)
        {
            Log.WriteLine("Killing Arma2OA process with ID: " + armaProcess.Id, LogLevel.VERBOSE);
            armaProcess.Kill();
        }

        await Task.Delay(TimeSpan.FromSeconds(20));

        armaProcesses = Process.GetProcessesByName("Arma2OA");
        foreach (Process armaProcess in armaProcesses)
        {
            Log.WriteLine("Setting Arma2OA process with ID: " + armaProcess.Id + " to real time priority", LogLevel.VERBOSE);
            armaProcess.PriorityClass = ProcessPriorityClass.RealTime;
        }

        Log.WriteLine("Reboot of headless client and setting process to real time priority completed", LogLevel.VERBOSE);
    }
}