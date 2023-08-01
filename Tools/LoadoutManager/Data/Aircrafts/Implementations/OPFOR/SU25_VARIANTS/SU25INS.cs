﻿public class SU25INS : BaseAircraft
{
    public SU25INS()
    {
        AircraftType = AircraftType.SU25INS;
        pylonAmount = 6;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDCH29, 2},
                { AmmunitionType.TWOROUNDR73, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.SIXTYFOURROUNDS5, 0 },
            { AmmunitionType.TWOROUNDIGLA, 2 },
        };

        inGameDisplayName = "Su-25A";
        inGameAircraftFactoryLevel = 3;
    }
}