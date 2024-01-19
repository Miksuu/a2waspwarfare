/*
	A camp has been captured by a unit or repaired.
	 Parameters:
		- Camp.
		- New Side.
		- Old Side.
		- {Is repaired}.
*/

Private ["_camps","_is_repair","_side","_side_new","_sideID_new","_sideID_old","_town"];

_camp = _this select 0;
_sideID_new = _this select 1;
_sideID_old = _this select 2;
_is_repair = if (count _this > 3) then {_this select 3} else {false};

_town = _camp getVariable "town";

//--- Does the new side match the client side?
if (cti_Client_SideID == _sideID_new) then {
	//--- The client side has captured a camp.
	(_camp getVariable "cti_camp_marker") setMarkerColorLocal cti_Client_Color;

	//--- Skip the reset upon repair.
	if (_is_repair) exitWith {};

	//--- Attempt to award the client if his orders were to take a town.
	// if ((cti_Client_Team getVariable "cti_task_order") == "towns") then {
		//--- Ensure that the destination is the camp's town.
		// if ((cti_Client_Team getVariable "cti_task_position") == _town) then {
			Private ["_closest"];
			//--- Get the closest unit from the player group near the camp.
			_closest = [_camp, units group player] Call cti_CO_FNC_GetClosestEntity;

			//--- If the closest unit is in range, then award the player's group.
			if (_closest distance _camp < (missionNamespace getVariable "cti_C_CAMPS_RANGE")) then {
				hint parseText Format["<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Information:</t><br /><br /><t>Your squad has captured a camp near <t color='#B6F563'>%1</t> and has been rewarded with <t color='#EAD267'>$%2.</t></t>",_town getVariable "name",missionNamespace getVariable "cti_C_CAMPS_CAPTURE_BOUNTY"];
				[player,score player + (missionNamespace getVariable 'cti_C_PLAYERS_SCORE_CAPTURE_CAMP')] remoteExecCall ["cti_SE_PVF_RequestChangeScore",2];
				
				(missionNamespace getVariable "cti_C_CAMPS_CAPTURE_BOUNTY") Call cti_CL_FNC_ChangePlayerFunds;
				["INFORMATION", Format ["Player %1 has captured camp in town: %2).", name player, _town getVariable "name"]] Call cti_CO_FNC_LogContent;
			};
		// };
	// };
} else {
	//--- Did the client side lost a known camp?
	if (cti_Client_SideID in [(_town getVariable "sideID"), _sideID_old]) then {
		(_camp getVariable "cti_camp_marker") setMarkerColorLocal (missionNamespace getVariable Format ["cti_C_%1_COLOR",(_sideID_new) Call cti_CO_FNC_GetSideFromID]);
	};
};