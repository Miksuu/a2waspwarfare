/* 
	Author: Marty, Miksuu
	Name: ICBM_friendlySide_Message.sqf
	Parameters:
	  0 - _side : 	side object - side who must receive the message. Can be east or west
	Description:
	    Play a text and audio message destined to the players who launched the ICBM order = friendly side.
		IMPORTANT : BE AWARE THAT YOU HAVE TO RESTART ARMA2OA TO TAKE SOUND INTO ACCOUNT IF YOU ADD A NEW SOUND (thats what i experienced is not related to the function but to bohemian) 
*/

// Miksuu: Should probably make the variables private here

_side = _this select 0;

//_time_before_ICBM_impact 			= missionNamespace getVariable "WFBE_ICBM_TIME_TO_IMPACT"; // Miksuu: Moved to the eventHandler message
_friendly_Message_Text              = "STR_WF_CHAT_ICBM_Launch_BY_OUR_TEAM";  // Miksuu: Removed localize from here to avoid showing the sender's localized message
//_friendly_Message_Text			= format[_friendly_Message_Text, _time_before_ICBM_impact]; // Miksuu: Removed, formatting will be done the EventHandler
_friendly_Message_SoundName         = "ICBM_message_to_friendly_players";
//_friendly_side_who_receive_message  = _side; // Miksuu: removed useless variable, replaced with _side on the WF_sendMessage call

// We use the magic function WF_sendMessage to broadcast text and audio to the corresponding side :
[_friendly_Message_Text, _friendly_Message_SoundName, _side] call WF_sendMessage ;