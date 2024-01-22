Private ['_area','_coin','_coinCategories','_coinItemArray','_curId','_d','_defenseCategories','_defenseCosts','_defenseDescriptions','_defenses','_emptyStructures','_extra','_fix','_i','_indexCategory','_isHQdeployed','_structureCosts','_structureDescriptions','_structures','_updateDefenses','_updateStructures'];
_area = _this select 0;
_isHQdeployed = _this select 1;
_coin = _this select 2;
_extra = "";
if (count _this > 3) then {_extra = _this select 3};


//--- Define the CoIn placement method.


missionNamespace setVariable ["cti_C_STRUCTURES_PLACEMENT_METHOD",{
    Private["_i","_factory","_sorted","_walls","_factories","_area","_lx","_ly","_type","_p","_entities"];
    _itemcategory = _this select 0;
    _preview = _this select 1;
    _color = _this select 2;
    _eside = if (side commanderTeam == west) then {east} else {west};
    _affected = ["Warfare_HQ_base_unfolded","Base_WarfareBBarracks","Base_WarfareBLightFactory","Base_WarfareBHeavyFactory",
                        "Base_WarfareBAircraftFactory","Base_WarfareBUAVterminal","Base_WarfareBVehicleServicePoint","BASE_WarfareBAntiAirRadar"];
    _area = [_preview,((cti_Client_SideJoined) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity2;

    if(_area getVariable 'avail' <= 0) then { _color = _colorRed };
    if (surfaceIsWater(position _preview)) then { _color = _colorRed };

    if ({_preview isKindOf _x} count _affected != 0) then {
        Private["_building","_sort","_strs","_lax","_lay"];
        _strs = ((position _preview) nearObjects ["House",25]) - [_preview];
        if (count _strs == 0) exitWith {};
        _sort = [_preview,_strs] Call cti_CO_FNC_SortByDistance;
        _building = _sort select 0;
        _lax=((boundingBox _building) select 1) select 0;
        _lay=((boundingBox _building) select 1) select 1;
        if(_preview distance _building < 1.5*(_lax max _lay)) then {
            _color = _colorRed
        } else{
            _color = _colorGreen
        };
    };
	
	_HIGHdistanceLIST=[
	"Land_Target_Concrete_Support_01_F"
	,"Land_Bunker_01_blocks_1_F"
	,"Land_Bunker_01_blocks_3_F"
	,"Land_PillboxWall_01_3m_round_F"
	,"Land_CncBarrierMedium4_F"
	,"Land_PetroglyphWall_02_F"
	,"Land_i_Garage_V2_F"
	,"Land_PillboxWall_01_6m_round_F"
	,"Land_CncWall4_F"
	,"Land_Podesta_1_stairs4"
	,"Land_Platform_Stairs_30"
	,"Land_Platform_Stairs_20"
	,"Land_ConcreteRamp"
	,"Land_ConcreteBlock"
	,"Land_Platform_Base"
	,"Land_BasaltWall_01_d_left_F"
	,"Land_BasaltWall_01_gate_F"
	,"Land_PillboxBunker_01_rectangle_F"
	,"Land_PillboxBunker_01_hex_F"
	,"Land_Bunker_02_light_right_F"
	,"Land_Bunker_02_right_F"
	,"Land_Bunker_02_light_double_F"
	,"Land_Bunker_02_light_left_F"
	,"Land_Bunker_02_left_F"
	,"Land_Bunker_02_double_F"
	,"Land_Bunker_01_small_F"
	,"Land_Podesta_1_stairs2"
	,"Land_Bunker_01_big_F"
	,"Land_Bunker_01_HQ_F"
	,"land_cwr3_ammostore2"
	,"Land_PillboxBunker_01_big_F"
	,"Land_Bunker_01_tall_F"
	,"land_cwr3_garaz_bez_tanku"
	
	
	
	
	];
	
	
    if (_itemcategory != 0) then {
        _color = _colorGreen;
        _walls = nearestObjects [_preview,[typeOf _preview],2];

        if(count _walls > 1) then {_color = _colorRed} else{_color = _colorGreen};
        if(count (nearestObjects [_preview,missionNamespace getVariable (Format["cti_%1DEFENSENAMES",cti_Client_SideJoined]),((((boundingbox _preview) select 1) select 0) max (((boundingbox _preview) select 1) select 1)) max 2] - [_preview]) > 0) then {_color = _colorRed} else{_color = _colorGreen};
        _entities = (position _preview) nearEntities [['Man','Car','Motorcycle','Tank','Air','Ship'],12];
        if ((count _entities > 0) && {side _x != cti_Client_SideJoined} count _entities !=0) then {_color = _colorRed};
        _factories = nearestObjects[_preview,["Warfare_HQ_base_unfolded","WarfareBBaseStructure","Base_WarfareBContructionSite"],25];
        if (count _factories == 0) exitWith {};
        _sorted = [_preview,_factories] Call cti_CO_FNC_SortByDistance;
        _factory = _sorted select 0;
        _type=typeOf _factory;
        _lx=((boundingbox _factory) select 1) select 0;
        _ly=((boundingbox _factory) select 1) select 1;

        switch (true) do {
            case ( _factory isKindOf "Warfare_HQ_base_unfolded"):{_p=0.6};
            case ( _factory isKindOf "Base_WarfareBBarracks"):{_p=0.57};
            case ( _factory isKindOf "Base_WarfareBLightFactory"):{_p=0.6};
            case ( _factory isKindOf "Base_WarfareBHeavyFactory"):{_p=0.54};
            case ( _factory isKindOf "Base_WarfareBAircraftFactory"):{_p=0.74};
            case ( _factory isKindOf "Base_WarfareBUAVterminal"):{_p=1};
            case ( _factory isKindOf "Base_WarfareBContructionSite"):{_p=12};
            default {_p=1};
        };

		

        if(_preview distance _factory < (_p*(_lx min _ly))) then {_color = _colorRed};
    }else{
        private ["_objects","_sideEfacs","_object"];
        _sideEfacs = if (side commanderTeam == west) then {east} else {west};
        _objects = nearestObjects [_preview,["WarfareBBaseStructure","Base_WarfareBContructionSite"],25];
        if (count _objects > 0) then {
            if (side (_objects select 0) == _sideEfacs && _preview distance (_objects select 0) < 10)then {_color = _colorRed};
        };
    };
	/*
    if (_itemcategory == 3) then {
        Private["_camos"];
        _color = _colorGreen;
        _camos = nearestObjects [_preview,[typeOf _preview],25];
        if(count _camos > 1) then {
            _color = _colorRed
        } else{_color = _colorGreen};
    };
	*/
	
	if (typeOf _preview in _HIGHdistanceLIST) then { 
        _color = _colorGreen;
        _walls = nearestObjects [_preview,[typeOf _preview],2];

        if(count _walls > 1) then {_color = _colorRed} else{_color = _colorGreen};
        if(count (nearestObjects [_preview,missionNamespace getVariable (Format["cti_%1DEFENSENAMES",cti_Client_SideJoined]),((((boundingbox _preview) select 1) select 0) max (((boundingbox _preview) select 1) select 1)) max 2] - [_preview]) > 0) then {_color = _colorRed} else{_color = _colorGreen};
        _entities = (position _preview) nearEntities [['Man','Car','Motorcycle','Tank','Air','Ship'],12];
        if ((count _entities > 0) && {side _x != cti_Client_SideJoined} count _entities !=0) then {_color = _colorRed};
        _factories = nearestObjects[_preview,["Warfare_HQ_base_unfolded","WarfareBBaseStructure","Base_WarfareBContructionSite"],25];
        if (count _factories == 0) exitWith {};
        _sorted = [_preview,_factories] Call cti_CO_FNC_SortByDistance;
        _factory = _sorted select 0;
        _type=typeOf _factory;
        _lx=((boundingbox _factory) select 1) select 0;
        _ly=((boundingbox _factory) select 1) select 1;

        switch (true) do {
            case ( _factory isKindOf "Warfare_HQ_base_unfolded"):{_p=0.6};
            case ( _factory isKindOf "Base_WarfareBBarracks"):{_p=0.57};
            case ( _factory isKindOf "Base_WarfareBLightFactory"):{_p=0.6};
            case ( _factory isKindOf "Base_WarfareBHeavyFactory"):{_p=0.54};
            case ( _factory isKindOf "Base_WarfareBAircraftFactory"):{_p=0.74};
            case ( _factory isKindOf "Base_WarfareBUAVterminal"):{_p=1};
            case ( _factory isKindOf "Base_WarfareBContructionSite"):{_p=12};
            default {_p=1};
        };

		

        if(_preview distance _factory < (_p*(_lx min _ly))+15) then {_color = _colorRed};
    }else{
        private ["_objects","_sideEfacs","_object"];
        _sideEfacs = if (side commanderTeam == west) then {east} else {west};
        _objects = nearestObjects [_preview,["WarfareBBaseStructure","Base_WarfareBContructionSite"],25];
        if (count _objects > 0) then {
            if (side (_objects select 0) == _sideEfacs && _preview distance (_objects select 0) < 10)then {_color = _colorRed};
        };
    };
	
	if (typeOf _preview == "CamoNet_wdl_big_F") then { 
	
	 Private["_camos"];
        _color = _colorGreen;
        _camos = nearestObjects [_preview,[typeOf _preview],25];
        if(count _camos > 1) then {
            _color = _colorRed
        } else{_color = _colorGreen};
	
	};
	
	if (typeOf _preview == "Land_IRMaskingCover_01_F") then { 
	
	 Private["_camos"];
        _color = _colorGreen;
        _camos = nearestObjects [_preview,[typeOf _preview],25];
        if(count _camos > 1) then {
            _color = _colorRed
        } else{_color = _colorGreen};
	
	};
	
    if (typeOf _preview == "Sign_Danger" && !isNull ([_preview,((cti_Client_SideJoined) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity2)) then {
        _color = _colorRed;
        hintsilent "Minefields are not allowed at base!";
    };
	
	 if (typeOf _preview == "Sign_DangerMines_ACR" && !isNull ([_preview,((cti_Client_SideJoined) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity2)) then {
        _color = _colorRed;
        hintsilent "Minefields are not allowed at base!";
    };
	
    if (_itemcategory != 0 && typeOf _preview isKindOf "Base_WarfareBVehicleServicePoint") then {
        _color = _colorGreen;
    };



	

/*original
    if ((typeOf _preview) iskindOf "Warfare_HQ_base_unfolded") then {
        Private ["_town","_townside","_eArea"];
        _town = [_preview] Call cti_CO_FNC_GetClosestLocation;
        _townside =  (_town getVariable "sideID") Call cti_CO_FNC_GetSideFromID;
        _eArea = [_preview,((_eside) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity3;
        if!(isNil "_townside")then{
            if ((_preview distance _town < 600 && _townside != cti_Client_SideJoined) || !isNull _eArea) then {
                _color = _colorRed;
                 hintSilent parseText "<t color='#fb0808'> You have entered a restricted area ! Impossible to build here! </t>";
            };
        };
    };
*/

//Mainbunkerblock 30m added...


_builded_bunker = nearestObjects[_preview,_HIGHdistanceLIST,25];
if (count _builded_bunker > 0) then {
        _sorted = [_preview,_builded_bunker] Call cti_CO_FNC_SortByDistance;
        _builded_bunker = _sorted select 0;
};
 if ((typeOf _preview) iskindOf "Warfare_HQ_base_unfolded") then {
        Private ["_town","_townside","_eArea"];
        
		//if(_preview distance _builded_bunker < 25) then {_color = _colorRed};
		
		_town = [_preview] Call cti_CO_FNC_GetClosestLocation;
        _townside =  (_town getVariable "sideID") Call cti_CO_FNC_GetSideFromID;
        _eArea = [_preview,((_eside) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity3;
        if!(isNil "_townside")then{
            if ((_preview distance _town < 600 && _townside != cti_Client_SideJoined) || !isNull _eArea
			||_preview distance _town < 30) then {
                _color = _colorRed;
                 hintSilent parseText "<t color='#fb0808'> You have entered a restricted area ! Impossible to build here! </t>";
            };
        };
    };

 if ((typeOf _preview) iskindOf "Warfare_HQ_base_unfolded") then {
	if(_preview distance _builded_bunker < 25) then {_color = _colorRed};};


 if ((typeOf _preview) iskindOf "Base_WarfareBBarracks") then {
        Private ["_town","_townside","_eArea"];
		
		
		
        _town = [_preview] Call cti_CO_FNC_GetClosestLocation;
        _townside =  (_town getVariable "sideID") Call cti_CO_FNC_GetSideFromID;
        _eArea = [_preview,((_eside) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity3;
        if!(isNil "_townside")then{
            if ((_preview distance _town < 600 && _townside != cti_Client_SideJoined) || !isNull _eArea
			||_preview distance _town < 30) then {
                _color = _colorRed;
                 hintSilent parseText "<t color='#fb0808'> You have entered a restricted area ! Impossible to build here! </t>";
            };
        };
    };

 if ((typeOf _preview) iskindOf "Base_WarfareBBarracks") then {
	if(_preview distance _builded_bunker < 25) then {_color = _colorRed};};


 if ((typeOf _preview) iskindOf "Base_WarfareBLightFactory") then {
        Private ["_town","_townside","_eArea"];
		
		
		
        _town = [_preview] Call cti_CO_FNC_GetClosestLocation;
        _townside =  (_town getVariable "sideID") Call cti_CO_FNC_GetSideFromID;
        _eArea = [_preview,((_eside) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity3;
        if!(isNil "_townside")then{
            if ((_preview distance _town < 600 && _townside != cti_Client_SideJoined) || !isNull _eArea
			||_preview distance _town < 30) then {
                _color = _colorRed;
                 hintSilent parseText "<t color='#fb0808'> You have entered a restricted area ! Impossible to build here! </t>";
            };
        };
    };

 if ((typeOf _preview) iskindOf "Base_WarfareBLightFactory") then {
	if(_preview distance _builded_bunker < 25) then {_color = _colorRed};};




 if ((typeOf _preview) iskindOf "Base_WarfareBHeavyFactory") then {
        Private ["_town","_townside","_eArea"];
		
		
		
        _town = [_preview] Call cti_CO_FNC_GetClosestLocation;
        _townside =  (_town getVariable "sideID") Call cti_CO_FNC_GetSideFromID;
        _eArea = [_preview,((_eside) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity3;
        if!(isNil "_townside")then{
            if ((_preview distance _town < 600 && _townside != cti_Client_SideJoined) || !isNull _eArea
			||_preview distance _town < 30) then {
                _color = _colorRed;
                 hintSilent parseText "<t color='#fb0808'> You have entered a restricted area ! Impossible to build here! </t>";
            };
        };
    };

if ((typeOf _preview) iskindOf "Base_WarfareBHeavyFactory") then {
	if(_preview distance _builded_bunker < 25) then {_color = _colorRed};};






 if ((typeOf _preview) iskindOf "Base_WarfareBAircraftFactory") then {
        Private ["_town","_townside","_eArea"];
		
		
		
        _town = [_preview] Call cti_CO_FNC_GetClosestLocation;
        _townside =  (_town getVariable "sideID") Call cti_CO_FNC_GetSideFromID;
        _eArea = [_preview,((_eside) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity3;
        if!(isNil "_townside")then{
            if ((_preview distance _town < 600 && _townside != cti_Client_SideJoined) || !isNull _eArea
			||_preview distance _town < 30) then {
                _color = _colorRed;
                 hintSilent parseText "<t color='#fb0808'> You have entered a restricted area ! Impossible to build here! </t>";
            };
        };
    };

if ((typeOf _preview) iskindOf "Base_WarfareBAircraftFactory") then {
	if(_preview distance _builded_bunker < 25) then {_color = _colorRed};};



 if ((typeOf _preview) iskindOf "Base_WarfareBUAVterminal") then {
        Private ["_town","_townside","_eArea"];
		
		
        _town = [_preview] Call cti_CO_FNC_GetClosestLocation;
        _townside =  (_town getVariable "sideID") Call cti_CO_FNC_GetSideFromID;
        _eArea = [_preview,((_eside) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity3;
        if!(isNil "_townside")then{
            if ((_preview distance _town < 600 && _townside != cti_Client_SideJoined) || !isNull _eArea
			||_preview distance _town < 30) then {
                _color = _colorRed;
                 hintSilent parseText "<t color='#fb0808'> You have entered a restricted area ! Impossible to build here! </t>";
            };
        };
    };
	
if ((typeOf _preview) iskindOf "Base_WarfareBUAVterminal") then {
	if(_preview distance _builded_bunker < 25) then {_color = _colorRed};};
	

 if ((typeOf _preview) iskindOf "Base_WarfareBVehicleServicePoint") then {
        Private ["_town","_townside","_eArea"];
		
		
		
        _town = [_preview] Call cti_CO_FNC_GetClosestLocation;
        _townside =  (_town getVariable "sideID") Call cti_CO_FNC_GetSideFromID;
        _eArea = [_preview,((_eside) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity3;
        if!(isNil "_townside")then{
            if ((_preview distance _town < 600 && _townside != cti_Client_SideJoined) || !isNull _eArea
			||_preview distance _town < 30) then {
                _color = _colorRed;
                 hintSilent parseText "<t color='#fb0808'> You have entered a restricted area ! Impossible to build here! </t>";
            };
        };
    };
if ((typeOf _preview) iskindOf "Base_WarfareBVehicleServicePoint") then {
	if(_preview distance _builded_bunker < 25) then {_color = _colorRed};};




 if ((typeOf _preview) iskindOf "BASE_WarfareBAntiAirRadar") then {
        Private ["_town","_townside","_eArea"];
		
		
		
        _town = [_preview] Call cti_CO_FNC_GetClosestLocation;
        _townside =  (_town getVariable "sideID") Call cti_CO_FNC_GetSideFromID;
        _eArea = [_preview,((_eside) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity3;
        if!(isNil "_townside")then{
            if ((_preview distance _town < 600 && _townside != cti_Client_SideJoined) || !isNull _eArea
			||_preview distance _town < 30) then {
                _color = _colorRed;
                 hintSilent parseText "<t color='#fb0808'> You have entered a restricted area ! Impossible to build here! </t>";
            };
        };
    };

if ((typeOf _preview) iskindOf "BASE_WarfareBAntiAirRadar") then {
	if(_preview distance _builded_bunker < 25) then {_color = _colorRed};};



if (typeOf _preview =="M2StaticMGPreview") then { _color = _colorGreen; };
   if ((typeOf _preview) isKindOf "StaticWeapon") then { _color = _colorGreen; };






    if( !((typeOf _preview) iskindOf "Warfare_HQ_base_unfolded"))then{
        _current_side  = side commanderTeam;
        _opposite_side = east;

        if(_current_side == west)then{
            _opposite_side = east;
        } else{
            _opposite_side = west;
        };

        _detected = (_area nearEntities [["Man","Car","Motorcycle","Tank","Air","Ship"], missionNamespace getVariable "cti_C_BASE_AREA_RANGE"]) unitsBelowHeight 20;
        {
            if(_itemcategory !=0 && side _x == _opposite_side)exitwith{
                _color = _colorRed;
                hintSilent parseText "<t color='#fb0808'> Enemies are detected near your base! </t>";
            };

        }foreach _detected;
    };
	
	
	
	
	
	
	

    _color
}];

_coin setVariable ["BIS_COIN_areasize", _area];
_coin setVariable ["BIS_COIN_fundsDescription",["$"]];
if (_extra == "") then {
	_coin setVariable ["BIS_COIN_funds",[(cti_Client_SideJoined) Call cti_CO_FNC_GetSideSupply, Call cti_CL_FNC_GetPlayerFunds]];
	_coin setVariable ["BIS_COIN_fundsDescription",["S ","$ "]];
};

_defenses = [];
_defenseCosts = [];
_defenseDescriptions = [];
_defenseCategories = [];

_structures = [(missionNamespace getVariable Format["cti_%1STRUCTURENAMES",cti_Client_SideJoinedText]) select 0];
_structureCosts = [(missionNamespace getVariable Format["cti_%1STRUCTURECOSTS",cti_Client_SideJoinedText]) select 0];
_structureDescriptions = [(missionNamespace getVariable Format["cti_%1STRUCTUREDESCRIPTIONS",cti_Client_SideJoinedText]) select 0];

_i = 0;

_updateStructures = false;
_updateDefenses = false;
_emptyStructures = false;

if (_isHQdeployed && _extra == "") then {_i = 1;_updateStructures = true; _updateDefenses = true};
if (_extra == "REPAIR") then {_updateDefenses = true; _emptyStructures = true;_coin setVariable ["BIS_COIN_funds",Call cti_CL_FNC_GetPlayerFunds]};

if (_updateStructures) then {
	_structures = missionNamespace getVariable Format["cti_%1STRUCTURENAMES",cti_Client_SideJoinedText];
	_structureCosts = missionNamespace getVariable Format["cti_%1STRUCTURECOSTS",cti_Client_SideJoinedText];
	_structureDescriptions = missionNamespace getVariable Format["cti_%1STRUCTUREDESCRIPTIONS",cti_Client_SideJoinedText];
};

if (_updateDefenses) then {
	_defenses = missionNamespace getVariable Format["cti_%1DEFENSENAMES",cti_Client_SideJoinedText];
	{
		_d = missionNamespace getVariable _x;
		if !(isNil '_d') then {
			_defenseCosts pushBack (_d select QUERYUNITPRICE);
			_defenseDescriptions pushBack ((_d select QUERYUNITLABEL));
			_defenseCategories pushBack ((_d select QUERYUNITFACTORY));
		};
	} forEach _defenses;
};

if (_emptyStructures) then {
	_structures = [];
	_structureCosts = [];
	_structureDescriptions = [];
};

_indexCategory=0;
_coinCategories = [];
_coinItemArray = [];
if (count _structures > 0) then {_coinCategories = _coinCategories + [localize "strwfbase"];_indexCategory =_indexCategory +1;};
if (count _defenses > 0) then {
    if (_extra == "REPAIR") then {_coinCategories = []};
    _coinCategories pushBack (localize "STR_WF_Defense40er");
   
   
    _coinCategories pushBack (localize "STR_WF_Fortification");
    _coinCategories pushBack (localize "STR_WF_Strategic");
 
 _coinCategories pushBack (localize "STR_WF_Defense60er");
 _coinCategories pushBack (localize "STR_WF_Defense80er");
 _coinCategories pushBack (localize "STR_WF_Ammo");
 
 //need add a sellcontainer for backpackstatics,it wil be made invisible with hypotethic upgrade level in coin_interface.sqf
 _coinCategories pushBack "nowhere";
 
};

if (_isHQdeployed && _i == 1 && _extra == "") then {
    _coinItemArray pushBack ([_structures select 0,0,[0, _structureCosts select 0], (_structureDescriptions select 0) + " " +  localize "strwfhqmobilizeme"]);
};

for [{_i=_i}, {_i<count _structures}, {_i = _i+1}] do {
  _coinItemArray pushBack ([_structures select _i,0,[0, _structureCosts select _i], (_structureDescriptions select _i)]);
};

_fix = 1;
if (_extra == "REPAIR") then {_coinItemArray = [];_indexCategory=0;_fix = 0};

for '_i' from 0 to count(_defenses)-1 do {
	_curId = _indexCategory;
	
	switch (_defenseCategories select _i) do {
			
		case "Fortification": {_curId = _indexCategory + 1};
		case "Strategic": {_curId = _indexCategory + 2};
		case "Defense60": {_curId = _indexCategory + 3};
		case "Defense80": {_curId = _indexCategory + 4};
	
		
		case "Ammo": {_curId = _indexCategory + 5};
		//need add a sellcontainer for backpackstatics,it wil be made invisible with hypotethic upgrade level in coin_interface.sqf
		case "nowhere": {_curId = _indexCategory + 6};
	};
    _coinItemArray pushBack ([_defenses select _i,_curId,[_fix, _defenseCosts select _i], _defenseDescriptions select _i]);
};

_coin setVariable ["BIS_COIN_categories",_coinCategories]; 
_coin setVariable ["BIS_COIN_items",_coinItemArray];

//--- Logic ID
if (isnil "BIS_coin_lastID") then {BIS_coin_lastID = -1};
BIS_coin_lastID = BIS_coin_lastID + 1;
call compile format ["BIS_coin_%1 = _coin; _coin setvehiclevarname 'BIS_coin_%1';",BIS_coin_lastID];

_coin setVariable ["BIS_COIN_ID",BIS_coin_lastID];

//--- Temporary variables
_coin setVariable ["BIS_COIN_params",[]];