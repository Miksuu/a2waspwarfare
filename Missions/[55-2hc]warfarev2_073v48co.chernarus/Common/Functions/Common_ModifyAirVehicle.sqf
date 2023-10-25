Private ["_lock","_position","_side","_type","_vehicle"];
_vehicle = _this select 0;
_type = typeof _vehicle;

["DEBUG (Common_ModifyAirVehicle1)", Format ["%1 | %2", _vehicle, _type]] Call WFBE_CO_FNC_LogContent;

switch (_type) do {

//LoadoutManagerInsertChanges
case "Su34":{
    _rearmor = {
        _ammo = _this select 4;
        _result = 0;
        switch (_ammo) do {
            case "M_R73_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            case "M_Sidewinder_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            default {_result = _this select 2; };
        };
        _result
    };
    _vehicle addeventhandler ["HandleDamage", format["_this Call %1", _rearmor]];
};

case "Su25_Ins":{
    _rearmor = {
        _ammo = _this select 4;
        _result = 0;
        switch (_ammo) do {
            case "M_R73_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            case "M_Sidewinder_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            default {_result = _this select 2; };
        };
        _result
    };
    _vehicle addeventhandler ["HandleDamage", format["_this Call %1", _rearmor]];
};

case "Su25_TK_EP1":{
    _rearmor = {
        _ammo = _this select 4;
        _result = 0;
        switch (_ammo) do {
            case "M_R73_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            case "M_Sidewinder_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            default {_result = _this select 2; };
        };
        _result
    };
    _vehicle addeventhandler ["HandleDamage", format["_this Call %1", _rearmor]];
};

case "Su39":{
    _rearmor = {
        _ammo = _this select 4;
        _result = 0;
        switch (_ammo) do {
            case "M_R73_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            case "M_Sidewinder_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            default {_result = _this select 2; };
        };
        _result
    };
    _vehicle addeventhandler ["HandleDamage", format["_this Call %1", _rearmor]];
};

case "L39_TK_EP1":{
    _rearmor = {
        _ammo = _this select 4;
        _result = 0;
        switch (_ammo) do {
            case "M_R73_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            case "M_Sidewinder_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            default {_result = _this select 2; };
        };
        _result
    };
    _vehicle addeventhandler ["HandleDamage", format["_this Call %1", _rearmor]];
};

case "F35B":{
    _rearmor = {
        _ammo = _this select 4;
        _result = 0;
        switch (_ammo) do {
            case "M_R73_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            case "M_Sidewinder_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            default {_result = _this select 2; };
        };
        _result
    };
    _vehicle addeventhandler ["HandleDamage", format["_this Call %1", _rearmor]];
};

case "L159_ACR":{
    _rearmor = {
        _ammo = _this select 4;
        _result = 0;
        switch (_ammo) do {
            case "M_R73_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            case "M_Sidewinder_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            default {_result = _this select 2; };
        };
        _result
    };
    _vehicle addeventhandler ["HandleDamage", format["_this Call %1", _rearmor]];
};

case "A10":{
    ["DEBUG (Common_ModifyAirVehicle A10_1)", Format ["%1 | %2", _vehicle, _type]] Call WFBE_CO_FNC_LogContent;
    _rearmor = {
        _ammo = _this select 4;
        _result = 0;
        ["DEBUG (Common_ModifyAirVehicle A10_2)", Format ["%1 | %2", _ammo, _type]] Call WFBE_CO_FNC_LogContent;

        switch (_ammo) do {
            case "M_R73_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            case "M_Sidewinder_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p);
            ["DEBUG (Common_ModifyAirVehicle A10_3)", Format ["%1 | %2", _dam, _result]] Call WFBE_CO_FNC_LogContent;
             };
            default {_result = _this select 2; ["DEBUG (Common_ModifyAirVehicle A10_default)", Format ["%1 | %2", _dam, _result]] Call WFBE_CO_FNC_LogContent; };
        };

        ["DEBUG (Common_ModifyAirVehicle A10_4)", Format ["%1", _result]] Call WFBE_CO_FNC_LogContent;
        _result
    };

    ["DEBUG (Common_ModifyAirVehicle A10_5)", Format ["%1", _result]] Call WFBE_CO_FNC_LogContent;
    _vehicle addeventhandler ["HandleDamage", format["_this Call %1", _rearmor]];
};

case "A10_US_EP1":{
    _rearmor = {
        _ammo = _this select 4;
        _result = 0;
        switch (_ammo) do {
            case "M_R73_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            case "M_Sidewinder_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            default {_result = _this select 2; };
        };
        _result
    };
    _vehicle addeventhandler ["HandleDamage", format["_this Call %1", _rearmor]];
};

case "AV8B":{
    _rearmor = {
        _ammo = _this select 4;
        _result = 0;
        switch (_ammo) do {
            case "M_R73_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            case "M_Sidewinder_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            default {_result = _this select 2; };
        };
        _result
    };
    _vehicle addeventhandler ["HandleDamage", format["_this Call %1", _rearmor]];
};

case "AV8B2":{
    _rearmor = {
        _ammo = _this select 4;
        _result = 0;
        switch (_ammo) do {
            case "M_R73_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            case "M_Sidewinder_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            default {_result = _this select 2; };
        };
        _result
    };
    _vehicle addeventhandler ["HandleDamage", format["_this Call %1", _rearmor]];
};

case "An2_TK_EP1":{
    _rearmor = {
        _ammo = _this select 4;
        _result = 0;
        switch (_ammo) do {
            case "M_R73_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            case "M_Sidewinder_AA": {_dam = _this select 2; _p = 99; _result = (_dam / 100) * (100 - _p); };
            default {_result = _this select 2; };
        };
        _result
    };
    _vehicle addeventhandler ["HandleDamage", format["_this Call %1", _rearmor]];
};
//LoadoutManagerInsertChanges_END

	default{
            ["DEBUG (Common_ModifyAirVehicle default)", Format ["%1 | %2", _vehicle, _type]] Call WFBE_CO_FNC_LogContent;
			_rearmor = {
   				_ammo = _this select 4;
   				_result = 0;

   				switch (_ammo) do {
     				default {_result = _this select 2;};
    			};
   				_result
  			};
			_vehicle addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];
	};
};
processinitcommands;

["DEBUG (Common_ModifyAirVehicle2)", Format ["returning vehicle %1 | %2", _vehicle, _type]] Call WFBE_CO_FNC_LogContent;

_vehicle