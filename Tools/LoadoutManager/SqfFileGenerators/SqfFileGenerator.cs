// This class, SqfFileGenerator, serves as a utility for generating files compliant with both 
// EASA loadout and common balance configurations. It provides methods for generating the 
// beginning and ending segments of EASA files, as well as methods for handling loadouts for 
// various vehicle types. In addition, it includes methods for writing these configurations 
// to files onto different terrains.

public class SqfFileGenerator
{
    // aircraftEasaLoadoutsFile stores the text for the respective EASA loadouts or initialization files.
    private static string aircraftEasaLoadoutsFile = string.Empty;
    private static string aircraftEasaLoadoutsFileForModdedMaps = string.Empty;
    // commonBalanceInitFile stores the text for the respective Common_BalanceInit loadouts or initialization files.
    private static string commonBalanceInitFile = string.Empty;
    private static string commonBalanceInitFileForModdedMaps = string.Empty;

    // GenerateStartOfTheEasaFile creates the initial part of the SQF file.
    // It returns a string that forms the starting block of the SQF file.
    public static string GenerateStartOfTheEasaFile()
    {
        string startOfTheEasaFile = string.Empty;
        startOfTheEasaFile += "Private [\"_ammo\",\"_easaDefault\",\"_easaLoadout\",\"_easaVehi" +
            "\",\"_is_AAMissile\",\"_loadout\",\"_loadout_line\",\"_vehicle\"];";
        startOfTheEasaFile += "\n";
        startOfTheEasaFile += "EASA_Equip = Compile preprocessFileLineNumbers " +
            "'Client\\Module\\EASA\\EASA_Equip.sqf';";
        startOfTheEasaFile += "EASA_RemoveLoadout = Compile preprocessFileLineNumbers" +
            " 'Client\\Module\\EASA\\EASA_RemoveLoadout.sqf';";
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
        endOfTheEasaFile += "\t\t\t\tif (getNumber(configFile >> \"CfgAmmo\" >> _ammo >> \"airLock\") == 1 &&" +
            " configName(inheritsFrom(configFile >> \"CfgAmmo\" >> _ammo)) ==" +
            " \"MissileBase\") exitWith {_is_AAMissile = true};";
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

    public static string GenerateStartOfTheCoreFile()
    {
        string code = "Private ['_c','_get','_i','_p','_z'];\n";
        code += "_c = [];\n";
        code += "_i = [];\n";

        return code;
    }

    public static string GenerateEndOfTheCoreFile()
    {
        string endCode = "";
        endCode += "for '_z' from 0 to (count _c)-1 do {\n";
        endCode += "    if (isClass (configFile >> 'CfgVehicles' >> (_c select _z))) then {\n";
        endCode += "        missionNamespace getVariable (_c select _z);\n";
        endCode += "            if (isNil '_get') then {\n";
        endCode += "                if ((_i select _z) select 0 == '') then {(_i select _z) set [0, [_c select _z,'displayName'] Call GetConfigInfo]};\n";
        endCode += "                if (typeName((_i select _z) select 4) == 'SCALAR') then {\n";
        endCode += "                                        if (((_i select _z) select 4) == -2) then {\n";
        endCode += "                                    _ret = (_c select _z) Call Compile preprocessFile \"Common\\Functions\\Common_GetConfigVehicleCrewSlot.sqf\";\n";
        endCode += "                                    (_i select _z) set[4, _ret select 0];\n";
        endCode += "                                    (_i select _z) set[9, _ret select 1];\n";
        endCode += "                                };\n";
        endCode += "                            };\n";
        endCode += "                            if (WF_Debug) then { (_i select _z) set[3, 1]};\n";
        endCode += "                            _p = if ((_c select _z) isKindOf 'Man') then { 'portrait'} else { 'picture'};\n";
        endCode += "                            (_i select _z) set[1, [_c select _z, _p] Call GetConfigInfo];\n";
        endCode += "                            missionNamespace setVariable[_c select _z, _i select _z];\n";
        endCode += "                       } else {\n";
        endCode += "		                            diag_log Format[\"[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_MOD: Duplicated Element found '%1'\", (_c select _z), diag_frameno, diag_tickTime];\n";
        endCode += "                    };\n";
    	endCode += "                            } else\n";
        endCode += "                   {\n";
        endCode += "                       diag_log Format[\"[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_MOD: Element '%1' is not a valid class.\", (_c select _z),diag_frameno,diag_tickTime] ;\n";
        endCode += "                  };\n";
        endCode += "                        };\n";
        endCode += "                    diag_log Format[\"[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_MOD: Initialization (%1 Elements) - [Done]\", count _c, diag_frameno, diag_tickTime] ;\n";
        return endCode;
    }

    // GenerateCommonBalanceInitAndTheEasaFileForEachTerrain initializes and writes EASA and common balance files for each terrain.
    // The method first locates the A2 Wasp Warfare directory and then proceeds to generate loadouts and file strings.
    // The generated strings are then written to files specific to different terrains.
    public static void GenerateCommonBalanceInitAndTheEasaFileForEachTerrain()
    {
        GenerateLoadoutsForAllVehicleTypes();
        var easaFileStrings = GenerateEasaFileString();
        var commonBalanceFileStrings = GenerateCommonBalanceFileString();
        var aircraftDisplayNameStrings = GenerateAircraftDisplayNameFileString();
        string coreModFileStrings = GenerateCoreModFileString();

        // First go through vanilla maps (copied to mod maps later)
        WriteAndUpdateToFilesForATerrain(easaFileStrings.vanilla, commonBalanceFileStrings.vanilla, TerrainName.CHERNARUS);
        WriteAndUpdateToFilesForATerrain(easaFileStrings.vanilla, commonBalanceFileStrings.vanilla, TerrainName.TAKISTAN);

        // Write to the modded maps
        WriteAndUpdateToFilesForModdedTerrains(easaFileStrings.modded, commonBalanceFileStrings.modded, coreModFileStrings);
    }

    // Generates file for the Core files, with vehicle name, price, construction time etc.
    private static string GenerateCoreModFileString()
    {
        string coreModString = GenerateStartOfTheCoreFile();

        foreach (VehicleType vehicleType in Enum.GetValues(typeof(VehicleType)))
        {
            var interfaceVehicle = (InterfaceVehicle)EnumExtensions.GetInstance(vehicleType.ToString());

            if (!interfaceVehicle.ModdedVehicle)
            {
                continue;
            }

            coreModString += interfaceVehicle.GenerateSQFCodeForCoreFiles() + "\n\n";
        }

        coreModString += GenerateEndOfTheCoreFile();

        return coreModString;
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
    private static MapFileProperties GenerateEasaFileString()
    {
        MapFileProperties properties = new MapFileProperties();

        string easaFileString = GenerateStartOfTheEasaFile();
        easaFileString += "\n" + aircraftEasaLoadoutsFile;

        properties.modded = easaFileString;
        properties.modded += aircraftEasaLoadoutsFileForModdedMaps;

        easaFileString += GenerateEndOfTheEasaFile();
        properties.modded += GenerateEndOfTheEasaFile();

        properties.vanilla = easaFileString;
        return properties;
    }

    // GenerateCommonBalanceFileString() stores the path for the respective EASA loadouts or initialization files.
    private static MapFileProperties GenerateCommonBalanceFileString()
    {
        MapFileProperties properties = new MapFileProperties();

        string commonBalanceFileString = @"Private[""_currentFactoryLevel""];" + "\n\n";
        commonBalanceFileString += "// After adding Pandur and BTR-90 to this script," +
            " it's necessary to exit on the server to prevent an occassional freeze\n";
        commonBalanceFileString += "if (isServer) exitWith {};\n\n";
        commonBalanceFileString += "switch (typeOf _this) do\n{\n";
        commonBalanceFileString += commonBalanceInitFile;

        properties.modded = commonBalanceFileString;
        properties.modded += commonBalanceInitFileForModdedMaps;

        commonBalanceFileString += "};";
        properties.modded += "};";

        properties.vanilla = commonBalanceFileString;
        return properties;
    }

    // GenerateCommonBalanceFileString() stores the path for the respective EASA loadouts or initialization files.
    private static MapFileProperties GenerateAircraftDisplayNameFileString()
    {
        MapFileProperties properties = new MapFileProperties();

        string commonBalanceFileString = @"Private[""_currentFactoryLevel""];" + "\n\n";
        commonBalanceFileString += "// After adding Pandur and BTR-90 to this script," +
            " it's necessary to exit on the server to prevent an occassional freeze\n";
        commonBalanceFileString += "if (isServer) exitWith {};\n\n";
        commonBalanceFileString += "switch (typeOf _this) do\n{\n";
        commonBalanceFileString += commonBalanceInitFile;

        properties.modded = commonBalanceFileString;
        properties.modded += commonBalanceInitFileForModdedMaps;

        commonBalanceFileString += "};";
        properties.modded += "};";

        properties.vanilla = commonBalanceFileString;
        return properties;
    }

    // GenerateAircraftSpecificLoadouts takes a VehicleType enum as an argument and generates specific loadouts for aircraft.
    // It appends the generated loadouts to the 'aircraftEasaLoadoutsFile' and 'commonBalanceInitFile'.
    // The method returns early if the vehicle type is not an aircraft or if the generated result is empty.
    private static void GenerateAircraftSpecificLoadouts(VehicleType _vehicleType)
    {
        var interfaceVehicle = (InterfaceVehicle)EnumExtensions.GetInstance(_vehicleType.ToString());
        string commonBalanceInit = interfaceVehicle.StartGeneratingCommonBalanceInitForTheVehicle() + "\n\n";

        // Decide which static variables to update based on _isModded
        if (interfaceVehicle.ModdedVehicle)
        {
            commonBalanceInitFileForModdedMaps += commonBalanceInit;
        }
        else
        {
            commonBalanceInitFile += commonBalanceInit;
        }

        // Skips non aircrafts
        var baseAircraft = interfaceVehicle as BaseAircraft;
        if (baseAircraft == null)
        {
            return;
        }

        string easaLoadouts = baseAircraft.GenerateLoadoutsForTheAircraft();
        if (easaLoadouts == "") { return; }

        // Skip non-aircraft for easa
        if (baseAircraft == null)
        {
            return;
        }
        else if (interfaceVehicle.ModdedVehicle)
        {
            aircraftEasaLoadoutsFileForModdedMaps += "\n" + easaLoadouts + "\n";
            return;
        }

        aircraftEasaLoadoutsFile += "\n" + easaLoadouts + "\n";
    }

    // WriteAndUpdateToFilesForATerrain takes in a DirectoryInfo object and two strings for EASA and common balance files.
    // It takes a defined terrain (Chernarus) and writes or updates the respective files of that terrain
    private static void WriteAndUpdateToFilesForATerrain(
        string _easaFileString, string _commonBalanceFileString, TerrainName _terrainName)
    {
        var terrainInstance = (InterfaceTerrain)EnumExtensions.GetInstance(_terrainName.ToString());

        Console.WriteLine();
        terrainInstance.WriteAndUpdateTerrainFiles(_easaFileString, _commonBalanceFileString);
    }

    //WriteAndUpdateToFilesForTerrains takes in a DirectoryInfo object and two strings for EASA and common balance files.
    //It iterates through all defined terrains and writes or updates the respective files.
    private static void WriteAndUpdateToFilesForModdedTerrains(
        string _easaFileString, string _commonBalanceFileString, string _coreModFile)
    {
        foreach (var terrainName in Enum.GetValues(typeof(TerrainName)))
        {
            var terrainInstance = (InterfaceTerrain)EnumExtensions.GetInstance(terrainName.ToString());
            if (!terrainInstance.isModdedTerrain) continue;

            Console.WriteLine();
            terrainInstance.WriteAndUpdateTerrainFiles(_easaFileString, _commonBalanceFileString, _coreModFile);
        }
    }
}