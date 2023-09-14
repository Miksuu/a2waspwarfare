﻿// The BaseTerrain class serves as the foundation for managing different types of terrains in the game.
// It implements the InterfaceTerrain to ensure certain properties and methods are present in derived classes.
// The class provides functionality for:
// - Determining mission paths and types based on whether the terrain is modded or not.
// - Writing specific content to terrain files.
// - Updating existing files, particularly for modded terrains.
// - Handling the source and destination directories for file operations.
// It utilizes helper methods for these operations, making it a comprehensive solution for terrain management.

public abstract class BaseTerrain : InterfaceTerrain
{
    // Properties that specifies the name/type of the terrain.
    public TerrainName TerrainName { get => terrainName; set => terrainName = value; }
    public TerrainType TerrainType { get => terrainType; set => terrainType = value; }
    private TerrainName terrainName { get; set; }
    private TerrainType terrainType { get; set; }

    // Boolean flag to check if the terrain is modded.
    public bool isModdedTerrain { get; set; }

    // Moved this here for better copypasteability to GPT
    private string loadScreenEvalString = @"__EVAL([""ca\Missions_e\campaign\missions\CE7B_PhoenixOp.Takistan\img\loading08_phoenixop_co.paa"",""ca\Missions_e\campaign\missions\CE7A_FinishingTouch.Takistan\img\loading08_finishingtouch_co.paa"",""ca\Missions_e\campaign\missions\CE6_EyeOfTheHurricane.Zargabad\img\loading07_co.paa"",""ca\Missions_e\campaign\missions\CE5B_FromHell.Takistan\img\loading06_fromhell_co.paa"",""ca\Missions_e\campaign\missions\CE5A_Sandstorm.Takistan\img\loading06_sandstorm_co.paa"",""ca\Missions_e\campaign\missions\CE4_OpenSeason.Takistan\img\loading05_co.paa"",""ca\Missions_e\campaign\missions\CE3_ColtanBlues.Takistan\img\loading04_co.paa"",""ca\Missions_e\campaign\missions\CE2_Pathfinder.Takistan\img\loading03_co.paa"",""ca\Missions_e\campaign\missions\CE1_GoodMorningTStan.Takistan\img\loading02_goodmorning_co.paa"",""ca\Missions_e\campaign\missions\CE0_Backstab.Zargabad\img\loading01_co.paa"",""ca\Missions_e\scenarios\SPE1_Jackal.Takistan\loading_jackal_co.paa"",""ca\Missions_e\scenarios\SPE1_Vehicles_US.Takistan\loading_showus_co.paa"",""ca\Missions_e\scenarios\SPE1_Vehicles_TKG.Zargabad\loading_showgue_co.paa"",""ca\Missions_e\scenarios\SPE1_Vehicles_TKA.Zargabad\loading_showtk_co.paa"",""ca\Missions_e\scenarios\SPE1_Vehicles_Civilian.Zargabad\loading_showciv_co.paa"",""ca\Missions_e\scenarios\SPE1_Vehicles_Allies.Takistan\loading_shownato_co.paa"",""ca\Missions_e\scenarios\SPE1_SteelPanthers.Takistan\loading_steelpanthers_co.paa"",""ca\Missions_e\scenarios\SPE1_OneShotOneKill.Takistan\loading_oneshotonekill_co.paa"",""ca\Missions_e\scenarios\SPE1_Littlebird.Takistan\loading_littlebird_co.paa"",""ca\Missions_e\scenarios\SPE1_LaserShow.Takistan\loading_lasershow_co.paa"",""ca\Missions_e\scenarios\SPE1_HikeInTheHills.Takistan\loading_hikeinthehills_co.paa"",""ca\Missions_e\scenarios\SPE1_DeathFromAbove.Takistan\loading_deathfromabove_co.paa"",""ca\Missions_e\scenarios\SPE1_Benchmark1.Takistan\loading_benchmark_co.paa"",""ca\Missions_e\MPScenarios\MPE1_Dogfighters.Takistan\loading_mpdogfight_co.paa"",""ca\Missions_e\MPScenarios\MPE_MountainWarfare.Takistan\loading_mpwarfare_co.paa"",""ca\Missions_e\MPScenarios\MPE_SectorControl.Zargabad\img\loading_mpsectorcontrol_co.paa""] select round random 25)";

    // Method that writes and updates the terrain files.
    public void WriteAndUpdateTerrainFiles(DirectoryInfo _dir, string _easaFileString, string _commonBalanceFileString)
    {
        WriteSpecificFilesToTheTerrains(_dir, _easaFileString, _commonBalanceFileString);
        string destinationDirectory = DetermineDestinationDirectory(_dir);

        if (terrainName == TerrainName.TAKISTAN)
        {
            UpdateFilesForTakistan(_dir);
        }

        ReplaceGUIMenuHelp(destinationDirectory);

        Console.WriteLine("-------" + terrainName + " DONE! ---------");
    }

    // Method to write specific content to terrain files based on conditions
    private void WriteSpecificFilesToTheTerrains(DirectoryInfo _dir, string _easaFileString, string _commonBalanceFileString)
    {
        // Write the content to the specified files
        WriteToFile(_dir, _easaFileString, @"Client\Module\EASA\EASA_Init.sqf");
        WriteToFile(_dir, _commonBalanceFileString, @"\Common\Functions\Common_BalanceInit.sqf");
        WriteToFile(_dir, GenerateAndWriteVersionSqf(), @"\version.sqf");
    }

    // Method to write content to a file at a specific path
    private void WriteToFile(string _destinationDirectory, string _content, string _targetScriptPath)
    {
        // Concatenate the directory and file path
        string targetFile = Path.Combine(
            _destinationDirectory, DetermineMissionPathIfItsModdedOrNot() +
            @"\[" + DetermineMissionTypeIfItsForestOrDesert() + "-2hc]warfarev2_073v48co." +
            EnumExtensions.GetEnumMemberAttrValue(terrainName) + @"\" + _targetScriptPath);

        // Make sure the directory exists
        string directoryName = Path.GetDirectoryName(targetFile);
        if (!Directory.Exists(directoryName))
        {
            // Create the directory if it doesn't exist
            Directory.CreateDirectory(directoryName);
        }

        // Write the content to the target file
        File.WriteAllText(targetFile, _content);
    }

    // Method to determine the mission path based on whether the terrain is modded or not
    private string DetermineMissionPathIfItsModdedOrNot()
    {
        // Return "Modded_Missions" if the terrain is modded, otherwise return "Missions"
        return isModdedTerrain ? "Modded_Missions" : "Missions";
    }

    // Method to determine the mission type based on the terrain type (Forest or Desert)
    private string DetermineMissionTypeIfItsForestOrDesert()
    {
        // Return "55" if the terrain type is FOREST, otherwise return "61"
        return TerrainType == TerrainType.FOREST ? "55" : "61";
    }

    // Method to determine the mission camo based on the terrain type (Forest or Desert)
    // Return string for commenting the camo/map definition variable for Desert maps
    private string DetermineIfTheMissionIsTakistanTypeAndReturnCommentStringIfThatIsTheCase()
    {
        return TerrainType == TerrainType.DESERT ? "//" : "";
    }

    // Method to update files for Takistan
    private void UpdateFilesForTakistan(DirectoryInfo _dir)
    {
        // Determine the source and destination directories for file operations
        string sourceDirectory = DetermineChernarusDirectory(_dir);
        string destinationDirectory = DetermineDestinationDirectory(_dir);

        // Copy files from the source to the destination directory
        FileManager.CopyFilesFromSourceToDestination(sourceDirectory, destinationDirectory);
    }

    // Method to update files for modded terrains
    private void UpdateFilesForAndModdedTerrain(DirectoryInfo _dir, string _destinationDirectory)
    {
        // temp
        if (isModdedTerrain)
        {
            return;
        }

        // Determine the source and destination directories for file operations
        string sourceDirectory = DetermineSourceDirectory(_dir);

        // Copy files from the source to the destination directory
        FileManager.CopyFilesFromSourceToDestination(sourceDirectory, _destinationDirectory);

        // Update the Guerilla Barracks file in the destination directory
        ReplaceContentOnASpecificFile(_destinationDirectory, @"\Server\Init\Init_Server.sqf",
            "_barrack_amount = 2;", "_barrack_amount = 0;");
    }

    // Replaces the gui menu help mission name according to the current Terrain name
    private void ReplaceGUIMenuHelp(string _destinationDirectory)
    {
        ReplaceContentOnASpecificFile(_destinationDirectory, @"\Client\GUI\GUI_Menu_Help.sqf",
            "<t size='1.2' color='#2394ef' align='center'>Warfare WASP-AWESOME EDITION | v48 | - CO - Mission</t><br />",
            $"<t size='1.2' color='#2394ef' align='center'>Warfare WASP-AWESOME EDITION | v48 | - CO -" +
            $" {EnumExtensions.GetEnumMemberAttrValue(terrainName)}</t><br />");
    }

    // Method to determine the takistan directory
    private string DetermineChernarusDirectory(DirectoryInfo _dir)
    {
        // Determine the name of the source terrain based on the terrain type
        string sourceTerrainName = "chernarus";

        // Determine the player count for the mission based on the terrain type
        string sourceTerrainPlayerCount = "55";

        // Construct and return the full source directory path
        return Path.Combine(_dir.FullName, @"Missions\[" + sourceTerrainPlayerCount + "-2hc]warfarev2_073v48co." + sourceTerrainName);
    }

    // Method to determine the source directory path based on terrain type and mission type
    private string DetermineSourceDirectory(DirectoryInfo _dir)
    {
        // Determine the name of the source terrain based on the terrain type
        string sourceTerrainName = TerrainType == TerrainType.FOREST ? "chernarus" : "takistan";

        // Determine the player count for the mission based on the terrain type
        string sourceTerrainPlayerCount = DetermineMissionTypeIfItsForestOrDesert();

        // Construct and return the full source directory path
        return Path.Combine(_dir.FullName, @"Missions\[" + sourceTerrainPlayerCount + "-2hc]warfarev2_073v48co." + sourceTerrainName);
    }

    // Method to determine the destination directory based on mission type and terrain name
    private string DetermineDestinationDirectory(DirectoryInfo _dir)
    {
        // Determine the player count for the mission based on the terrain type
        string sourceTerrainPlayerCount = DetermineMissionTypeIfItsForestOrDesert();

        string directoryOfMissions = "Modded_Missions";

        if (!isModdedTerrain)
        {
            directoryOfMissions = "Missions";
        }

        // Construct and return the full destination directory path
        return Path.Combine(_dir.FullName, directoryOfMissions + @"\[" + sourceTerrainPlayerCount +
            "-2hc]warfarev2_073v48co." + EnumExtensions.GetEnumMemberAttrValue(TerrainName));
    }

    // Method to update a specific file's content (such as init_server on modded maps for disabling guerilla barracks)
    private static void ReplaceContentOnASpecificFile(string _destinationDirectory, string _missionFileToEdit,
        string _contentToSearchFor, string _contentToReplaceWith)
    {
        // Construct the full path of the file that needs to be updated
        string finalPathToEdit = _destinationDirectory + _missionFileToEdit;

        // Check if the file exists
        if (!File.Exists(finalPathToEdit))
        {
            // Log a message if the file was not found
            Console.WriteLine("File not found!");
        }

        // Read the content of the file
        string content = File.ReadAllText(finalPathToEdit);

        // Check if the file contains the specific string to be replaced
        if (!content.Contains(_contentToSearchFor))
        {
            // Log a message if the specific content was not found
            Console.WriteLine("The specified content was not found in the file.");
            return;
        }

        // Replace the string and update the file
        content = content.Replace(_contentToSearchFor, _contentToReplaceWith);
        File.WriteAllText(finalPathToEdit, content);
    }

    // Generates and returns the SQF code for a specific terrain. This method is built upon 
    // the base functionalities defined in BaseTerrain.cs.
    // Generate the mission name by combining various parameters including the terrain name
    // Determine if the mission has camo enabled based on base terrain configurations
    // Marty - IMPORTANT : COMMENT the WF_LOG_CONTENT line if you DONT want to activate logs in rpt file. Changing only its value wont have any effect.
    // Marty - IS_CHERNARUS_MAP_DEPENDENT MUST NOT BE COMMENTED IF the map depend on chernarus content. MUST BE COMMENT IF the map depend on takistan content. 
    // Generate the version-specific SQF code using string interpolation
    public string GenerateAndWriteVersionSqf()
    {
        string wfDebug = GenerateWFDebug();
        string wfLogContent = GenerateWFLogContent();
        string terrainTypeCommentPrefix = DetermineIfTheMissionIsTakistanTypeAndReturnCommentStringIfThatIsTheCase();
        string maxPlayers = DetermineMissionTypeIfItsForestOrDesert();
        string missionName = $@"[{maxPlayers}] Warfare V48 {EnumExtensions.GetEnumMemberAttrValue(terrainName)}";

        return $@"{wfDebug}
{wfLogContent}
{terrainTypeCommentPrefix}#define IS_CHERNARUS_MAP_DEPENDENT
#define WF_MAXPLAYERS {maxPlayers}
#define WF_MISSIONNAME ""{missionName}""
#define COMBINEDOPS 1
#define WF_RESPAWNDELAY 2
#define WF_LOADSCREEN {loadScreenEvalString}";
    }

    // Generates the WF_DEBUG line based on build configuration
    private string GenerateWFDebug()
    {
#if DEBUG
            return "#define WF_DEBUG 1";
#elif SERVER_DEBUG
        return "// #define WF_DEBUG 1";
#else
            return "// #define WF_DEBUG 1";
#endif
    }
    // Generates the WF_LOG_CONTENT line based on build configuration
    private string GenerateWFLogContent()
    {
#if DEBUG
            return "#define WF_LOG_CONTENT 1";
#elif SERVER_DEBUG
        return "#define WF_LOG_CONTENT 1";
#else
            return "// #define WF_LOG_CONTENT 1";
#endif
    }
}