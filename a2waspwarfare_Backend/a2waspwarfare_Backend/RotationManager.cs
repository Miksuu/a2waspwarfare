using System.Collections.Generic;
using System.Text;

public static class RotationManager
{
    public static async Task ModifyRotation()
    {
        List<string> searchStrings = new List<string> { "chernarus", "takistan" };// Temp, will be replaced with a list of maps from the TerrainData
        string targetPath = @"C:\Program Files (x86)\Steam\steamapps\common\Arma 2 Operation Arrowhead\default\serverconfig.cfg";
        string startReplaceFrom = "// WriteMapToBePlayedHere";
        string endReplaceTo = "// WriteMapToBePlayedHere_END";

        Log.WriteLine("Starting to find strings in file", LogLevel.VERBOSE);
        string foundMap = FileManager.FindStringsInFile(searchStrings, targetPath, startReplaceFrom, endReplaceTo);

        Log.WriteLine("Found maps: " + foundMap, LogLevel.DEBUG);

        string generatedCode;
        if (foundMap.Trim() == "takistan")
        {
            Log.WriteLine("Generating code for takistan", LogLevel.VERBOSE);
            generatedCode = @"
            class WFBE_Map
            {
                template=""[55-2hc]warfarev2_073v48co.chernarus"";
                difficulty=""veteran"";
            };
            ";
        }
        else
        {
            Log.WriteLine("Generating code for other maps", LogLevel.VERBOSE);
            generatedCode = @"
            class WFBE_Map
            {
                template=""[61-2hc]warfarev2_073v48co.takistan"";
                difficulty=""veteran"";
            };
            ";
        }

        FileManager.InsertGeneratedCodeInToAFile(generatedCode, targetPath, startReplaceFrom, endReplaceTo);
    }
}