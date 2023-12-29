using System;
using System.Diagnostics;
using System.ServiceProcess;

public static class ServerManager
{
    public static async Task RestartServerAndHeadlessClient()
    {
        Log.WriteLine("Initiating server restart process", LogLevel.VERBOSE);

        // Restart the service named A2OAServer
        ServiceController service = new ServiceController("A2OAServer");
        if (service.Status != ServiceControllerStatus.Stopped)
        {
            Log.WriteLine("Stopping the A2OAServer service", LogLevel.VERBOSE);
            service.Stop();
            service.WaitForStatus(ServiceControllerStatus.Stopped);
            Log.WriteLine("A2OAServer service stopped successfully", LogLevel.VERBOSE);
        }

        Log.WriteLine("Modifying rotation", LogLevel.VERBOSE);
        await RotationManager.ModifyRotation();
        Log.WriteLine("Rotation modified successfully", LogLevel.VERBOSE);

        Log.WriteLine("Rebooting headless client and setting it to real time priority", LogLevel.VERBOSE);
        Task.Run(() => HeadlessClientManager.RebootHeadlessClientAndSetItToRealTimePriority());
        Log.WriteLine("Headless client rebooted and set to real time priority successfully", LogLevel.VERBOSE);
        
        Log.WriteLine("Starting the A2OAServer service", LogLevel.VERBOSE);
        service.Start();
        service.WaitForStatus(ServiceControllerStatus.Running);
        Log.WriteLine("A2OAServer service started successfully", LogLevel.VERBOSE);

        Log.WriteLine("Server restart process completed", LogLevel.VERBOSE);
    }
}