/* 
	Author: Marty, Miksuu
	Name: Client_onEventHandler_SEND_MESSAGE.sqf
	Parameters:
	Parameters are given by the EH "SEND_MESSAGE" addPublicVariableEventHandler
	0 - string - correspond to the name of the public variable braodcasted, here it is "SEND_MESSAGE"
	1 - _SEND_MESSAGE_infos : array containing all the value given by the addPublicVariableEventHandler, here it the infos about the message to be send.

	Description: This function is meant to create a message only visible and heard for a specific side (west or east).
	    
*/

// Miksuu: Should probably make the variables private here

_SEND_MESSAGE_infos = _this select 1; // select 1 not 0 to get the value !

// Extract the value from the array to get specific infos for the message creation :
_messageText				= _SEND_MESSAGE_infos select 0;
_messageSoundName			= _SEND_MESSAGE_infos select 1;
_side_who_receive_message	= _SEND_MESSAGE_infos select 2;

if (playerSide == _side_who_receive_message) then 
{
    // Miksuu: Create the localization on the client that receives it, not the sender for the ICBM messages
    // Arty message is not changed now, needs a bit more refactoring for that, such as changing the _messageText variable.
    if (_messageText == "STR_WF_CHAT_ICBM_Launch_BY_OUR_TEAM" || _messageText == "STR_WF_CHAT_ICBM_Launch_BY_ENEMY_TEAM") then {
        private["_localizedMessage","_timeBeforeImpact"];
        _timeBeforeImpact = missionNamespace getVariable "WFBE_ICBM_TIME_TO_IMPACT";
        _localizedMessage = localize _messageText;
        _messageText = format[_messageText, _timeBeforeImpact];

    	systemChat _messageText;
    	playSound _messageSoundName;
    }else {
    	// Send a text and audio message to all clients who are supposed to receive it.
    	systemChat _messageText;
    	playSound _messageSoundName;
    };
};


