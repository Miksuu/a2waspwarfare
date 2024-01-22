Private["_assist","_bounty","_get","_name","_type"];

_type = _this select 0;
_assist = _this select 1;
_ai = if (count _this > 2) then {_this select 2} else {objNull};

_get = missionNamespace getVariable _type;

_name = _get select QUERYUNITLABEL;


_bounty = switch  (true) do {
                    case (_type isKindOf "Man"): {round((_get select QUERYUNITPRICE) *0.7* (missionNamespace getVariable "cti_C_UNITS_BOUNTY_COEF"));};

					case (_type isKindOf "Car"): {round((_get select QUERYUNITPRICE) *0.45* (missionNamespace getVariable "cti_C_UNITS_BOUNTY_COEF"));};

					case (_type isKindOf "Ship"): {round((_get select QUERYUNITPRICE) *0.4* (missionNamespace getVariable "cti_C_UNITS_BOUNTY_COEF"));};

					case (_type isKindOf "Motorcycle"): {round((_get select QUERYUNITPRICE) *0.7* (missionNamespace getVariable "cti_C_UNITS_BOUNTY_COEF"));};

					case (_type isKindOf "Tank"): {round((_get select QUERYUNITPRICE) *0.4* (missionNamespace getVariable "cti_C_UNITS_BOUNTY_COEF"));};

					case (_type isKindOf "Helicopter"): {round((_get select QUERYUNITPRICE) *0.4*(missionNamespace getVariable "cti_C_UNITS_BOUNTY_COEF"));};

					case (_type isKindOf "Plane"): {round((_get select QUERYUNITPRICE) *0.35* (missionNamespace getVariable "cti_C_UNITS_BOUNTY_COEF"));};

					case (_type isKindOf "StaticWeapon"): {round((_get select QUERYUNITPRICE)*0.5*(missionNamespace getVariable "cti_C_UNITS_BOUNTY_COEF"));};

					case (_type isKindOf "WarfareBBaseStructure"): {2000;};
                   
				    case (_type isKindOf "building"): {round((_get select QUERYUNITPRICE)*0.55*(missionNamespace getVariable "cti_C_UNITS_BOUNTY_COEF"));};

};

//--- Are we dealing with a kill assist or a full kill.
if (_assist) then {
	_bounty = _bounty * (missionNamespace getVariable "cti_C_UNITS_BOUNTY_ASSISTANCE_COEF");
	Format[Localize "STR_WF_CHAT_Award_Bounty_Assist", _bounty, _name] Call cti_CL_FNC_GroupChatMessage;
} else {
	Format[Localize "STR_WF_CHAT_Award_Bounty", _bounty, _name] Call cti_CL_FNC_GroupChatMessage;
};

(_bounty) Call cti_CL_FNC_ChangePlayerFunds;