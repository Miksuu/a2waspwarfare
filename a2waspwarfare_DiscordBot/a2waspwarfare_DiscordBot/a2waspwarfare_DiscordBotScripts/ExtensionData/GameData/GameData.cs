using A2WASPDiscordBot_Windows_App;
using MySql.Data.MySqlClient;
using System.Data;
using System.Drawing;
using System.Numerics;
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
        string playerCount = GameData.Instance.exportedArgs[4];
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
        string playerCount = GameData.Instance.exportedArgs[4];
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
        return (InterfaceTerrain)EnumExtensions.GetInstance(exportedArgs[2]);
    }

    public string GenerateGameStatusMessage()
    {
        string message = string.Empty;
        double skillWest = GetSideTotalSkill(Side.WEST);
        double skillEast = GetSideTotalSkill(Side.EAST);

        Side sideToJoin = GetSideWherePlayerShouldJoin(skillWest, skillEast);

        string emojiToJoin = EnumExtensions.GetEnumMemberAttrValue(EmojiName.OPFORICON);

        if (sideToJoin == Side.WEST)
        {
            emojiToJoin = EnumExtensions.GetEnumMemberAttrValue(EmojiName.BLUFORICON);
        }

        message += "Skill: " + EnumExtensions.GetEnumMemberAttrValue(EmojiName.BLUFORICON) + " " + skillWest +
            " vs " + skillEast + " " + EnumExtensions.GetEnumMemberAttrValue(EmojiName.OPFORICON) + "\n";
        message += emojiToJoin + " JOIN SIDE: " + sideToJoin.ToString() + " " + emojiToJoin + "\n\n";
        message += "Score: " + EnumExtensions.GetEnumMemberAttrValue(EmojiName.BLUFORICON) + exportedArgs[0] +
            " vs " + exportedArgs[1] + EnumExtensions.GetEnumMemberAttrValue(EmojiName.OPFORICON);
        message += "\nUptime: " + ConvertUpTimeToSecondsAsString();

        message += "\n\nPlease balance the teams accordingly!";
        return message;
    }

    public static Side GetSideWherePlayerShouldJoin(double _skillWest, double _skillEast)
    {
        if (_skillWest < _skillEast)
        {
            Log.WriteLine("Team to join is: " + Side.WEST, LogLevel.VERBOSE);
            return Side.WEST;
        }
        else
        {
            Log.WriteLine("Team to join is: " + Side.EAST, LogLevel.VERBOSE);
            return Side.EAST;
        }
    }

    public static double GetSideTotalSkill(Side side)
    {
        double sideTotalSkill = 0;

        List<Player> activePlayersOnSide = GetPlayersOnSide(side);

        foreach (Player player in activePlayersOnSide)
        {
            sideTotalSkill += (double)player.GetTotalScore() / player.GetTotalTicks();
        }

        sideTotalSkill = Math.Round(sideTotalSkill, 1);

        return sideTotalSkill;
    }

    public static List<Player> GetPlayersOnSide(Side side)
    {
        List<Player> listOfPlayersOnSide = new List<Player>();

        try
        {
            using (var conn = new MySql.Data.MySqlClient.MySqlConnection())
            {
                conn.ConnectionString = GlobalVariables.DbLocationAndDetails;
                conn.Open();

                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conn;
                // Log.Write("Connection opened and attached to MySqlCommand.", LogLevel.DEBUG);

                cmd.CommandText = "get_active_players_side";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@requestedSide", side.ToString());
                cmd.Parameters["@requestedSide"].Direction = ParameterDirection.Input;

                using (MySqlDataReader reader = cmd.ExecuteReader())
                {

                    while (reader.Read())
                    {
                        listOfPlayersOnSide.Add(new Player(reader.GetInt64(reader.GetOrdinal("player_guid"))));
                    }

                    reader.Close();
                }

                conn.Close();

                return listOfPlayersOnSide;
            }
        }
        catch (Exception e)
        {
            Log.WriteLine("Couldn't retrieve side [" + side + "] active players! Error: " + e.ToString(), LogLevel.ERROR);
            return null;
        }
    }

    /*
    private string ReceiveTeamSkillValues()
    {
        List<Player> listOfActivePlayers = new List<Player>();

        try
        {
            using (var conn = new MySql.Data.MySqlClient.MySqlConnection())
            {
                conn.ConnectionString = GlobalVariables.DbLocationAndDetails;
                conn.Open();

                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conn;
                // Log.Write("Connection opened and attached to MySqlCommand.", LogLevel.DEBUG);

                cmd.CommandText = "get_active_players_side";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@requestedSide", side.ToString());
                cmd.Parameters["@requestedSide"].Direction = ParameterDirection.Input;

                MySqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    listOfActivePlayers.Add(new Player(reader.GetInt64(reader.GetOrdinal("player_guid"))));
                }

                reader.Close();

                conn.Close();

                return listOfActivePlayers;
            }
        }
        catch (MySqlException ex)
        {
            Log.WriteLine("Retrieving data of players on side: " + side.ToString() + " failed! Error code: " + ex.Number + ": " + ex.Message, LogLevel.ERROR);
            return null;
        }
    }*/

    private string ConvertUpTimeToSecondsAsString()
    {
        return TimeService.ReturnTimeLeftAsStringFromTheTimeTheActionWillTakePlaceWithTimeLeft(
            ulong.Parse(exportedArgs[3]));
    }
}