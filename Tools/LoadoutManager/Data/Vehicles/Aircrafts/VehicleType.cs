﻿using System.Runtime.Serialization;

public enum VehicleType
{
    [EnumMember(Value = "Su34")]
    SU34,

    // Su-25 variants
    [EnumMember(Value = "Su25_Ins")]
    SU25A,
    [EnumMember(Value = "Su25_TK_EP1")]
    SU25T,
    [EnumMember(Value = "Su39")]
    SU39,

    [EnumMember(Value = "L39_TK_EP1")]
    L39TKEP1,

    [EnumMember(Value = "F35B")]
    F35B,

    [EnumMember(Value = "L159_ACR")]
    L159ACR,

    // A-10 variants
    [EnumMember(Value = "A10")]
    A10A,
    [EnumMember(Value = "A10_US_EP1")]
    A10C,

    // AV8B variants
    [EnumMember(Value = "AV8B")]
    AV8BLGB,
    [EnumMember(Value = "AV8B2")]
    AV8B2,

    [EnumMember(Value = "Mi24_D_CZ_ACR")]
    MI24VCZ,

    [EnumMember(Value = "AH64D")]
    AH64A,

    [EnumMember(Value = "AH64D_EP1")]
    AH64DEP1,

    [EnumMember(Value = "BAF_Apache_AH1_D")]
    APACHEAH1,

    [EnumMember(Value = "AH1Z")]
    AH1Z,

    [EnumMember(Value = "AW159_Lynx_BAF")]
    WILDCAT,

    [EnumMember(Value = "Mi24_V")]
    MI24V,

    [EnumMember(Value = "Mi24_P")]
    MI24P,

    [EnumMember(Value = "Ka52")]
    KA52,

    [EnumMember(Value = "Ka52Black")]
    KA52BLACK,

    [EnumMember(Value = "M6_EP1")]
    M6EP1,

    [EnumMember(Value = "An2_TK_EP1")]
    AN2TKEP1,

    [EnumMember(Value = "T34_TK_EP1")]
    T34TKEP1,

    [EnumMember(Value = "T34_TK_GUE_EP1")]
    T34TKGUEEP1,
}