/*
	Triggered whenever the player die
	 Parameters:
		- Killed
*/

Private ["_body"];

_body = _this select 0;

//--- EH are flushed on unit death, still, just make sure.
player removeEventHandler ["killed", cti_PLAYERKEH];

cti_Client_IsRespawning = true;

{player removeAction _x} forEach [0,1,2,3,4,5];
if !(isNil "HQAction") then {player removeAction HQAction};
player removeAction Options;

//--- Close any existing dialogs.
if (dialog) then {closeDialog 0};

if(!cti_GameOver) then
{
	cti_DeathLocation = getPos _body;

	//--- Fade transition.
	titleCut["","BLACK OUT",1];
	waitUntil {alive player};

	//--- Update the player.
	["update-teamleader", cti_Client_Team, player] remoteExecCall ["cti_SE_PVF_RequestSpecial",2];
	//--- Make sure that player is always the leader (of his group).
	if (group player == cti_Client_Team) then {
		if (leader(group player) != player) then {(group player) selectLeader player};
	};

	titleCut["","BLACK IN",1];

	//--- Re-add the KEH to the client.
	cti_PLAYERKEH = player addEventHandler ['Killed', {[_this select 0,_this select 1] Spawn cti_CL_FNC_OnKilled; [_this select 0,_this select 1, sideID] Spawn cti_CO_FNC_OnUnitKilled}];

	//--- Call the pre respawn routine.
	(player) Call cti_CL_FNC_PreRespawnHandler;

	//--- Camera & PP thread
	[] Spawn {
		Private ["_delay"];
		_delay = missionNamespace getVariable "cti_C_RESPAWN_DELAY";

		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [1];
		"dynamicBlur" ppEffectCommit _delay/3;  
		"colorCorrections" ppEffectAdjust [1, 1, 0, [0.1, 0.0, 0.0, 1], [1.0, 0.5, 0.5, 0.1], [0.199, 0.587, 0.114, 0.0]];
		"colorCorrections" ppEffectCommit 0.1;
		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectAdjust [1, 1, 0, [0.1, 0.0, 0.0, 0.5], [1.0, 0.5, 0.5, 0.1], [0.199, 0.587, 0.114, 0.0]];
		"colorCorrections" ppEffectCommit _delay/3;

		cti_DeathCamera = "camera" camCreate cti_DeathLocation;
		//cti_DeathCamera camSetDir 0;
		cti_DeathCamera camSetFov 0.7;
		cti_DeathCamera cameraEffect["Internal","TOP"];

		cti_DeathCamera camSetTarget cti_DeathLocation;
		cti_DeathCamera camSetPos [cti_DeathLocation select 0,(cti_DeathLocation select 1) + 2,5];
		cti_DeathCamera camCommit 0;

		waitUntil {camCommitted cti_DeathCamera};

		cti_DeathCamera camSetPos [cti_DeathLocation select 0,(cti_DeathLocation select 1) + 2,30];
		cti_DeathCamera camCommit _delay+2;
	};

	sleep random 1;

	//--- Create a respawn menu.
	createDialog "cti_RespawnMenu";
};