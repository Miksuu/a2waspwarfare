/* 
	Author: Marty, Miksuu
	Name: ICBM_Message.sqf
	Parameters:
	  0 - _side : 	side object - side who must receive the message. Can be east or west
	Description:
	    Play a text and audio message destined to the players who will get nuked = enemy side.
*/

// Miksuu: Should probably make the variables private here

_side = _this select 0 ;

//_time_before_ICBM_impact 			= missionNamespace getVariable "WFBE_ICBM_TIME_TO_IMPACT"; // Miksuu: Moved to the eventHandler message
_enemy_Message_Text 				= "STR_WF_CHAT_ICBM_Launch_BY_ENEMY_TEAM";  // Miksuu: Removed localize from here to avoid showing the sender's localized message
//_enemy_Message_Text 				= format[_enemy_Message_Text, _time_before_ICBM_impact]; // Miksuu: Removed, formatting will be done the EventHandler
_enemy_Message_SoundName			= "ICBM_message_to_enemy_players";

// We use the magic function WF_sendMessage to broadcast text and audio to the corresponding side :
[_enemy_Message_Text, _enemy_Message_SoundName, _side ] call WF_sendMessage ;
