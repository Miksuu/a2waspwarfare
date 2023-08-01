﻿public class FOURROUNDCH29 : BASECH29
{
    public FOURROUNDCH29()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.FOURROUNDCH29 };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.CH29LAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Kh-29";
        costPerPylon = 600;
    }
}