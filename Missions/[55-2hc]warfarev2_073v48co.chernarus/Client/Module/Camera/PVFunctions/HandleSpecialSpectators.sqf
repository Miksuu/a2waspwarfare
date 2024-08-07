Private['_args', '_request'];

_request = _this select 0;
_args = +_this;
_args set [0, "**NIL**"];
_args = _args - ["**NIL**"]; //--- Strip the action request from the arguments.

diag_log format["[WFBE_CAM_HandleSpecialSpectators] _request: %1, _args: %2", _request, _args];

switch (_request) do {
    case "cam_new-commander-assigned": {
        diag_log format["[WFBE_CAM_HandleSpecialSpectators] Spawning WFBE_CAM_FNC_Commander_Assigned with args: %1", _args];
        _args spawn WFBE_CAM_FNC_Commander_Assigned
    };
    default {
        diag_log format["[WFBE_CAM_HandleSpecialSpectators] Unknown request: %1", _request];
    };
};

diag_log "[WFBE_CAM_HandleSpecialSpectators] Finished processing request";