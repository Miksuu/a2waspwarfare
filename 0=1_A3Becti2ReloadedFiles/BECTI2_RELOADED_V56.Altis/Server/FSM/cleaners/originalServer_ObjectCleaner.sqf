private ["_isHidden","_checkPlayerCount","_checkFrequencyDefault","_checkFrequencyAccelerated","_playerThreshold","_deadMenLimit","_deadMenDistCheck","_deadMenDist","_deadVehiclesLimit","_deadVehicleDistCheck","_deadVehicleDist","_craterLimit","_craterDistCheck","_craterDist","_ruins","_ruinsLimit","_ruinsDistCheck","_ruinsDist","_weaponHolderLimit","_weaponHolderDistCheck","_weaponHolderDist","_minesLimit","_minesDistCheck","_minesDist","_staticsLimit","_staticsDistCheck","_staticsDist","_orphanedTriggers","_emptyGroups"];

//==================== HIDDEN-FROM-PLAYERS FUNCTION

_isHidden = compileFinal "
	private [""_c""];
	_c = FALSE;
	if (({(((_this select 0) distance _x) < (_this select 1))} count (_this select 2)) isEqualTo 0) then {
		_c = TRUE;
	};
	_c;
";

//================================================================ CONFIG

deleteManagerPublic = TRUE;						// To terminate script via debug console
_checkPlayerCount = FALSE;						// dynamic sleep. Set TRUE to have sleep automatically adjust based on # of players.
_checkFrequencyDefault = 240;					// sleep default
_checkFrequencyAccelerated = 180;				// sleep accelerated
_playerThreshold = 30;							// How many players before accelerated cycle kicks in?

_craterLimit = 20;								// Craters. Set -1 to disable.
_craterDistCheck = TRUE;						// TRUE to delete any craters that are far from players.
_craterDist = 1000;								// Distance (meters) from players that craters are not deleted if below max.
_ruinsLimit = 10;								// Ruins. Set -1 to disable.
_ruinsDistCheck = TRUE;							// TRUE to delete any ruins that are far from players.
_ruinsDist = 3000;								// Distance (meters) from players that ruins are not deleted if below max.

_objectsLimit = 0;								// Objects. Set -1 to disable.
_objectsDistCheck = TRUE;							// TRUE to delete any objects that are far from players.
_objectsDist = 3000;								// Distance (meters) from players that objects are not deleted if below max.
_objectFilters = ["WeaponHolder", "GroundWeaponHolder", "WeaponHolderSimulated", "Mine", "MineE"];



//================================================================ LOOP

while {!cti_GameOver} do {

	//================================= CRATERS
	if (!(_craterLimit isEqualTo -1)) then {
		if ((count (allMissionObjects "CraterLong")) > _craterLimit) then {
			while {(((count (allMissionObjects "CraterLong")) - _craterLimit) > 0)} do {
				deleteVehicle ((allMissionObjects "CraterLong") select 0);
				sleep 0.5;
			};
		} else {
			if (_craterDistCheck) then {
				{
					if ([_x,_craterDist,(playableUnits + switchableUnits)] call _isHidden) then {
						deleteVehicle _x;
					};
				} count (allMissionObjects "CraterLong");
			};
		};
	};
	sleep 1;
	//================================= RUINS
	if (!(_ruinsLimit isEqualTo -1)) then {
		_ruins = [];
		{
			if ((_x distance [0,0,0]) > 100) then {
				_ruins pushBack _x;
				sleep 0.1;
			};
		} count (allMissionObjects "Ruins");
		if ((count _ruins) > _ruinsLimit) then {
			while {(((count _ruins) - _ruinsLimit) > 0)} do {
				_ruins resize (count _ruins - 1);
				deleteVehicle (_ruins select 0);
				sleep 0.5;
			};
		} else {
			if (_ruinsDistCheck) then {
				{
					if ([_x,_ruinsDist,(playableUnits + switchableUnits)] call _isHidden) then {
						deleteVehicle _x;
					};
				} count (allMissionObjects "Ruins");
			};
		};
	};
	
	//================================= OBJECTS
	if (!(_objectsLimit isEqualTo -1)) then {
		for '_i' from 0 to count(_objectFilters)-1 do {
			_filter = _objectFilters select _i;
			if ((count (allMissionObjects _filter)) > _objectsLimit) then {
				while {(((count (allMissionObjects _filter)) - _objectsLimit) > 0)} do {
					deleteVehicle ((allMissionObjects _filter) select 0);
					sleep 0.5;
				};
			} else {
				if (_objectsDistCheck) then {
					{
						if ([_x,_objectsDist,(playableUnits + switchableUnits)] call _isHidden) then {
							deleteVehicle _x;
						};
					} count (allMissionObjects _filter);
				};
			};
		};
	};
	
	
	sleep 1;
	//================================= SLEEP
	if (_checkPlayerCount) then {
		if ((count (playableUnits + switchableUnits)) >= _playerThreshold) then {
			sleep _checkFrequencyAccelerated;
		} else {
			sleep _checkFrequencyDefault;
		};
	} else {
		sleep _checkFrequencyDefault;
	};
};