﻿public class R73_WEAPON : BaseWeapon
{
    public R73_WEAPON()
    {
        Type = WeaponType.R73_WEAPON;
        CostPerWeaponLauncher = 1000; // Fill in the actual cost here
    }

    public WeaponType Type { get; }
}