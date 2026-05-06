/*
	Creator : Marty. 
	Function that handles the missile glitch restriction to avoid exploit when players shoot guided missiles while using terrain masking.
	
*/

Private [
	"_unit_who_shot",
	"_weapon",
	"_ammo",
	"_magazine",
	"_projectile",
	"_vehicle",
	"_unit_targeted",
	"_limit_distance",
	"_distance_target_player",
	"_fromPos",
	"_targetPos",
	"_terrainMasked",
	"_restrictedAmmos",
	"_toleranceAboveGround"
];

_unit_who_shot = _this select 0; 	// Unit or vehicle that fired.
_weapon        = _this select 1; 	// Weapon used.
_ammo          = _this select 4;	// Ammo class.
_magazine      = _this select 5;	// Magazine class.
_projectile    = _this select 6;	// Projectile object.

// Marty:
// Only monitor the local player.
// Depending on where the Fired eventHandler is attached, _unit_who_shot can be either the player unit or the vehicle itself, so we check both cases.
_vehicle = vehicle player;

if (_vehicle == player) exitWith {}; // Infantry is not concerned by this restriction.
if !(player in crew _vehicle) exitWith {};
if !(_unit_who_shot == player || _unit_who_shot == _vehicle) exitWith {};

//systemChat format ["_unit_who_shot : %1 ", _unit_who_shot];
//systemChat format ["_weapon : %1 ", _weapon];

// Marty:
// Restrict only guided missiles / rockets concerned by terrain masking.
// Add or remove ammo classes here depending on the vehicles and weapons to monitor.
_restrictedAmmos = [
	"M_AT5_AT",
	"M_AT6_AT",
	"M_AT9_AT",
	"M_AT10_AT",
	"M_AT11_AT",
	"M_AT13_AT",
	"M_AT2_AT",
	"M_AT3_AT",
	"M_AT4_AT",
	"M_AT7_AT",
	"M_AT_Sagger_AT",
	"M_Hellfire_AT",
	"M_TOW_AT",
	"M_TOW2_AT",
	"M_Javelin_AT",
	"M_Metis_AT",
	"M_Vikhr_AT"
];

if !(_ammo in _restrictedAmmos) exitWith {};

// Marty:
// cursorTarget is local to the player and allows us to retrieve the currently aimed / locked target.
_unit_targeted = cursorTarget;
if (isNull _unit_targeted) exitWith {}; // if there is no lock on target, we quit.

// Only vehicles are relevant targets here.
if !(_unit_targeted isKindOf "LandVehicle" || _unit_targeted isKindOf "Air") exitWith {};

/*
_limit_distance = missionNamespace getVariable "WFBE_C_GAMEPLAY_MISSILE_TERRAIN_MASKING_DISTANCE";
_distance_target_player = player distance _unit_targeted;

// Marty:
// Restriction only applies under the configured distance.
// Example: 3500 meters.
if (_distance_target_player > _limit_distance) exitWith {};

systemChat format ["point passage 3"];
*/

// Marty:
// Check if terrain blocks the line between the firing vehicle and the target.
// Slight vertical offsets are added to avoid detecting tiny ground contact near the vehicle or target.
// It add a small vertical tolerance to avoid false terrain masking detection.
_toleranceAboveGround = 2.5; // tolerance in meters is added above ground corresponding to visual sight hight of a tank
_fromPos = getPosASL _vehicle;
_fromPos set [2, (_fromPos select 2) + _toleranceAboveGround]; // tolerance only on the z axis (= altitude), in meters.

_targetPos = getPosASL _unit_targeted;
_targetPos set [2, (_targetPos select 2) + _toleranceAboveGround];

_terrainMasked = terrainIntersectASL [_fromPos, _targetPos];
systemChat format ["_terrainMasked : %1 ", _terrainMasked];

if !(_terrainMasked) exitWith {};

// If we reach this point, the player fired a restricted missile while masked by terrain.
deleteVehicle _projectile;

hint localize "STR_WF_MESSAGE_MissileTerrainMaskingRestriction";
