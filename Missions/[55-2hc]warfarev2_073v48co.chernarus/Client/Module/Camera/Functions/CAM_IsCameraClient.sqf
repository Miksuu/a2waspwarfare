private ["_isCamera"];

_isCamera = false;

if (side player == civilian && hasInterface) then {
    _isCamera = true;
};

diag_log format ["CAMERA: Is camera client: %1", _isCamera];

_isCamera
