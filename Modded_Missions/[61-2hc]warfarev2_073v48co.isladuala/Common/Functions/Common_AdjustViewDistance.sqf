/*
This script allows the player to adjust view distance with the custom action keys 19 and 20.

TODO: Adjustable by slider that how much the view distance will change per key press

Author: Miksuu
contributors : Marty.
*/
Private ["_key","_adjustViewDistanceBy","_newViewDistanceToBeSet"];
_key = _this select 1;

_adjustViewDistanceBy = 1000;

//--- Marty: Automatic view distance feature
if (_key in (actionKeys "User18")) then 
{
    _toggle_auto_distance_view = missionNamespace getVariable "TOOGLE_AUTO_DISTANCE_VIEW";
    //diag_log format[ "1. DEBUG _toggle_auto_distance_view = %1 | type = %2", _toggle_auto_distance_view, typeName _toggle_auto_distance_view ];
    if (_toggle_auto_distance_view) then 
    {
        missionNamespace setVariable ["TOOGLE_AUTO_DISTANCE_VIEW", false]; // deactivate the feature.
        "Automatic view distance is now OFF" call GroupChatMessage;
        playSound ["autoViewDistanceToggledOff",true];
    }else 
    {
        missionNamespace setVariable ["TOOGLE_AUTO_DISTANCE_VIEW", true]; // activate the feature.
        "Automatic view distance is now ON" call GroupChatMessage;
        playSound ["autoViewDistanceToggledOn",true];
    };
   
};
//Marty end.

//--- Decrease View Distance
if (_key in (actionKeys "User19")) then {
    //_adjustViewDistanceTimerScript = compile preprocessFile "Common\Functions\Common_AdjustViewDistanceTimerScript.sqf";

    if (newViewDistance == 0) then
    {
        _newViewDistanceToBeSet = viewDistance;
    } else {
        _newViewDistanceToBeSet = newViewDistance;
    };

    newViewDistance = _newViewDistanceToBeSet - _adjustViewDistanceBy max 1;
    (format ["Setting view distance to: %1", str(newViewDistance)]) call GroupChatMessage;
    execVm "Common\Functions\Common_AdjustViewDistanceTimerScript.sqf";
};

//--- Increase View Distance
if (_key in (actionKeys "User20")) then {
    //_adjustViewDistanceTimerScript = compile preprocessFile "Common\Functions\Common_AdjustViewDistanceTimerScript.sqf";

    if (newViewDistance == 0) then
    {
        _newViewDistanceToBeSet = viewDistance;
    } else {
        _newViewDistanceToBeSet = newViewDistance;
    };

    newViewDistance = _newViewDistanceToBeSet + _adjustViewDistanceBy min WFBE_C_ENVIRONMENT_MAX_VIEW;
    (format ["Setting view distance to: %1", str(newViewDistance)]) call GroupChatMessage;
    [] execVm "Common\Functions\Common_AdjustViewDistanceTimerScript.sqf";
};

false