private ['_sourceTown', '_associatedSupplyTruck', '_supplyAmount', '_supplyMissionAlreadyActiveInTown', '_cursorTarget', '_supplyUpgradeModifier', '_type', '_upgradeLevel', '_isTruck', '_isHeli', '_eligible', '_byHeli'];

_sourceTown = call GetClosestFriendlyLocation;
WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK = objNull;

missionNamespace setVariable ["WFBE_Client_PV_IsSupplyMissionActiveInTown", [player, _sourceTown]];
publicVariableServer "WFBE_Client_PV_IsSupplyMissionActiveInTown";

_supplyMissionAlreadyActiveInTown = _sourceTown getVariable "supplyMissionCoolDownEnabled";

if (_supplyMissionAlreadyActiveInTown) exitWith {
    diag_log format ["ERROR: Supply mission happened already during the last 30 minutes in %1!", _sourceTown];
    format ["This town doesn't have enough supplies to be collected yet! You can start a supply mission in towns that have [+SUPPLY] added after their SV on map."] call GroupChatMessage;
};

_cursorTarget = cursorTarget;
_type = typeOf _cursorTarget;
_upgradeLevel = ((sideJoined) Call WFBE_CO_FNC_GetSideUpgrades) select WFBE_UP_SUPPLYRATE;

//--- Eligibility: trucks always; the supply helicopter needs Supply upgrade 2.
_isTruck  = _type in WFBE_C_SUPPLY_TRUCK_TYPES;
_isHeli = (_type in WFBE_C_SUPPLY_HELI_TYPES) && (_upgradeLevel >= 2);
_eligible = _isTruck || _isHeli;
_byHeli   = _isHeli;

//--- Locked helo? Explain the requirement instead of silently doing nothing.
if (!_eligible && {_type in WFBE_C_SUPPLY_HELI_TYPES}) exitWith {
    format ["Supply helicopters require Supply upgrade level 2."] call GroupChatMessage;
};

if (_eligible && (_cursorTarget distance player < 50)) then {
    WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK = _cursorTarget;
    WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK setVariable ["SupplyFromTown", _sourceTown, true];
    WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK setVariable ["SupplyByHeli", _byHeli, true];

    _supplyUpgradeModifier = 1;
    if (_upgradeLevel >= 3) then { _supplyUpgradeModifier = 2; };
    if (_upgradeLevel == 2) then { _supplyUpgradeModifier = 1.5; };

    _supplyAmount = floor ((_sourceTown getVariable "supplyValue") * WFBE_C_ECONOMY_SUPPLY_MISSION_MULTIPLIER * _supplyUpgradeModifier);

    WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK setVariable ["SupplyAmount", _supplyAmount, true];

    format ["You loaded S %1 to your vehicle from %2. Note that supplies from one town only fit in your vehicle at a time!", _supplyAmount, str (_sourceTown)] call GroupChatMessage;

    WFBE_Client_PV_SupplyMissionStarted = [player, WFBE_CL_VAR_ASSOCIATED_SUPPLY_TRUCK, _sourceTown, sideJoined];
    publicVariableServer "WFBE_Client_PV_SupplyMissionStarted";

} else {
    if (_eligible && (_cursorTarget distance player >= 50)) then {
        format ["Your supply vehicle is too far away to collect the supply from this town!"] call GroupChatMessage;
    };
};

sleep 0.1;

publicVariableServer "WFBE_Client_PV_IsSupplyMissionActiveInTown";
