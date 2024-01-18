/*
  # HEADER #
	Script: 		Common\Module\ECM\Functions\Common_preInit_ECMobject.sqf
	Alias:			cti_CO_MDL_ECM_FNC_preInitECM_Object
	Description:	Attach the ECM Module to object
					Note that this command is often used by a PVF
	Author: 		0=1
	Creation Date:	04-03-2023
	Revision Date:	04-03-2023
	
  # PARAMETERS #
    0	[Object]: The ECM vehicle or every other object
    
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	_this call cti_CO_MDL_ECM_FNC_preInitECM_Object
	
	
  # DEPENDENCIES #
	Depends an object to attach functions
	
  # EXAMPLE #
    _this call cti_CO_MDL_ECM_FNC_preInitECM_Object
	
	  -> _this object will be an ECM-object
	  
	
*/
//___________________________________________________________________________________________________________________________

_ECMobject=_this#0;


//create ID name
_varname= str _ECMobject;
_OBJECTid=_varname+"id";
systemChat "check0";

_OBJECTid_damage=_OBJECTid+"damage";
private _CHECKVALUE= missionNamespace getVariable _OBJECTid_damage;
if (isNil "_CHECKVALUE") then {
_ECMobject addEventHandler ['HitPart', {_this Spawn cti_CO_FNC_HandleDamage_Object}];

_CHECKVALUE=[0,_OBJECTid_damage];
missionNamespace setVariable [_OBJECTid_damage, _CHECKVALUE];
systemChat "check";
};
_ECMobject addAction ["ECM-SWITCH","Functions\Init_ECMobject.sqf","",95,true,true,"","(((_this distance _originalTarget)<5))",5,true,"",""];




/*
{

//create ID name
_varname= str _x;
_OBJECTid=_varname+"id";
systemChat "check0";

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