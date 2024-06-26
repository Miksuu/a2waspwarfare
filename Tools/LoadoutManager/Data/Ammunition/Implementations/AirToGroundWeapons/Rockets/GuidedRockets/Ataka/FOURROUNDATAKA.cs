﻿public class FOURROUNDATAKA : BaseAmmunition
{
    public FOURROUNDATAKA()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.FOURROUNDATAKA };
        amountPerPylon = 2;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.ATAKALAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Ataka-V";
        costPerPylon = 600;
    }
}