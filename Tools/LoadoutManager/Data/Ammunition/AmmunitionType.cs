﻿using System.Runtime.Serialization;

public enum AmmunitionType
{
    [EnumMember(Value = "2Rnd_R73")]
    TWOROUNDR73,
    [EnumMember(Value = "4Rnd_R73")]
    FOURROUNDR73,

    [EnumMember(Value = "4Rnd_FAB_250")]
    FOURROUNDFAB250,

    [EnumMember(Value = "ERROR_UNDEFINED_VARIANTS")]
    BASECH29,
    [EnumMember(Value = "4Rnd_Ch29")]
    FOURROUNDCH29,
    [EnumMember(Value = "6Rnd_Ch29")]
    SIXROUNDCH29,

    [EnumMember(Value = "40Rnd_S8T")]
    FOURTYROUNDS8,
    [EnumMember(Value = "64Rnd_57mm")]
    SIXTYFOURROUNDS5,

    [EnumMember(Value = "4Rnd_AT9_Mi24P")]
    FOURROUNDATAKA,

    [EnumMember(Value = "2Rnd_GBU12")]
    TWOROUNDGBU12,

    [EnumMember(Value = "2Rnd_Igla")]
    TWOROUNDIGLA,

    [EnumMember(Value = "2Rnd_Sidewinder_F35")]
    TWOROUNDSIDEWINDER,

    [EnumMember(Value = "2Rnd_Sidewinder_AH1Z")]
    TWOROUNDSIDEWINDER_AH1Z,

    [EnumMember(Value = "2Rnd_Maverick_A10")]
    TWOROUNDMAVERICK,

    [EnumMember(Value = "3Rnd_Mk82")]
    THREEROUNDMK82,

    [EnumMember(Value = "38Rnd_FFAR")]
    THIRTYEIGHTROUNDHYDRA,

    [EnumMember(Value = "8Rnd_Hellfire")]
    EIGHTROUNDHELLFIRE,
}