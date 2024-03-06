WF_MenuAction = -1;

//_veh = vehicle player;
_allPylonMags2 = ("count( getArray (_x >> 'hardpoints')) > 0" configClasses (configfile >> "CfgMagazines")) apply {configname _x};

//hint str _allPylonMags2;		

_sideID= str cti_Client_SideJoined;
_pID=str player;
_EASAvar="giveDATAtoEASA"+_sideID+_pID;
_veh =missionNamespace getVariable _EASAvar;
missionNamespace setvariable [_EASAvar,0];
_type = typeOf _veh;



//______________________________________________________________________________________________________________________________________________

_OpforContainer = ["OTeamleader1","OTeamleader2","OTeamleader3","OTeamleader4","OTeamleader5","OEngineer1","OEngineer2","OEngineer3","OEngineer4","OEngineer5","OMachinegunner1_1","OMachinegunner1_2","OMachinegunner2_1","OMachinegunner2_2","OMachinegunner3_1","OMachinegunner3_2","OMachinegunner4_1","OMachinegunner4_2","OMachinegunner5_1","OMachinegunner5_2","OMedic1","OMedic2","OMedic3","OMedic4","OMedic5","OSpecOps1","OSpecOps2","OSpecOps3","OSpecOps4","OSpecOps5"];
_BLUcontainer = ["BTeamleader1","BTeamleader2","BTeamleader3","BTeamleader4","BTeamleader5","BEngineer1","BEngineer2","BEngineer3","BEngineer4","BEngineer5","BMachinegunner1_1","BMachinegunner1_2","BMachinegunner2_1","BMachinegunner2_2","BMachinegunner3_1","BMachinegunner3_2","BMachinegunner4_1","BMachinegunner4_2","BMachinegunner5_1","BMachinegunner5_2","BMedic1","BMedic2","BMedic3","BMedic4","BMedic5","BSpecOps1","BSpecOps2","BSpecOps3","BSpecOps4","BSpecOps5"];
_UKContainer =["BTeamleader4","BTeamleader5","BEngineer4","BEngineer5","BMachinegunner4_1","BMachinegunner4_2","BMachinegunner5_1","BMachinegunner5_2","BMedic4","BMedic5","BSpecOps4","BSpecOps5"];
_USContainer =["BTeamleader1","BTeamleader2","BTeamleader3","BEngineer1","BEngineer2","BEngineer3","BMachinegunner1_1","BMachinegunner1_2","BMachinegunner2_1","BMachinegunner2_2","BMachinegunner3_1","BMachinegunner3_2","BMedic1","BMedic2","BMedic3","BSpecOps1","BSpecOps2","BSpecOps3"];




//hint str _sideID;
//____________________________________________________________________________________________________






_allPylonMags3=[];


if (_pID in _USContainer) then {
	
	
	_allPylonMags3=EASA_US;
	
};
if (_pID in _UKContainer) then {
	//_sorted=_EASA_UK;
	_allPylonMags3=EASA_UK;
	
	
};

if (_pID in _OpforContainer) then {
//if ( _sideID isEqualto "EAST") then {	
	
	_allPylonMags3=EASA_RU;
	
	

};


//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//_______________________________________________________SET_CAM________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________


_Etrack = _veh;
		showCinemaBorder false;
		
		_pitch = 0;
		_Edir = 0;
		_Edistance = 15.5;
		_Epos = [(sin _Edir)*(cos _pitch * _Edistance),(cos _pitch) * (cos _Edir * _Edistance),0.1-(sin _pitch * _Edistance)];
		
		EASA_CTI_UnitsCamera = "camera" camCreate getPos _Etrack;
		EASA_CTI_UnitsCamera camSetTarget _Etrack;
		EASA_CTI_UnitsCamera camSetRelPos _Epos;
		EASA_CTI_UnitsCamera camCommit 0;
		EASA_CTI_UnitsCamera cameraEffect ["Internal", "back"];


//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//_______________________________________________________INIT_OLD_PYLONSPACE____________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________



_pylons = [];
_rearmPrice = 0;
_oldpylons = _veh getVariable "_pylons";

//--Check is it first EASA for veh or no. If it is no a first EASA, copy old data--
if(!(isNil '_oldpylons' )) then { 
	if (count _oldpylons > 0) then {
		_pylons = +_oldpylons;
		//_rearmPrice = round((((missionNamespace getVariable _type) select QUERYUNITPRICE)/(missionNamespace getVariable "cti_C_UNITS_SUPPORT_REARM_PRICE"))*1.25);
		//_rearmPrice = round((_rearmPrice * (count _pylons)) / 2);
	};
};

//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//_______________________________________________________FUNCTIONS_SPACE________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________


//create pylonlist
EASA_get_pylonlist={//______________________________________________________________________________________________________________________________________________
_ix = 0;
lbClear 230033;
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
_show_numbers=1;
{
	_strText = "";
	_strSubText = getText (configFile >> "CfgMagazines" >> (getPylonMagazines _veh) select _ix >> "displayName");
	/*
	for "_i" from 0 to (count _pylons) - 1 do {			
		if(((_pylons select _i) select 0) == _x) exitWith {
			_strText = format["%1 (%2)", _x, getText (configFile >> "CfgMagazines" >> (_pylons select _i) select 1 >> "displayName")];			
		};
	};	
	*/
	
	
	

	
	//lbAdd[230033, format ["%1 (%2)", _x, _strSubText]];
	
	lbAdd[230033, format ["%1 (%2)",(str _show_numbers), _strSubText]];
	_show_numbers=_show_numbers+1;
	
	lbSetTooltip [230033, _ix, _strSubText];
		
	if(_strText != "") then {
		lbSetColor [230033, _ix, [0.9333, 0.8980, 0.5451, 0.9]];
	};
	
	lbSetData[230033, _ix, _x];
	_ix = _ix + 1;
} foreach _allPylons;

};//______________________________________________________________________________________________________________________________________________

call EASA_get_pylonlist;
//hint parseText(localize 'STR_WF_INFO_EASA_HELP');

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

//[[lbData[230033, lbCurSel 230033], lbData[230034, lbCurSel 230034],true, _turretPath]] call EASA_create_full_loadout;
private _partial=_this; //todo
private _actual=call EASA_get_loadout;
private _updated=[];


private _update_indexlimit=count _partial -1;
private _i=0;
{
if (_partial#_i#0 == _x#0)then{//>update
_updated=_updated + [_partial#_i];
if (_i < _update_indexlimit)then{_i=_i+1;};
}else{//>keep it
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
/*
for "_i" from 0 to (count _actualLoadout#0) - 1 do {
[_veh,[_i + 1,_actualLoadout#0#_i,true,_actualLoadout#1#_i]] remoteexec ["setPylonLoadOut",_veh] ;
};
*/
for "_i" from 0 to (count _actualLoadout) - 1 do {
[_veh,[_actualLoadout#_i#0,_actualLoadout#_i#1,true,_actualLoadout#_i#3]] remoteexec ["setPylonLoadOut",_veh] ;
};

};//______________________________________________________________________________________________________________________________________________




//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//_______________________________________________________INIT_SPACE________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________

//_new_system-->save first loadout

_initloadout=_veh getVariable "Loadout";
if (isNil '_initloadout' ) then { //save it for abort actions
_initloadout=call EASA_get_loadout;
_veh setVariable ["Loadout",_initloadout];


};


	

//lbData[230035, lbCurSel 230035]
lbAdd[230035, "FALSE"];
lbAdd[230035, "TRUE"];
lbSetData[230035, 0, "[0]"];
lbSetData[230035, 1, "[-1]"];

if(count allTurrets [_veh, true] == 0) then {
	//lbAdd[230035, "TRUE"];
	lbSetCurSel [230035, 1];
	ctrlEnable[230035, false];
}else{



};


/*
ctrlEnable[22004, false];
ctrlSetText [230005, "$" + str(_rearmPrice)];

ctrlEnable[230007 , false];

if(!(isNil '_oldpylons' ) ) then { 
	if (count _oldpylons > 0) then {	
		ctrlSetText [230006,"$" + str(round(_rearmPrice / 2))];
		if(round(_rearmPrice / 2) <= Call cti_CL_FNC_GetPlayerFunds && (count _pylons > 0)) then {
			ctrlEnable[230007, true];
		}
		else {
			ctrlEnable[230007, false];
		};
	};
} else {
	ctrlEnable[230007, false];
	ctrlSetText [230006,"$0"];
};
*/
//diag_log format["_pylons after check = %1", _pylons];


ctrlEnable[230007 , true];//right button
ctrlEnable[22004 , true];//save or purchase buton

//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//___LOOP______LOOP______LOOP______LOOP______LOOP______LOOP______LOOP______LOOP______LOOP______LOOP______LOOP______LOOP______LOOP______LOOP_____
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________



while {alive player && dialog} do {
	sleep 0.1;
	
	if (side player != cti_Client_SideJoined) exitWith {
	closeDialog 0;
	_initloadout call EASA_equip_loadout;
	_veh setVariable ["Loadout",nil];
	};
	if !(dialog) exitWith {
	_initloadout call EASA_equip_loadout;
	_veh setVariable ["Loadout",nil];};
	
	
	if (WF_MenuAction == 111) then {//on pylon selected
		WF_MenuAction = -1;		
		
		//get actual turret setting
		_owner=lbData[230033, lbCurSel 230033] call EASA_get_actual_owner;
		if (_owner#0 == 0)then{
		//lbClear 230035;
		//lbAdd[230035, "FALSE"];
		//lbAdd[230035, "TRUE"];
		lbSetCurSel [230035, 0];
		};
		if (_owner#0 == -1)then{
		//lbClear 230035;
		//lbAdd[230035, "FALSE"];
		//lbAdd[230035, "TRUE"];
		lbSetCurSel [230035, 1];
		};
		
		//lbSetData[230033, _ix, _x];
		//systemchat str _owner;
		//lbSetCurSel [230033, lbData[230033, lbCurSel 230033]];
		
		
		
		_k = 0;
		lbClear 230034;
		{
			if(_x != "CUP_PylonPod_ANAAQ_28" && _x != "CUP_PylonPod_ALQ_131"&& _x != "cwr3_PylonMissile_1Rnd_B61"&& _x != "cwr3_PylonMissile_1Rnd_RN28") then {
				//lbAdd[230034, getText (configFile >> "CfgMagazines" >> _x >> "displayName")];				
				
				_displayName=getText (configFile >> "CfgMagazines" >> _x >> "displayName");
				
				_ammoclass = getText(configFile >> 'CfgMagazines' >> _x >> 'ammo');
				
				_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'missileLockMinDistance');	//Defines min range a lock can be obtained
				_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'missileLockMaxDistance');	//Defines max range a lock can be obtained
				
				if (_ammostat_minLock == 0) then {	
				_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'ActiveRadar'>>'AirTarget'>>'minRange');	
					
					if (_ammostat_minLock == 0) then {	
					_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'ActiveRadar'>>'GroundTarget'>>'minRange');	
				
						if (_ammostat_minLock == 0) then {	
						_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'IRSensorComponent'>>'AirTarget'>>'minRange');	
				
							if (_ammostat_minLock == 0) then {	
							_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'IRSensorComponent'>>'GroundTarget'>>'minRange');					
				
								if (_ammostat_minLock == 0) then {	
								_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'LaserSensor'>>'AirTarget'>>'minRange');	
						
									if (_ammostat_minLock == 0) then {	
									_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'LaserSensor'>>'GroundTarget'>>'minRange');	
									
										if (_ammostat_minLock == 0) then {	
										_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'NVSensorComponent'>>'AirTarget'>>'minRange');	
								
											if (_ammostat_minLock == 0) then {	
											_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'NVSensorComponent'>>'GroundTarget'>>'minRange');	
												
												if (_ammostat_minLock == 0) then {	
												_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'VisualSensorComponent'>>'Components'>>'NVSensorComponent'>>'AirTarget'>>'minRange');	
												
													if (_ammostat_minLock == 0) then {	
													_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'VisualSensorComponent'>>'Components'>>'NVSensorComponent'>>'GroundTarget'>>'minRange');	
												
													};
												};
											};
										};
									};
								};
							};
						};
					};
				};
				
				
				
				if (_ammostat_maxLock == 0) then {	
				_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'ActiveRadar'>>'AirTarget'>>'maxRange');	
					
					if (_ammostat_maxLock == 0) then {	
					_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'ActiveRadar'>>'GroundTarget'>>'maxRange');	
				
						if (_ammostat_maxLock == 0) then {	
						_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'IRSensorComponent'>>'AirTarget'>>'maxRange');	
				
							if (_ammostat_maxLock == 0) then {	
							_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'IRSensorComponent'>>'GroundTarget'>>'maxRange');	
						
								if (_ammostat_maxLock == 0) then {	
								_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'LaserSensor'>>'AirTarget'>>'maxRange');	
						
									if (_ammostat_maxLock == 0) then {	
									_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'LaserSensor'>>'GroundTarget'>>'maxRange');	
										
										if (_ammostat_maxLock == 0) then {	
										_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'NVSensorComponent'>>'AirTarget'>>'maxRange');	
								
											if (_ammostat_maxLock == 0) then {	
											_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'NVSensorComponent'>>'GroundTarget'>>'maxRange');						
												
												if (_ammostat_maxLock == 0) then {	
												_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'VisualSensorComponent'>>'Components'>>'NVSensorComponent'>>'AirTarget'>>'maxRange');	
												
													if (_ammostat_maxLock == 0) then {	
													_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'VisualSensorComponent'>>'Components'>>'NVSensorComponent'>>'GroundTarget'>>'maxRange');	
												
													};
												};
											};
										};
									};
								};
							};
						};
					};
				};
				
				
				
				/*
				if (_ammostat_minLock == 0) then {	
				_parentslist=[ configFile >> 'CfgAmmo' >> _ammoclass, true ] call BIS_fnc_returnParents; 
				_Pclass=_parentslist#1;
				_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _Pclass >> 'missileLockMinDistance');	
					if (_ammostat_minLock == 0) then {
					_Pclass=_parentslist#2;
					_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _Pclass >> 'missileLockMinDistance');	
						if (_ammostat_minLock == 0) then {
						_Pclass=_parentslist#3;
						_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _Pclass >> 'missileLockMinDistance');	
							if (_ammostat_minLock == 0) then {
							_Pclass=_parentslist#4;
							_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _Pclass >> 'missileLockMinDistance');	
							
							//if still 0 crawl weapon baseclass
							_Wparentslist=[ configFile >> 'CfgMagazines' >> _x , true ] call BIS_fnc_returnParents; 
							_Px=_Wparentslist#1;
							_ammoclassB = getText(configFile >> 'CfgMagazines' >> _Px >> 'ammo');
							
							_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclassB >> 'missileLockMinDistance');
							
							if (_ammostat_minLock == 0) then {
							
								_parentslistB=[ configFile >> 'CfgAmmo' >> _ammoclassB, true ] call BIS_fnc_returnParents; 
								_PclassB=_parentslistB#1;
								_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _PclassB >> 'missileLockMinDistance');	
								
								if (_ammostat_minLock == 0) then {
								
									_PclassB=_parentslistB#2;
									_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _PclassB >> 'missileLockMinDistance');	
								
								
									};
								
								};
							};
						};
					};
				
				};
				
				*/
				_aSTRmin=str _ammostat_minLock;
				_aSTRmax=str _ammostat_maxLock;
				
				_aSubtext=_aSTRmin + "|>" + _aSTRmax;
				
				
				_ammostat_price = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'cost');	
				_ammostat_count = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'count');	
				
				/*
				if (_ammostat_count == 0) then {
				_PRICE=(_ammostat_price*0.1);
				_pSubtext=str _PRICE ;
				_pSubtext=_pSubtext +"$";
				}else{
				_PRICE=(_ammostat_price*0.1*_ammostat_count);
				_pSubtext=str _PRICE;
				_pSubtext=_pSubtext +"$";
				};
				*/
				
				_PRICE=(_ammostat_price*0.1);
				_pSubtext=str _PRICE ;
				_pSubtext=_pSubtext +"$";
				
				_pSubtext="0$";
				
				lbAdd[230034, format ["%1 (%2)", _displayName, _pSubtext]];
				
	

	
				
				//TOOLTIPSTUFF
				
								
				_ammostat_lockType = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'weaponLockSystem');	
				_locktype0="LOCK TYPE:";
				_locktype1=str _ammostat_lockType;
				
				
				if (_locktype1 isEqualto "") then {//CHECK OLD SYSTEM
				
				_ammostat_lockType_nvLock = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'nvLock');	
				_ammostat_lockType_laserLock = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'laserLock');	
				_ammostat_lockType_irLock  = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'irLock');
				
				if (_ammostat_lockType_nvLock == 1) then {
				_locktype1=_locktype1+ " NV "
				
				};
				if (_ammostat_lockType_laserLock == 1) then {
				_locktype1=_locktype1+ " LASER "
				
				};
				if (_ammostat_lockType_irLock == 1) then {
				_locktype1=_locktype1+ " IR "
				
				};
				
				
				
				//_ammostat_lockType_airLock = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'airLock');	//is aa= true
				
				
				/*
				_ammostat_lockType_laserScanner = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'laserScanner');	//for vehicle
				_ammostat_lockType_nvScanner  = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'laserScanner');	//for vehicle
				*/
				
				
				
					
				
				 
				
				//_ammostat_lockType_lockType = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'lockType');	//0 for all guided weapons
				 
				
				};
				_locktype2 =_locktype0 + _locktype1;
				
				_ammostat_hit = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'hit');
				_hit0="HIT DIRECT:";
				_hit1=str _ammostat_hit;
				_hit2=_hit0 + _hit1;
				
				_BORDER="______________";
				
				_ammostat_ihit = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'indirectHit');	
				_hiti0="HIT INDIRECT:";
				_hiti1=str _ammostat_ihit;
				_hiti2=_hiti0 + _hiti1;
				
				
				_ammostat_ihitRange = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'indirectHitRange');	
				_ammostat_ihitRangeSTR=str _ammostat_ihitRange;
				_iHitrange="RANGE INDIRECT:"+_ammostat_ihitRangeSTR;
				
				
				
				
				
				
				_Lockrange= "Lock (MIN/MAX) ="+_aSubtext;
				
				
				//
				
				//DEBUG
				
				
				//_parentslist=[ configFile >> 'CfgAmmo' >> _ammoclass, true ] call BIS_fnc_returnParents; 
				//_STRparents= str _parentslist;
				
				_STR_Mag_class=str _x;
				
				//_tSubtext= format['%1<br/>%2<br/>%3<br/>%4',_locktype2,_hit2,_hiti2,_Lockrange]];
				
				_tSubtext=str composeText [
				
				_locktype2
				,toString [13, 10]
				,_hit2
				,toString [13, 10]
				,_BORDER
				,toString [13, 10]
				,_hiti2
				,toString [13, 10]
				,_iHitrange
				,toString [13, 10]
				,_Lockrange
				
				
				
				
				//,toString [13, 10]
				//,_STRparents
				
				,toString [13, 10]
				,_STR_Mag_class
				
				
				];
				
				
				//lbSetTooltip [230034, ,format['%1<br/>%2<br/>%3<br/>%4','My Multi-line Tool-tip:','Line 1','Line 2','Line 3']];

	
	
				lbSetTooltip [230034, _k, _tSubtext];
				
				lbSetData [230034, _k, _x];
				_k = _k + 1;
			};			
		//} foreach ((typeOf _veh) getCompatiblePylonMagazines lbData[230033, lbCurSel 230033]);		
		} foreach _allPylonMags3;	
		//} foreach _allPylonMags2;		
		//} foreach _sorted;		
	
		//if actual in list,select it
		
		
		//lbData[230034, lbCurSel 230034]//pylonmags
		//lbSetCurSel [230035, 1];
		_maglist=getPylonMagazines _veh;
		//systemchat str lbData[230033, lbCurSel 230033];
		private _check=lbData[230033, lbCurSel 230033] call EASA_get_actual_magazine;
		if (_check in _allPylonMags3)then {//get index
		private _index=0;
		private _switch=2;
		{
		if ((_switch==2)&&!(_x==_check))then {
		_index=_index+1;
		}else{
		if (_switch==2) then{_switch=5};
		};
		}forEach _allPylonMags3;
		
		lbSetCurSel [230034, _index];
		}else{//some fueltanks not listed,just dont select it if you want keep it,we select 0 here
		lbSetCurSel [230034, 0];
		};
		//systemchat str _check;
	};
	
	/*
	
	if (WF_MenuAction == 111) then {
		WF_MenuAction = -1;		
		_allPylonMags2 = ("count( getArray (_x >> 'hardpoints')) > 0" configClasses (configfile >> "CfgMagazines")) apply {configname _x};
	
		_k = 0;
		lbClear 230034;
		{
			if(_x != "CUP_PylonPod_ANAAQ_28" && _x != "CUP_PylonPod_ALQ_131"&& _x != "cwr3_PylonMissile_1Rnd_B61"&& _x != "cwr3_PylonMissile_1Rnd_RN28") then {
				lbAdd[230034, getText (configFile >> "CfgMagazines" >> _x >> "displayName")];				
				lbSetData [230034, _k, _x];
				_k = _k + 1;
			};			
		} foreach _allPylonMags2 lbData[230033, lbCurSel 230033]);		
	};
	*/
	//_allPylonMags2 = ("count( getArray (_x >> 'hardpoints')) > 0" configClasses (configfile >> "CfgMagazines")) apply {configname _x};
	//hint str _allPylonMags2;	

	
	
	
	
	//--Weapon magazine changed--
	if (WF_MenuAction == 112) then {
		WF_MenuAction = -1;						
		
		_turretPath = lbData[230033, lbCurSel 230033] call EASA_get_actual_owner;

		
		if(lbData[230035, lbCurSel 230035] == "[0]") then {	
			_turretPath = [0];
		}else {			
		_turretPath = [-1];
		};

		
		
		[[lbData[230033, lbCurSel 230033], lbData[230034, lbCurSel 230034],true, _turretPath]] call EASA_equip_loadout;
		sleep .1;//need some sleep here to get actual not last one
		call EASA_get_pylonlist;
		
		/*
		if(count _pylons > 0) then {
			//--If current pylon already in array do not pushBack to array, else set new value--
			_exist = false;
			
			for "_j" from 0 to (count _pylons) - 1 do {
				if( (_pylons select _j) select 0 == lbData[230033, lbCurSel 230033]) exitWith {
					_exist = true;
					_pylons set [_j, [lbData[230033, lbCurSel 230033], lbData[230034, lbCurSel 230034], true, _turretPath]];
					lbSetColor [230033, lbCurSel 230033, [0.9333, 0.8980, 0.5451, 0.9]];					
				};
			};
			
			if(!_exist) then {
				_pylons pushBack [lbData[230033, lbCurSel 230033], lbData[230034, lbCurSel 230034], true, _turretPath];
				lbSetColor [230033, lbCurSel 230033, [0.9333, 0.8980, 0.5451, 0.9]];				
			};
		}
		else
		{
			_pylons pushBack [lbData[230033, lbCurSel 230033], lbData[230034, lbCurSel 230034], true, _turretPath];
			lbSetColor [230033, lbCurSel 230033, [0.9333, 0.8980, 0.5451, 0.9]];			
		};
		
		//_rearmPrice = round((((missionNamespace getVariable _type) select QUERYUNITPRICE)/(missionNamespace getVariable "cti_C_UNITS_SUPPORT_REARM_PRICE"))*1.25);
		//_rearmPrice = round((_rearmPrice * (count _pylons)) / 2);		
		ctrlSetText [230005,"$"+str(_rearmPrice)];
		
		if(_rearmPrice <= Call cti_CL_FNC_GetPlayerFunds && (count _pylons > 0)) then {
			ctrlEnable[22004 , true];
		}
		else {
			ctrlEnable[22004 , false];
		};
		
		if(!(isNil '_oldpylons' ) ) then { 
			if (count _oldpylons > 0) then {
				if(round(_rearmPrice / 2) <= Call cti_CL_FNC_GetPlayerFunds && (count _pylons > 0)) then {
					ctrlEnable[230007 , true];
				}
				else {
					ctrlEnable[230007 , false];
				};
			};
		};	
		
		ctrlSetText [230006,"$" + str(round(_rearmPrice / 2))];	
		*/
		
	};
	
	//--Weapon control mode changed--
	if (WF_MenuAction == 114) then {
		WF_MenuAction = -1;		
		
	
		_turretPath = [0];
		if(lbData[230035, lbCurSel 230035] == "[0]") then {			
			_turretPath = [0];
		}
		else {
			
			_turretPath = [-1];
		};
		
		
		
		[[lbData[230033, lbCurSel 230033], lbData[230034, lbCurSel 230034],true, _turretPath]] call EASA_equip_loadout;
		
		/*
		if(count _pylons > 0) then {			
			for "_j" from 0 to (count _pylons) - 1 do {
				if( (_pylons select _j) select 0 == lbData[230033, lbCurSel 230033]) exitWith {					
					_pylons set [_j, [lbData[230033, lbCurSel 230033], lbData[230034, lbCurSel 230034], true, _turretPath]];					
				};
			};
		};
			*/
	};
	
	//--Remove from set--doubleclick on pylon
	if (WF_MenuAction == 102) then {
		WF_MenuAction = -1;
		/*
		_trysell_message = true;		
		
		if(count _pylons > 0) then {			
			for "_j" from 0 to (count _pylons) - 1 do {
				if( (_pylons select _j) select 0 == lbData[230033, lbCurSel 230033] && lbData[230033, lbCurSel 230033] == lbText[230033, lbCurSel 230033] ) exitWith {					
					_pylons deleteAt _j;
					lbSetColor [230033, lbCurSel 230033, [1, 1, 1, 1]];
					_trysell_message = false;
				};
			};
		};
		
		if(count _pylons > 0) then {
			//_rearmPrice = round((((missionNamespace getVariable _type) select QUERYUNITPRICE)/(missionNamespace getVariable "cti_C_UNITS_SUPPORT_REARM_PRICE"))*1.25);
			//_rearmPrice = round((_rearmPrice * (count _pylons)) / 2);		
		}
		else {
			_rearmPrice = 0;
		};
		
		ctrlSetText [230005,"$"+str(_rearmPrice)];
		
		if(_rearmPrice <= Call cti_CL_FNC_GetPlayerFunds && (count _pylons > 0)) then {
			ctrlEnable[22004 , true];
		}
		else {
			ctrlEnable[22004 , false];
		};
		
		if(!(isNil '_oldpylons' ) ) then { 
			if (count _oldpylons > 0) then {
				if(round(_rearmPrice / 2) <= Call cti_CL_FNC_GetPlayerFunds && (count _pylons > 0)) then {
					ctrlEnable[230007 , true];
				}
				else {
					ctrlEnable[230007 , false];
				};
			};
		};
		
		ctrlSetText [230006,"$" + str(round(_rearmPrice / 2))];		
		
		if(_trysell_message) then {
			//hint parseText(localize 'STR_WF_EASA_TRYSELL_MESSAGE');
		};	
			*/
	};
	
	//--Purchase Button--
	if (WF_MenuAction == 101) then {
		WF_MenuAction = -1;
		
		//save it
		_initloadout=call EASA_get_loadout;
		_veh setVariable ["Loadout",_initloadout];
		
		/*
		-_rearmPrice Call cti_CL_FNC_ChangePlayerFunds;
			
		if(count _pylons > 0) then {
			_veh setVariable ["_pylons", _pylons, true];
			[_veh, _pylons] call cti_CO_FNC_Requip_AIR_VEH;
		};
		
		
		
		if (WF_Debug) then {
			diag_log format["Set pylons for %1 : %2", typeOf _veh, _pylons];
		};
		*/
	};
	
	//--Rearm by default Button--
	if (WF_MenuAction == 115) then {
		WF_MenuAction = -1;
		
		_initloadout call EASA_equip_loadout;
		
		/*
		-(round(_rearmPrice / 2)) Call cti_CL_FNC_ChangePlayerFunds;		
		
		cti_CO_FNC_RearmVehicle = Compile preprocessFileLineNumbers "Common\Functions\Common_RearmVehicle.sqf";
		_veh setVariable ["_pylons", nil]; 
		[_veh, side player] Spawn cti_CO_FNC_RearmVehicle;
		*/
	};
};

EASA_CTI_UnitsCamera cameraEffect["TERMINATE","BACK"];
camDestroy EASA_CTI_UnitsCamera;