// Common_ReturnAircraftNameFromItsType.sqf

private ["_typeOfObject", "_aircraftName"];
_typeOfObject = _this select 0; // Taking the first argument passed to the function

// Define the array of valid types
private _validTypes = ["A10", "A10_US_EP1", "AH64D", "AH64D_EP1", "Su25_Ins", "Su25_TK_EP1", "Su39"];

_aircraftName = [_typeOfObject, 'displayName'] call GetConfigInfo;

// Check if the type is in the valid types array
if !(_typeOfObject in _validTypes) exitWith {_aircraftName};

switch (_typeOfObject) do {
    case "A10": { _aircraftName = "A-10A"; };
    case "A10_US_EP1": { _aircraftName = "A-10C"; };
    case "AH64D": { _aircraftName = "AH-64D (TOW)"; };
    case "AH64D_EP1": { _aircraftName = "AH-64D (Hellfire)"; };
    case "Su25_Ins": { _aircraftName = "Su-25A"; };
    case "Su25_TK_EP1": { _aircraftName = "Su-25T"; };
    case "Su39": { _aircraftName = "Su-39"; };
};

_aircraftName