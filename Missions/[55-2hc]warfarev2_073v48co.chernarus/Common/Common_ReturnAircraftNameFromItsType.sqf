// Common_ReturnAircraftNameFromItsType.sqf

private ["_typeOfObject", "_aircraftName", "_aircraftNameString", "_validTypes"];
_typeOfObject = _this select 0; // Taking the first argument passed to the function

//["DEBUG (ReturnAircraftName1)", Format ["%1", _typeOfObject]] Call WFBE_CO_FNC_LogContent;

_validTypes = ["Su25_Ins", "Su25_TK_EP1", "Su39", "A10", "A10_US_EP1", "AH64D", "AH64D_EP1"];

_aircraftName = [_typeOfObject, 'displayName'] call GetConfigInfo;
_aircraftNameString = str(_aircraftName)

//["DEBUG (ReturnAircraftName2)", Format ["%1", _aircraftName]] Call WFBE_CO_FNC_LogContent;

if !(_typeOfObject in _validTypes) exitWith {_aircraftNameString};

//["DEBUG (ReturnAircraftName3)", Format ["after exitWith %1", _aircraftName]] Call WFBE_CO_FNC_LogContent;

switch (_typeOfObject) do {
    case "Su25_Ins": { _aircraftNameString = "Su-25A"; };
    case "Su25_TK_EP1": { _aircraftNameString = "Su-25T"; };
    case "Su39": { _aircraftNameString = "Su-39"; };
    case "A10": { _aircraftNameString = "A-10A"; };
    case "A10_US_EP1": { _aircraftNameString = "A-10C"; };
    case "AH64D": { _aircraftNameString = "AH-64D (TOW)"; };
    case "AH64D_EP1": { _aircraftNameString = "AH-64D (Hellfire)"; };
};

//["DEBUG (ReturnAircraftName4)", Format ["after switch, returning %1", _aircraftName]] Call WFBE_CO_FNC_LogContent;

_aircraftNameString