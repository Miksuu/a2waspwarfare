//--- [Controls Style Preprocessors]
#define UCST_LEFT 				0
#define UCST_RIGHT 				1
#define UCST_CENTER 				2
#define UCST_MULTI 				16
#define UCST_PICTURE 				48
#define UCST_TEXT_BG 				128
#define UCST_LINE 				176
#define UCST_KEEP_ASPEUCCT_RATIO	"0x30 + 0x800"
#define UCLB_MULTI 				0x20

#define UCST_POS            0x0F
#define UCST_HPOS           0x03
#define UCST_VPOS           0x0C
//#define UCST_LEFT           0x00
//#define UCST_RIGHT          0x01
//#define UCST_CENTER         0x02
#define UCST_DOWN           0x04
#define UCST_UP             0x08
#define UCST_VCENTER        0x0C
#define UCST_TYPE           0xF0
#define UCST_SINGLE         0x00
//#define UCST_MULTI          0x10
#define UCST_TITLE_BAR      0x20
//#define UCST_PICTURE        0x30
#define UCST_FRAME          0x40
#define UCST_BACKGROUND     0x50

////////////////
//Base Classes//
////////////////
class UCRscTabletFrameTablet
{
    access = 0;
    idc = -1;
    type = UCCT_STATIC;
    style = UCST_PICTURE;
	colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    text = ""; 
	font = "PuristaMedium";	
	sizeEx = 0.03;
};
class UCRscTabletPictureFrame
{
    access = 0;
    idc = -1;
    type = UCCT_STATIC;
    style = UCST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "PuristaLight";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
};
class UCRscTabletFrameBase
{
    type = UCCT_STATIC;
    idc = -1;
    style = UCST_FRAME;
    shadow = 2;
    colorBackground[] = {1,1,1,1};
    colorText[] = {1,1,1,0.9};
    font = "PuristaLight";
    sizeEx = 0.03;
    text = "";
};
class UCRscTabletScreen
{
    type = UCCT_STATIC;
    idc = -1;
    style = UCST_CENTER;
    shadow = 2;
    colorBackground[] = { 0.2,0.9,0.5, 0.9};
    colorText[] = {1,1,1,0.9};
    font = "PuristaLight";
    sizeEx = 0.03;
    text = "";
};
class UCRscTabletText
{
    access = 0;
    idc = -1;
    type = UCCT_STATIC;
    style = UCST_MULTI;
    linespacing = 1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
	colorShadow[] = {0,0,0,0};
    colorBorder[] = {0,0,0,0};
    text = "";
    shadow = 0;
    font = "PuristaLight";
    SizeEx = 0.02300;
    fixedWidth = 0;
	borderSize = 0;

    x = 0;
    y = 0;
    h = 0;
    w = 0;
   
};
//--- HTML Structured Text
class UCRscTabletStructuredText {
	type = UCCT_STRUCTURED_TEXT;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	style = UCST_LEFT;
	text = "";
	size = "(			(			(			((safezoneW / safezoneH) min 1.1) / 1.1) / 25) * 1)";
	SizeEx = 0.01800;
	font = "PuristaBold";
	colorText[] = {1,1,1,1.0};
	shadow = 1;
	class Attributes {
		font = "PuristaMedium";
		color = "#ffffff";
		align = "left";
		shadow = 0;
		size = 0.8;
	};
};
class UCRscTabletTextos
{
	type = UCCT_STRUCTURED_TEXT;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	style = UCST_LEFT;
	text = "";
	size = "(			(			(			((safezoneW / safezoneH) min 1.1) / 1.1) / 25) * 1)";
	SizeEx = 0.01800;
	font = "PuristaBold";
	colorText[] = {1,1,1,1.0};
	shadow = 1;
	class Attributes {
		font = "PuristaBold";
		color = "#ffffff";
		align = "center";
		shadow = 0;
		size = 0.8;
	};
   
};
class UCRscTabletTextlink
{
    access = 0;
    idc = -1;
    type = UCCT_HTML;
    style = UCST_CENTER; 
    text = "";
	font = "PuristaSemiBold";
	filename = "UCRsc\oslink.html";
    x = 0;
    y = 0;
    h = 0;
    w = 0;
	
	colorBackground[] = {1,1,1,0};
	colorBold[] = {1,1,1,1};
	colorLink[] = {1,1,1,1};
	colorLinkActive[] = {1,1,1,1};
	colorPicture[] = {1,1,1,1};
	colorPictureBorder[] = {1,1,1,1};
	colorPictureLink[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorText[] = {1,1,1,1};
	
	prevPage = "\ca\ui\data\arrow_left_ca.paa";
	nextPage = "\ca\ui\data\arrow_right_ca.paa";
	
	class H1 {
		font = "PuristaSemiBold";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.02474;
		align = "center";
	};
	
	class H2 {
		font = "PuristaSemiBold";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.0286458;
		align = "center";
	};
	
	class H3 {
		font = "PuristaSemiBold";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.0286458;
		align = "center";
	};
	
	class H4 {
		font = "PuristaSemiBold";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.0208333;
		align = "center";
	};
	
	class H5 {
		font = "PuristaSemiBold";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.0208333;
		align = "center";
	};
	
	class H6 {
		font = "PuristaSemiBold";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.0208333;
		align = "center";
	};
	
	class P {
		font = "PuristaSemiBold";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.0208333;
		align = "center";
	};
	
	class A {
		font = "PuristaSemiBold";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.0208333;
		color = "#000000";
		align = "center";
		valign = "middle";
		shadow = false;
		shadowColor = "#ff0000";
		size = "1";
	};
   
};
class UCRscTabletTextWelcome
{
    access = 0;
    idc = -1;
    type = UCCT_HTML;
    style = UCST_CENTER; 
    text = "";
	font = "PuristaMedium";
	filename = "UCRsc\welcome.html";
    x = 0;
    y = 0;
    h = 0;
    w = 0;
	
	colorBackground[] = {1,1,1,0};
	colorBold[] = {1,1,1,1};
	colorLink[] = {1,1,1,1};
	colorLinkActive[] = {1,1,1,1};
	colorPicture[] = {1,1,1,1};
	colorPictureBorder[] = {1,1,1,1};
	colorPictureLink[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorText[] = {1,1,1,1};
	
	prevPage = "\ca\ui\data\arrow_left_ca.paa";
	nextPage = "\ca\ui\data\arrow_right_ca.paa";
	
	class H1 {
		font = "PuristaMedium";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.05;
		align = "center";
	};
	
	class H2 {
		font = "PuristaMedium";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.04;
		align = "center";
	};
	
	class H3 {
		font = "PuristaMedium";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.04;
		align = "center";
	};
	
	class H4 {
		font = "PuristaMedium";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.03;
		align = "center";
	};
	
	class H5 {
		font = "PuristaMedium";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.03;
		align = "center";
	};
	
	class H6 {
		font = "PuristaMedium";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.03;
		align = "center";
	};
	
	class P {
		font = "PuristaMedium";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.03;
		align = "center";
	};
	
	class A {
		font = "PuristaMedium";
		fontBold = "PuristaSemiBold";
		sizeEx = 0.03;
		color = "#000000";
		align = "center";
		valign = "middle";
		shadow = false;
		shadowColor = "#ff0000";
		size = "1";
	};
   
};
class UCRscTabletTitle
{  
    access = 0;
    idc = -1;
    type = UCCT_STATIC;
    style = 2;
    linespacing = 1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    text = "";
    shadow = 0;
    font = "PuristaSemiBold";
    SizeEx = 0.04;
    fixedWidth = 0;
	borderSize = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;
};
class UCRscTabletButton
{
   access = 0;
   idc = -1;
    type = UCCT_BUTTON;
    text = "";
    colorText[] = {1,1,1,.9};
    colorDisabled[] = {0.4,0.4,0.4,0};
    colorBackground[] = {0.75,0.75,0.75,0.8};
    colorBackgroundDisabled[] = {0,0.0,0};
    colorBackgroundActive[] = {0.75,0.75,0.75,1};
    colorFocused[] = {0.75,0.75,0.75,.5};
    colorShadow[] = {0.023529,0,0.0313725,1};
    colorBorder[] = {0.023529,0,0.0313725,1};
    soundEnter[] = {"\A3\ui_f\data\sound\UCRscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\UCRscButton\soundPush",0,0};
    soundClick[] = {"\A3\ui_f\data\sound\UCRscButton\soundClick",0.07,1};
    soundEscape[] = {"\A3\ui_f\data\sound\UCRscButton\soundEscape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaLight";
    sizeEx = 0.065;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};

class UCRscTabletButtonMenu
{  
   access = 0;
   idc = -1;
    type = UCCT_BUTTON;
    text = "";
    colorText[] = {1,1,1,.7};
    colorDisabled[] = {1,1,1,0.3};
    colorBackground[] = {0.18,0.227,0.247,0.7};
    colorBackgroundDisabled[] = {0.18,0.227,0.247,0.3};
    colorBackgroundActive[] = {0.18,0.227,0.247,0.7};
    colorFocused[] = {0.18,0.227,0.247,0.7};
    colorShadow[] = {0.023529,0,0.0313725,0.7};
    colorBorder[] = {0.023529,0,0.0313725,0};
    soundEnter[] = {"\A3\ui_f\data\sound\UCRscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\UCRscButton\soundPush",0,0};
    soundClick[] = {"\A3\ui_f\data\sound\UCRscButton\soundClick",0.07,1};
    soundEscape[] = {"\A3\ui_f\data\sound\UCRscButton\soundEscape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaSemiBold";
    sizeEx = 0.055;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};
class UCRscTabletButtonPower
{  
	access = 0;
	idc = -1;
    type = UCCT_BUTTON;
    text = "";
    colorText[] = {1,1,1,.9};
    colorDisabled[] = {0.18,0.227,0.247,0};
    colorBackground[] = {0.18,0.227,0.247,0};
    colorBackgroundDisabled[] = {0.18,0.227,0.247,0};
    colorBackgroundActive[] = {0.18,0.227,0.247,0};
    colorFocused[] = {0.624,0.631,0.635,0};
    colorShadow[] = {0.023529,0,0.0313725,0};
    colorBorder[] = {0.023529,0,0.0313725,0};
    soundEnter[] = {"\A3\ui_f\data\sound\UCRscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\UCRscButton\soundPush",0,0};
    soundClick[] = {"\A3\ui_f\data\sound\UCRscButton\soundClick",0.07,1};
    soundEscape[] = {"\A3\ui_f\data\sound\UCRscButton\soundEscape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
	font = "PuristaSemiBold";
    sizeEx = 0.05;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};
class UCRscTabletCloseButton
{  
   access = 0;
   idc = -1;
    type = UCCT_BUTTON;
    text = "";
    colorText[] = {1,1,1,.7};
    colorDisabled[] = {1,1,1,0.2};
    colorBackground[] = {0.18,0.227,0.247,0.4};
    colorBackgroundDisabled[] = {0.18,0.227,0.247,0.2};
    colorBackgroundActive[] = {0.18,0.227,0.247,0.4};
    colorFocused[] = {0.18,0.227,0.247,0.7};
    colorShadow[] = {0.023529,0,0.0313725,0.7};
    colorBorder[] = {0.023529,0,0.0313725,0};
    soundEnter[] = {"\A3\ui_f\data\sound\UCRscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\UCRscButton\soundPush",0,0};
    soundClick[] = {"\A3\ui_f\data\sound\UCRscButton\soundClick",0.07,1};
    soundEscape[] = {"\A3\ui_f\data\sound\UCRscButton\soundEscape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaSemiBold";
    sizeEx = 0.040;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};
class UCRscTabletHomeButton
{  
   access = 0;
   idc = -1;
    type = UCCT_BUTTON;
    text = "";
    colorText[] = {1,1,1,.7};
    colorDisabled[] = {1,1,1,0.2};
    colorBackground[] = {0.18,0.227,0.247,0.4};
    colorBackgroundDisabled[] = {0.18,0.227,0.247,0.2};
    colorBackgroundActive[] = {0.18,0.227,0.247,0.4};
    colorFocused[] = {0.18,0.227,0.247,0.7};
    colorShadow[] = {0.023529,0,0.0313725,0.7};
    colorBorder[] = {0.023529,0,0.0313725,0};
    soundEnter[] = {"\A3\ui_f\data\sound\UCRscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\UCRscButton\soundPush",0,0};
    soundClick[] = {"\A3\ui_f\data\sound\UCRscButton\soundClick",0.07,1};
    soundEscape[] = {"\A3\ui_f\data\sound\UCRscButton\soundEscape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaSemiBold";
    sizeEx = 0.040;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};
class UCRscTabletBackButton
{  
   access = 0;
   idc = -1;
    type = UCCT_BUTTON;
    text = "";
    colorText[] = {1,1,1,.7};
    colorDisabled[] = {1,1,1,0.2};
    colorBackground[] = {0.18,0.227,0.247,0.4};
    colorBackgroundDisabled[] = {0.18,0.227,0.247,0.2};
    colorBackgroundActive[] = {0.18,0.227,0.247,0.4};
    colorFocused[] = {0.18,0.227,0.247,0.7};
    colorShadow[] = {0.023529,0,0.0313725,0.7};
    colorBorder[] = {0.023529,0,0.0313725,0};
    soundEnter[] = {"\A3\ui_f\data\sound\UCRscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\UCRscButton\soundPush",0,0};
    soundClick[] = {"\A3\ui_f\data\sound\UCRscButton\soundClick",0.07,1};
    soundEscape[] = {"\A3\ui_f\data\sound\UCRscButton\soundEscape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaSemiBold";
    sizeEx = 0.040;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};
class UCRscTabletServiceButton
{  
   access = 0;
   idc = -1;
    type = UCCT_BUTTON;
    text = "";
    colorText[] = {1,1,1,.7};
    colorDisabled[] = {1,1,1,0.2};
    colorBackground[] = {0.18,0.227,0.247,0.4};
    colorBackgroundDisabled[] = {0.18,0.227,0.247,0.2};
    colorBackgroundActive[] = {0.18,0.227,0.247,0.4};
    colorFocused[] = {0.18,0.227,0.247,0.7};
    colorShadow[] = {0.023529,0,0.0313725,0.7};
    colorBorder[] = {0.023529,0,0.0313725,0};
    soundEnter[] = {"\A3\ui_f\data\sound\UCRscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\UCRscButton\soundPush",0,0};
    soundClick[] = {"\A3\ui_f\data\sound\UCRscButton\soundClick",0.07,1};
    soundEscape[] = {"\A3\ui_f\data\sound\UCRscButton\soundEscape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaSemiBold";
    sizeEx = 0.040;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};
class UCRscTabletTransferButton
{  
   access = 0;
   idc = -1;
    type = UCCT_BUTTON;
    text = "";
    colorText[] = {1,1,1,.7};
    colorDisabled[] = {1,1,1,0.2};
    colorBackground[] = {0.18,0.227,0.247,0.4};
    colorBackgroundDisabled[] = {0.18,0.227,0.247,0.2};
    colorBackgroundActive[] = {0.18,0.227,0.247,0.4};
    colorFocused[] = {0.18,0.227,0.247,0.7};
    colorShadow[] = {0.023529,0,0.0313725,0.7};
    colorBorder[] = {0.023529,0,0.0313725,0};
    soundEnter[] = {"\A3\ui_f\data\sound\UCRscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\UCRscButton\soundPush",0,0};
    soundClick[] = {"\A3\ui_f\data\sound\UCRscButton\soundClick",0.07,1};
    soundEscape[] = {"\A3\ui_f\data\sound\UCRscButton\soundEscape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaSemiBold";
    sizeEx = 0.040;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};