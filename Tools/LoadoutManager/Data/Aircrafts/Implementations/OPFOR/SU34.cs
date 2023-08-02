﻿public class SU34 : BaseAircraft
{
    public SU34()
    {
        AircraftType = AircraftType.SU34;
        pylonAmount = 10;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDR73, 4},
                { AmmunitionType.SIXROUNDCH29, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDR73, 0 },
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.BASECH29, 0 },
            { AmmunitionType.FOURTYROUNDS8, 6 },
            { AmmunitionType.TWOROUNDGBU12, 8 },
        };
        inGameDisplayName = "Su-34";
        inGameAircraftFactoryLevel = 5;
    }
}