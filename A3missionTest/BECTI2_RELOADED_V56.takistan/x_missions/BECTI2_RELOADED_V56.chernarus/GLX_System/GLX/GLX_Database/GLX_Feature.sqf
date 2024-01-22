// ////////////////////////////////////////////////////////////////////////////
// GLX - Feature Settings
// ////////////////////////////////////////////////////////////////////////////
// Feature Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_Feature") then
{
	GLX_Feature =
	[
		80,
		75,
		50,
		
		50,
		95,
		
		 50,
		50,
		
		True,
		[55, 250, 500, 700]
	];
	
	if (isFilePatchingEnabled) then
	{
		if ("UserConfig\GLX\GLX_Feature.sqf" call GLX_Exist_F) then
		{
			call compileFinal preprocessFileLineNumbers "UserConfig\GLX\GLX_Feature.sqf";
		};
	};
};