using System;
using System.Diagnostics;
using System.ServiceProcess;

public static class ServerManager
{
    public static async Task RestartServerAndHeadlessClient()
    {
        Log.WriteLine("Restarting server");

        // Restart the service named A2OAServer
        ServiceController service = new ServiceController("A2OAServer");
        if (service.Status != ServiceControllerStatus.Stopped)
        {
            service.Stop();
            service.WaitForStatus(ServiceControllerStatus.Stopped);
        }
        service.Start();
        service.WaitForStatus(ServiceControllerStatus.Running);

        Log.WriteLine("Done restarting server, killing headless client.");

        Task.Run(() => HeadlessClientManager.RebootHeadlessClientAndSetItToRealTimePriority());
    }
}