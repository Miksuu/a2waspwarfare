public class AH64DTOW : BaseHelicopter
{
    public AH64DTOW()
    {
        VehicleType = VehicleType.AH64DTOW;
        pylonAmount = 4;

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.EIGHTROUNDHELLFIRE, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXROUNDTOWTWO, 2},
            };

        // Commented out, the system does not seem to generate the correct loadout for the turret (Just like in AH-64D (Hellfire) and the AH1
        // base.vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
        //     {
        //         { AmmunitionType.EIGHTROUNDHELLFIRE, 2},
        //         { AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE, 2},
        //     };
        // base.defaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
        //     {
        //         { AmmunitionType.SIXROUNDTOWTWO, 2},
        //         { AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE, 4},
        //     };

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