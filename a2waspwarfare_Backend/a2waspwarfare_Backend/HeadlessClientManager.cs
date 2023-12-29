using System;
using System.Diagnostics;
using System.ServiceProcess;

public static class HeadlessClientManager
{
    public static async Task RebootHeadlessClientAndSetItToRealTimePriority()
    {
        // Wait for 2 minutes before killing the headless client and setting the process to real time priority
        await Task.Delay(TimeSpan.FromMinutes(2));

        Process[] armaProcesses = Process.GetProcessesByName("Arma2OA");
        foreach (Process armaProcess in armaProcesses)
        {
            armaProcess.Kill();
        }

        armaProcesses = Process.GetProcessesByName("Arma2OA");
        foreach (Process armaProcess in armaProcesses)
        {
            armaProcess.PriorityClass = ProcessPriorityClass.RealTime;
        }
    }
}