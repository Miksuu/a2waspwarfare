//inputformat from init_commonconstants
//['CUP_O_Ka52_Blk_RU',		[
//										["pylons2","PylonMissile_Missile_AA_R77_x1",true,[0]],
//										["pylons3","PylonMissile_Missile_AA_R77_x1",true,[0]]]
//		]
//or
//['AH-1Z (Multirole)', [[1, "CUP_PylonPod_1Rnd_AIM_9L_Sidewinder_M", true, [0]],
//		                            [2, "CUP_PylonPod_19Rnd_Rocket_FFAR_M", false, [-1]],
//		                            [3, "rhs_mag_AGM114L_4", true, [0], 4],
//		                            [4, "rhs_mag_AGM114L_4", true, [0], 4],
//		                            [2, "CUP_PylonPod_19Rnd_Rocket_FFAR_M", false, [-1]],
//		                            [6, "CUP_PylonPod_1Rnd_AIM_9L_Sidewinder_M", true, [0]]]
//		]

_veh = _this#0;
_pylonsEquipment = _this#1;

//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//_______________________________________________________FUNCTIONS_SPACE________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________



EASA_remove_all={//______________________________________________________________________________________________________________________________________________

//>remove all
private _worklist=getAllPylonsInfo _veh;
for "_i" from 0 to (count _worklist) - 1 do {
private _activePylonMag = [_worklist#_i#3]; 
private _weapon = _activePylonMag apply {getText ((configfile >> "CfgMagazines" >> _x >> "pylonWeapon"))}; 
[_veh,[_weapon#0,_worklist#_i#2]] remoteexec ["removeWeaponTurret",_veh] ;
[_veh,[_worklist#_i#3,_worklist#_i#2]] remoteexec ["removeMagazineTurret",_veh] ;
[_veh,[_i + 1,"",true,_worklist#_i#2]] remoteexec ["setPylonLoadOut",_veh] ;
[_veh,[_i + 1,0]] remoteexec ["SetAmmoOnPylon",_veh] ;
};
//to be sure, we make it in different way too now

//>remove magazines
private _activePylonMags = GetPylonMagazines _veh;
	{
		[_veh,[_foreachIndex + 1,"",true]] remoteexec ["setPylonLoadOut",_veh] ;
		[_veh,[_foreachIndex + 1,0]] remoteexec ["SetAmmoOnPylon",_veh] ;
	} forEach _activePylonMags;

//>remove weapons
private _nonpylonWeaponslist = [];
{ _nonpylonWeaponslist append getArray (_x >> "weapons") } forEach ([_veh, configNull] call BIS_fnc_getTurrets);
private _weapons=weapons _veh;
private _activePylonMags = GetPylonMagazines _veh;
private _weapons2 = _activePylonMags apply {getText ((configfile >> "CfgMagazines" >> _x >> "pylonWeapon"))}; 
{if !(_x in _weapons) then{_weapons=_weapons + [_x];};}forEach _weapons2;
{if (_x in _weapons) then{_weapons=_weapons - [_x];};
}forEach _nonpylonWeaponslist;
{ _veh removeWeaponGlobal _x } forEach (_weapons);

};//______________________________________________________________________________________________________________________________________________



EASA_get_loadout={//______________________________________________________________________________________________________________________________________________

private _actual=getAllPylonsInfo _veh;
//format=


//[
	//	[1,"PylonLeft1",[0],"PylonRack_4Rnd_LG_scalpel",4,"0:10000646"],
	//	[2,"PylonLeft2",[0],"PylonRack_19Rnd_Rocket_Skyfire",19,"0:10000648"],
	//	[3,"PylonRight2",[0],"PylonRack_19Rnd_Rocket_Skyfire",19,"0:10000649"],
	//	[4,"PylonRight1",[0],"PylonRack_4Rnd_LG_scalpel",4,"0:10000650"]
//]

//convert to setPylonLoadOut format
private _loadoutlist=[];
_i=0;
{
_loadoutlist= _loadoutlist + [[_actual#_i#1,_actual#_i#3,true,_actual#_i#2]];

_i=_i+1;
}forEach _actual;

_loadoutlist

};//______________________________________________________________________________________________________________________________________________

EASA_get_actual_owner={//______________________________________________________________________________________________________________________________________________
private _relevant_pylon=_this;
private _actual=getAllPylonsInfo _veh;
private _owner=[];
{
if (_x#1 == _relevant_pylon)then{
_owner=_owner+[_x#2];
};

}forEach _actual;
_owner#0
};//______________________________________________________________________________________________________________________________________________


EASA_get_actual_magazine={//______________________________________________________________________________________________________________________________________________
private _relevant_pylon=_this;
private _actual=getAllPylonsInfo _veh;
private _mag=[];
{
if (_x#1 == _relevant_pylon)then{
_mag=_mag+[_x#3];
};

}forEach _actual;
_mag#0
};//______________________________________________________________________________________________________________________________________________



EASA_create_full_loadout={//______________________________________________________________________________________________________________________________________________


private _partial=_this;// [["pylons2","PylonMissile_Missile_AA_R77_x1",true,[0]],["pylons3","PylonMissile_Missile_AA_R77_x1",true,[0]]]
private _actual=call EASA_get_loadout;
private _updated=[];

private _update_indexlimit=count _partial -1;

private _i=0;


{
if (_partial#_i#0 == _x#0)then{//update

_updated=_updated + [_partial#_i];
if (_i < _update_indexlimit)then{_i=_i+1;};

}else{//keep it

_updated=_updated + [_x];
};

}forEach _actual;



/*
for "_i" from 0 to (count _partial) - 1 do {
{
if (_partial#_i#0 == _x#0)then{//update

_updated=_updated + [_partial#_i];
}else{

_updated=_updated + [_x];
};

}forEach _actual;

};

*/


//systemchat str _upadated;
_updated

};//______________________________________________________________________________________________________________________________________________




EASA_equip_loadout={//______________________________________________________________________________________________________________________________________________

private _actualLoadout=_this;

//check for full
private _check=call EASA_get_loadout;
if !((count _check) == (count _actualLoadout))then{

_actualLoadout= _actualLoadout call EASA_create_full_loadout;
};
//clear all first (setPylonLoadOut dont removes old weapons)

_veh call EASA_remove_all;


//>add actual loadout

for "_i" from 0 to (count _actualLoadout) - 1 do {
[_veh,[_actualLoadout#_i#0,_actualLoadout#_i#1,true,_actualLoadout#_i#3]] remoteexec ["setPylonLoadOut",_veh] ;
};

};//______________________________________________________________________________________________________________________________________________


//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//_______________________________________________________WORK_SPACE________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________

//test format of _pylonsEquipment

//works
//_veh call EASA_remove_all;




private _allPylons = "true" configClasses (
		configFile 
		>> 
		"CfgVehicles" 
		>> 
		typeOf _veh
		>> 
		"Components" 
		>> 
		"TransportPylonsComponent" 
		>> 
		"pylons"
		) apply {configName _x};
		
	if (_pylonsEquipment#0#0 in _allPylons)then{//-->its string format

		_pylonsEquipment call EASA_equip_loadout;
		
		}else{//-->its number input,just convert it here
		
		//number -1 == index , so just change it with _allPylons
		
		_converted=[];
		//_i=0;
		for "_i" from 0 to (count _pylonsEquipment)-1 do{
		private _index=_pylonsEquipment#_i#0 -1;
		_converted= _converted+ [[_allPylons#_index,_pylonsEquipment#_i#1,true,_pylonsEquipment#_i#3]];
		};
			
		_converted  call EASA_equip_loadout;
			
		};
		
		
//_veh = _this select 0;

/*
//--Given: vehicle pointer, pylons arr--
functionDoLoadOut = {
	_vh = _this select 0;
	_plns = _this select 1;
	for "_j" from 0 to (count _plns) - 1 do {
		//_pylonConf = [];					
		for "_k" from 0 to (count (_plns select _j)) - 1 do {
			if(_k < 4) then {				
				_vh setVariable[format['_p%1', _k], (_plns select _j) select _k];
			};
		};		
		
		if(!(isNil { _vh getVariable  '_p2'} ) && !(isNil { _vh getVariable '_p3'} )) then {			
			_vh setPylonLoadOut[_vh getVariable '_p0', _vh getVariable '_p1', _vh getVariable '_p2', _vh getVariable '_p3'];
		} else {
			if(!(isNil { _vh getVariable  '_p2'} )) then {				
				_vh setPylonLoadOut[_vh getVariable '_p0', _vh getVariable '_p1', _vh getVariable '_p2'];
			} else {				
				_vh setPylonLoadOut[_vh getVariable '_p0', _vh getVariable '_p1'];
			};
		};
		
		if(count (_plns select _j) == 5) then {			
			_vh setAmmoOnPylon [_vh getVariable '_p0', (_plns select _j) select 4];			
		};
	};
};

[_veh, _pylonsEquipment] spawn functionDoLoadOut;

*/