public class TAVI : BaseTerrain
{
    public TAVI()
    {
        TerrainName = TerrainName.TAVI;
        TerrainType = TerrainType.FOREST;
        startingDistanceInMeters = 7500;
        terrainModStatus = TerrainModStatus.MODDED;
        inGameMapName = "tavi";
        isNavalTerrain = true;
    }
}