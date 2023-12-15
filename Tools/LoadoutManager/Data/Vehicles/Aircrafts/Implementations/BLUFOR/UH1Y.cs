public class UH1Y : BaseHelicopter
{
    public UH1Y()
    {
        VehicleType = VehicleType.UH1Y;
        pylonAmount = 0;

        //weapons[] = {
        //    "FFARLauncher_14",
        //    "CMFlareLauncher"
        //};
        //magazines[] = {
        //    "14Rnd_FFAR",
        //    "120Rnd_CMFlareMagazine"
        //};

        // base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
        //     {

        //     };
        // base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
        //     {
        //         { AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE, 2},
        //     };

        base.vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURTEENROUNDHYDRA, 2},
            };

        base.defaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURTEENROUNDHYDRA, 8},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
        };

        inGameDisplayName = "UH1Y";
        inGameFactoryLevel = 2;

        turretPos = -1;

        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
    }
}