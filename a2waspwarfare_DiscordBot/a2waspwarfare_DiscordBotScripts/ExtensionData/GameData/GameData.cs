using System.Runtime.Serialization;
using Newtonsoft.Json;

[DataContract]
public class GameData
{
    public static GameData Instance
    {
        get
        {
            lock (padlock)
            {
                if (instance == null)
                {
                    instance = new GameData();
                }
                return instance;
            }
        }
        set
        {
            instance = value;
        }
    }

    // Singleton stuff
    private static GameData instance;
    private static readonly object padlock = new object();

    [DataMember] private string[] exportedArgs = new string[4];

    public static GameData LoadFromFile()
    {
        try
        {
            var dataPath = Preferences.Instance.DataSourcePath ?? @"C:\a2waspwarfare\Data";
            var filePath = Path.Combine(dataPath, "database.json");
            
            Log.WriteLine($"Loading GameData from: {filePath}", LogLevel.DEBUG);

            if (!File.Exists(filePath))
            {
                Log.WriteLine($"Database file not found: {filePath}. Using default GameData.", LogLevel.WARNING);
                return new GameData();
            }

            string json = File.ReadAllText(filePath);
            
            var serializerSettings = new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Include,
                TypeNameHandling = TypeNameHandling.All,
                ObjectCreationHandling = ObjectCreationHandling.Replace
            };

            var gameData = JsonConvert.DeserializeObject<GameData>(json, serializerSettings);
            
            if (gameData == null)
            {
                Log.WriteLine("Failed to deserialize GameData from JSON. Using default GameData.", LogLevel.WARNING);
                return new GameData();
            }
            
            Log.WriteLine("GameData loaded successfully", LogLevel.DEBUG);
            return gameData;
        }
        catch (Exception ex)
        {
            Log.WriteLine($"Error loading GameData: {ex.Message}. Using default GameData.", LogLevel.ERROR);
            return new GameData();
        }
    }

    public string GetGameMapAndPlayerCountWithEmoji()
    {
        var terrainInstance = GetInterfaceTerrainFromWorldName();
        
        // Fix array bounds issue and add fallback values
        string playerCount = "0";
        if (exportedArgs != null && exportedArgs.Length > 4 && !string.IsNullOrEmpty(exportedArgs[4]))
        {
            playerCount = exportedArgs[4];
        }
        
        string maxPlayerCount = terrainInstance.DetermineMissionTypeIfItsForestOrDesertAndGetThePlayerCount();

        string terrainEmoji = EnumExtensions.GetEnumMemberAttrValue(EmojiName.EVERGREENTREE);

        if (terrainInstance.TerrainType == TerrainType.DESERT)
        {
            terrainEmoji = EnumExtensions.GetEnumMemberAttrValue(EmojiName.DESERT);
        }

        return terrainEmoji + " [" + playerCount + "/" + maxPlayerCount + "] " + 
            EnumExtensions.GetEnumMemberAttrValue(terrainInstance.TerrainName);
    }

    public string GetGameMapAndPlayerCountWithEmojiForChannelName()
    {
        var terrainInstance = GetInterfaceTerrainFromWorldName();
        
        // Fix array bounds issue and add fallback values
        string playerCount = "0";
        if (exportedArgs != null && exportedArgs.Length > 4 && !string.IsNullOrEmpty(exportedArgs[4]))
        {
            playerCount = exportedArgs[4];
        }
        
        string maxPlayerCount = terrainInstance.DetermineMissionTypeIfItsForestOrDesertAndGetThePlayerCount();

        string terrainEmoji = EnumExtensions.GetEnumMemberAttrValue(EmojiName.EVERGREENTREE);

        if (terrainInstance.TerrainType == TerrainType.DESERT)
        {
            terrainEmoji = EnumExtensions.GetEnumMemberAttrValue(EmojiName.DESERT);
        }

        return terrainEmoji + "  " + playerCount + "︱" + maxPlayerCount + "  " +
            EnumExtensions.GetEnumMemberAttrValue(terrainInstance.TerrainName);
    }

    //public string GetGameMapAndPlayerCount()
    //{
    //    var terrainInstance = GetInterfaceTerrainFromWorldName();
    //    string playerCount = GameData.Instance.exportedArgs[4];
    //    string maxPlayerCount = terrainInstance.DetermineMissionTypeIfItsForestOrDesertAndGetThePlayerCount();

    //    return "[" + playerCount + "/" + maxPlayerCount + "] " + terrainInstance.TerrainDisplayName;
    //}

    public InterfaceTerrain GetInterfaceTerrainFromWorldName()
    {
        // Check if exportedArgs is properly populated
        if (exportedArgs == null || exportedArgs.Length < 3 || string.IsNullOrEmpty(exportedArgs[2]))
        {
            // Return a default terrain if no data is available
            return (InterfaceTerrain)EnumExtensions.GetInstance("TAKISTAN");
        }
        
        return (InterfaceTerrain)EnumExtensions.GetInstance(exportedArgs[2]);
    }

    public string GenerateGameStatusMessage()
    {
        string message = string.Empty;

        // Add fallback values for score
        string bluforScore = "0";
        string opforScore = "0";
        
        if (exportedArgs != null && exportedArgs.Length > 1)
        {
            if (!string.IsNullOrEmpty(exportedArgs[0])) bluforScore = exportedArgs[0];
            if (!string.IsNullOrEmpty(exportedArgs[1])) opforScore = exportedArgs[1];
        }

        message += "Score: " + EnumExtensions.GetEnumMemberAttrValue(EmojiName.BLUFORICON) + bluforScore +
            " vs " + opforScore + EnumExtensions.GetEnumMemberAttrValue(EmojiName.OPFORICON);
        message += "\nUptime: " + ConvertUpTimeToSecondsAsString();

        message += "\n\nPlease balance the teams accordingly!";
        return message;
    }

    private string ConvertUpTimeToSecondsAsString()
    {
        // Add fallback for uptime
        if (exportedArgs == null || exportedArgs.Length < 4 || string.IsNullOrEmpty(exportedArgs[3]))
        {
            return "00:00:00";
        }
        
        if (ulong.TryParse(exportedArgs[3], out ulong uptime))
        {
            return TimeService.ReturnTimeLeftAsStringFromTheTimeTheActionWillTakePlaceWithTimeLeft(uptime);
        }
        
        return "00:00:00";
    }
}