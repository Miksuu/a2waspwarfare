public interface InterfaceTerrain
{
    public TerrainName TerrainName { get; set; }
    public TerrainType TerrainType { get; set; }
    public int startingDistanceInMeters { get; set; }
    //public bool isModdedTerrain { get; set; }
    public TerrainModStatus terrainModStatus { get; set; }
    public bool isNavalTerrain { get; set; }
    public string inGameMapName { get; set; }
    
    // Could be removed after Tasmania is fixed
    public bool skipProcessing { get; set; }
    
    public void WriteAndUpdateTerrainFiles(
        string _easaFileString, string _commonBalanceFileString, string _aircraftDisplayNameStrings, string _addedAircraftDamageModelChanges, string _coreModFile = "");

    public bool IsTerrainModded();
} 