//// Functions
//// Get all Unit Equipment
//// DeraKOren
///////////////////////////

	// _this: unit object

private["_Unit", "_Equpment", "_Prime", "_Second", "_HandGun", "_Uniform", "_Vest", "_BackPack", "_Helmet", "_Goggles", "_BasicItem", "_NVG", "_Binoc"];

_Unit		= _this;

_Prime		= ["", ["","","",""], []];		// [Rifle, [muzzle, laser, optics, bipod], [magazine]]
_Second		= ["", ["","",""], []];		// [RPG, [muzzle, laser, optics], [magazine]]
_HandGun	= ["", ["","",""], []];		// [Pistol, [muzzle, laser, optics], [magazine]]

_Uniform	= ["", [], 0];				// [Uniform, items, sumLoad]
_Vest		= ["", [], 0];				// [Vest, items, sumLoad]
_BackPack	= ["", [], 0];				// [BackPack, items, sumLoad]

_Helmet		= [""];						// H_HelmetB
_NVG		= [""];
_Binoc		= [""];
_Goggles	= [""];						// "G_Tactical_Clear"
_BasicItem	= [""]; 					// ["ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","NVGoggles","Binocular"]	config.bin/CfgWeapons/ItemCore

//////////////////////////
//// Fill Equipment Array
//////////////////////////

private["_Rifle", "_RPG", "_Pistol", "_UniformA", "_VestA", "_BackPackA"];

//// Add Primary Weapon (Rifle) in Array, if exist
_Rifle = primaryWeapon _Unit;
if (_Rifle != "") then {_Prime = [_Rifle, primaryWeaponItems _Unit, primaryWeaponMagazine _Unit]};

//// Add Secondary Weapon (RPG) in Array, if exist
_RPG = secondaryWeapon  _Unit;
if (_RPG != "") then {_Second = [_RPG, secondaryWeaponItems _Unit, secondaryWeaponMagazine _Unit]};

//// Add HandGun Weapon (Pistol) in Array, if exist
_Pistol = handgunWeapon _Unit;
if (_Pistol != "") then {_HandGun = [_Pistol, handgunItems _Unit, handgunMagazine _Unit]};

//// Add Uniform and item in Array, if exist
_UniformA = uniform _Unit;
if (_UniformA != "") then {_Uniform = [_UniformA, uniformItems _Unit, loadUniform _Unit]};

//// Add Vest and item in Array, if exist
_VestA = vest _Unit;
if (_VestA != "") then {_Vest = [_VestA, vestItems _Unit, loadVest _Unit]};

//// Add Backpack and item in Array, if exist
_BackPackA = backpack _Unit;
if (_BackPackA != "") then {_BackPack = [_BackPackA, backpackItems _Unit, loadBackpack _Unit]};

//// Add HeadGear in Array
_Helmet set [0, headgear _Unit];

/// Add NVG in Array
_NVG set [0, hmd _Unit];

/// Add Binocular in Array
_Binoc set [0, binocular _Unit];

/// Add Googles in Array
_Goggles set [0, goggles _Unit];

//// Add BasicItem in Array
_BasicItem = assignedItems _Unit;
_BasicItem = _BasicItem - [_NVG, _Binoc];

///////////////////////////////////////////////////////////////
//// Create Equipment Array and send him like Function result
///////////////////////////////////////////////////////////////
			//[ 0	 , 1		, 2		 , 3	   , 4	  , 5		, 6	     , 7   , 8	   , 9		 , 10        , 11 		]
_Equpment	= [_Prime, _Second, _HandGun, _Uniform, _Vest, _BackPack, _Helmet, _NVG, _Binoc, _Goggles, _BasicItem, load _Unit];

_Equpment