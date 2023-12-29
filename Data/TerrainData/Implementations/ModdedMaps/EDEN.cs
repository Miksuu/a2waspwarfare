public class EDEN : BaseTerrain
{
    public EDEN()
    {
        TerrainName = TerrainName.EDEN;
        TerrainType = TerrainType.FOREST;
        startingDistanceInMeters = 7500;
        terrainModStatus = TerrainModStatus.MODDED;
        inGameMapName = "eden";
        isNavalTerrain = true;
    }
}