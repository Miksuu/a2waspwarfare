/* Controls Definitions */

#define CT_STATIC 			0
#define CT_BUTTON 			1
#define CT_EDIT 			2
#define CT_COMBO 			4 
#define CT_LISTBOX 			5
#define CT_CONTROLS_GROUP	15
#define CT_CLICKABLETEXT	11
#define CT_STRUCTUREDTEXT	13
#define CT_LISTNBOX 		102
#define CT_PROGRESS				8
#define CT_ACTIVETEXT			11
#define CT_STRUCTURED_TEXT		13

#define CT_SHORTCUTBUTTON		16
#define CT_XSLIDER				43
#define CT_MAP					101

#define ST_POS 				0x0F
#define ST_HPOS 			0x03
#define ST_VPOS 			0x0C
#define ST_LEFT 			0x00
#define ST_RIGHT 			0x01
#define ST_CENTER 			0x02
#define ST_DOWN 			0x04
#define ST_UP				0x08
#define ST_VCENTER 			0x0c

#define ENABLE_SHADOW 		shadow = 2

#define ST_PICTURE 			48
#define ST_TEXT_BG 			128

#define subcolor1 {1,1,0.7,1}
#define subcolor1hex "#eee58b"
#define cti_SoundClick "a3\ui_f\data\sound\rscbutton\soundclick"
#define cti_SoundEnter "a3\ui_f\data\sound\rscbutton\soundenter"
#define cti_SoundEscape "a3\ui_f\data\sound\rscbutton\soundescape"
#define cti_SoundPush "a3\ui_f\data\sound\rscbutton\soundpush"
#define cti_SoundSelect "a3\ui_f\data\sound\rsclistbox\soundselect"
#define cti_SoundExpand "a3\ui_f\data\sound\rsccombo\soundexpand"
#define cti_SoundCollapse "a3\ui_f\data\sound\rsccombo\soundcollapse"


#include "Styles.hpp"
/* RscPicture */
class RscControlsGroup {
	type = CT_CONTROLS_GROUP;
	idc = -1;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	shadow = 0;
	style = ST_MULTI;
	class VScrollbar {
		width = 0.021;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
		shadow = 0;
		color[] = {1,1,1,0.6};
	};
	class HScrollbar {
		height = 0.028;
		shadow = 0;
		color[] = {1,1,1,0.6};
	};
	class ScrollBar	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "#(argb,8,8,3)color(1,1,1,1)";
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		border = "#(argb,8,8,3)color(1,1,1,1)";
	};
	class Controls{
	
	};
};

class RscPicture {
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;
	colorText[] = {0.75, 0.75, 0.75, 1};
	colorBackground[] = {0, 0, 0, 0};
	font = "PuristaMedium";
	sizeEx = 0.025;
	soundClick[] = {cti_SoundClick, 0.2, 1};
	soundEnter[] = {cti_SoundEnter, 0.2, 1};
	soundEscape[] = {cti_SoundEscape, 0.2, 1};
	soundPush[] = {cti_SoundPush,0.2,1};
	w = 0.275;
	h = 0.04;
	text = "";
	shadow = 0;
};





class RscPictureKeepAspect : RscPicture { //Coin Menu
	style = ST_KEEP_ASPECT_RATIO;
};

class IGUIBack { //Coin Menu
	type = CT_STATIC;
	idc = 124;
	style = ST_TEXT_BG;
	text = "";
	colorText[] = {0, 0, 0, 0};
	font = "PuristaMedium";
	sizeEx = 0.0;
	x = 0.1;
	y = 0.1;
	w = 0.1;
	h = 0.1;
	colorbackground[] = {0, 0, 0, 0.6};
};

/* RscButton */
class RscButton {
	type = CT_BUTTON;
	idc = -2;
	style = ST_CENTER;
	x = 0;
	y = 0;
	w = 0;
	h = 0.036;
	text = "";
	font = "PuristaMedium";
	sizeEx = 0.035;
	shadow = 1;
	colorText[] = {1, 1, 1, 0.8};
	colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
	colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
	colorDisabled[] = {0.5, 0.5, 0.5, 0.8};
	colorBackgroundDisabled[] = {0, 0, 0, 0.6};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorFocused[] = {0.5882, 0.5882, 0.3529, 0.7};
	colorShadow[] = {0.023529, 0, 0.0313725, 1};
	colorBorder[] = {0.023529, 0, 0.0313725, 1};
	borderSize = 0.0;
	soundEnter[] = {cti_SoundEnter,0.09,1};
	soundPush[] = {cti_SoundPush,0.09,1};
	soundClick[] = {cti_SoundClick,0.07,1};
	soundEscape[] = {cti_SoundEscape,0.09,1};
};
class RscButton_Main : RscButton {
	colorBackground[] = cti_Menu_Button_Color;
	colorBackgroundActive[] = cti_Menu_Button_Color;
	colorFocused[] = cti_Menu_Button_Focused_Color;
	colorText[] = cti_Menu_Button_Text_Color;
};
class RscButton_Back : RscButton {
	w = 0.04;
	h = 0.04;
	text = "<<";
	shadow = 2;
	sizeEx = 0.035;
};
class RscButton_Exit : RscButton {
	w = 0.04;
	h = 0.04;
	text = "X";
	shadow = 2;
	sizeEx = 0.035;
	colorText[] = {1, 1, 1, 0.8};
	colorBackground[] = {0.5020, 0, 0, 1};
	colorBackgroundActive[] = {0.9, 0, 0, 1};
	colorFocused[] = {0.5020, 0, 0, 1};
};

/* RscShortcutButton */
class RscShortcutButton {
	type = 16;
	idc = -2;
	style = 0;
	default = 0;
	w = 0.183825;
	h = 0.104575;
	color[] = {0.543, 0.5742, 0.4102, 1.0};
	color2[] = {0.95, 0.95, 0.95, 1};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.4};
	colorDisabled[] = {1, 1, 1, 0.25};
	periodFocus = 1.2;
	periodOver = 0.8;
	class HitZone {
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	class ShortcutPos {
		left = 0.004;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	class TextPos {
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	animTextureNormal = "Client\Images\ui_button_normal_ca.paa";
	animTextureDisabled = "Client\Images\ui_button_disabled_ca.paa";
	animTextureOver = "Client\Images\ui_button_over_ca.paa";
	animTextureFocused = "Client\Images\ui_button_focus_ca.paa";
	animTexturePressed = "Client\Images\ui_button_down_ca.paa";
	//animTextureDefault = "Client\Images\ui_button_default_ca.paa";
	textureNoShortcut = "";
	period = 0.4;
	font = "PuristaMedium";
	size = 0.03521;
	sizeEx = 0.03521;
	text = "";
	soundEnter[] = {cti_SoundEnter,0.09,1};
	soundPush[] = {cti_SoundPush,0.09,1};
	soundClick[] = {cti_SoundClick,0.07,1};
	soundEscape[] = {cti_SoundEscape,0.09,1};
	action = "";
	class Attributes {
		//font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	class AttributesImage {
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
	};
};
class RscIGUIShortcutButton : RscShortcutButton {
	w = 0.183825;
	h = 0.0522876;
	style = 2;
	color[] = {1, 1, 1, 1};
	color2[] = {1, 1, 1, 0.85};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.85};
	colorDisabled[] = {1, 1, 1, 0.4};
	class HitZone {
		left = 0.002;
		top = 0.003;
		right = 0.002;
		bottom = 0.016;
	};
	class ShortcutPos {
		left = -0.006;
		top = -0.007;
		w = 0.0392157;
		h = 0.0522876;
	};
	class TextPos {
		left = 0.02;
		top = 0.0;
		right = 0.002;
		bottom = 0.016;
	};
	animTextureNormal = "Client\Images\igui_button_normal_ca.paa";
	animTextureDisabled = "Client\Images\igui_button_disabled_ca.paa";
	animTextureOver = "Client\Images\igui_button_over_ca.paa";
	animTextureFocused = "Client\Images\igui_button_focus_ca.paa";
	animTexturePressed = "Client\Images\igui_button_down_ca.paa";
	animTextureDefault = "Client\Images\igui_button_normal_ca.paa";
	class Attributes {
		//font = "PuristaMedium";
		color = "#E5E5E5";
		align = "center";
		shadow = "true";
	};
};
class RscShortcutButtonMain: RscShortcutButton {
	w = 0.313726;
	h = 0.104575;
	color[] = {0.2588, 0.7137, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	class HitZone {
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	class ShortcutPos {
		left = 0.0204;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	class TextPos {
		left = 0.08;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	animTextureNormal = "Client\Images\ui_button_main_normal.paa";
	animTextureDisabled = "Client\Images\ui_button_main_disabled.paa";
	animTextureOver = "Client\Images\ui_button_main_over.paa";
	animTextureFocused = "Client\Images\ui_button_main_focus.paa";
	animTexturePressed = "Client\Images\ui_button_main_down.paa";
	animTextureDefault = "Client\Images\ui_button_main_normal.paa";
	period = 0.5;
	font = "PuristaMedium";
	size = 0.03921;
	sizeEx = 0.03921;
	text = "";
	soundEnter[] = {cti_SoundEnter,0.09,1};
	soundPush[] = {cti_SoundPush,0.09,1};
	soundClick[] = {cti_SoundClick,0.07,1};
	soundEscape[] = {cti_SoundEscape,0.09,1};
	action = "";
	class Attributes {
		//font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class AttributesImage {
		//font = "PuristaMedium";
		color = "#E5E5E5";
		align = "false";
	};
};

/* RscListBox */
class RscListBox {
	idc = -2;
	type = 5;
	style = 0 + 0x10;
	font = "PuristaMedium";
	sizeEx = 0.03321;
	color[] = {0.2588, 0.7137, 1, 1};
	colorText[] = {1, 1, 1, 0.75};
	colorScrollbar[] = {0.95, 0, 0, 1};
	colorSelect[] = {0, 0, 0, 0.7};
	colorSelect2[] = {0, 0, 0, 0.7};
	colorSelectBackground[] = {0.2588, 0.7137, 1, 1};
	colorSelectBackground2[] = {0.2588, 0.7137, 1, 1};
	columns[] = {0.1, 0.7, 0.1, 0.1};
	period = 0;
	colorBackground[] = {0, 0, 0, 1};
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	soundSelect[] = {cti_SoundSelect, 0.09, 1};
	colorDisabled[] = {1,1,1,0.3};
	
		class ListScrollBar //In older games this class is "ScrollBar"
		{
		width = 0; // width of ListScrollBar
		height = 0; // height of ListScrollBar
		scrollSpeed = 0.01; // scroll speed of ListScrollBar
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)
		color[] = {1,1,1,1}; // Scrollbar color
	};
	
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "Client\Images\igui_scrollbar_thumb_ca.paa";
		arrowFull = "Client\Images\igui_arrow_top_active_ca.paa";
		arrowEmpty = "Client\Images\igui_arrow_top_ca.paa";
		border = "Client\Images\igui_border_scroll_ca.paa";
	};
};

class RscListnBox : RscListBox {
	type = CT_LISTNBOX;
	style = ST_MULTI;
	shadow = 0;
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	color[] = {0.95,0.95,0.95,1};
	colorText[] = {1,1,1,1.0};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	period = 1.2;
	soundSelect[] = {"\A3\ui_f\data\sound\new1",0.09,1};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	maxHistoryDelay = 1.0;
	rowHeight = 0.03;
	idcRight = -1;
	idcLeft = -1;
	drawSideArrows = 0;
	class ListScrollBar {
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};
class RscListBoxA : RscListBox {
	type = CT_LISTNBOX;
	lineSpacing = 1;
	sizeEx = 0.029;
	rowHeight = 0.03;
	style = ST_MULTI;
	colorDisabled[] = {1,1,1,0.25};
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
};


class RscTextGear {
	type = CT_STATIC;
	idc = -1;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = ST_LEFT;
	shadow = 1;
	colorShadow[] = {0,0,0,0.5};
	font = "PuristaMedium";
	text="";
	SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.0) / 1.0) / 25) * 1)";
	colorText[] = {1,1,1,1.0};
	colorBackground[] = {0,0,0,0};
	linespacing = 1;
};

class RscFrameGear : RscTextGear {
	style = 64;
	shadow = 2;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	sizeEx = 0.02;
	text = "";
};

//--- Listnbox
class RscListNBoxGear {
	type = CT_LISTNBOX;
	style = ST_MULTI;
	shadow = 0;
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	color[] = {0.95,0.95,0.95,1};
	colorText[] = {1,1,1,1.0};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,1};
	period = 1.2;
	soundSelect[] = {"\A3\ui_f\data\sound\new1",0.09,1};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	maxHistoryDelay = 1.0;
	idcRight = -1;
	idcLeft = -1;
	drawSideArrows = 0;
	class ListScrollBar {
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class RscComboGear {
	type = CT_COMBO;
	style = ST_MULTI;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelect[] = {0,0,0,1};
	colorText[] = {0.95,0.95,0.95,1};
	colorBackground[] = {0,0,0,1};
	colorSelectBackground[] = {1,1,1,0.7};
	colorScrollbar[] = {1,0,0,1};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {1,1,1,1};
	colorActive[] = {1,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	font = "PuristaMedium";
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
	maxHistoryDelay = 1.0;
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	class ComboScrollBar	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class RscProgressGear {
	type = CT_PROGRESS;
	style = ST_LEFT;
	x = 0.344;
	y = 0.619;
	w = 0.3137255;
	h = 0.0261438;
	shadow = 2;
	texture = "#(argb,8,8,3)color(1,1,1,1)";
	colorFrame[] = {0,0,0,0.7};
	colorBar[] = {1,1,1,1};
};

class RscActiveTextGear {
	type = CT_ACTIVETEXT;
	idc = -1;
	style = ST_CENTER;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.035;
	font = "PuristaMedium";
	shadow = 2;
	text = "";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	color[] = {0,0,0,1};
	colorText[] = {0,0,0,1};
	colorActive[] = {0.3,0.4,0,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
};

class RscButtonGear {
	type = CT_BUTTON;
	style = ST_CENTER;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,1,1,1.0};
	colorDisabled[] = {0.4,0.4,0.4,1};
	colorBackground[] = {0.258823529, 0.713725490, 1, 0.7};
	colorBackgroundActive[] = {0.258823529, 0.713725490, 1, 1};
	colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorFocused[] = {0.258823529, 0.713725490, 1, 1};
	colorShadow[] = {0,0,0,1};
	colorBorder[] = {0,0,0,1};
	borderSize = 0.0;
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter.wss",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush.wss",0.0,0};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick.wss",0.07,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape.wss",0.09,1};
};

//--- HTML Structured Text
class RscStructuredTextGear {
	type = CT_STRUCTURED_TEXT;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	style = ST_LEFT;
	text = "";
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,1,1,1.0};
	shadow = 1;
	colorBackground[] = {1,1,1,0.7};
	class Attributes {
		font = "PuristaMedium";
		color = "#ffffff";
		align = "left";
		shadow = 1;
	};
};

class RscButton_LesserGear : RscButtonGear {
	colorBackground[] = {0.768627451, 1, 0.137254902, 0.7};
	colorBackgroundActive[] = {0.768627451, 1, 0.137254902, 1};
	colorFocused[] = {0.768627451, 1, 0.137254902, 1};
};

/* RscText */
class RscText {
	idc = -2;
	type = CT_STATIC;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0;
	style = ST_LEFT;
	font = "PuristaMedium";
	text = "";
	sizeEx = 0.03;
	shadow = 1;
	colorText[] = {0.9333, 0.8980, 0.5451, 0.9};
	colorBackground[] = {0, 0, 0, 0};
};
class RscText_Title : RscText {
	h = 0.04;
	colorText[] = {0.2588, 0.7137, 1, 1};
	sizeEx = 0.045;
	shadow = 1;
};
class RscText_SubTitle : RscText {
	h = 0.04;
	colorText[] = {0.2588, 0.7137, 1, 0.9};
	sizeEx = 0.035;
	shadow = 1;
};
class RscText_Small : RscText {
	h = 0.037;
	colorText[] = {0.9333, 0.8980, 0.5451, 0.9};
	sizeEx = 0.025;
	shadow = 1;
};




//ofps design
class RscEdit {
	type = CT_EDIT;
	idc = -1;
	style = "0x00 + 0x40";
	font = "PuristaMedium";
	shadow = 2;
	autocomplete = "";
	text = "";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorBackground[] = {0,0,0,1};
	colorText[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
	canModify = 1;
};



/* RscStructuredText */
class RscStructuredText {
	type = CT_STRUCTURED_TEXT;
	idc = -2;
	style = ST_LEFT;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = 0.03421;
	colorText[] = subcolor1;
	class Attributes {
		font = "PuristaMedium";
		color = subcolor1hex;
		align = "left";
		shadow = true;
	};
};

class RscFrame
{
type = CT_STATIC;
idc = -1;
style = 64;
shadow = 2;
colorBackground[] = {0,0,0,-0};
colorText[] = {1,1,1,1};
font = "PuristaMedium";
sizeEx = 0.02;
text = "";
};

/* RscStructuredTextB for valhalla hud */
class RscStructuredTextB{
	type=13;
	idc=-1;
	style = 0;
	sizeEx=0.028;
	size=0.02;
	lineSpacing=1;
	colorbackground[]={0,0.0,0,0};
	colorText[]={1,1,1,1};
	text="";
	x=-1;
	y=-1;
	w=0;
	h=0;
	class Attributes
	{
		font="PuristaMedium";
		color="#ffffff";
		align="left";
		shadow=false;
	};
};


/* RscXSliderH */
class RscXSliderH {
	idc = -2;
	type = 43;
	style = 0x400  + 0x10;
	x = 0;
	y = 0;
	h = 0.029412;
	w = 0.4;
	color[] = {1, 1, 1, 0.4};
	colorActive[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.2};
	arrowEmpty = "Client\Images\ui_arrow_left_ca.paa";
	arrowFull = "Client\Images\ui_arrow_left_active_ca.paa";
	border = "Client\Images\ui_border_frame_ca.paa";
	thumb = "Client\Images\ui_slider_bar_ca.paa";
};

/* RscCombo */
class RscCombo {
	idc = -2;
	type = 4;
	style = 1;
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.035;
	colorSelect[] = {0, 0, 0, 0.7};
	colorText[] = {1, 1, 1, 0.75};
	colorBackground[] = {0,0,0,0.75};
	colorSelectBackground[] = {0.2588, 0.7137, 1, 1};
	colorScrollbar[] = {0.023529, 0, 0.0313725, 1};
	arrowEmpty = "Client\Images\ui_arrow_combo_ca.paa";
	arrowFull = "Client\Images\ui_arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {0.2588, 0.7137, 1, 1};
	colorActive[] = {0, 0, 0, 1};
	colorDisabled[] = {0, 0, 0, 0.3};
	font = "PuristaMedium";
	sizeEx = 0.031;
	soundSelect[] = {cti_SoundSelect,0.09,1};
	soundExpand[] = {cti_SoundExpand,0.09,1};
	soundCollapse[] = {cti_SoundCollapse,0.09,1};
	maxHistoryDelay = 1.0;
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "Client\Images\ui_scrollbar_thumb_ca.paa";
		arrowFull = "Client\Images\ui_arrow_top_active_ca.paa";
		arrowEmpty = "Client\Images\ui_arrow_top_ca.paa";
		border = "Client\Images\ui_border_scroll_ca.paa";
	};
	class ComboScrollBar : ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "#(argb,8,8,3)color(1,1,1,1)";
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		border = "#(argb,8,8,3)color(1,1,1,1)";
		shadow = 0;
	};
};

/* RscClickableText */
class RscClickableText {
	idc = -2;
	type = 11;
	style = 48 + 0x800;
	color[] = {0.75,0.75,0.75,1};
	colorActive[] = {1,1,1,1};
	colorBackground[] = {0.6, 0.8392, 0.4706, 1};
	colorBackgroundSelected[] = {0.6, 0.8392, 0.4706, 1};
	colorFocused[] = {0.0, 0.0, 0.0, 0};
	colorDisabled[] = {1,1,1,0.25};
	font = "PuristaMedium";
	sizeEx = 0.03921;
	soundClick[] = {cti_SoundClick,0.2,1};
	soundDoubleClick[] = {"", 0.1, 1};
	soundEnter[] = {cti_SoundEnter,0.2,1};
	soundEscape[] = {cti_SoundEscape,0.2,1};
	soundPush[] = {, 0.2, 1};
	w = 0.275;
	h = 0.04;
	text = "";
};

class Box
{
    type = CT_STATIC;
    idc = -1;
    style = ST_CENTER;
    shadow = 2;
    colorBackground[] = { 1,1,1,0.9};
    colorText[] = {1,1,1,0.9};
    font = "puristaMedium";
    sizeEx = 0.03;
    text = "";
};

class Skill_RscListbox
{
    idc = -1;
    type = CT_LISTBOX;
    text = "";
    font = "puristaMedium";
    style = LB_TEXTURES;
    colorBackgroundDisabled[] = {0,0.0,0};
    color[] = {0.95,0.95,0.95,1};
    colorText[] = {1,1,1,1.0};
    colorScrollbar[] = {0.95,0.95,0.95,1};
    colorSelect[] = {0,0,0,1};
    colorSelect2[] = {0,0,0,1};
    colorSelectBackground[] = {0.95,0.95,0.95,1};
    colorSelectBackground2[] = {1,1,1,0.5};
    colorDisabled[] = {1,1,1,0.25};
    soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
    class ListScrollBar
    {
        width = 0; // width of ListScrollBar
        height = 0; // height of ListScrollBar
        scrollSpeed = 0.01; // scrollSpeed of ListScrollBar
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)
        color[] = {1,1,1,1}; // Scrollbar color
    };
    maxHistoryDelay = 1;
    sizeEx = 0.03;
    coloumns[] = {0,0,0.9};
    drawSideArrows = false;
    idcLeft = -1;
    idcRight = -1;
    rowHeight = 0.050;
    x = 0.0;
    y = 0;
    w = 0;
    h = 0;
};

class Skill_RscStructuredText {
    type = 13;
    style = 0;
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = 0.025;
    colorText[] = {1,1,1,1.0};
    shadow = 1;
    class Attributes {
        font = "puristaMedium";
        color = "#ffffff";
        align = "left";
        shadow = 1;
    };
};

/* RscMapControl */
class RscMapControl {
	type = 101;
	moveOnEdges = 1;
	sizeEx = 0.043;
	style = 48;
	colorBackground[] = {1,1,1,1};
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	//font = "TahomaB";
	//sizeEx = 0.04;
	colorSea[] = {0.56,0.8,0.98,0.5};
	colorForest[] = {0.5,0.7,0.2,0.2};
	colorRocks[] = {0.85,0.0,0.0,0.3};
	colorCountlines[] = {0.65,0.45,0.27,0.5};
	colorMainCountlines[] = {0.65,0.45,0.27,1};
	colorCountlinesWater[] = {0,0.53,1,0.5};
	colorMainCountlinesWater[] = {0,0.53,1,1};
	colorForestBorder[] = {0,0.85,0,0.5};
	colorRocksBorder[] = {0.7,0.0,0.0,1};
	colorPowerLines[] = {0,0,0,1};
	colorNames[] = {0,0,0,1};
	colorInactive[] = {1,1,1,0.5};
	colorLevels[] = {0.9,0.65,0,0.71};
	colorOutside[] = {0, 0, 0, 1};
	colorRailWay[] = {0,0,0.5,1};
	maxSatelliteAlpha = 1;
	alphaFadeStartScale = 1;
	alphaFadeEndScale = 2;
	fontLabel = "PuristaMedium";
	sizeExLabel = 0.030;
	fontGrid = "PuristaMedium";
	sizeExGrid = 0.030;
	fontUnits = "PuristaMedium";
	sizeExUnits = 0.030;
	fontNames = "PuristaMedium";
	sizeExNames = 0.044;
	fontInfo = "PuristaMedium";
	sizeExInfo = 0.030;
	fontLevel = "PuristaMedium";
	sizeExLevel = 0.020;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	stickX[] = {0.2,{"Gamma",1,1.5}};
	stickY[] = {0.2,{"Gamma",1,1.5}};
	ptsPerSquareSea = 6;
	ptsPerSquareTxt = 8;
	ptsPerSquareCLn = 8;
	ptsPerSquareExp = 8;
	ptsPerSquareCost = 8;
	ptsPerSquareFor = "4.0f";
	ptsPerSquareForEdge = "10.0f";
	ptsPerSquareRoad = 2;
	ptsPerSquareObj = 10;
    showCountourInterval = "false";
	colorTracks[] = {0.84,0.76,0.65,1.0};
	colorTracksFill[] = {0.84,0.76,0.65,1.0};
	colorRoads[] = {0.7,0.7,0.7,1.0};
	colorRoadsFill[] = {1.0,1.0,1.0,1.0};
	colorMainRoads[] = {0.9,0.5,0.3,1.0};
	colorMainRoadsFill[] = {1.0,0.6,0.4,1.0};
	colorGrid[] = {0.1,0.1,0.1,0.6};
	colorGridMap[] = {0.1,0.1,0.1,0.6};
	scaleMin = 0.001;
	scaleMax = 1.0;
	scaleDefault = 0.16;
	widthRailWay = 1;
	
	class LineMarker
	{
		lineDistanceMin = 3e-005;
		lineLengthMin = 5;
		lineWidthThick = 0.014;
		lineWidthThin = 0.008;
		textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
	};
	class power
{
icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
size = 24;
		importance = 1;
coefMin = 0.85;
		coefMax = 1;
color[] = {1,1,1,1};
	};
class powersolar
{
icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
size = 24;
		importance = 1;
coefMin = 0.85;
		coefMax = 1;
color[] = {1,1,1,1};
	};
class powerwave
{
icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
size = 24;
importance = 1;
coefMin = 0.85;
coefMax = 1;
color[] = {1,1,1,1};
};
class powerwind
{
icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
size = 24;
importance = 1;
coefMin = 0.85;
coefMax = 1;
color[] = {1,1,1,1};
};
class shipwreck
{
icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
size = 24;
importance = 1;
coefMin = 0.85;
coefMax = 1;
color[] = {1,1,1,1};
};

	class Command {
					icon = "#(argb,8,8,3)color(1,1,1,1)";
		color[] = {0, 0, 0, 1};
					size = 18;
					importance = 1;
					coefMin = 1;
					coefMax = 1;
	};
	
	class Bunker {
		icon = "\ca\ui\data\map_bunker_ca.paa";
		color[] = {0.55,0.64,0.43,1};
		size = 16;
		importance = 1.5 * 14 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Bush {
		icon = "\ca\ui\data\map_bush_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 16;
		importance = 0.2 * 14 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class BusStop {
		icon = "\ca\ui\data\map_busstop_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 10;
		importance = 1 * 10 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Cross {
		icon = "\ca\ui\data\map_cross_ca.paa";
		color[] = {0.55,0.64,0.43,1};
		size = 16;
		importance = 0.7 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Task {
		icon = "Client\Images\ui_taskstate_current_CA.paa";
		iconCreated = "Client\Images\ui_taskstate_new_CA.paa";
		iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
		iconDone = "Client\Images\ui_taskstate_done_CA.paa";
		iconFailed = "Client\Images\ui_taskstate_failed_CA.paa";
		color[] = {0.863,0.584,0.0,1};
		colorCreated[] = {0.95,0.95,0.95,1};
		colorCanceled[] = {0.606,0.606,0.606,1};
		colorDone[] = {0.424,0.651,0.247,1};
		colorFailed[] = {0.706,0.0745,0.0196,1};
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
		
	class CustomMark {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0.65,0.64,0.03,1};
		size = 16;
		importance = 0.7 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Fortress {
		icon = "\ca\ui\data\map_bunker_ca.paa";
		color[] = {0.55,0.64,0.43,1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Fuelstation {
		icon = "\ca\ui\data\map_fuelstation_ca.paa";
		color[] = {0.55,0.64,0.43,1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.75;
		coefMax = 4;
	};
	
	class Fountain {
		icon = "\ca\ui\data\map_fountain_ca.paa";
		color[] = {0,0.35,0.7,1};
		size = 12;
		importance = 1 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Hospital {
		icon = "\ca\ui\data\map_hospital_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.5;
		coefMax = 4;
	};
	
	class Chapel {
		icon = "\ca\ui\data\map_chapel_ca.paa";
		color[] = {0.55,0.64,0.43,1};
		size = 16;
		importance = 1 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};
	
	class Church {
		icon = "\ca\ui\data\map_church_ca.paa";
		color[] = {0.55,0.64,0.43,1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};
	
	class Lighthouse {
		icon = "\ca\ui\data\map_lighthouse_ca.paa";
		color[] = {0.78,0,0.05,1};
		size = 20;
		importance = 3 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};
	
	class Quay {
		icon = "\ca\ui\data\map_quay_ca.paa";
		color[] = {0.55,0.64,0.43,1};
		size = 16;
		importance = 2 * 16 * 0.05;
		coefMin = 0.5;
		coefMax = 4;
	};
	
	class Rock {
		icon = "\ca\ui\data\map_rock_ca.paa";
		color[] = {0.55,0.64,0.43,1};
		size = 12;
		importance = 0.5 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Ruin {
		icon = "\ca\ui\data\map_ruin_ca.paa";
		color[] = {0.78,0,0.05,1};
		size = 16;
		importance = 1.2 * 16 * 0.05;
		coefMin = 1;
		coefMax = 4;
	};
	
	class SmallTree {
		icon = "\ca\ui\data\map_smalltree_ca.paa";
		color[] = {0.35,0.74,0.33,1};
		size = 12;
		importance = 0.6 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	class Stack {
		icon = "\ca\ui\data\map_stack_ca.paa";
		size = 20;
		color[] = {0, 0.9, 0, 1};
		importance = 2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};
	class Tree {
		icon = "\ca\ui\data\map_tree_ca.paa";
		color[] = {0.40,0.74,0.33,1};
		size = 12;
		importance = 0.9 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	
	class Tourism {
		icon = "\ca\ui\data\map_tourism_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 16;
		importance = 1 * 16 * 0.05;
		coefMin = 0.7;
		coefMax = 4;
	};
	
	class Transmitter {
		icon = "\ca\ui\data\map_transmitter_ca.paa";
		size = 20;
		color[] = {0,0.35,0.7,1};
		importance = 2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};
	
	class ViewTower {
		icon = "\ca\ui\data\map_viewtower_ca.paa";
		size = 16;
		color[] = {0,0.35,0.7,1};
		importance = 2.5 * 16 * 0.05;
		coefMin = 0.5;
		coefMax = 4;
	};
	
	class Watertower {
		icon = "\ca\ui\data\map_watertower_ca.paa";
		color[] = {0,0.35,0.7,1};
		size = 32;
		importance = 1.2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};
	class Waypoint {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		size = 14;
		color[] = {0,0.35,0.7,1};
		importance = 2.5 * 16 * 0.05;
		coefMin = 0.5;
		coefMax = 4;
	};
	
	class WaypointCompleted {
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
		size = 16;
		color[] = {0,0.35,0.7,1};
		importance = 2.5 * 16 * 0.05;
		coefMin = 0.5;
		coefMax = 4;
	};
	class ActiveMarker {
		icon = "";
		color[] = {0, 0, 1, 1};
		size = 15;
		importance = 2.5 * 16 * 0.05;
		coefMin = 0.5;
		coefMax = 4;
	};
};

