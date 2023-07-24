class CfgPatches {
    // Other CfgPatches entries if you have any
};

class CfgMagazines {
    class 4Rnd_Ch29 : VehicleMagazine
    {
        scope = 2;
        displayName = "Ch-29";
        ammo = "M_Ch29_AT";
        count = 2; // Limit the count to 2
        type = 256; // Vehicle magazine type
        initSpeed = 0;
        sound[] = {
            "\ca\Weapons\Data\Sound\TOW_2",
            3.16228,
            1,
            1400
        };
        reloadMagazineSound[] = {
            "",
            0.000316228,
            1
        };
        //canReload = 0; // Disallow reloading
    };

    class 6Rnd_Ch29 : 4Rnd_Ch29
    {
        count = 2;
    };
};