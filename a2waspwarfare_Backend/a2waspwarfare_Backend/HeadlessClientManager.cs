using System;
using System.Diagnostics;
using System.ServiceProcess;

public static class HeadlessClientManager
{
    public static async Task RebootHeadlessClientAndSetItToRealTimePriority()
    {
        Process[] armaProcesses = Process.GetProcessesByName("Arma2OA");
        foreach (Process armaProcess in armaProcesses)
        {
            armaProcess.Kill();
        }

        // Wait for 2 minutes before setting the process to real time priority
        await Task.Delay(TimeSpan.FromMinutes(2));

        armaProcesses = Process.GetProcessesByName("Arma2OA");
        foreach (Process armaProcess in armaProcesses)
        {
            armaProcess.PriorityClass = ProcessPriorityClass.RealTime;
        }
    }
}