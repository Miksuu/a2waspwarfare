using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        //GenerateTheEasaFile();
        GenerateCommonBalanceInitSQF();
        WaitForExitCommand();
    }


    private static void GenerateCommonBalanceInitSQF()
    {
        SQFGenerator generator = new SQFGenerator();
        Dictionary<string, int> f35bLoadout = new Dictionary<string, int>
        {
            {"TWOROUNDGBU12", 2},
            {"TWOROUNDSIDEWINDER", 2},
            {"TWOROUNDMAVERICK", 2}
        };

        string sqfCode = generator.GenerateSQFCode("F35B", f35bLoadout);
        Console.WriteLine(sqfCode);
    }

    /// <summary>
    /// MOVE TO OWN CLASS
    /// </summary>
    public class SQFGenerator
    {
        private Dictionary<string, string> ammunitionEnumMapping = new Dictionary<string, string>
    {
        // ... (Add the rest of the mappings here)
        {"TWOROUNDGBU12", "2Rnd_GBU12"},
        {"TWOROUNDSIDEWINDER", "2Rnd_Sidewinder_F35"},
        {"TWOROUNDMAVERICK", "2Rnd_Maverick_A10"}
    };

        private Dictionary<string, string> weaponEnumMapping = new Dictionary<string, string>
    {
        // ... (Add the rest of the mappings here)
        {"GBU12BOMBLAUNCHER", "BombLauncherF35"},
        {"SIDEWINDERLAUNCHER", "SidewinderLaucher_F35"},
        {"MAVERICKLAUNCHER", "MaverickLauncher"}
    };

        public string GenerateSQFCode(string aircraftName, Dictionary<string, int> loadout)
        {
            List<string> weapons = new List<string>();
            List<string> magazines = new List<string>();

            foreach (var ammo in loadout)
            {
                for (int i = 0; i < ammo.Value; i++)
                {
                    magazines.Add(ammunitionEnumMapping[ammo.Key]);
                }

                // Assuming the ammunitionEnumMapping key is always a prefix for the weaponEnumMapping key
                string weaponKey = ammo.Key.Replace("ROUND", "BOMBLAUNCHER"); // Replace with correct mapping logic
                if (weaponEnumMapping.ContainsKey(weaponKey))
                {
                    weapons.Add(weaponEnumMapping[weaponKey]);
                }
            }

            string sqfCode = $"case \"{aircraftName}\": {{\n";
            sqfCode += $"    _this addMagazine \"{string.Join("\";\n    _this addMagazine \"", magazines)}\";\n";
            sqfCode += $"    _this addWeapon \"{string.Join("\";\n    _this addWeapon \"", weapons)}\";\n";
            sqfCode += "};";

            return sqfCode;
        }
    }

    private static void WaitForExitCommand()
    {
        string userInput;
        do
        {
            //Console.WriteLine("Type 'exit' to close the program...");
            userInput = Console.ReadLine();
        } while (userInput?.ToLower() != "exit");
    }



    /// <summary>
    /// MOVE TO OWN CLASS
    /// </summary>
    private static void GenerateStartOfTheEasaFile()
    {
        Console.WriteLine("Private [\"_ammo\",\"_easaDefault\",\"_easaLoadout\",\"_easaVehi\",\"_is_AAMissile\",\"_loadout\",\"_loadout_line\",\"_vehicle\"];");
        Console.WriteLine();
        Console.WriteLine("EASA_Equip = Compile preprocessFileLineNumbers 'Client\\Module\\EASA\\EASA_Equip.sqf';");
        Console.WriteLine("EASA_RemoveLoadout = Compile preprocessFileLineNumbers 'Client\\Module\\EASA\\EASA_RemoveLoadout.sqf';");
        Console.WriteLine();
        Console.WriteLine("_easaDefault = [];");
        Console.WriteLine("_easaLoadout = [];");
        Console.WriteLine("_easaVehi = [];");
        Console.WriteLine();
        Console.WriteLine("/* [[Price], [Description], [Weapon, Ammos], [Weapon, Ammos]...] */");
    }


    private static void GenerateTheEasaFile()
    {
        GenerateStartOfTheEasaFile();
        GenerateAllAircraftLoadouts();
        GenerateEndOfTheEasaFile();
    }

    private static void GenerateAllAircraftLoadouts()
    {
        foreach (AircraftType aircraftType in Enum.GetValues(typeof(AircraftType)))
        {
            var _interfaceAircraft = (InterfaceAircraft)EnumExtensions.GetInstance(aircraftType.ToString());
            _interfaceAircraft.GenerateLoadoutsForTheAircraft();

            Console.WriteLine("\n");
        }
    }

    private static void GenerateEndOfTheEasaFile()
    {
        Console.WriteLine("//--- Now we check for AA-based loadouts.");
        Console.WriteLine("for '_i' from 0 to count(_easaVehi)-1 do {");
        Console.WriteLine("\t_loadout = _easaLoadout select _i;");
        Console.WriteLine("\t");
        Console.WriteLine("\tfor '_j' from 0 to count(_loadout)-1 do {");
        Console.WriteLine("\t\t_loadout_line = _loadout select _j;");
        Console.WriteLine("\t\t_is_AAMissile = false;");
        Console.WriteLine("\t\t");
        Console.WriteLine("\t\t//--- Browse each EASA magazines and check the ammunition kind.");
        Console.WriteLine("\t\t{");
        Console.WriteLine("\t\t\t_ammo = getText(configFile >> \"CfgMagazines\" >> _x >> \"ammo\"); //--- We grab the ammo used by the magazine.");
        Console.WriteLine("\t\t\t");
        Console.WriteLine("\t\t\tif (_ammo != \"\") then {");
        Console.WriteLine("\t\t\t\t//--- We check if the ammo is air-lock based and that in inherits from the missile class.");
        Console.WriteLine("\t\t\t\tif (getNumber(configFile >> \"CfgAmmo\" >> _ammo >> \"airLock\") == 1 && configName(inheritsFrom(configFile >> \"CfgAmmo\" >> _ammo)) == \"MissileBase\") exitWith {_is_AAMissile = true};");
        Console.WriteLine("\t\t\t};");
        Console.WriteLine("\t\t} forEach ((_loadout_line select 2) select 1);");
        Console.WriteLine("\t\t");
        Console.WriteLine("\t\t_loadout_line set [3, if (_is_AAMissile) then {true} else {false}];");
        Console.WriteLine("\t};");
        Console.WriteLine("};");
        Console.WriteLine();
        Console.WriteLine("missionNamespace setVariable ['WFBE_EASA_Vehicles',_easaVehi];");
        Console.WriteLine("missionNamespace setVariable ['WFBE_EASA_Loadouts',_easaLoadout];");
        Console.WriteLine("missionNamespace setVariable ['WFBE_EASA_Default',_easaDefault];");
    }


}