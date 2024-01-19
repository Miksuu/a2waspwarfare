Private ['_ammo','_currentUpgrades','_extMagUpgr','_i','_index','_side','_unit'];
_unit = _this select 0;
_index = _this select 1;
_side = _this select 2;

//--- Browse for extended Mags (WP, SADARM... )



//_ammo = (missionNamespace getVariable Format['cti_%1_ARTILLERY_EXTENDED_MAGS',_side]) select _index;

//_indexnumber=((missionNamespace getVariable Format ["cti_%1_ARTILLERY_CLASSNAMES",_side])select [1,20]) find [(typeOf (_unit) )];
//_indexshift=_indexnumber +1;



//_ammo = (missionNamespace getVariable Format['cti_%1_ARTILLERY_EXTENDED_MAGS',_side]) select _indexshift;


_index= _index +1;
_ammo = (missionNamespace getVariable Format['cti_%1_ARTILLERY_EXTENDED_MAGS',_side]) select _index;



if (count _ammo == 0) exitWith {};


_extMagUpgr = missionNamespace getVariable Format['cti_%1_ARTILLERY_EXTENDED_MAGS_UPGRADE',_side];



_sp=side player;


//--- Retrieve the Artillery upgrade level.
_currentUpgrades = ((_sp) Call cti_CO_FNC_GetSideUpgrades) select cti_UP_ARTYAMMO;



//Remove all first

_all = [
//D30
"CUP_30Rnd_122mmWP_D30_M",
"CUP_30Rnd_122mmLASER_D30_M",
"CUP_30Rnd_122mmSMOKE_D30_M",
"CUP_30Rnd_122mmILLUM_D30_M",
//Mortars
'8Rnd_82mm_Mo_shells',
"8Rnd_82mm_Mo_Flare_white",
"8Rnd_82mm_Mo_Smoke_white",
//L118
"CUP_30Rnd_105mmWP_M119_M",
"CUP_30Rnd_105mmLASER_M119_M",
"CUP_30Rnd_105mmSMOKE_M119_M",
"CUP_30Rnd_105mmILLUM_M119_M",
//M777& CEASAR
"pook_M982_12rdGPS",
"pook_M549A1_12rdRAP",
"pook_M864_12rdCBU",
"pook_M712_6rdLAS",
"pook_ARTY_12rdSMK",
"pook_ARTY_30rdILM",
"pook_ARTY_12rdAP",
//A222
"pook_130mm_40rdHE"






];




_m=magazines _unit;
{if (_x in _all) then {_unit removeMagazineTurret [_x, [0]]}} forEach _m;

_turretlist=[_unit, true] call BIS_fnc_allTurrets;




for [{_i = 0},{_i < count(_ammo)},{_i = _i + 1}] do {
	if (_currentUpgrades >= ((_extMagUpgr select _index) select _i)) then {
		_unit addMagazine (_ammo select _i);
	};
};


/*

for [{_i = 0},{_i < count(_ammo)},{_i = _i + 1}] do {       
	if(count(_extMagUpgr) > 0 )then{
		_adv_ammo_arr = _extMagUpgr select _index;
		if(!(isNil "_adv_ammo_arr") && count(_extMagUpgr) <= _i )then{
			if (_currentUpgrades >= (_extMagUpgr select _i)) then {
				_unit addMagazine (_ammo select _i);
			};
		};
	};
};
*/