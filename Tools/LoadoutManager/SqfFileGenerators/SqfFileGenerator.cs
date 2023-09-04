// This class, SqfFileGenerator, serves as a utility for generating files compliant with both 
// EASA regulations and common balance configurations. It provides methods for generating the 
// beginning and ending segments of EASA files, as well as methods for handling loadouts for 
// various vehicle types. In addition, it includes methods for writing these configurations 
// to files onto different terrains.
public class SqfFileGenerator
{
    // aircraftEasaLoadoutsFile stores the text for the respective EASA loadouts or initialization files.
    private static string aircraftEasaLoadoutsFile = string.Empty;
    // commonBalanceInitFile stores the text for the respective EASA loadouts or initialization files.
    private static string commonBalanceInitFile = string.Empty;

    // GenerateStartOfTheEasaFile creates the initial part of the SQF file.
    // It returns a string that forms the starting block of the SQF file.
    public static string GenerateStartOfTheEasaFile()
    {
        string startOfTheEasaFile = string.Empty;
        startOfTheEasaFile += "Private [\"_ammo\",\"_easaDefault\",\"_easaLoadout\",\"_easaVehi\",\"_is_AAMissile\",\"_loadout\",\"_loadout_line\",\"_vehicle\"];";
        startOfTheEasaFile += "\n";
        startOfTheEasaFile += "EASA_Equip = Compile preprocessFileLineNumbers 'Client\\Module\\EASA\\EASA_Equip.sqf';";
        startOfTheEasaFile += "EASA_RemoveLoadout = Compile preprocessFileLineNumbers 'Client\\Module\\EASA\\EASA_RemoveLoadout.sqf';";
        startOfTheEasaFile += "\n";
        startOfTheEasaFile += "\n_easaDefault = [];";
        startOfTheEasaFile += "\n_easaLoadout = [];";
        startOfTheEasaFile += "\n_easaVehi = [];";
        startOfTheEasaFile += "\n\n";
        startOfTheEasaFile += "/* [[Price], [Description], [Weapon, Ammos], [Weapon, Ammos]...] */";
        return startOfTheEasaFile;
    }

    // GenerateEndOfTheEasaFile creates the concluding part of the SQF file.
    // It generates the logic for handling EASA vehicle loadouts and configurations.
    // The method returns a string that forms the concluding block of the SQF file.
    public static string GenerateEndOfTheEasaFile()
    {
        string endOfTheEasaFile = string.Empty;

        endOfTheEasaFile += "for '_i' from 0 to count(_easaVehi)-1 do {";
        endOfTheEasaFile += "\t_loadout = _easaLoadout select _i;";
        endOfTheEasaFile += "\t";
        endOfTheEasaFile += "\tfor '_j' from 0 to count(_loadout)-1 do {";
        endOfTheEasaFile += "\t\t_loadout_line = _loadout select _j;";
        endOfTheEasaFile += "\t\t_is_AAMissile = false;";
        endOfTheEasaFile += "\t\t";
        endOfTheEasaFile += "\t\t{";
        endOfTheEasaFile += "\t\t\t_ammo = getText(configFile >> \"CfgMagazines\" >> _x >> \"ammo\");";
        endOfTheEasaFile += "\t\t\t";
        endOfTheEasaFile += "\t\t\tif (_ammo != \"\") then {";
        endOfTheEasaFile += "\t\t\t\tif (getNumber(configFile >> \"CfgAmmo\" >> _ammo >> \"airLock\") == 1 && configName(inheritsFrom(configFile >> \"CfgAmmo\" >> _ammo)) == \"MissileBase\") exitWith {_is_AAMissile = true};";
        endOfTheEasaFile += "\t\t\t};";
        endOfTheEasaFile += "\t\t} forEach ((_loadout_line select 2) select 1);";
        endOfTheEasaFile += "\t\t";
        endOfTheEasaFile += "\t\t_loadout_line set [3, if (_is_AAMissile) then {true} else {false}];";
        endOfTheEasaFile += "\t};";
        endOfTheEasaFile += "};";
        endOfTheEasaFile += "\n";
        endOfTheEasaFile += "missionNamespace setVariable ['WFBE_EASA_Vehicles',_easaVehi];";
        endOfTheEasaFile += "missionNamespace setVariable ['WFBE_EASA_Loadouts',_easaLoadout];";
        endOfTheEasaFile += "missionNamespace setVariable ['WFBE_EASA_Default',_easaDefault];";

        return endOfTheEasaFile;
    }

    // GenerateCommonBalanceInitAndTheEasaFileForEachTerrain initializes and writes EASA and common balance files for each terrain.
    // The method first locates the A2 Wasp Warfare directory and then proceeds to generate loadouts and file strings.
    // The generated strings are then written to files specific to different terrains.
    public static void GenerateCommonBalanceInitAndTheEasaFileForEachTerrain()
    {
        DirectoryInfo dir = FileManager.FindA2WaspWarfareDirectory();
        try
        {
            FileManager.FindA2WaspWarfareDirectory();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            return;
        }

        GenerateLoadoutsForAllVehicleTypes();
        string easaFileString = GenerateEasaFileString();
        string commonBalanceFileString = GenerateCommonBalanceFileString();

        WriteAndUpdateToFilesForTerrains(dir, easaFileString, commonBalanceFileString);
    }

    // GenerateLoadoutsForAllVehicleTypes iterates through all vehicle types defined in the VehicleType enum.
    // It calls the GenerateAircraftSpecificLoadouts method for each vehicle type to generate specific loadouts.
    private static void GenerateLoadoutsForAllVehicleTypes()
    {
        foreach (VehicleType vehicleType in Enum.GetValues(typeof(VehicleType)))
        {
            GenerateAircraftSpecificLoadouts(vehicleType);
        }
    }

    // GenerateEasaFileString() stores the path for the respective EASA loadouts or initialization files.
    private static string GenerateEasaFileString()
    {
        string easaFileString = SqfFileGenerator.GenerateStartOfTheEasaFile();
        easaFileString += "\n" + aircraftEasaLoadoutsFile;
        easaFileString += SqfFileGenerator.GenerateEndOfTheEasaFile();
        return easaFileString;
    }

    // GenerateCommonBalanceFileString() stores the path for the respective EASA loadouts or initialization files.
    private static string GenerateCommonBalanceFileString()
    {
        string commonBalanceFileString = @"Private[""_currentFactoryLevel""];" + "\n\n";
        commonBalanceFileString += "// After adding Pandur and BTR-90 to this script, it's necessary to exit on the server to prevent an occassional freeze\n";
        commonBalanceFileString += "if (isServer) exitWith {};\n\n";
        commonBalanceFileString += "switch (typeOf _this) do\n{\n";
        commonBalanceFileString += commonBalanceInitFile;
        commonBalanceFileString += "};";
        return commonBalanceFileString;
    }

    // GenerateAircraftSpecificLoadouts takes a VehicleType enum as an argument and generates specific loadouts for aircraft.
    // It appends the generated loadouts to the 'aircraftEasaLoadoutsFile' and 'commonBalanceInitFile'.
    // The method returns early if the vehicle type is not an aircraft or if the generated result is empty.
    private static void GenerateAircraftSpecificLoadouts(VehicleType _vehicleType)
    {
        var interfaceVehicle = (InterfaceVehicle)EnumExtensions.GetInstance(_vehicleType.ToString());
        commonBalanceInitFile += interfaceVehicle.StartGeneratingCommonBalanceInitForTheVehicle() + "\n\n";

        var baseAircraft = interfaceVehicle as BaseAircraft;

        // Skip non-aircraft for easa
        if (baseAircraft == null)
        {
            return;
        }

        string result = baseAircraft.GenerateLoadoutsForTheAircraft();

        if (result == "") { return; }

        aircraftEasaLoadoutsFile += "\n" + result + "\n";
    }

    // WriteAndUpdateToFilesForTerrains takes in a DirectoryInfo object and two strings for EASA and common balance files.
    // It iterates through all defined terrains and writes or updates the respective files.
    private static void WriteAndUpdateToFilesForTerrains(DirectoryInfo _dir, string _easaFileString, string _commonBalanceFileString)
    {
        foreach (var terrainName in Enum.GetValues(typeof(TerrainName)))
        {
            var terrainInstance = (InterfaceTerrain)EnumExtensions.GetInstance(terrainName.ToString());
            Console.WriteLine();
            terrainInstance.WriteAndUpdateTerrainFiles(_dir, _easaFileString, _commonBalanceFileString);
        }
    }
}