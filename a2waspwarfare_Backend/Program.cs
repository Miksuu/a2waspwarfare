class Program
{
    // Entry point
    // Args[0] = restart server, true or false
    static async Task Main(string[] _args)
    {
        await ProgramRuntime.InitBackend(_args);
    }
}