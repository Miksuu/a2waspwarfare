// ////////////////////////////////////////////////////////////////////////////
// GLX - A.I. Settings
// ////////////////////////////////////////////////////////////////////////////
// A.I. Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_AI") then
{
	GLX_AI =
	[
		0.01,
		0.02,
		15,
		500
	];
	
	if (isFilePatchingEnabled) then
	{
		if ("UserConfig\GLX\GLX_AI.sqf" call GLX_Exist_F) then
		{
			call compileFinal preprocessFileLineNumbers "UserConfig\GLX\GLX_AI.sqf";
		};
	};
};