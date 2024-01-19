/*
  # HEADER #
	Script: 		Client\Functions\Client_DisplayMessage.sqf
	Alias:			CTI_CL_FNC_DisplayMessage
	Description:	Display a localize message on the client
					Note that this command is often used by a PVF
	Author: 		0=1
	Creation Date:	19-09-2013
	Revision Date:	19-09-2013
	
  # PARAMETERS #
    0	[String]: The message to use
    1	[Dynamic]: The parameters linked to the message
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[MESSAGE] call CTI_CL_FNC_DisplayMessage
	[MESSAGE, PARAMETERS] call CTI_CL_FNC_DisplayMessage
	
  # DEPENDENCIES #
	Depends on the Message content
	
  # EXAMPLE #
    ["commander-disconnected"] call CTI_CL_FNC_DisplayMessage
	["town-capture", [_town, _value]] call CTI_CL_FNC_DisplayMessage;
	  -> Display some message on the client
	  
	[["CLIENT", West], "Client_OnMessageReceived", ["commander-disconnected"]] call CTI_CO_FNC_NetSend;
	  -> Display a message for the west side, the "Client_OnMessageReceived" will call this function
	[["CLIENT", West], "Client_OnMessageReceived", ["structure-preplaced", [_this select 0, _position]]] call CTI_CO_FNC_NetSend;
	  -> Display a parameterized message for the west side, the "Client_OnMessageReceived" will call this function
*/


//cti_CO_FNC_init_ECM = Compile preprocessFileLineNumbers "Functions\Init_ECMobject.sqf";

ECM_SYNC_AREA_UNITS=[];
ECM_SYNC_AREA_VEHICLES=[];
OUTSIDE_SYNC_ECM_AREA_VEHICLES=[];

cti_CO_FNC_HandleIncomingMissileECM = Compile preprocessFileLineNumbers "Common\Module\ECM\Functions\Common_HandleIncomingMissileECM.sqf";
cti_CO_FNC_HandleIncomingMissile = Compile preprocessFileLineNumbers "Common\Module\ECM\Functions\Common_HandleIncomingMissile.sqf";
cti_CO_FNC_HandleDamage_Object = Compile preprocessFileLineNumbers "Common\Module\ECM\Functions\Common_HandleDamageObject.sqf";

cti_CO_MDL_ECM_FNC_preInitECM_Object = Compile preprocessFileLineNumbers "Functions\Common_preInit_ECMObject.sqf";


/* EDITOR INIT

_objects=[0,0,0] nearObjects ["Land_Device_slingloadable_F", 30000];
{

//create ID name
_varname= str _x;
_OBJECTid=_varname+"id";

_OBJECTid_damage=_OBJECTid+"damage";
private _CHECKVALUE= missionNamespace getVariable _OBJECTid_damage;
if (isNil "_CHECKVALUE") then {
_x addEventHandler ['HitPart', {_this Spawn cti_CO_FNC_HandleDamage_Object}];

_CHECKVALUE=[0,_OBJECTid_damage];
missionNamespace setVariable [_OBJECTid_damage, _CHECKVALUE];
systemChat "check";
};
_x addAction ["ECM-SWITCH","Functions\Init_ECMobject.sqf","",95,true,true,"","(((_this distance _originalTarget)<5))",5,true,"",""];

}forEach _objects;

*/


