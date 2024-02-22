using Discord.WebSocket;
using Discord;
public static class GlobalVariables
{
    static string uidEnvVariable = Environment.GetEnvironmentVariable("databaseUid");
    static string passwordEnvVariable = Environment.GetEnvironmentVariable("databasePassword");
    static string databaseEnvVariable = Environment.GetEnvironmentVariable("databaseName");

    public static readonly string DbLocationAndDetails = @"server=localhost;uid=" + uidEnvVariable + ";pwd=" + passwordEnvVariable + ";database=" + databaseEnvVariable;
}