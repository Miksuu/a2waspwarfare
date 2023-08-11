﻿using System.Runtime.Serialization;

public enum WeaponType
{
    [EnumMember(Value = "R73Launcher_2")]
    R73_WEAPON,

    [EnumMember(Value = "R73Launcher")]
    R73_WEAPON_4,

    [EnumMember(Value = "AirBombLauncher")]
    AIRBOMBLAUNCHER,

    [EnumMember(Value = "Ch29Launcher_Su34")]
    CH29LAUNCHER,

    [EnumMember(Value = "S8Launcher")]
    S8LAUNCHER,
    [EnumMember(Value = "80mmLauncher")]
    VANILLA_S8LAUNCHER,

    [EnumMember(Value = "57mmLauncher")]
    S5LAUNCHER,

    [EnumMember(Value = "AT9Launcher")]
    ATAKALAUNCHER,

    [EnumMember(Value = "BombLauncherF35")]
    GBU12BOMBLAUNCHER,
    [EnumMember(Value = "BombLauncherA10")]
    GBU12BOMBLAUNCHER_A10,//vanilla
    [EnumMember(Value = "BombLauncher")]
    VANILLA_GBU12BOMBLAUNCHER_6RND,

    [EnumMember(Value = "Igla_twice")]
    IGLALAUNCHER,

    [EnumMember(Value = "SidewinderLaucher_F35")]
    SIDEWINDERLAUNCHER,

    [EnumMember(Value = "SidewinderLaucher_AH1Z")]
    SIDEWINDERLAUNCHER_AH1Z,

    [EnumMember(Value = "MaverickLauncher")]
    MAVERICKLAUNCHER,

    [EnumMember(Value = "Mk82BombLauncher_6")]
    MK82BOMBLAUNCHER,

    [EnumMember(Value = "VikhrLauncher")]
    VIKHRLAUNCHER,

    [EnumMember(Value = "FFARLauncher")]
    HYDRALAUNCHER,
    [EnumMember(Value = "FFARLauncher_14")]
    HYDRALAUNCHER_14ROUNDS,

    [EnumMember(Value = "HellfireLauncher")]
    HELLFIRELAUNCHER,

    [EnumMember(Value = "GAU12")]
    GAU12,

    [EnumMember(Value = "StingerLauncher_twice")]
    STINGERLAUNCHER,
    [EnumMember(Value = "StingerLaucher_4x")]
    VANILLA_STINGERLAUNCHER_4X,

    [EnumMember(Value = "GSh301")]
    GSHGUNPOD,

    [EnumMember(Value = "TOWLauncherSingle")]
    TOWLAUNCHERSINGLE,
    [EnumMember(Value = "TOWLauncher")]
    TOWLAUNCHER2RND,

    [EnumMember(Value = "SpikeLauncher_ACR")]
    SPIKELAUNCHER,

    [EnumMember(Value = "CTWS")]
    CTWS,

    [EnumMember(Value = "CRV7_HEPD")]
    CRV7HEPD,

    [EnumMember(Value = "9M311Laucher")]
    VANILLA_TUNGUSKALAUNCHER,

    [EnumMember(Value = "TwinVickers")]
    TWINVICKERS,

    // FLARES
    [EnumMember(Value = "CMFlareLauncher")]
    CMFLARELAUNCHER,

    [EnumMember(Value = "DT_veh")]
    DTMACHINEGUN,

    [EnumMember(Value = "ZiS_S_53")]
    ZISS53,

    [EnumMember(Value = "M242BC")]
    M242BC,
    [EnumMember(Value = "M242")]
    M242,

    [EnumMember(Value = "MLRS")]
    MLRSLAUNCHER,
}