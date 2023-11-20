public class NAPF : BaseTerrain
{
    public NAPF()
    {
        TerrainName = TerrainName.NAPF;
        TerrainType = TerrainType.FOREST;
        startingDistanceInMeters = 12500;
        terrainModStatus = TerrainModStatus.MODDED;
        inGameMapName = "Napf";
        isNavalTerrain = true;
    }
}