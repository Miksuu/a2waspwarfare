using System.Linq.Expressions;
using System.Text.RegularExpressions;

// The BaseAircraft class serves as the foundational abstraction for all types of aircraft in the application.
// It inherits from the BaseVehicle class and implements the InterfaceAircraft, encapsulating common behaviors,
// properties, and methods shared across different aircraft types. This includes functionalities for generating
// loadouts, calculating weapon counts, and managing ammunition types, among others.
public abstract class BaseAircraft : BaseVehicle, InterfaceAircraft
{
    // Number of pylons available on the aircraft.
    public int pylonAmount { get; set; }

    // Dictionary mapping allowed ammunition types to their maximum allowed amounts.
    public Dictionary<AmmunitionType, int> allowedAmmunitionTypesWithTheirLimitationAmount { get; set; }

    public bool addToDefaultLoadoutPrice { get; set; }

    // Dictionary mapping ammunition types to their cost modifiers.
    public Dictionary<AmmunitionType, float> ammunitionTypeCostFloatModifier { get; set; }

    // Used for generating for Common_ReturnAircraftNameFromItsType.sqf
    public bool hasCustomRadarName { get; set; }

    public bool excludeFromAntiAirMissileOneHitKill { get; set; }

    // Generates a string representing the loadouts for this aircraft.
    public string GenerateLoadoutsForTheAircraft()
    {
        string generatedLoadouts = string.Empty;

        generatedLoadouts += GenerateCommentForTheSqfCode();
        generatedLoadouts += "\n_easaVehi = _easaVehi + ['" + EnumExtensions.GetEnumMemberAttrValue(VehicleType) + "'];";
        generatedLoadouts += GenerateDefaultLoadout();
        string generatedLoadout = GenerateCombinationLoadouts();
        if (generatedLoadout == "")
        {
            return "";
        }
        generatedLoadouts += generatedLoadout;
        generatedLoadouts += "\n]";
        generatedLoadouts += "\n];";

        return generatedLoadouts;
    }

    // Generates a comment for the Sqf code representing this aircraft's loadout, including details like display name and factory type.
    protected override string GenerateCommentForTheSqfCode()
    {
        return "// " + inGameDisplayName + " [" + EnumExtensions.GetEnumMemberAttrValue(producedFromFactoryType)
            + InGameFactoryLevel + "] - " + pylonAmount + " pylons";
    }

    // Generates combinations of allowed ammunition types for this aircraft's pylons.
    private string GenerateCombinationLoadouts()
    {
        string generatedCombinationLoadouts = string.Empty;

        if(allowedAmmunitionTypesWithTheirLimitationAmount == null || allowedAmmunitionTypesWithTheirLimitationAmount.Count < 1)
        {
            return "";
        }

        generatedCombinationLoadouts += "\n_easaLoadout = _easaLoadout + [\n[";
        var combinations = GenerateCombinations(allowedAmmunitionTypesWithTheirLimitationAmount.Keys.ToArray(), pylonAmount / 2);
        generatedCombinationLoadouts += ConvertCombinationsToStringFormat(combinations);

        return generatedCombinationLoadouts;
    }

    // Returns combinations of ammunition types as a formatted string without sorting by total cost.
    private string ConvertCombinationsToStringFormat(List<List<AmmunitionType>> _combinations)
    {
        string combinationsInStringFormat = string.Empty;

        var finalCombinations = GetFinalCombinations(_combinations);

        int index = 0;
        foreach (var item in finalCombinations)
        {
            string finalString = item.Key + ",";
            if (index == finalCombinations.Count - 1)
            {
                finalString = finalString.TrimEnd(',');
            }
            combinationsInStringFormat += "\n" + finalString;
            index++;
        }

        return combinationsInStringFormat;
    }

    // Returns given combinations of ammunition types with their total cost without sorting.
    private Dictionary<string, string> GetFinalCombinations(List<List<AmmunitionType>> _combinations)
    {
        Dictionary<string, string> combinationDictionary = new Dictionary<string, string>();
        foreach (var combination in _combinations)
        {
            var loadout = GenerateLoadoutForCombination(combination);
            if (loadout.Item1 != "" && loadout.Item2 != "")
            {
                combinationDictionary.Add(loadout.Item1, loadout.Item2);
            }
        }
        var sortedDictionary = combinationDictionary.OrderBy(x => x.Value).ToDictionary(x => x.Key, x => x.Value);

        var modifiedDictionary = new Dictionary<string, string>();
        foreach (var item in sortedDictionary)
        {
            string modifiedKey = Regex.Replace(item.Key, @"(\b|\D)0*([1-9][0-9]?)(\b|\D)", match => match.Groups[1].Value + (match.Groups[1].Value == " " || match.Groups[3].Value == " " ? match.Groups[2].Value.PadLeft(2, '0') : match.Groups[2].Value) + match.Groups[3].Value);
            modifiedDictionary.Add(modifiedKey, item.Value);
        }

        sortedDictionary = modifiedDictionary;

        return sortedDictionary;
    }

    // Generates a loadout and its cost for a given combination of ammunition types.
    private (string, string) GenerateLoadoutForCombination(List<AmmunitionType> _combination)
    {
        (string, string) loadout = ("", "");
        Dictionary<AmmunitionType, int> combinationLoadouts = new Dictionary<AmmunitionType, int>();

        foreach (var item in _combination)
        {
            if (!combinationLoadouts.ContainsKey(item))
            {
                combinationLoadouts.Add(item, 2);
            }
            else
            {
                combinationLoadouts[item] += 2;
            }
        }

        loadout = GenerateLoadoutRow(combinationLoadouts);
        return loadout;
    }

    // Generates a default loadout for the aircraft based on its type and specific configurations.
    private string GenerateDefaultLoadout()
    {
        (string, string) ammunitionArray = ("", "");

        if (vehicleType == VehicleType.MI24P)
        {
            ammunitionArray = GenerateLoadoutRow(defaultLoadout.AmmunitionTypesWithCount, false);
            ammunitionArray.Item1 = "\n_easaDefault = _easaDefault + " + ammunitionArray.Item1 + ";";
            return ammunitionArray.Item1;
        }

        // Calculate for turret (like for aircrafts, the Su34)
        if (defaultLoadoutOnTurret.AmmunitionTypesWithCount.Count > 0) // Convert this to list if needed later on
        {
            ammunitionArray = GenerateLoadoutRow(defaultLoadoutOnTurret.AmmunitionTypesWithCount, false);
        }
        else
        {
            ammunitionArray = GenerateLoadoutRow(defaultLoadout.AmmunitionTypesWithCount, false);
        }

        if (ammunitionArray.Item1 == "")
        {
            return "";
        }

        ammunitionArray.Item1 = "\n_easaDefault = _easaDefault + " + ammunitionArray.Item1 + ";";
        return ammunitionArray.Item1;
    }

    // Calculates the total price for a given ammunition type, applying a cost modifier if available.
    private int CalculateLoadoutTotalPrice(AmmunitionType _ammunitionType, int _priceWithoutModifier)
    {
        if (ammunitionTypeCostFloatModifier == null ||
            !ammunitionTypeCostFloatModifier.ContainsKey(_ammunitionType))
        {
            return _priceWithoutModifier;
        }

        return _priceWithoutModifier * (int)ammunitionTypeCostFloatModifier[_ammunitionType];
    }

    // Generates a row string that represents a loadout based on the given dictionary of ammunition types and counts.
    // Optionally includes price and weapons information in the output.
    private (string, string) GenerateLoadoutRow(
        Dictionary<AmmunitionType, int> _input, bool _generateWithPriceAndWeaponsInfo = true)
    {
        string finalRowOutput = string.Empty;

        // Remove flares magazines
        if (!_generateWithPriceAndWeaponsInfo && _input.ContainsKey(AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE))
        {
            foreach (var item in _input.Keys)
            {
                if (item == AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE)
                {
                    _input.Remove(item);
                }
            }
        }

        var calculatedLoadoutRow = CalculateLoadoutRow(_input, _generateWithPriceAndWeaponsInfo);

        if (_generateWithPriceAndWeaponsInfo)
        {
            string priceAndWeaponsInfo = calculatedLoadoutRow.totalPrice.ToString() + ",'" + calculatedLoadoutRow.weaponsInfo + "',";

            finalRowOutput += "[" + priceAndWeaponsInfo + "[[";
        }
        else
        {
            finalRowOutput += "[[[";
        }

        calculatedLoadoutRow.weaponTypesArray = calculatedLoadoutRow.weaponTypesArray.TrimEnd(',');
        calculatedLoadoutRow.weaponTypesArray += "]";

        finalRowOutput += calculatedLoadoutRow.weaponTypesArray + ",";
        finalRowOutput += "[";

        foreach (var item in calculatedLoadoutRow.ammunitionList)
        {
            finalRowOutput += "'";
            finalRowOutput += item;
            finalRowOutput += "',";
        }

        finalRowOutput = finalRowOutput.TrimEnd(',');
        finalRowOutput += "]]]";

        return (finalRowOutput, calculatedLoadoutRow.weaponsInfo);
    }

    // Checks whether a given loadout should be disregarded based on certain conditions, such as exceeding the allowed amount of a particular ammunition type.
    private bool CheckDisregardedLoadout(
        Dictionary<AmmunitionType, int> _input, bool _generateWithPriceAndWeaponsInfo)
    {
        if (vehicleType == VehicleType.WILDCAT)
        {
            return false;
        }

        bool disregardLoadout = false;
        var ammoToSearch = AmmunitionType.BASECH29;

        foreach (var ammunitionKvp in _input)
        {
            if (_generateWithPriceAndWeaponsInfo &&
                allowedAmmunitionTypesWithTheirLimitationAmount[ammunitionKvp.Key] != 0 &&
                ammunitionKvp.Value > allowedAmmunitionTypesWithTheirLimitationAmount[ammunitionKvp.Key])
            {
                disregardLoadout = true;
                break;
            }

            if (ammunitionKvp.Key != ammoToSearch) continue;

            if (ammunitionKvp.Value == 2)
            {
                disregardLoadout = true;
                break;
            }
        }

        return disregardLoadout;
    }

    // Calculates the details of a loadout row based on the given dictionary of ammunition types and counts.
    // Takes into account various conditions such as disregarded loadouts, special amounts of ammunition, and optional inclusion of price and weapon information.
    // Returns a LoadoutRow object containing all the calculated details.
    private LoadoutRow CalculateLoadoutRow(
        Dictionary<AmmunitionType, int> _input,
        bool _generateWithPriceAndWeaponsInfo = true) // For non-default loadouts, show the information on the easa screen
    {
        var wildcatSpecialWeapons = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOHUNDREDROUNDCTWSHE, 2},
            { AmmunitionType.TWOHUNDREDROUNDCTWSSABOT, 2},
            { AmmunitionType.SIXROUNDCRV7HEPD, 2},
        };

        // Special handling for wildcat, inserting the default weapons to each of the pylons
        if (vehicleType == VehicleType.WILDCAT && _generateWithPriceAndWeaponsInfo) 
        {
            foreach (var weapon in wildcatSpecialWeapons)
            {
                if (_input.ContainsKey(weapon.Key))
                {
                    _input[weapon.Key] += weapon.Value;
                }
                else
                {
                    _input.Add(weapon.Key, weapon.Value);
                }
            }
        }

        LoadoutRow newLoadoutRow = new LoadoutRow();

        if (CalculateWeaponsCount(_input) != pylonAmount && !addToDefaultLoadoutPrice)
        {
            return newLoadoutRow;
        }

        if (CheckDisregardedLoadout(_input, _generateWithPriceAndWeaponsInfo))
        {
            return new LoadoutRow();
        }

        bool doneAddingSpecialAmounts = false;
        Dictionary<string, string> alreadyAddedWeaponLaunchersWithWeaponAmountInTotal = new Dictionary<string, string>();

        var sortedInput = _input.OrderBy(i => 
        {
            var ammunitionType = (InterfaceAmmunition)EnumExtensions.GetInstance(i.Key.ToString());
            return ammunitionType.ammoDisplayName.ToString();
        }).ToDictionary(i => i.Key, i => i.Value);

        foreach (var ammoTypeKvp in sortedInput)
        {            
            string weaponAmount = "0";

            var ammunitionType = (InterfaceAmmunition)EnumExtensions.GetInstance(ammoTypeKvp.Key.ToString());
            
            var weaponDefinition = (InterfaceWeapon)ammunitionType.weaponDefinition;
            var weaponSqfName = EnumExtensions.GetEnumMemberAttrValue(weaponDefinition.WeaponType);
            var ammoDisplayName = EnumExtensions.GetEnumMemberAttrValue(ammunitionType.AmmunitionTypes[0]);

            for (int p = 0; p < ammoTypeKvp.Value; p++)
            {
                if (p % 2 != 0)
                {
                    continue;
                }

                string totalTypes = string.Empty;
                if (!addToDefaultLoadoutPrice)
                {
                    // If not adding to default loadout price, just add the cost of the current ammunition type
                    newLoadoutRow.totalPrice += CalculateLoadoutTotalPrice(ammoTypeKvp.Key, ammunitionType.costPerPylon * 2);
                }

                int tempWeaponAmount = int.Parse(weaponAmount);
                tempWeaponAmount += ammunitionType.amountPerPylon * 2;
                weaponAmount = tempWeaponAmount.ToString();

                foreach (var ammunitonType in ammunitionType.AmmunitionTypes)
                {
                    string type = EnumExtensions.GetEnumMemberAttrValue(ammunitonType);

                    if (type == "ERROR_UNDEFINED_VARIANTS")
                    {
                        continue;
                    }

                    newLoadoutRow.ammunitionList.Add(type);
                }
            }

            // Compare to default loadout and see what it adds to the aircraft EASA total cost
            if (addToDefaultLoadoutPrice)
            {
                var ammo = ammunitionType.AmmunitionTypes[0];
                var defaultLoadcoutAmmoCount = 0;
                if (defaultLoadout.AmmunitionTypesWithCount.ContainsKey(ammo))
                {
                    defaultLoadcoutAmmoCount = defaultLoadout.AmmunitionTypesWithCount[ammo];
                }

                var easaAmmoCount = ammoTypeKvp.Value;

                newLoadoutRow.totalPrice += CalculateLoadoutTotalPrice(ammoTypeKvp.Key, ammunitionType.costPerPylon * (easaAmmoCount - defaultLoadcoutAmmoCount));
            }

            // Temp solution to add kh29
            if (ammoTypeKvp.Key == AmmunitionType.BASECH29 && !doneAddingSpecialAmounts)
            {
                var tempCh29 = (InterfaceAmmunition)EnumExtensions.GetInstance(AmmunitionType.BASECH29.ToString());

                foreach (var item in tempCh29.optionalAmmunitionDictionary[ammoTypeKvp.Value])
                {
                    string type = EnumExtensions.GetEnumMemberAttrValue(item);

                    newLoadoutRow.ammunitionList.Add(type);
                }
            }

            if (_generateWithPriceAndWeaponsInfo)
            {
                newLoadoutRow.totalPrice += weaponDefinition.costPerWeaponLauncher;
            }

            // Do not add duplicate weapon launchers
            if (alreadyAddedWeaponLaunchersWithWeaponAmountInTotal.ContainsKey(weaponSqfName))
            {
                alreadyAddedWeaponLaunchersWithWeaponAmountInTotal[weaponSqfName] += int.Parse(weaponAmount);
                continue;
            }

            if (!weaponDefinition.doNotAddWeapon)
            {
                newLoadoutRow.weaponTypesArray += "'";
                newLoadoutRow.weaponTypesArray += EnumExtensions.GetEnumMemberAttrValue(weaponDefinition.WeaponType);
                newLoadoutRow.weaponTypesArray += "',";
            }

            // Temporarily make the weapon amount a string so that it can be padded with 0s
            int weaponAmountInt = int.Parse(weaponAmount);
            if (weaponAmountInt < 10)
            {
                weaponAmount = "00" + weaponAmount;
            }
            else if (weaponAmountInt < 100)
            {
                weaponAmount = "0" + weaponAmount;
            }
            else
            {
                weaponAmount = weaponAmount.ToString();
            }

            // Wildcat black magic
            if (vehicleType == VehicleType.WILDCAT && _generateWithPriceAndWeaponsInfo && wildcatSpecialWeapons.ContainsKey(ammoTypeKvp.Key)) 
            {
                alreadyAddedWeaponLaunchersWithWeaponAmountInTotal.Add(weaponSqfName, weaponAmount);
                continue;
            }
            else 
            {
                newLoadoutRow.weaponsInfo += ammunitionType.ammoDisplayName + " (" + weaponAmount + ") | ";
                alreadyAddedWeaponLaunchersWithWeaponAmountInTotal.Add(weaponSqfName, weaponAmount);
            }            
        }

        newLoadoutRow.weaponsInfo = newLoadoutRow.weaponsInfo.TrimEnd(' ');
        newLoadoutRow.weaponsInfo = newLoadoutRow.weaponsInfo.TrimEnd('|');
        newLoadoutRow.weaponsInfo = newLoadoutRow.weaponsInfo.TrimEnd(' ');

        return newLoadoutRow;
    }

    // Calculates the total count of weapons based on a given dictionary of ammunition types and their counts.
    // Adjusts the count based on specific types of ammunition.
    private int CalculateWeaponsCount(Dictionary<AmmunitionType, int> _input)
    {
        int countOfWeapons = 0;

        foreach (var item in _input)
        {
            int totalValue = 0;

            switch (item.Key)
            {
                case AmmunitionType.TWELVEROUNDSVIKHR:
                case AmmunitionType.FOURROUNDCH29:
                case AmmunitionType.EIGHTROUNDHELLFIRE:
                    totalValue += item.Value * 2;
                    break;
                case AmmunitionType.FOURROUNDFAB250:
                case AmmunitionType.TWOROUNDFAB250:
                    totalValue += item.Value / 2;
                    break;
                case AmmunitionType.SIXROUNDCH29:
                    totalValue += item.Value * 3;
                    break;
                default:
                    countOfWeapons += item.Value;
                    break;
            }
            countOfWeapons += totalValue;
        }

        return countOfWeapons;
    }

    // Generates all possible combinations of ammunition types based on an array of ammunition types and a given size (r).
    private List<List<AmmunitionType>> GenerateCombinations(AmmunitionType[] _inputArray, int _r)
    {
        List<List<AmmunitionType>> result = new List<List<AmmunitionType>>();
        List<AmmunitionType> combination = new List<AmmunitionType>();

        GenerateCombinationsUtil(_inputArray, _r, 0, combination, result);

        return result;
    }

    // Utility method that recursively generates combinations of ammunition types.
    // Called by GenerateCombinations and adds combinations to the result list.
    private void GenerateCombinationsUtil(
        AmmunitionType[] _inputArray, int _r, int _start, List<AmmunitionType> _combination, List<List<AmmunitionType>> _result)
    {
        if (_r == 0)
        {
            _result.Add(new List<AmmunitionType>(_combination));
            return;
        }

        for (int i = _start; i < _inputArray.Length; i++)
        {
            // Check if the current ammunition type is HELLFIRE/VIKHR
            if ((_inputArray[i] == AmmunitionType.EIGHTROUNDHELLFIRE || _inputArray[i] == AmmunitionType.TWELVEROUNDSVIKHR) && !addToDefaultLoadoutPrice) // Quickfix for ah64, apache, ah1z with hellfires 
            {
                // If it is, then reduce the remaining slots by 2 instead of 1
                // Also make sure there are enough slots left for HELLFIRE/VIKHR
                if (_r >= 2)
                {
                    _combination.Add(_inputArray[i]);
                    GenerateCombinationsUtil(_inputArray, _r - 2, i, _combination, _result);
                    _combination.RemoveAt(_combination.Count - 1);
                }
            }
            else
            {
                // Otherwise, proceed as usual
                _combination.Add(_inputArray[i]);
                GenerateCombinationsUtil(_inputArray, _r - 1, i, _combination, _result);
                _combination.RemoveAt(_combination.Count - 1);
            }
        }
    }
}