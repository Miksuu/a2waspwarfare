// ////////////////////////////////////////////////////////////////////////////
// GLX - Tweak Settings
// ////////////////////////////////////////////////////////////////////////////
// Tweak Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_Tweak") then
{
	GLX_Tweak =
	[
		[15, 20, 25, 20, 15],
		55
	];
	
	if (isFilePatchingEnabled) then
	{
		if ("UserConfig\GLX\GLX_Tweak.sqf" call GLX_Exist_F) then
		{
			call compileFinal preprocessFileLineNumbers "UserConfig\GLX\GLX_Tweak.sqf";
		};
	};
};