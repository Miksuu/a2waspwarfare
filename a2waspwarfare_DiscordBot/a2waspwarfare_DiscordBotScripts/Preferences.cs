using Newtonsoft.Json;
using System;

public sealed class Preferences
{
    // Singleton stuff
    private static Preferences? instance;
    private static readonly object padlock = new object();

    public ulong GuildID;
    public ulong[] AuthorizedUserIDs { get; set; } = new ulong[0];
    public ulong? GameStatusChannelID { get; set; }
    public ulong? GameStatusMessageID { get; set; }
    public string? DataSourcePath { get; set; }
    public bool a3Mode { get; set; } = false;
    public string LogLevelString { get; set; } = "debug";

    public static Preferences Instance
    {
        get
        {
            lock (padlock)
            {
                if (instance == null)
                {
                    string json = File.ReadAllText("preferences.json");
                    instance = JsonConvert.DeserializeObject<Preferences>(json);
                }
            }
#pragma warning disable CS8603 // Possible null reference return.
            return instance;
#pragma warning restore CS8603 // Possible null reference return.
        }
        set
        {
            instance = value;
        }
    }

    public static void SaveToFile()
    {
        lock (padlock)
        {
            string json = JsonConvert.SerializeObject(Instance, Formatting.Indented);
            File.WriteAllText("preferences.json", json);
        }
    }

    public bool IsUserAuthorized(ulong userId)
    {
        return AuthorizedUserIDs.Contains(userId);
    }
    
    public LogLevel GetLogLevel()
    {
        switch (LogLevelString?.ToLowerInvariant())
        {
            case "error": return LogLevel.ERROR;
            case "warning": return LogLevel.WARNING;
            case "important": return LogLevel.IMPORTANT;
            case "serialization": return LogLevel.SERIALIZATION;
            case "debug": return LogLevel.DEBUG;
            case "add_verbose": return LogLevel.ADD_VERBOSE;
            case "set_verbose": return LogLevel.SET_VERBOSE;
            case "get_verbose": return LogLevel.GET_VERBOSE;
            case "verbose": return LogLevel.VERBOSE;
            default: return LogLevel.DEBUG;
        }
    }
}
