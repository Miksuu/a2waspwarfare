using System.Runtime.Serialization;

[DataContract]
public class GameData
{
    // File paths
    public static string dbPath = @"C:\a2waspwarfare\Data";
    public static string dbFileName = "database.json";
    public static string dbPathWithFileName = dbPath + @"\" + dbFileName;

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