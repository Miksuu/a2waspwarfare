public static class FileConfiguration
{
    public static readonly string MainAppNameDataDirectory = @"C:\a2waspwarfare\Data";
    public static readonly string LogsPath = ".logs/";
    
    // Configurable data source path
    private static string? customDataPath;
    
    public static string DataSourcePath
    {
        get
        {
            // Use Preferences if set
            if (!string.IsNullOrEmpty(Preferences.Instance.DataSourcePath))
            {
                return Preferences.Instance.DataSourcePath;
            }
            if (!string.IsNullOrEmpty(customDataPath))
            {
                return customDataPath;
            }
            // Try to load from config file
            try
            {
                if (File.Exists("botconfig.json"))
                {
                    var config = System.Text.Json.JsonSerializer.Deserialize<BotConfig>(File.ReadAllText("botconfig.json"));
                    if (config != null && !string.IsNullOrEmpty(config.DataSourcePath))
                    {
                        customDataPath = config.DataSourcePath;
                        Log.WriteLine($"Using custom data source path: {customDataPath}", LogLevel.DEBUG);
                        return customDataPath;
                    }
                }
            }
            catch (Exception ex)
            {
                Log.WriteLine($"Error loading bot config: {ex.Message}", LogLevel.WARNING);
            }
            // Default fallback
            Log.WriteLine("Using default Arma 2 data source path", LogLevel.DEBUG);
            return MainAppNameDataDirectory;
        }
    }
    
    public static void SetCustomDataSourcePath(string path)
    {
        customDataPath = path;
        Log.WriteLine($"Custom data source path set to: {path}", LogLevel.DEBUG);
    }
}

public class BotConfig
{
    public string? DataSourcePath { get; set; }
}
