using System.Runtime.Serialization;

public abstract class BaseAircraft : InterfaceAircraft
{
    public AircraftType AircraftType { get => aircraftType; set => aircraftType = value; }

    private AircraftType aircraftType { get; set; }
    public int pylonAmount { get; set; }
    public Dictionary<AmmunitionType, int> allowedAmmunitionTypesWithTheirLimitationAmount { get; set; }
    public Loadout vanillaGameDefaultLoadout { get; set; }
    public Loadout defaultLoadout { get; set; }
    public string inGameDisplayName { get; set; }
    public int inGameAircraftFactoryLevel { get; set; }
    public bool addToDefaultLoadoutPrice { get; set; }
    public Dictionary<AmmunitionType, float> ammunitionTypeCostFloatModifier { get; set; }

    // Add price etc here for more advanced SQF generation

    protected BaseAircraft()
    {
        defaultLoadout = new Loadout();
        vanillaGameDefaultLoadout = new Loadout();
    }

    public void GenerateLoadoutsForTheAircraft()
    {
        Console.WriteLine(GenerateCommentForTheSqfCode());
        Console.WriteLine("_easaVehi = _easaVehi + ['" + EnumExtensions.GetEnumMemberAttrValue(AircraftType) + "'];");
        GenerateDefaultLoadout();
        GenerateCombinationLoadouts();
        Console.WriteLine("]");
        Console.WriteLine("];");
    }

    private string GenerateCommentForTheSqfCode()
    {
        return "// " + inGameDisplayName + " [AF" + inGameAircraftFactoryLevel + "] - " + pylonAmount + " pylons";
    }

    private void GenerateCombinationLoadouts()
    {
        Console.WriteLine("_easaLoadout = _easaLoadout + [\n[");
        var combinations = GenerateCombinations(allowedAmmunitionTypesWithTheirLimitationAmount.Keys.ToArray(), pylonAmount / 2);
        PrintSortedCombinations(combinations);
    }

    private void PrintSortedCombinations(List<List<AmmunitionType>> _combinations)
    {
        var finalPricesSortedByPrice = GetSortedCombinationsByPrice(_combinations);

        int index = 0;
        foreach (var item in finalPricesSortedByPrice)
        {
            string finalString = item.Key + ",";
            if (index == finalPricesSortedByPrice.Count - 1)
            {
                finalString = finalString.TrimEnd(',');
            }
            Console.WriteLine(finalString);
            index++;
        }
    }

    private Dictionary<string, int> GetSortedCombinationsByPrice(List<List<AmmunitionType>> _combinations)
    {
        Dictionary<string, int> unsortedListByPrice = new Dictionary<string, int>();
        foreach (var combination in _combinations)
        {
            var loadout = GenerateLoadoutForCombination(combination);
            if (loadout.Item1 != "" && loadout.Item2 != 0)
            {
                unsortedListByPrice.Add(loadout.Item1, loadout.Item2);
            }
        }
        return unsortedListByPrice.OrderBy(pair => pair.Value).ToDictionary(pair => pair.Key, pair => pair.Value);
    }

    private (string, int) GenerateLoadoutForCombination(List<AmmunitionType> _combination)
    {
        (string, int) loadout = ("", 0);
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

    private string GenerateDefaultLoadout()
    {
        Console.WriteLine("_easaDefault = _easaDefault + ");
        var ammunitionArray = GenerateLoadoutRow(defaultLoadout.AmmunitionTypesWithCount, false);
        if (ammunitionArray.Item1 == "")
        {
            return "";
        }
        Console.WriteLine(ammunitionArray.Item1 + ";");
        return ammunitionArray.Item1;
    }

    private int CalculateLoadoutTotalPrice(AmmunitionType _ammunitionType, int _priceWithoutModifier)
    {
        if (ammunitionTypeCostFloatModifier == null ||
            !ammunitionTypeCostFloatModifier.ContainsKey(_ammunitionType))
        {
            return _priceWithoutModifier;
        }

        return _priceWithoutModifier * (int)ammunitionTypeCostFloatModifier[_ammunitionType];
    }

    private (string, int) GenerateLoadoutRow(
        Dictionary<AmmunitionType, int> _input,
        bool _generateWithPriceAndWeaponsInfo = true)
    {
        string finalRowOutput = string.Empty;

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

        //Console.WriteLine("RETURNING: " + finalRowOutput);

        return (finalRowOutput, calculatedLoadoutRow.totalPrice);
    }

    private void CheckDefaultLoadout(
        Dictionary<AmmunitionType, int> _input, LoadoutRow _newLoadoutRow, bool _generateWithPriceAndWeaponsInfo)
    {
        if (_input.SequenceEqual(defaultLoadout.AmmunitionTypesWithCount) && _generateWithPriceAndWeaponsInfo)
        {
            _newLoadoutRow.isDefaultLoadout = true;
        }
    }

    private bool CheckDisregardedLoadout(Dictionary<AmmunitionType, int> _input,
        bool _generateWithPriceAndWeaponsInfo)
    {
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


    private LoadoutRow CalculateLoadoutRow(
        Dictionary<AmmunitionType, int> _input,
        bool _generateWithPriceAndWeaponsInfo = true) // For non-default loadouts, show the information on the easa screen
    {
        LoadoutRow newLoadoutRow = new LoadoutRow();

        if (CalculateWeaponsCount(_input) != pylonAmount && !addToDefaultLoadoutPrice)
        {
            return newLoadoutRow;
        }

        CheckDefaultLoadout(_input, newLoadoutRow, _generateWithPriceAndWeaponsInfo);

        if (CheckDisregardedLoadout(_input, _generateWithPriceAndWeaponsInfo))
        {
            return new LoadoutRow();
        }

        if (newLoadoutRow.isDefaultLoadout)
        {
            newLoadoutRow.weaponsInfo += "DEFAULT | ";
        }

        bool doneAddingSpecialAmounts = false;
        Dictionary<string, int> alreadyAddedWeaponLaunchersWithWeaponAmountInTotal = new Dictionary<string, int>();
        foreach (var ammoTypeKvp in _input)
        {
            int weaponAmount = 0;

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

                weaponAmount += ammunitionType.amountPerPylon * 2;

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
                alreadyAddedWeaponLaunchersWithWeaponAmountInTotal[weaponSqfName] += weaponAmount;
                continue;
            }

            if (!weaponDefinition.doNotAddWeapon)
            {
                newLoadoutRow.weaponTypesArray += "'";
                newLoadoutRow.weaponTypesArray += EnumExtensions.GetEnumMemberAttrValue(weaponDefinition.WeaponType);
                newLoadoutRow.weaponTypesArray += "',";
            }

            newLoadoutRow.weaponsInfo += ammunitionType.ammoDisplayName + " (" + weaponAmount + ") | ";

            alreadyAddedWeaponLaunchersWithWeaponAmountInTotal.Add(weaponSqfName, weaponAmount);
        }

        newLoadoutRow.weaponsInfo = newLoadoutRow.weaponsInfo.TrimEnd(' ');
        newLoadoutRow.weaponsInfo = newLoadoutRow.weaponsInfo.TrimEnd('|');
        newLoadoutRow.weaponsInfo = newLoadoutRow.weaponsInfo.TrimEnd(' ');

        // Detect the default loadout for su34 etc
        if (!newLoadoutRow.isDefaultLoadout)
        {
            string defaultLoadoutWeaponsInfo = string.Empty;
            foreach (var kvp in defaultLoadout.AmmunitionTypesWithCount)
            {
                int finalKvpValue = kvp.Value;

                var ammunitionType = (InterfaceAmmunition)EnumExtensions.GetInstance(kvp.Key.ToString());

                if (ammunitionType.AmmunitionTypes[0] == AmmunitionType.FOURROUNDCH29)
                {
                    finalKvpValue = 4;
                }

                if (ammunitionType.AmmunitionTypes[0] == AmmunitionType.SIXROUNDCH29)
                {
                    finalKvpValue = 6;
                }

                defaultLoadoutWeaponsInfo += ammunitionType.ammoDisplayName + " (" + finalKvpValue + ") | ";
            }
            defaultLoadoutWeaponsInfo = defaultLoadoutWeaponsInfo.TrimEnd(' ');
            defaultLoadoutWeaponsInfo = defaultLoadoutWeaponsInfo.TrimEnd('|');
            defaultLoadoutWeaponsInfo = defaultLoadoutWeaponsInfo.TrimEnd(' ');

            if (_generateWithPriceAndWeaponsInfo && (defaultLoadoutWeaponsInfo == newLoadoutRow.weaponsInfo))
            {
                newLoadoutRow.weaponsInfo = newLoadoutRow.weaponsInfo.Insert(0, "DEFAULT | ");
                newLoadoutRow.isDefaultLoadout = true;
            }
        }

        return newLoadoutRow;
    }

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


    private List<List<AmmunitionType>> GenerateCombinations(AmmunitionType[] _inputArray, int _r)
    {
        List<List<AmmunitionType>> result = new List<List<AmmunitionType>>();
        List<AmmunitionType> combination = new List<AmmunitionType>();

        GenerateCombinationsUtil(_inputArray, _r, 0, combination, result);

        return result;
    }

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

    public void GenerateCommonBalanceInitForTheAircraft()
    {
        Dictionary<string, List<string>> weaponsAndMagazinesToAdd = new();
        Dictionary<string, List<string>> weaponsAndMagazinesVanilla = new();

        PopulateWeaponsAndMagazines(defaultLoadout.AmmunitionTypesWithCount, weaponsAndMagazinesToAdd);
        PopulateWeaponsAndMagazines(vanillaGameDefaultLoadout.AmmunitionTypesWithCount, weaponsAndMagazinesVanilla);

        // Magazines to add
        List<string> magazinesToAdd = GetAllMagazines(weaponsAndMagazinesToAdd)
            .Except(GetAllMagazines(weaponsAndMagazinesVanilla))
            .Distinct()
            .ToList();

        // Weapons to add
        IEnumerable<string> weaponsToAdd = weaponsAndMagazinesToAdd.Keys
            .Except(weaponsAndMagazinesVanilla.Keys)
            .Distinct();

        string addSQFCode = GenerateSQFCodeInner(magazinesToAdd, weaponsToAdd, "add");

        string finalSQFCode = $"case \"{aircraftType}\": {{\n" + addSQFCode + "};";

        Console.WriteLine(finalSQFCode);
    }



    private void PopulateWeaponsAndMagazines(
        Dictionary<AmmunitionType, int> _ammunitionTypesWithCount,
        Dictionary<string, List<string>> _weaponsAndMagazines)
    {
        foreach (var ammo in _ammunitionTypesWithCount)
        {
            var ammoMapping = (InterfaceAmmunition)EnumExtensions.GetInstance(ammo.Key.ToString());
            var weaponMapping = (InterfaceWeapon)EnumExtensions.GetInstance(ammoMapping.weaponDefinition.WeaponType.ToString());

            List<string> magazines = new List<string>();
            for (int i = 0; i < ammo.Value; i++)
            {
                magazines.AddRange(ammoMapping.AmmunitionTypes.Select(a => EnumExtensions.GetEnumMemberAttrValue(a)));
            }

            string weaponTypeString = EnumExtensions.GetEnumMemberAttrValue(weaponMapping.WeaponType);

            if (_weaponsAndMagazines.ContainsKey(weaponTypeString))
            {
                _weaponsAndMagazines[weaponTypeString].AddRange(magazines);
            }
            else
            {
                _weaponsAndMagazines[weaponTypeString] = magazines;
            }
        }
    }

    private List<string> GetAllMagazines(Dictionary<string, List<string>> weaponsAndMagazines)
    {
        return weaponsAndMagazines.Values.SelectMany(m => m).ToList();
    }

    private string GenerateSQFCodeInner(List<string> magazines, IEnumerable<string> weapons, string action)
    {
        string magazineAction = action == "add" ? "addMagazine" : "removeMagazine";
        string weaponAction = action == "add" ? "addWeapon" : "removeWeapon";  // Note: corrected "addweapon" to "addWeapon"

        return $"    _this {magazineAction} \"{string.Join($"\";\n    _this {magazineAction} \"", magazines)}\";\n" +
               $"    _this {weaponAction} \"{string.Join($"\";\n    _this {weaponAction} \"", weapons)}\";\n";
    }

}