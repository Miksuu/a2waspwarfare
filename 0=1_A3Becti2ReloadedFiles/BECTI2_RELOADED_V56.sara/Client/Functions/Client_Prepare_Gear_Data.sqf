//// Functions
//// Prepare Gear Data by Upgrade Level
////////////////////////////////////////

	// this: [ Side, Question]

private["_Side", "_Question", "_SideNum", "_Upgrades", "_PublicArray", "_PublicArray", "_PublicIndex",
		"_NewGearData", "_result"];
_Side			= _this select 0;		// Player Side or String "All"
_Question		= _this select 1;		// Gear Data Type

_Upgrades = ((cti_Client_SideJoined) Call cti_CO_FNC_GetSideUpgrades) select cti_UP_GEAR;

//_Upgrades		= if (side Player == west) then {Public_UpgradesBF} else {Public_UpgradesOF};	// Upgrades Data
//_upgrade_level = ((cti_Client_SideJoined) Call cti_CO_FNC_GetSideUpgrades) select cti_UP_GEAR;
//_PublicArray	= _Upgrades select 1;									// Public Upgrades
_PublicIndex	= [];													// Public Upgrades Array only Names
_NewGearData	= [];													// New Gear Data By Upgraded Level

//// Create Index Array (for Fast Search)
//////////////////////////////////////////
//{
//	_PublicIndex set [count(_PublicIndex), _x select 0];
//} forEach _PublicArray;

//// Get Gear Data by Side and GearType
////////////////////////////////////////
_GearDataByType = [_Side, _Question] call compile preprocessFileLineNumbers "Common\Config\Gear\Data_Gear.sqf";

//// Sort GearData by Upgraded Level
/////////////////////////////////////
if ((typeName _Side) == "SIDE") then
{
	/// Sort Gear Data By Upgraded level
	{
		private["_GearLevel", "_Index", "_Upgraded"];
		
		_GearLevel	= _Upgrades;								// Gear Level
		
		
		//_Index		= _PublicIndex find _GearLevel;				// Find Needed Level
		//_Upgraded	= (_PublicArray select _Index) select 1;	// Upgrade is upgraded or not (Boolean)
		
		if(_GearLevel == (_x select 0))then{
			_Upgraded = true
		}else{
			_Upgraded = false
		};
		
		/// Write to New GearArray only Gear Type and Cost
		if (_Upgraded) then	{_NewGearData set[ count(_NewGearData), [_x select 1, _x select 2]]};
	} forEach _GearDataByType;
}
else
{
	/// If Side is Stirng "All" then return full Data without Upgrade Level Sort
	{
		_NewGearData set[ count(_NewGearData), [_x select 1, _x select 2]];
	} forEach _GearDataByType;
};

//// Return New Gear Data Sort by Upgrade level
_result	= _NewGearData;
_result