﻿public class MIG21 : BaseAircraft
{
    public MIG21()
    {
        VehicleType = VehicleType.MIG21;
        pylonAmount = 4;

        //weapons[] = { "GSh23L", "CMFlareLauncher" };
        //magazines[] = { "520Rnd_23mm_GSh23L", "60Rnd_CMFlare_Chaff_Magazine" };

        // Only test for now
        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDR73, 4},
            };
        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDR73, 4},
            { AmmunitionType.TWOROUNDGBU12, 2},
            { AmmunitionType.FOURROUNDATAKA, 2},
        };

        inGameDisplayName = "MiG-21MF";
        hasCustomRadarName = true;

        inGamePrice = 45712;
        ConstructionTime = 50;
        inGameFactoryLevel = 5;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
        factionType = FactionType.MOLATIAN;

        moddedVehicle = true;
    }
}