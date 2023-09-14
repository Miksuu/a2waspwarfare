// ////////////////////////////////////////////////////////////////////////////
// GLX - Radio Settings
// ////////////////////////////////////////////////////////////////////////////
// Radio Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_Radio") then
{
	GLX_Radio =
	[
		10,
		//[3500, 3500, 3500, 15000, 15000]//should be [*,*,*,air,ship] maybe inf car tank idk
		[900, 900, 900, 15000, 15000]
	];
	
	if (isFilePatchingEnabled) then
	{
		if ("UserConfig\GLX\GLX_Radio.sqf" call GLX_Exist_F) then
		{
			call compileFinal preprocessFileLineNumbers "UserConfig\GLX\GLX_Radio.sqf";
		};
	};
};