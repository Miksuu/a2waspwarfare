Private ['_camps','_marker','_town','_townDubbingName','_townMaxSV','_townName','_townRange','_townStartSV','_townValue'];

_town = _this select 0;
_townName = _this select 1;
_townDubbingName = _this select 2;
_townStartSV = _this select 3;
_townMaxSV = _this select 4;
_townValue = _this select 5;
_town_type = _this select 6;
_townRange = 600;

if ((missionNamespace getVariable "cti_DEBUG_DISABLE_TOWN_INIT") == 1) exitWith {
	["DEBUG", "Init_Town.sqf init is disabled"] Call cti_CO_FNC_LogContent;
};

//--- Prevent the isServer bug on the client.
sleep (1.2 + random 0.2);

if (isNull _town || (_town getVariable "cti_inactive")) exitWith {};

_town setVariable ["name",_townName];
_town setVariable ["range",_townRange];
_town setVariable ["startingSupplyValue",_townStartSV];
_town setVariable ["maxSupplyValue",_townMaxSV];

//--- If the town type is an array rather than a single value, pick a random template (see Server_GetTownGroupsDefender.sqf).
if (typeName _town_type == "ARRAY") then {_town_type = _town_type select floor(random count _town_type);};
_town setVariable ["cti_town_type", _town_type];
waitUntil {commonInitComplete};

if (isServer) then {
    Private ["_camps", "_defenses", "_synced"];
    //--- Get the camps and defenses, note that synchronizedObjects only work for the server.
    _camps = [];
    _defenses = [];

    for '_i' from 0 to count(synchronizedObjects _town)-1 do {
        _synced = (synchronizedObjects _town) select _i;
        if (typeOf _synced == "LocationCamp_F") then {
            _camps pushBack _synced;
            _synced setVariable ["town", _town];
        };
        if (!isNil {_synced getVariable "cti_defense_kind"}) then {_defenses pushBack _synced};
    };

    ["INITIALIZATION",Format ["Init_Town.sqf : Found [%1] synchronized camps in [%2].", count _camps, _town getVariable "name"]] call cti_CO_FNC_LogContent;

    _town setVariable ["camps", _camps, true];
    _town setVariable ["cti_town_defenses", _defenses];

    _townDubbingName = switch (_townDubbingName) do {
        case "+": {_townName};//--- Copy the name.
        case "": {"Town"};//--- Unknown name, apply Town dubbing.
        default {_townDubbingName};//--- Input name.
    };
    _town setVariable ["cti_town_dubbing", _townDubbingName];

    //--- Don't pause.
    [_town,_townStartSV,_townRange] spawn {
        Private ["_camps","_defenses","_marker","_size","_town","_townModel","_townRange","_townStartSV"];
        _town = _this select 0;
        _townStartSV = _this select 1;
        _townRange = _this select 2;
        _camps = _town getVariable "camps";

        //get z on 0
		
		//_town setVectorUp surfaceNormal (position _town) ;
		_town setPosATL [getPosATL _town select 0,getPosATL _town select 1,0];
		//--- Models creation.
       
	
//clear all arround towncenter//for easy build of new maps
		_cleanlist = nearestTerrainObjects [(getPos _town), ["BUILDING", "HOUSE", "CHURCH", "CHAPEL", "BUNKER", "FORTRESS", "FOUNTAIN", "VIEW-TOWER", "LIGHTHOUSE", "QUAY", "FUELSTATION", "HOSPITAL", "FENCE", "WALL", "BUSSTOP", "TRANSMITTER", "STACK", "RUIN", "TOURISM", "WATERTOWER", "POWER LINES", "RAILWAY", "POWERSOLAR", "POWERWAVE", "POWERWIND", "HIDE", "SHIPWRECK","TREE", "SMALL TREE", "BUSH", "FOREST BORDER", "FOREST TRIANGLE", "FOREST SQUARE", "FOREST", "ROCK", "ROCKS", "HIDE"], 35, false, true];
		_countC = 0;
		{[_x, true] remoteExec ["hideObjectGlobal", 0, true];_countC = _countC + 1;} forEach _cleanlist;
				
	

	
		
	_townModel = createVehicle [missionNamespace getVariable "cti_C_DEPOT", getPosATL _town, [], 0, "NONE"];
	
	/*
	_townModel setDir (getDir _town);
	_townModel setPosATL (getPosATL _town);
	_townModel setVectorUp surfaceNormal (position _townModel) ;
	*/
	
			_townModel setDir (0);
            _depot_pos=getPosATL _townModel;
			_nearRoads = _depot_pos nearRoads 50;			
			
			
			
			if(count _nearRoads > 0) then {
					_road = _nearRoads select 0;				
					_roadConnectedTo = roadsConnectedTo _road;
					if(count _roadConnectedTo > 0 ) then {
						_connectedRoad = _roadConnectedTo select 0;
						_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
						_townModel setDir (_direction-90);

						//[_direction, _depot_pos, _campModel, _town] call cti_CO_FNC_CreateComposition;
						//_x setDir (getDir _campModel);
						//_x setPosATL (getPosATL _campModel);
					};
            };
			_townModel setVectorUp surfaceNormal (getposATL _townModel);
			
	
	
	
	_townModel addEventHandler ["handleDamage", {false}];				
	//depot ready
	
	
	

        if (isNil {_town getVariable "sideID"}) then {_town setVariable ["sideID",cti_DEFENDER_ID,true]};
        _town setVariable ["supplyValue",_townStartSV,true];

        sleep (random 1);

        waitUntil {serverInitComplete};
        _towns_camps 		= [];
        _town_camp_flags    = [];
        _camp_counter = 0;
        {
            Private ["_camp_health","_flag","_pos","_townModel"];
            //--- Create the camp model.
            
			_camp_pos = getPosATL _x;
            _campModel = createVehicle [missionNamespace getVariable "cti_C_CAMP", getPos _x, [], 0, "NONE"];
			
			
			_campModel setPosASL [(getPosASL _campModel)#0,(getPosASL _campModel)#1,(getTerrainHeightASL[(getPosASL _campModel)#0,(getPosASL _campModel)#1])];
			_campModel setVectorUp surfaceNormal (getposATL _campModel);
			_campModel setDir (0);
            _nearRoads = _camp_pos nearRoads 50;			
			
            if(count _nearRoads > 0) then {
                _road = _nearRoads select 0;				
                _roadConnectedTo = roadsConnectedTo _road;
				if(count _roadConnectedTo > 0 ) then {
					_connectedRoad = _roadConnectedTo select 0;
					_direction = [_road, _connectedRoad] call BIS_fnc_DirTo;
					_campModel setDir (_direction);

					[_direction, _camp_pos, _campModel, _town] call cti_CO_FNC_CreateComposition;
					_x setDir (getDir _campModel);
					_x setPosATL (getPosATL _campModel);
				};
            };
			_campModel setVectorUp surfaceNormal (getposATL _campModel);
			
			
			
			//--- Maybe we want to make the camp stronger.test
			_camp_health = missionNamespace getVariable "cti_C_CAMP_HEALTH_COEF";
			if !(isNil '_camp_health') then {
				_campModel addEventHandler ["handleDamage",{getDammage (_this select 0)+((_this select 2)/(missionNamespace getVariable "WFBE_C_CAMP_HEALTH_COEF"))}];
			};
			
			
			
            //--- Create a flag near the camp location & position it.

			_flag = createVehicle [missionNamespace getVariable "cti_C_CAMP_FLAG", getPos _x, [], 0, "NONE"];
			_flag setPos (_x modelToWorld (missionNamespace getVariable "cti_C_CAMP_FLAG_POS"));

			_x setVariable ["cti_flag", _flag];



            //--- Initialize the camp.
            if (isNil {_x getVariable "sideID"}) then {_x setVariable ["sideID",cti_DEFENDER_ID,true]};
            if (isNil {_x getVariable "supplyValue"}) then {
                waitUntil {!isNil {_town getVariable "supplyValue"}};
                _x setVariable ["supplyValue", _town getVariable "supplyValue", true];
                _x setVariable ["cti_camp_bunker", _campModel, true];
                _towns_camps pushBack _x;
            };
            _town_camp_flags pushBack _flag;
            ["INITIALIZATION",Format ["Init_Town.sqf : Initialized Camp in [%1].", _town getVariable "name"]] call cti_CO_FNC_LogContent;
            _camp_counter = _camp_counter + 1;
        } forEach _camps;

        if(_camp_counter == count _camps)then{
            [_towns_camps, _town, _town_camp_flags] execVM "Server\FSM\server_town_camp.sqf";
        };

        waitUntil {townInitServer};

        //--- Prepare the default defenses (if needed and if occupation or defender is present).
        if ((_town getVariable "sideID") != cti_C_UNKNOWN_ID && ((missionNamespace getVariable "cti_C_TOWNS_DEFENDER") > 0 || (missionNamespace getVariable "cti_C_TOWNS_OCCUPATION") > 0)) then {
            [_town, (_town getVariable "sideID") Call cti_CO_FNC_GetSideFromID, -1] Spawn cti_SE_FNC_ManageTownDefenses;
        };
    };


    sleep 0.01;
};

//--- Client camp init.
if (local player) then {
    waitUntil {!isNil {_town getVariable "camps"}};

    _camps = _town getVariable "camps";
    for '_i' from 0 to count(_camps)-1 do {
        _camp = _camps select _i;
        _camp setVariable ["cti_camp_marker", Format ["cti_%1_CityMarker_Camp%2", str _town, _i]];
        _camp setVariable ["town", _town];
    };

    ["INITIALIZATION",Format ["Init_Town.sqf : (Client) Initialized Camps [%1] for town [%2].", count _camps, _townName]] call cti_CO_FNC_LogContent;
};

["INITIALIZATION",Format ["Init_Town.sqf : Initialized town [%1].", _townName]] call cti_CO_FNC_LogContent;

towns pushBack _town;
