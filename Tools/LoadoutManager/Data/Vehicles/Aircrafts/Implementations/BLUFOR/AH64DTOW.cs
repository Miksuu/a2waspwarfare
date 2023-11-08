public class AH64DTOW : BaseHelicopter
{
    public AH64DTOW()
    {
        VehicleType = VehicleType.AH64DTOW;
        pylonAmount = 4;

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.EIGHTROUNDHELLFIRE, 2},
                { AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXROUNDTOWTWO, 2},
                { AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE, 6},
            };

        //weapons[] = {
        //            "M230",
        //            "SidewinderLaucher_AH64" ????
        //        };
        //magazines[] = {
        //            "1200Rnd_30x113mm_M789_HEDP",
        //            "8Rnd_Sidewinder_AH64" ????
        //        };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.SIXROUNDTOWTWO, 2},
            { AmmunitionType.TWOROUNDSTINGER, 2 },
        };

        inGameDisplayName = "AH-64D (TOW)";
        hasCustomRadarName = true;

        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;

        addToDefaultLoadoutPrice = true;
    }
}