﻿public class SU34 : BaseAircraft
{
    public SU34()
    {
        VehicleType = VehicleType.SU34;
        pylonAmount = 10;

        // Pilot seat
        //base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
        //    {
        //        { AmmunitionType.VANILLA_FOURTYROUNDS8, 2},
        //    };
        //base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
        //    {
        //        { AmmunitionType.FOURTYROUNDS8, 2},
        //    };

        // Turret
        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXROUNDCH29, 2},
                { AmmunitionType.FOURROUNDR73, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXROUNDCH29, 2},
                { AmmunitionType.TWOROUNDR73, 4},
            };
        //turretPos = -1;

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDR73, 0 },
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.BASECH29, 0 },
            { AmmunitionType.FOURTYROUNDS8, 6 },
            { AmmunitionType.TWOROUNDGBU12, 8 },
        };
        inGameDisplayName = "Su-34";
        inGameFactoryLevel = 5;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
    }
}