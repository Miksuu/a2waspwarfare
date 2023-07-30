﻿using System.Runtime.Serialization;

public enum WeaponType
{
    [EnumMember(Value = "R73Launcher_2")]
    R73_WEAPON,

    [EnumMember(Value = "AirBombLauncher")]
    AIRBOMBLAUNCHER,

    [EnumMember(Value = "Ch29Launcher_Su34")]
    CH29LAUNCHER,

    [EnumMember(Value = "80mmLauncher")]
    S8LAUNCHER,

    [EnumMember(Value = "57mmLauncher")]
    S5LAUNCHER,

    [EnumMember(Value = "AT9Launcher")]
    ATAKALAUNCHER,

    [EnumMember(Value = "BombLauncherF35")]
    GBU12BOMBLAUNCHER,

    [EnumMember(Value = "Igla_twice")]
    IGLALAUNCHER,

    [EnumMember(Value = "SidewinderLaucher_F35")]
    SIDEWINDERLAUNCHER,

    [EnumMember(Value = "MaverickLauncher")]
    MAVERICKLAUNCHER,
}