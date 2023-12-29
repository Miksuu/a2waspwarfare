using System;

public class RESTARTSERVER : BaseExtensionClass
{
    public override void ActivateExtensionMethodOnTheDerivedClass(string[] _args)
    {
        try
        {
            Log.WriteLine("Restarting server", LogLevel.DEBUG);
        
            

            Log.WriteLine("Done restarting server", LogLevel.DEBUG);
        }
        catch (Exception _ex)
        {
            Log.WriteLine(_ex.Message, LogLevel.CRITICAL);
            throw new InvalidOperationException(_ex.Message);
        }
    }
}