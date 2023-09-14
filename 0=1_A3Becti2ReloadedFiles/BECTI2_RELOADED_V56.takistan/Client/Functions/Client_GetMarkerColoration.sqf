Private ["_color","_colorationMode","_colorFor"];

_colorFor = _this;
//_colorationMode = 'cti_MAPCOLORATION' Call GetNamespace;

_color = "";
switch (_colorFor) do {
	case "Friendly": 
	{_color = "ColorGreen"};
	case "Enemy":
	{_color = "ColorRed"};
	case "Resistance": 
	{_color = "ColorGreen"};
};

_color