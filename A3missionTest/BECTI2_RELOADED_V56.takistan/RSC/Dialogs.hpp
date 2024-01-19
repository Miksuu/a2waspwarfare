/* Dialogs */
//--- WF3 Upgrade Menu.
class cti_UpgradeMenu {
	movingEnable = 1;
	idd = 504000;
	onLoad = "(_this) ExecVM 'Client\GUI\GUI_UpgradeMenu.sqf'";
	
	class controlsBackground {
		class CA_Background : RscText {
			x = 0;
			y = 0;
			w = 0.8;
			h = 0.8;
			colorBackground[] = cti_Background_Color;
			moving = 1;
		};
		class CA_Background_Header : CA_Background {
			x = 0;
			y = 0;
			w = 0.8;
			h = 0.06;
			colorBackground[] = cti_Background_Color_Header;
		};
		class CA_Background_Footer : CA_Background {
			x = 0;
			y = 0.76;
			w = 0.8;
			h = 0.04;
			colorBackground[] = cti_Background_Color_Sub;
		};
		class CA_Menu_Title : RscText_Title {
			x = 0.007;
			y = 0.01;
			w = 0.5;
			text = "Upgrade Menu :";
			colorText[] = cti_Menu_Title_Color;
		};
		class CA_Quit_Button: RscButton_Main {
			x = 0.75;
			y = 0.0075;
			w = 0.045;
			h = 0.045;
			text = "X";
			shadow = 2;
			sizeEx = 0.03;
			
			onButtonClick = "closeDialog 0;";
		};
		class CA_Back_Button : CA_Quit_Button {
			x = 0.695;
			text = "<<";
			onButtonClick = "cti_WF_MenuAction = 1000;";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		class CA_Menu_Details : RscText {
			x = 0.345;
			y = 0.075;
			w = 0.45;
			h = 0.20;
			colorBackground[] = {0.5, 0.5, 0.5, 0.15};
			style = ST_TEXT_BG;
		};
		class CA_Menu_Links : CA_Menu_Details {
			y = 0.29;
			h = 0.16;
		};
		class CA_Menu_Desc : CA_Menu_Details {
			y = 0.465;
			h = 0.28;
		};
	};
	
	class controls {
		class CA_UpgradeList : RscListnBox {
			idc = 504001;
			x = 0.000983551;
			y = 0.065;
			w = 0.34;
			h = 0.69;
			columns[] = {0.01, 0.25, 0.75};
			
			colorDisabled[] = {1,1,1,0.3};
			
			onLBDblClick = "cti_WF_MenuAction = 1";
			onLBSelChanged = "cti_WF_MenuAction = 2";
		};/*
		class CA_Icon : RscPicture {
			idc = 504002;
			x = 0.67;
			y = 0.095;
			w = 0.128;
			h = 0.128;
			colorText[] = {1, 1, 1, 0.1};
			colorBackground[] = {0, 0, 0, 0};
		};*/
		
		
		class CA_UpgradeDetails : RscStructuredText {
			idc = 504003;
			x = 0.35;
			y = 0.08;
			w = 0.32;
			h = 0.195;
			size = 0.0260;
			shadow = 1;
			
			class Attributes {
				font = "PuristaMedium";
				color = "#E8F0FF";
				align = "left";
				shadow = true;
			};
		};
		
		class CA_UpgradeLinks : CA_UpgradeDetails {
			idc = 504004;
			y = 0.295;
			h = 0.155;
			w = 0.45;
		};
		class CA_UpgradeDesc : CA_UpgradeLinks {
			idc = 504005;
			y = 0.47;
			h = 0.275;
		};
		class CA_Upgrade : RscButton_Main {
			idc = 504007;
			x = 0.595;
			y = 0.762;
			w = 0.2;
			h = 0.035;
			sizeEx = 0.035;
			text = "Upgrade";
			action = "cti_WF_MenuAction = 1";
		};
		class CA_Details : CA_UpgradeDetails {
			idc = 504006;
			x = 0.01;
			y = 0.765;
			w = 0.4;
			h = 0.035;
			size = 0.0250;
			shadow = 2;
		};
	};
};
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- WF3 Vote Menu.
class cti_VoteMenu {
	movingEnable = 1;
	idd = 500000;
	onLoad = "(_this) ExecVM 'Client\GUI\GUI_VoteMenu.sqf'";
	
	class controlsBackground {
		class CA_Background : RscText {
			x = 0.273;
			y = 0.134;
			w = 0.5;
			h = 0.8;
			colorBackground[] = cti_Background_Color;
			moving = 1;
		};
		class CA_Background_Header : CA_Background {
			x = 0.273;
			y = 0.134;
			w = 0.5;
			h = 0.06;
			colorBackground[] = cti_Background_Color_Header;
		};
		class CA_Background_Footer : CA_Background {
			x = 0.273;
			y = 0.134 + 0.76;
			w = 0.5;
			h = 0.04;
			colorBackground[] = cti_Background_Color_Sub;
		};
		class CA_Menu_Title : RscText_Title {
			x = 0.28;
			y = 0.134 + 0.01;
			w = 0.5;
			text = $STR_WF_VOTING_Title;
			colorText[] = cti_Menu_Title_Color;
		};
		class CA_Quit_Button: RscButton_Main {
			x = 0.273 + 0.45;
			y = 0.134 + 0.0075;
			w = 0.045;
			h = 0.045;
			text = "X";
			shadow = 2;
			sizeEx = 0.03;
			
			onButtonClick = "closeDialog 0;";
		};
	};
	
	class controls {
		class CA_Vote_List : RscListnBox {
			idc = 500100;
			x = 0.28;
			y = 0.134 + 0.07;
			w = 0.489;
			h = 0.665;
			columns[] = {0.01, 0.75};
			colorDisabled[] = {1,1,1,0.3};
			colorSelectBackground[] = cti_Menu_ListBox_Select_Color;
			colorSelectBackground2[] = cti_Menu_ListBox_Select_Color;
			
			onLBSelChanged = "cti_MenuAction = 1";
		};
		class CA_Menu_TimeLeft : RscText {
			idc = 500101;
			x = 0.28;
			y = 0.134 + 0.762;
			w = 0.25;
			sizeEx = 0.03;
			text = "";
			colorText[] = cti_Menu_Text_Color;
			shadow = 2;
		};
		class CA_Menu_Elected : CA_Menu_TimeLeft {
			idc = 500102;
			x = 0.273 + 0.20;
			y = 0.134 + 0.762;
			w = 0.3;
			style = ST_RIGHT;
			text = "";
		};
		class CA_Menu_Time_Static : CA_Menu_TimeLeft {
			idc = 500103;
			x = 0.273 + 0.16;
			y = 0.134 + 0.762;
			w = 0.3;
			style = ST_RIGHT;
			text = $STR_WF_VOTING_TimeLeft;
		};
	};
};
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- WF3 Commander Vote Menu.
class cti_Commander_VoteMenu {
	movingEnable = 1;
	idd = 500999;
	onLoad = "(_this) ExecVM 'Client\GUI\GUI_Commander_VoteMenu.sqf'";
	
	class controlsBackground {
		class CA_Background : RscText {
			x = 0.273;
			y = 0.134;
			w = 0.5;
			h = 0.8;
			colorBackground[] = cti_Background_Color;
			moving = 1;
		};
		class CA_Background_Header : CA_Background {
			x = 0.273;
			y = 0.134;
			w = 0.5;
			h = 0.06;
			colorBackground[] = cti_Background_Color_Header;
		};
		class CA_Background_Footer : CA_Background {
			x = 0.273;
			y = 0.134 + 0.76;
			w = 0.5;
			h = 0.04;
			colorBackground[] = cti_Background_Color_Sub;
		};
		class CA_Menu_Title : RscText_Title {
			x = 0.28;
			y = 0.134 + 0.01;
			w = 0.5;
			text = $STR_WF_VOTING_Title;
			colorText[] = cti_Menu_Title_Color;
		};
		class CA_Quit_Button: RscButton_Main {
			x = 0.273 + 0.45;
			y = 0.134 + 0.0075;
			w = 0.045;
			h = 0.045;
			text = "X";
			shadow = 2;
			sizeEx = 0.03;
			
			onButtonClick = "closeDialog 0;";
		};
	};
	
	class controls {
		class CA_Vote_List : RscListnBox {
			idc = 509100;
			x = 0.28;
			y = 0.134 + 0.07;
			w = 0.489;
			h = 0.6;
			columns[] = {0.01};
			
			colorSelectBackground[] = cti_Menu_ListBox_Select_Color;
			colorSelectBackground2[] = cti_Menu_ListBox_Select_Color;
			
			onLBSelChanged = "cti_MenuAction = 1";
		};

		class CA_Set_New_Commander : RscButton_Main {
			idc = 509101;
			x = 0.28;
			y = 0.85;
			w = 0.489;
			h = 0.035;
			sizeEx = 0.035;
			text = $STR_WF_SetNewCommander;
			action = "cti_MenuAction = 2";
		};		
	};
};
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- WF3 Respawn menu.
class cti_RespawnMenu {
	movingEnable = 1;
	idd = 511000;
	onLoad = "(_this) ExecVM 'Client\GUI\GUI_RespawnMenu.sqf'";
	
	class controlsBackground {
		class CA_Background : RscText {
			x = 0;
			y = 0;
			w = 1;
			h = 1;
			colorBackground[] = cti_Background_Color;
			moving = 1;
		};
		class CA_Background_Header : CA_Background {
			x = 0;
			y = 0;
			w = 1;
			h = 0.06;
			colorBackground[] = cti_Background_Color_Header;
		};
		class CA_Background_Footer : CA_Background {
			x = 0;
			y = 0.96;
			w = 1;
			h = 0.04;
			colorBackground[] = cti_Background_Color_Sub;
		};
		class CA_Menu_Title : RscText_Title {
			x = 0.007;
			y = 0.01;
			w = 0.5;
			text = $STR_WF_RESPAWN_Title;
			colorText[] = cti_Menu_Title_Color;
		};
		class CA_Quit_Button: RscButton_Main {
			x = 0.95;
			y = 0.0075;
			w = 0.045;
			h = 0.045;
			text = "X";
			shadow = 2;
			sizeEx = 0.03;
			
			onButtonClick = "closeDialog 0;";
		};
	};
	
	class controls {
		class WF_MiniMap : RscMapControl {
			idc = 511001;
			x = 0.01;
			y = 0.07;
			w = 0.98;
			h = 0.8;
			ShowCountourInterval = 1;
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)";
			onMouseButtonDown = "mouseButtonDown = _this select 1;";
			onMouseButtonUp = "mouseButtonUp = _this select 1;";
		};
		class CA_RespawnDetails : RscStructuredText {
			idc = 511002;
			x = 0.01;
			y = 0.965;
			w = 0.49;
			h = 0.13;
			
			size = 0.0275;
			shadow = 2;
		};
		class CA_RespawnDelay : CA_RespawnDetails {
			idc = 511003;
			x = 0.5;
			w = 0.49;
			h = 0.13;
		};
		class CA_Gear_Button : RscButton {
			idc = 511004;
			x = 0.68;
			y = 0.00940119;
			w = 0.25;
			sizeEx = 0.03221;
			
			colorBackground[] = cti_Menu_Button_Sub_Color;
			colorBackgroundActive[] = cti_Menu_Button_Sub_Color;
			colorFocused[] = cti_Menu_Button_Sub_Focused_Color;
			
			tooltip = $STR_WF_TOOLTIP_RespawnDefault;
			onButtonClick = "cti_MenuAction = 1;";
		};
	};
};
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- WF3 Funds Menu.
class cti_TransferMenu {
	movingEnable = 1;
	idd = 505000;
	onLoad = "(_this) ExecVM 'Client\GUI\GUI_TransferMenu.sqf'";
	
	class controlsBackground {
		class CA_Background : RscText {
			x = 0;
			y = 0;
			w = 0.8;
			h = 0.6;
			colorBackground[] = cti_Background_Color;
			moving = 1;
		};
		class CA_Background_Header : CA_Background {
			x = 0;
			y = 0;
			w = 0.8;
			h = 0.06;
			colorBackground[] = cti_Background_Color_Header;
		};
		class CA_Background_Footer : CA_Background {
			x = 0;
			y = 0.56;
			w = 0.8;
			h = 0.04;
			colorBackground[] = cti_Background_Color_Sub;
		};
		class CA_Menu_Title : RscText_Title {
			x = 0.007;
			y = 0.01;
			w = 0.5;
			text = $STR_WF_MAIN_FundsMenu;
			colorText[] = cti_Menu_Title_Color;
		};
		class CA_Quit_Button: RscButton_Main {
			x = 0.75;
			y = 0.0075;
			w = 0.045;
			h = 0.045;
			text = "X";
			shadow = 2;
			sizeEx = 0.03;
			
			onButtonClick = "closeDialog 0;";
		};
		class CA_Menu_Details : RscText {
			x = 0.405;
			y = 0.075;
			w = 0.385;
			h = 0.18;
			colorBackground[] = {0.5, 0.5, 0.5, 0.15};
			style = ST_TEXT_BG;
		};
		class CA_Edit_BG : RscText {
			x = 0.415;
			y = 0.165;
			w = 0.15;
			colorBackground[] = cti_Background_Color_Header;
		};
	};
	
	class controls {
		class CA_TransferList : RscListnBox {
			idc = 505001;
			x = 0.000983551;
			y = 0.065;
			w = 0.4;
			h = 0.488;
			columns[] = {0.01, 0.3, 0.75};
			rowHeight = 0.03;
			colorDisabled[] = {1,1,1,0.3};
			onLBDblClick = "cti_MenuAction = 1";
		};
		class CA_Send : RscButton_Main {
			x = 0.595;
			y = 0.562;
			w = 0.2;
			h = 0.035;
			sizeEx = 0.035;
			text = $STR_WF_Send;
			action = "cti_MenuAction = 1";
		};
		class CA_AmountDetails : RscText {
			x = 0.415;
			y = 0.08;
			w = 0.2;
			sizeEx = 0.030;
			text = $STR_WF_Amount;
		};
		class CA_Funds_Slider : RscXSliderH {
			idc = 505002;
			x = 0.415;
			y = 0.12;
			w = 0.365;
			h = 0.029412;
			
			onSliderPosChanged = "cti_MenuAction = 2";
		};
		class CA_Funds_Edit : RscEdit {
			idc = 505003;
			x = 0.415;
			y = 0.165;
			w = 0.15;
			text = "0";
			sizeEx = 0.035;
			colorDisabled[] = {1,1,1,0.3};
		};
		class CA_Funds : RscStructuredText {
			idc = 505004;
			x = 0.415;
			y = 0.21;
			w = 0.3;
			h = 0.035;
			size = 0.03;
			
			colorText[] = {0.543, 0.5742, 0.4102, 1.0};
		};
	};
};

//--- WF3 Gear Menu.
class cti_BuyGearMenu 
{
	movingEnable = 0;
	idd = 503000;
	
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_gear', _this select 0];['onLoad'] execVM 'Client\GUI\GUI_WFGear.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_gear', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
	
	
	class controlsBackground {
		class cti_Background : RscTextGear {
			x = "SafeZoneX";
			y = "SafeZoneY";
			w = "SafeZoneW";
			h = "SafeZoneH";
			
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 0;
		};
		class cti_Background_Header : cti_Background {
			x = "SafeZoneX";
			y = "SafeZoneY";
			w = "SafeZoneW";
			h = "SafeZoneH * 0.06";
			
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class cti_Background_Footer : cti_Background {
			x = "SafeZoneX";
			y = "SafeZoneY + (SafezoneH * 0.96)";
			w = "SafeZoneW";
			h = "SafeZoneH * 0.04";
			
			colorBackground[] = {0, 0, 0, 0.3};
		};
		class cti_Menu_Title : RscTextGear {
			x = "SafeZoneX + (SafeZoneW * 0.007)";
			y = "SafeZoneY + (SafezoneH * 0.01)";
			w = "SafeZoneW * 0.5";
			h = "SafeZoneH * 0.037";
			
			text = "Gear Purchase Menu :";
			colorText[] = {0.258823529, 0.713725490, 1, 1};
			
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class cti_Background_Gear : RscTextGear {
			x = "SafeZoneX + (SafeZoneW * 0.4)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.6";
			h = "SafeZoneH * 0.9";
			
			colorBackground[] = {0.5, 0.5, 0.5, 0.15};
		};
		class cti_Menu_Icons_Frame : RscFrameGear {
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			// x = "SafeZoneX + (SafeZoneW * 0.028)";
			y = "SafeZoneY + (SafezoneH * 0.07)";
			// w = "SafeZoneW * 0.344";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.08";
		};
		class cti_Menu_Icons_Background : RscTextGear {
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.07)";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.08";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		
		class cti_Menu_ComboTarget_Frame : RscFrameGear {
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.17)";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.055";
		};
		class cti_Menu_ComboTarget_Background : cti_Menu_Icons_Background {
			y = "SafeZoneY + (SafezoneH * 0.17)";
			h = "SafeZoneH * 0.055";
		};
		class cti_Menu_ComboTarget_Label : RscTextGear {
			x = "SafeZoneX + (SafeZoneW * 0.02)";
			y = "SafeZoneY + (SafezoneH * 0.18)";
			w = "SafeZoneW * 0.1";
			h = "SafeZoneH * 0.035";
			
			text = "Target :";
			
			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		
		class cti_Menu_ShopList_Frame : RscFrameGear {
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.245)";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.48";
		};
		/*place used for info now
		class cti_Menu_LinkedList_Frame : RscFrameGear {
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.745)";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.2";
		};
		*/
		class cti_Menu_ShopList_Background : cti_Menu_ComboTarget_Background {
			y = "SafeZoneY + (SafezoneH * 0.245)";
			h = "SafeZoneH * 0.48";
		};
		class cti_Menu_MagsList_Background : cti_Menu_ComboTarget_Background {
			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.545)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.395";
		};
	};
	
	class controls {
		//--- Interactive background controls
		class cti_Gear_Container_Uniform : RscTextGear {
			idc = 77001;
			
			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.07)";
			w = "SafeZoneW * 0.09";
			h = "SafeZoneH * 0.112";
			
			colorBackground[] = {1, 1, 1, 0.15};
		};
		class cti_Gear_Container_Vest : cti_Gear_Container_Uniform {
			idc = 77002;
			
			x = "SafeZoneX + (SafeZoneW * 0.505)";
		};
		class cti_Gear_Container_Backpack : cti_Gear_Container_Uniform {
			idc = 77003;
			
			x = "SafeZoneX + (SafeZoneW * 0.60)";
		};
		class cti_Gear_Container_Helm : cti_Gear_Container_Uniform {
			idc = 77004;
			
			x = "SafeZoneX + (SafeZoneW * 0.70)";
			w = "SafeZoneW * 0.07";
			h = "SafeZoneH * 0.09";
		};
		class cti_Gear_Container_Glasses : cti_Gear_Container_Helm {
			idc = 77005;
			
			x = "SafeZoneX + (SafeZoneW * 0.774)";
		};
		class cti_Gear_Container_NVGoggles : cti_Gear_Container_Helm {
			idc = 77006;
			
			x = "SafeZoneX + (SafeZoneW * 0.847)";
		};
		class cti_Gear_Container_Binoculars : cti_Gear_Container_Helm {
			idc = 77007;
			
			x = "SafeZoneX + (SafeZoneW * 0.921)";
		};
		class cti_Gear_Container_Map : cti_Gear_Container_Uniform {
			idc = 77008;
			
			x = "SafeZoneX + (SafeZoneW * 0.70)";
			y = "SafeZoneY + (SafezoneH * 0.17)";
			w = "SafeZoneW * 0.056";
			h = "SafeZoneH * 0.07";
		};
		class cti_Gear_Container_GPS : cti_Gear_Container_Map {
			idc = 77009;
			
			x = "SafeZoneX + (SafeZoneW * 0.759)";
		};
		class cti_Gear_Container_Radio : cti_Gear_Container_Map {
			idc = 77010;
			
			x = "SafeZoneX + (SafeZoneW * 0.818)";
		};
		class cti_Gear_Container_Compass : cti_Gear_Container_Map {
			idc = 77011;
			
			x = "SafeZoneX + (SafeZoneW * 0.877)";
		};
		class cti_Gear_Container_Clock : cti_Gear_Container_Map {
			idc = 77012;
			
			x = "SafeZoneX + (SafeZoneW * 0.936)";
		};
		
		class cti_Gear_Container_Primary : cti_Gear_Container_Uniform {
			idc = 77013;
			
			x = "SafeZoneX + (SafeZoneW * 0.70)";
			y = "SafeZoneY + (SafezoneH * 0.25)";
			w = "SafeZoneW * 0.29";
			h = "SafeZoneH * 0.09";
		};		
		class cti_Gear_Container_Primary_Muzzle : cti_Gear_Container_Map { // wasp
			idc = 77014;
			
			x = "SafeZoneX + (SafeZoneW * 0.70)";
			y = "SafeZoneY + (SafezoneH * 0.345)";
			w = "SafeZoneW * 0.054";
		};
		class cti_Gear_Container_Primary_Flashlight : cti_Gear_Container_Primary_Muzzle {
			idc = 77015;
			
			x = "SafeZoneX + (SafeZoneW * 0.7565)";
		};
		class cti_Gear_Container_Primary_Optics : cti_Gear_Container_Primary_Muzzle {
			idc = 77016;
			
			x = "SafeZoneX + (SafeZoneW * 0.813)";
			w = "SafeZoneW * 0.064";
		};
                class cti_Gear_Container_Primary_Bipod : cti_Gear_Container_Primary_Muzzle {
			idc = 77017;
			
			x = "SafeZoneX + (SafeZoneW * 0.8795)";
		};
		class cti_Gear_Container_Primary_CurrentMagazine : cti_Gear_Container_Primary_Muzzle {
			idc = 77901;
			
			x = "SafeZoneX + (SafeZoneW * 0.936)";
		};
		
		class cti_Gear_Container_Secondary : cti_Gear_Container_Primary {
			idc = 77018;
			
			x = "SafeZoneX + (SafeZoneW * 0.70)";
			y = "SafeZoneY + (SafezoneH * 0.42)";
		};
		class cti_Gear_Container_Secondary_Muzzle : cti_Gear_Container_Map {
			idc = 77019;
			
			x = "SafeZoneX + (SafeZoneW * 0.70)";
			y = "SafeZoneY + (SafezoneH * 0.515)";
			w = "SafeZoneW * 0.06775";
		};
		class cti_Gear_Container_Secondary_Flashlight : cti_Gear_Container_Secondary_Muzzle {
			idc = 77020;
			
			x = "SafeZoneX + (SafeZoneW * 0.77375)";
		};
		class cti_Gear_Container_Secondary_Optics : cti_Gear_Container_Secondary_Muzzle {
			idc = 77021;
			
			x = "SafeZoneX + (SafeZoneW * 0.848)";
		};
        class cti_Gear_Container_Secondary_Bipod : cti_Gear_Container_Secondary_Muzzle {
			idc = 77022;
			
			x = "SafeZoneX + (SafeZoneW * 0.8515)+100";
		};
		class cti_Gear_Container_Secondary_CurrentMagazine : cti_Gear_Container_Secondary_Muzzle {
			idc = 77902;
			
			x = "SafeZoneX + (SafeZoneW * 0.92225)";
		};
		
		class cti_Gear_Container_Pistol : cti_Gear_Container_Primary {
			idc = 77023;
			x = "SafeZoneX + (SafeZoneW * 0.70)";
			y = "SafeZoneY + (SafezoneH * 0.595)";
		};
		class cti_Gear_Container_Pistol_Muzzle : cti_Gear_Container_Map {
			idc = 77024;
			
			x = "SafeZoneX + (SafeZoneW * 0.70)";
			y = "SafeZoneY + (SafezoneH * 0.695)";
			w = "SafeZoneW * 0.06775";
		};
		class cti_Gear_Container_Pistol_Flashlight : cti_Gear_Container_Pistol_Muzzle {
			idc = 77025;
			
			x = "SafeZoneX + (SafeZoneW * 0.77375)";
		};
		class cti_Gear_Container_Pistol_Optics : cti_Gear_Container_Pistol_Muzzle {
			idc = 77026;
			
			x = "SafeZoneX + (SafeZoneW * 0.848)";
		};
                class cti_Gear_Container_Pistol_Bipod : cti_Gear_Container_Pistol_Muzzle {
			idc = 77027;
			
			x = "SafeZoneX + (SafeZoneW * 0.8515)+100";
		};
		class cti_Gear_Container_Pistol_CurrentMagazine : cti_Gear_Container_Pistol_Muzzle {
			idc = 77903;
			
			x = "SafeZoneX + (SafeZoneW * 0.92225)";
		};
		
		
		class cti_Gear_Container_Items_Unit : cti_Gear_Container_Pistol_Muzzle {
			idc = 77109;
			
			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.25)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.28";
		};
		
		//--- Actual controls
		class cti_Gear_Control_Items_Purchase : RscListNBoxGear {
			idc = 70108;
			
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.245)";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.48";
			
			rowHeight = "1.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.26, 0.001};
			
			canDrag = 1;
			
			onLBDblClick = "['onShoppingListLBDblClick', _this select 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrag = "['onShoppingListLBDrag', _this select 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBSelChanged = "['onShoppingListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Linked_Items : cti_Gear_Control_Items_Purchase {
			idc = 70601;
			
			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.545)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.395";
			
			onLBDblClick = "['onLinkedListLBDblClick', _this select 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrag = "['onShoppingListLBDrag', _this select 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBSelChanged = "['onLinkedListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";

			
			//onLBSelChanged = "";
		};
		
		class cti_Gear_Control_Items_Unit : RscListNBoxGear {
			idc = 70109;
			
			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.25)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.28";
			
			rowHeight = "1.65 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			
			
			itemSpacing = 0.001;
			columns[] = {0.01, 0.4};
			
			onLBDblClick = "['onUnitItemsLBDblClick', _this select 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'ListItems', 77109, ((_this select 4) select 0) select 2, -1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		
		class cti_Gear_Control_Uniform: RscActiveTextGear {
			idc = 70001;
			
			style = ST_KEEP_ASPECT_RATIO;
			soundDoubleClick[] = {"",0.1,1};
			
			colorBackground[] = {0.6, 0.83, 0.47, 1};
			colorBackgroundSelected[] = {0.6, 0.83, 0.47, 1};
			colorFocused[] = {0, 0, 0, 0};
			color[] = {0.85, 0.85, 0.85, 1};
			colorText[] = {0.85, 0.85, 0.85, 1};
			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1,1,1,0.3};
			
			canDrag = 1;
			
			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.07)";
			w = "SafeZoneW * 0.09";
			h = "SafeZoneH * 0.112";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_uniform_gs.paa";
			action = "['onItemContainerClicked', 0, 77001] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onMouseButtonDown = "['onItemContainerMouseClicked', 0, 70001, _this select 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onMouseButtonDblClick = "['onItemContainerMouseDblClicked', 0] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Container', 77001, ((_this select 4) select 0) select 2, 0] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Vest: cti_Gear_Control_Uniform {
			idc = 70002;
			
			x = "SafeZoneX + (SafeZoneW * 0.505)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa";
			action = "['onItemContainerClicked', 1, 77002] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onMouseButtonDown = "['onItemContainerMouseClicked', 1, 70002, _this select 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onMouseButtonDblClick = "['onItemContainerMouseDblClicked', 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Container', 77002, ((_this select 4) select 0) select 2, 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Backpack: cti_Gear_Control_Uniform {
			idc = 70003;
			
			x = "SafeZoneX + (SafeZoneW * 0.60)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_backpack_gs.paa";
			action = "['onItemContainerClicked', 2, 77003] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onMouseButtonDown = "['onItemContainerMouseClicked', 2, 70003, _this select 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onMouseButtonDblClick = "['onItemContainerMouseDblClicked', 2] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Container', 77003, ((_this select 4) select 0) select 2, 2] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Helm: cti_Gear_Control_Uniform {
			idc = 70004;
			
			x = "SafeZoneX + (SafeZoneW * 0.70)";
			w = "SafeZoneW * 0.07";
			h = "SafeZoneH * 0.09";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa";
			action = "['onAccessoryClicked', 0, 70004, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'HeadAsset', 77004, ((_this select 4) select 0) select 2, [2,0]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onMouseButtonDown = "";
			onMouseButtonDblClick = "";
		};
		class cti_Gear_Control_Glasses: cti_Gear_Control_Helm {
			idc = 70005;
			
			x = "SafeZoneX + (SafeZoneW * 0.774)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_glasses_gs.paa";
			action = "['onAccessoryClicked', 1, 70005, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_glasses_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'HeadAsset', 77005, ((_this select 4) select 0) select 2, [2,1]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_NVGoggles: cti_Gear_Control_Helm {
			idc = 70006;
			
			x = "SafeZoneX + (SafeZoneW * 0.847)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_nvg_gs.paa";
			action = "['onItemClicked', [0,0], 70006, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_nvg_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Item', 77006, ((_this select 4) select 0) select 2, [3,0,0]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Binoculars: cti_Gear_Control_Helm {
			idc = 70007;
			
			x = "SafeZoneX + (SafeZoneW * 0.921)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_binocular_gs.paa";
			action = "['onItemClicked', [0,1], 70007, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_binocular_gs.paa', [3,1]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Item', 77007, ((_this select 4) select 0) select 2, [3,0,1]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Map: cti_Gear_Control_Uniform {
			idc = 70008;
			
			x = "SafeZoneX + (SafeZoneW * 0.70)";
			y = "SafeZoneY + (SafezoneH * 0.17)";
			w = "SafeZoneW * 0.056";
			h = "SafeZoneH * 0.07";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_map_gs.paa";
			action = "['onItemClicked', [1,0], 70008, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_map_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Item', 77008, ((_this select 4) select 0) select 2, [3,1,0]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onMouseButtonDown = "";
			onMouseButtonDblClick = "";
		};
		class cti_Gear_Control_GPS: cti_Gear_Control_Map {
			idc = 70009;
			
			x = "SafeZoneX + (SafeZoneW * 0.759)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_gps_gs.paa";
			action = "['onItemClicked', [1,1], 70009, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_gps_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Item', 77009, ((_this select 4) select 0) select 2, [3,1,1]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Radio: cti_Gear_Control_Map {
			idc = 70010;
			
			x = "SafeZoneX + (SafeZoneW * 0.818)";
		
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_radio_gs.paa";
			action = "['onItemClicked', [1,2], 70010, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_radio_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Item', 77010, ((_this select 4) select 0) select 2, [3,1,2]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Compass: cti_Gear_Control_Map {
			idc = 70011;
			
			x = "SafeZoneX + (SafeZoneW * 0.877)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_compass_gs.paa";
			action = "['onItemClicked', [1,3], 70011, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_compass_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Item', 77011, ((_this select 4) select 0) select 2, [3,1,3]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Clock: cti_Gear_Control_Map {
			idc = 70012;
			
			x = "SafeZoneX + (SafeZoneW * 0.936)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_watch_gs.paa";
			action = "['onItemClicked', [1,4], 70012, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_watch_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Item', 77012, ((_this select 4) select 0) select 2, [3,1,4]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		
		class cti_Gear_Control_Primary: cti_Gear_Control_Uniform {
			idc = 70013;
			
			x = "SafeZoneX + (SafeZoneW * 0.71)";
			y = "SafeZoneY + (SafezoneH * 0.25)";
			
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.09";
			colorDisabled[] = {1,1,1,0.3};

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_primary_gs.paa";
			action = "['onWeaponClicked', 0] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Weapon', 77013, ((_this select 4) select 0) select 2, 0] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onMouseButtonDown = "";
			onMouseButtonDblClick = "";
		};
		class cti_Gear_Control_Primary_Muzzle: cti_Gear_Control_Map { // wasp
			idc = 70014;
			
			x = "SafeZoneX + (SafeZoneW * 0.70)";
			y = "SafeZoneY + (SafezoneH * 0.345)";
			w = "SafeZoneW * 0.054";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
			action = "['onWeaponAccessoryClicked', 0, 0, 70014, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77014, ((_this select 4) select 0) select 2, [0,0,1,0]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Primary_Side: cti_Gear_Control_Primary_Muzzle {
			idc = 70015;
			
			x = "SafeZoneX + (SafeZoneW * 0.7565)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa";
			action = "['onWeaponAccessoryClicked', 0, 1, 70015, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77015, ((_this select 4) select 0) select 2, [0,0,1,1]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Primary_Optics: cti_Gear_Control_Primary_Muzzle {
			idc = 70016;
			
			x = "SafeZoneX + (SafeZoneW * 0.82)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
			action = "['onWeaponAccessoryClicked', 0, 2, 70016, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77016, ((_this select 4) select 0) select 2, [0,0,1,2]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
        class cti_Gear_Control_Primary_Bipod: cti_Gear_Control_Primary_Muzzle {
			idc = 70017;
			
			x = "SafeZoneX + (SafeZoneW * 0.8795)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa";
			action = "['onWeaponAccessoryClicked', 0, 3, 70017, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77017, ((_this select 4) select 0) select 2, [0,0,1,3]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Primary_CurrentMagazine: cti_Gear_Control_Primary_Muzzle {
			idc = 70901;
			
			x = "SafeZoneX + (SafeZoneW * 0.936)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
			action = "['onWeaponCurrentMagazineClicked', 0, 70901] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'CurrentMagazine', 77901, ((_this select 4) select 0) select 2, 0] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			//onLBDrop = "['onShoppingListLBDrop', 'CurrentMagazine', 77901, ((_this select 4) select 0) select 2, [0,0,1,4]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		
		};
		
		class cti_Gear_Control_Secondary: cti_Gear_Control_Primary {
			idc = 70018;
			
			x = "SafeZoneX + (SafeZoneW * 0.71)";
			y = "SafeZoneY + (SafezoneH * 0.42)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_secondary_gs.paa";
			action = "['onWeaponClicked', 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Weapon', 77018, ((_this select 4) select 0) select 2, 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Secondary_Muzzle: cti_Gear_Control_Map {
			idc = 70019;
			
			x = "SafeZoneX + (SafeZoneW * 0.705)";
			y = "SafeZoneY + (SafezoneH * 0.52)";
			w = "SafeZoneW * 0.06775";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
			action = "['onWeaponAccessoryClicked', 1, 0, 70019, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77019, ((_this select 4) select 0) select 2, [0,1,1,0]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Secondary_Side: cti_Gear_Control_Secondary_Muzzle {
			idc = 70020;
			
			x = "SafeZoneX + (SafeZoneW * 0.775)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa";
			action = "['onWeaponAccessoryClicked', 1, 1, 70020, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77020, ((_this select 4) select 0) select 2, [0,1,1,1]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Secondary_Optics: cti_Gear_Control_Secondary_Muzzle {
			idc = 70021;
			
			x = "SafeZoneX + (SafeZoneW * 0.845)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
			action = "['onWeaponAccessoryClicked', 1, 2, 70021, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77021, ((_this select 4) select 0) select 2, [0,1,1,2]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
        class cti_Gear_Control_Secondary_Bipod: cti_Gear_Control_Secondary_Muzzle {
			idc = 70022;
			
			x = "SafeZoneX + (SafeZoneW * 0.845)+100";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa";
			action = "['onWeaponAccessoryClicked', 1, 3, 70022, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77022, ((_this select 4) select 0) select 2, [0,1,1,3]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Secondary_CurrentMagazine: cti_Gear_Control_Secondary_Muzzle {
			idc = 70902;
			
			x = "SafeZoneX + (SafeZoneW * 0.92)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
			action = "['onWeaponCurrentMagazineClicked', 1, 70902] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'CurrentMagazine', 77902, ((_this select 4) select 0) select 2, 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		
		class cti_Gear_Control_Pistol: cti_Gear_Control_Primary {
			idc = 70023;
					
			x = "SafeZoneX + (SafeZoneW * 0.70)";
			y = "SafeZoneY + (SafezoneH * 0.595)";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_hgun_gs.paa";
			action = "['onWeaponClicked', 2] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Weapon', 77023, ((_this select 4) select 0) select 2, 2] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Pistol_Muzzle: cti_Gear_Control_Map {
			idc = 70024;
			
			x = "SafeZoneX + (SafeZoneW * 0.705)";
			y = "SafeZoneY + (SafezoneH * 0.695)";
			w = "SafeZoneW * 0.06775";

			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
			action = "['onWeaponAccessoryClicked', 2, 0, 70024, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77024, ((_this select 4) select 0) select 2, [0,2,1,0]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Pistol_Side: cti_Gear_Control_Pistol_Muzzle {
			idc = 70025;
			
			x = "SafeZoneX + (SafeZoneW * 0.775)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa";
			action = "['onWeaponAccessoryClicked', 2, 1, 70025, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77025, ((_this select 4) select 0) select 2, [0,2,1,1]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Pistol_Optics: cti_Gear_Control_Pistol_Muzzle {
			idc = 70026;
			
			x = "SafeZoneX + (SafeZoneW * 0.845)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
			action = "['onWeaponAccessoryClicked', 2, 2, 70026, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77026, ((_this select 4) select 0) select 2, [0,2,1,2]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
                class cti_Gear_Control_Pistol_Bipod: cti_Gear_Control_Pistol_Muzzle {
			idc = 70027;
			
			x = "SafeZoneX + (SafeZoneW * 0.845)+100";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa";
			action = "['onWeaponAccessoryClicked', 2, 3, 70027, '\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'Accessory', 77027, ((_this select 4) select 0) select 2, [0,2,1,3]] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Pistol_CurrentMagazine: cti_Gear_Control_Pistol_Muzzle {
			idc = 70903;
			
			x = "SafeZoneX + (SafeZoneW * 0.92)";
			
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
			action = "['onWeaponCurrentMagazineClicked', 2, 70903] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
			onLBDrop = "['onShoppingListLBDrop', 'CurrentMagazine', 77903, ((_this select 4) select 0) select 2, 2] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Combo_Target : RscComboGear {
			idc = 70201;

			x = "SafeZoneX + (SafeZoneW * 0.15)";
			y = "SafeZoneY + (SafezoneH * 0.18)";
			w = "SafeZoneW * 0.235";
			h = "SafeZoneH * 0.037";
			
			onLBSelChanged = "['onUnitLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		
		class cti_Gear_Uniform_Progress_Load : RscProgressGear {
			idc = 70301;
			
			style = 0;
			texture = "";
			textureExt = "";
			colorBar[] = {0.9,0.9,0.9,0.9};
			colorExtBar[] = {1,1,1,1};
			colorFrame[] = {1,1,1,1};
			
			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.183)";
			w = "SafeZoneW * 0.09";
			h = "SafeZoneH * 0.016";
		};
		class cti_Gear_Vest_Progress_Load : cti_Gear_Uniform_Progress_Load {
			idc = 70302;
			
			x = "SafeZoneX + (SafeZoneW * 0.505)";
		};
		class cti_Gear_Backpack_Progress_Load : cti_Gear_Uniform_Progress_Load {
			idc = 70303;
			
			x = "SafeZoneX + (SafeZoneW * 0.60)";
		};
		
		class cti_Icon_Primary : RscActiveTextGear {
			idc = 70501;
			style = ST_KEEP_ASPECT_RATIO;
			x = "SafeZoneX + (SafeZoneW * 0.028)";
			y = "SafeZoneY + (SafezoneH * 0.07)";
			w = "SafeZoneW * 0.043";
			h = "SafeZoneH * 0.08";
			
			color[] = {0.75,0.75,0.75,0.7};
			colorActive[] = {1,1,1,0.7};
			colorBackground[] = {0.6, 0.8392, 0.4706, 0.7};
			colorBackgroundSelected[] = {0.6, 0.8392, 0.4706, 0.7};
			colorFocused[] = {0.0, 0.0, 0.0, 0};
			colorDisabled[] = {1,1,1,0.3};
			
			text = "Rsc\Pictures\icon_wf_gear_primary.paa";
			action = "['onShoppingTabClicked', cti_GEAR_TAB_PRIMARY] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Icon_Secondary : cti_Icon_Primary {
			idc = 70502;
			x = "SafeZoneX + (SafeZoneW * 0.071)";
			
			text = "Rsc\Pictures\icon_wf_gear_secondary.paa";
			action = "['onShoppingTabClicked', cti_GEAR_TAB_SECONDARY] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Icon_Handgun : cti_Icon_Primary {
			idc = 70503;
			x = "SafeZoneX + (SafeZoneW * 0.114)";
			
			text = "Rsc\Pictures\icon_wf_gear_handgun.paa";
			action = "['onShoppingTabClicked', cti_GEAR_TAB_HANDGUN] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Icon_Accessories : cti_Icon_Primary {
			idc = 70504;
			x = "SafeZoneX + (SafeZoneW * 0.157)";
			
			text = "Rsc\Pictures\icon_wf_gear_accessories.paa";
			action = "['onShoppingTabClicked', cti_GEAR_TAB_ACCESSORIES] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Icon_Ammunitions : cti_Icon_Primary {
			idc = 70505;
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			
			text = "Rsc\Pictures\icon_wf_gear_ammunition.paa";
			action = "['onShoppingTabClicked', cti_GEAR_TAB_AMMO] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Icon_Misc : cti_Icon_Primary {
			idc = 70506;
			x = "SafeZoneX + (SafeZoneW * 0.243)";
			
			text = "Rsc\Pictures\icon_wf_gear_miscellaneous.paa";
			action = "['onShoppingTabClicked', cti_GEAR_TAB_MISC] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Icon_Equipment : cti_Icon_Primary {
			idc = 70507;
			x = "SafeZoneX + (SafeZoneW * 0.286)";
			
			text = "Rsc\Pictures\icon_wf_gear_equipment.paa";
			action = "['onShoppingTabClicked', cti_GEAR_TAB_EQUIPMENT] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Icon_Template : cti_Icon_Primary {
			idc = 70508;
			x = "SafeZoneX + (SafeZoneW * 0.329)";
			
			text = "Rsc\Pictures\icon_wf_building_barracks.paa";
			action = "['onShoppingTabClicked', cti_GEAR_TAB_TEMPLATES] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		
		class cti_Gear_Control_CreateTemplate : RscButtonGear {
			idc = 70401;
			
			x = "SafeZoneX + (SafeZoneW * 0.70)";
			y = "SafeZoneY + (SafezoneH * 0.80)";
			w = "SafeZoneW * 0.29";
			h = "SafeZoneH * 0.04";
			
			text = "Create Template";
			tooltip = "Create a template of the current gear setup";
			action = "['onTemplateCreation'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_DeleteTemplate : cti_Gear_Control_CreateTemplate {
			idc = 70402;
			
			y = "SafeZoneY + (SafezoneH * 0.851)";
			
			text = "Delete Template";
			tooltip = "Remove an existing template";
			action = "['onTemplateDeletion', lnbCurSelRow 70108] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Buy : cti_Gear_Control_CreateTemplate {
			idc = 70403;
			
			y = "SafeZoneY + (SafezoneH * 0.903)";
			
			text = "Buy";
			tooltip = "Purchase the current gear setup";
			action = "['onPurchase'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Menu_Control_Info : RscStructuredTextGear {
			idc = 70028;
			x = "SafeZoneX + (SafeZoneW * 0.41)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.03";
			
			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class cti_Gear_Control_Clear : RscButton_LesserGear {
			idc = 70029;
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.96)";
			w = "SafeZoneW * 0.185";
			h = "SafeZoneH * 0.04";
			
			text = "Clear";
			tooltip = "Clear the gear of the existing target";
			action = "['onInventoryClear'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Gear_Control_Reload : cti_Gear_Control_Clear {
			idc = 70030;
			x = "SafeZoneX + (SafeZoneW * 0.205)";
			
			text = "Reload";
			tooltip = "Reload the last purchased gear for this target";
			action = "['onInventoryReload'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'";
		};
		class cti_Control_Exit : RscButtonGear {
			idc = 22555;
			
			x = "SafeZoneX + (SafeZoneW * 0.95)";
			y = "SafeZoneY + (SafezoneH * 0.01)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";
			
			text = "X";
			action = "closeDialog 0";
		};
	
	
	
	//info ADD
	
	
	class CTI_Menu_Stats_background: RscText
		{
			idc = 1007;
			
			/*
			x = 0.01 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.38 * safezoneW;
			h = 0.19 * safezoneH;
			*/
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.745)";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.2";
			
			
			colorBackground[] = {0.5,0.5,0.5,0.25};
		};
		class CTI_Menu_Stats_img: RscStructuredText
		{
			idc = 71111;
			type = UCCT_STRUCTURED_TEXT;
			style = UCST_MULTI;
			text = ""; //--- ToDo: Localize;
			
			/*
			x = 0.02 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.175 * safezoneW;
			h = 0.175 * safezoneH;
			*/
			
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.745)";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.2";
			
			
			colorBackground[] = {0,0,0,0};
		};
		class CTI_Menu_Stats_list: RscListNBox
		{
			idc = 71112;
			rowHeight = "1.1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.35,0.001};
			
			/*
			x = 0.2 * safezoneW + safezoneX;
			y = 0.25 * safezoneH + safezoneY;
			w = 0.19 * safezoneW;
			h = 0.19 * safezoneH;
			*/
			
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.745)";
			w = "SafeZoneW * 0.38";
			h = "SafeZoneH * 0.2";
			
			
			
			colorBackground[] = {0,0,0,0};
			sizeEx = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		
		
		class CTI_Gear_Control_RenameTemplateInput: RscEdit
		{
			idc = 71120;
			text = "Enter a new template name..."; //--- ToDo: Localize;
			//--- We don't want people to see it even for a split second on load
			/*
			x = 1 * safezoneW + safezoneX; //0.012 * safezoneW + safezoneX;
			y = 1 * safezoneH + safezoneY; //0.41 * safezoneH + safezoneY;
			*/
			
			x ="SafeZoneX + (SafeZoneW * 0.12)";
			
			//x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.745)";
			
			w = 0.27 * safezoneW;
			h = 0.025 * safezoneH;
		};
		/*
		
		class CTI_Gear_Control_CreateTemplate: RscButton
		{
			idc = 70401;
			text = "Create Template"; //--- ToDo: Localize;
			action = "['onTemplateCreation'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";


			x = 0.70 * safezoneW + safezoneX;
			y = 0.765 * safezoneH + safezoneY;
			w = 0.1425 * safezoneW;
			h = 0.04 * safezoneH;
			tooltip = "Create a template of the current gear setup"; //--- ToDo: Localize;
		};
		
		*/
		class CTI_Gear_Control_RenameTemplateButton: RscButtonGear
		{
			idc = 71121;
			text = "Rename";
			action = "['onTemplateRename', lnbCurSelRow 70108] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_GearMenu.sqf'";
			tooltip = "";
			//--- We don't want people to see it even for a split second on load
			
			/*
			x = 1 * safezoneW + safezoneX; //0.285 * safezoneW + safezoneX;
			y = 1 * safezoneH + safezoneY; //0.4095 * safezoneH + safezoneY;
			*/
			
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.745)";
			
			w = 0.098 * safezoneW;
			h = 0.0243 * safezoneH;
		};
		
		
	
	
	
	
	
	
	};
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- Main Menu.
class WF_Menu {
	movingEnable = 1;
	idd = 11000;
	onLoad = "ExecVM ""Client\GUI\GUI_Menu.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.17467;
			y = 0.186955;
			w = 0.65066;
			h = 0.63192;
			moving = 1;
			colorBackground[] = cti_Background_Color;
		};
		class Background_H : RscText {
			x = 0.17467;
			y = 0.186955;
			w = 0.65066;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.17467;
			y = 0.766375;
			w = 0.65066;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.17467;
			y = 0.238455;
			w = 0.65066;
			h = cti_Background_Border_Thick;
			colorBackground[] = cti_Background_Border;
		};
	};
	class controls {
		class Button_A : RscShortcutButtonMain {
			idc = 11001;
			x = 0.17598;
			y = 0.250358;
			w = 0.313727;
			h = 0.104575;
			text = $STR_WF_MAIN_Purchase_Units;
			tooltip = $STR_WF_TOOLTIP_MainMenu_Purchase_Units;
			colorFocused[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundFocused[] = { 1,1,1,0 };
			action = "WF_MenuAction = 1";
		};
		class Button_B : RscShortcutButtonMain {
			idc = 11002;
			x = 0.17598;
			y = 0.35116;
			w = 0.313727;
			h = 0.104575;
			text = $STR_WF_MAIN_Purchase_Gear;
			tooltip = $STR_WF_TOOLTIP_MainMenu_Purchase_Gear;
			colorFocused[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundFocused[] = { 1,1,1,0 };
			action = "WF_MenuAction = 2";
		};
		class Button_C : RscShortcutButtonMain {
			idc = 11011;
			
			x = 0.510943;
			y = 0.35116;
			w = 0.313727;
			h = 0.104575;
			
			
			//roles menu == remote menu now
			text = $STR_WF_MAIN_RoleSelector;
			tooltip = $STR_WF_TOOLTIP_MainMenu_RoleSelectorMenu;
			colorFocused[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundFocused[] = { 1,1,1,0 };
			action = "WF_MenuAction = 14";
		};
		class Button_D : RscShortcutButtonMain {
			idc = 11004;
			x = 0.510943;
			y = 0.65356;
			w = 0.313727;
			h = 0.104575;
			text = $STR_WF_MAIN_VotingMenu;
			tooltip = $STR_WF_TOOLTIP_MainMenu_VoteForCommander;
			colorFocused[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundFocused[] = { 1,1,1,0 };
			action = "WF_MenuAction = 4";
		};
		class Button_E : RscShortcutButtonMain {
		idc = 11009;

			x = 0.17598;
			y = 0.65356;
			w = 0.313727;
			h = 0.104575;
			
			text = $STR_WF_SupportMenu;
            tooltip = $STR_WF_TOOLTIP_CommandMenu_SupportMenu;
			colorFocused[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundFocused[] = { 1,1,1,0 };
			action = "WF_MenuAction = 9";
		};
		class Button_F : RscShortcutButtonMain {
		idc = 11003;
		
			x = 0.17598;
			y = 0.451959;
			w = 0.313727;
			h = 0.104575;

		text = $STR_WF_MAIN_TeamMenu;
            tooltip = $STR_WF_TOOLTIP_MainMenu_TeamMenu;
			colorFocused[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundFocused[] = { 1,1,1,0 };
			action = "WF_MenuAction = 3";
		};		
		
		class Button_G : RscShortcutButtonMain {
		idc = 11005;
			
			x = 0.510943;
			y = 0.55276;
			w = 0.313727;
			h = 0.104575;
			
		text = $STR_WF_MAIN_CommandMenu;
            tooltip = $STR_WF_TOOLTIP_CommandMenu_Commandteam;
			colorFocused[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundFocused[] = { 1,1,1,0 };
			action = "WF_MenuAction = 5";
		};
		
		class Button_H : RscShortcutButtonMain {
		idc = 11008;			
			
			x = 0.510943;
			y = 0.250358;
			w = 0.313727;
			h = 0.104575;
						
		text = $STR_WF_MAIN_EconomyMenu;
			tooltip = $STR_WF_TOOLTIP_CommandMenu_Commander_Menu;
			colorFocused[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundFocused[] = { 1,1,1,0 };
			action = "WF_MenuAction = 8";
		};
		class Button_I : RscShortcutButtonMain {
		idc = 11006;
						
			x = 0.17598;
			y = 0.55276;
			w = 0.313727;
			h = 0.104575;
			
		text = $STR_WF_MAIN_TacticalMenu;
            tooltip = $STR_WF_TOOLTIP_CommandMenu_SpecialMenu;
			colorFocused[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundFocused[] = { 1,1,1,0 };
			action = "WF_MenuAction = 6";
		};
		
		class Button_J : RscShortcutButtonMain {
		idc = 11007;
		
			x = 0.510943;
			y = 0.451959;
			w = 0.313727;
			h = 0.104575;
			
			text = $STR_WF_MAIN_UpgradeMenu;
            tooltip = $STR_WF_TOOLTIP_CommandMenu_Upgrade_Menu;
			colorFocused[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundFocused[] = { 1,1,1,0 };
			action = "WF_MenuAction = 7";
		};
		
		class TitleMenu: RscText_Title {
			idc = 11015;
			x = 0.178164;
			y = 0.19379;
			w = 0.800001;
			sizeEx = 0.035;
		};

		class CA_Help_Button : RscClickableText {
            idc = 11012;
            x = 0.736399;
            y = 0.191982;
            w = 0.04;
            h = 0.04;
            text = "Client\Images\icon_inf.paa";
            action = "WF_MenuAction = 13";
            colorDisabled[] = {1,1,1,0.3};
            tooltip = $STR_WF_TOOLTIP_CommandMenu_Help;
        };

		class CA_PA_Button : RscClickableText {
			idc = 11012;
			x = 0.776399;
			y = 0.191982;
			w = 0.04;
			h = 0.04;
			//text = "Client\Images\icon_inf.paa";
			text = "Client\Images\icon_wf_param_list.paa";
			action = "WF_MenuAction = 12";
			colorDisabled[] = {1,1,1,0.3};
			tooltip = $STR_WF_TOOLTIP_Parameter;
		};
		class CA_UN_Button : RscClickableText {
			idc = 11013;
			x = 0.194088;
			y = 0.767144;
			w = 0.045;
			h = 0.045;
			text = "Client\Images\icon_turn_the_car.paa";
			action = "WF_MenuAction = 10";
			colorDisabled[] = {1,1,1,0.3};
			tooltip = $STR_WF_TOOLTIP_Unflip;
		};
		class CA_HB_Button : RscClickableText {
			idc = 11014;
			x = 0.265514;
			y = 0.766938;
			w = 0.045;
			h = 0.045;
			text = "Client\Images\UI_Time.paa";
			action = "WF_MenuAction = 11";
			colorDisabled[] = {1,1,1,0.3};
			tooltip = $STR_WF_TOOLTIP_HeadBugFix;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.778103;
			y = 0.769671;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- Team Menu.
class RscMenu_Team {
	movingEnable = 1;
	idd = 13000;
	onLoad = "_this ExecVM ""Client\GUI\GUI_Menu_Team.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.187276;
			y = 0.200401;
			w = 0.625448;
			h = 0.599268;
			colorBackground[] = cti_Background_Color;
			moving = 1;
		};
		class Background_H : RscText {
			x = 0.187276;
			y = 0.200401;
			w = 0.625448;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.187276;
			y = 0.747169;
			w = 0.625448;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.187276;
			y = 0.251901;
			w = 0.625448;
			h = cti_Background_Border_Thick;
			colorBackground[] = cti_Background_Border;
		};
	};
	class controls {
		class Title_TeamMenu : RscText_Title {
			idc = 13001;
			x = 0.192941;
			y = 0.206879;
			w = 0.3;
			text = $STR_WF_MAIN_TeamMenu;
		};
		/* Video */
		class CA_OD_Label : RscText {
			idc = 13101;
			x = 0.19634;
			y = 0.265506;
			w = 0.3;
		};
		class CA_VD_Label : RscText {
			idc = 13002;
			x = 0.197022;
			y = 0.314747;
			w = 0.3;
		};
		class CA_OD_Slider : RscXSliderH {
			idc = 130039;
			x = 0.513947;
			y = 0.27408;
			w = 0.279999;
			h = 0.029412;
		};
		class CA_VD_Slider : RscXSliderH {
			idc = 13003;
			x = 0.513947;
			y = 0.31565;
			w = 0.279999;
			h = 0.029412;
		};
		class CA_TG_Label : RscText {
			idc = 13004;
			x = 0.197022;
			y = 0.35722;
			w = 0.3;
		};
		/*terrain slider
		class CA_TG_Slider : RscXSliderH {
			idc = 13005;
			x = 0.514313;
			y = 0.363086;
			w = 0.279999;
			h = 0.029412;
		};
		*/
		/* Transfer */
		class CA_Transfer_SubTitle : RscText_SubTitle {
			idc = 13012;
			x = 0.19634;
			y = 0.465507;
			w = 0.3;
			text = $STR_WF_TEAM_MoneyTransferLabel;
		};
		class CA_TM_Label : RscText {
			idc = 13006;
			x = 0.196002;
			y = 0.57032;
			w = 0.3;
		};
		class CA_TM_Slider : RscXSliderH {
			idc = 13007;
			x = 0.513947;
			y = 0.517846;
			w = 0.279999;
			h = 0.029412;
		};
		class CA_TM_Combo : RscCombo {
			idc = 13008;
			x = 0.202366;
			y = 0.517987;
			w = 0.279999;
			h = 0.035;
		};
		class CA_TM_Button : RscButton {
			idc = 13009;
			x = 0.513949;
			y = 0.572956;
			w = 0.279999;
			text = $STR_WF_TEAM_TransferButton;			
			action = "WF_MenuAction = 1";
		};
		class CA_TA_Button : RscButton_Main {
			idc = 13109;
			x = 0.513949;
			y = 0.465;
			w = 0.279999;
			text = "Transfer (Adv)";			
			action = "WF_MenuAction = 101";
		};
		class CA_IC_SubTitle : RscText_SubTitle {
			idc = 13010;
			x = 0.380877;
			y = 0.20787;
			w = 0.426891;
			style = ST_RIGHT;
		};
		/* Disband */
		class CA_Disband_SubTitle : RscText_SubTitle {
			idc = 13011;
			x = 0.19532;
			y = 0.642376;
			w = 0.3;
			text = $STR_WF_TEAM_DisbandLabel;
		};
		class CA_DB_Combo : RscCombo {
			idc = 13013;
			x = 0.202364;
			y = 0.691727;
			w = 0.279999;
			h = 0.035;
		};
		class CA_DB_Button : RscButton {
			idc = 13014;
			x = 0.513951;
			y = 0.691511;
			w = 0.279999;
			text = $STR_WF_TEAM_DisbandButton;
			action = "WF_MenuAction = 3";
		};
		/* FX */
		class CA_FX_Label : RscText {
			idc = 13015;
			x = 0.19634;
			y = 0.405641;
			w = 0.3;
			text = $STR_WF_TEAM_GraphicFilterLabel;
		};
		class CA_FX_Combo : RscCombo {
			idc = 13018;
			x = 0.514313;
			y = 0.406464;
			w = 0.0999999;
			h = 0.035;
			onLBSelChanged = "WF_MenuAction = 6";
		};
		/* Vote PopUp */
		class VPOPON_Button : RscButton {
			idc = 13019;
			x = 0.203;
			y = 0.755;
			w = 0.279;
			text = "";
			action = "WF_MenuAction = 13";
		}
		/* Seperator */
		class Line_TRH1 : RscText {
			x = 0.192941;
			y = 0.455916;
			w = 0.614486;
			h = cti_SPT1;
			colorBackground[] = cti_SPC1;
		};
		class Line_TRH2 : RscText {
			x = 0.192941;
			y = 0.629907;
			w = 0.614486;
			h = cti_SPT1;
			colorBackground[] = cti_SPC1;
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.704632;
			y = 0.753185;
			action = "WF_MenuAction = 8";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.766877;
			y = 0.753185;			
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- BuyUnits Menu.
class RscMenu_BuyUnits {
	movingEnable = 1;
	idd = 12000;
	onLoad = "_this ExecVM ""Client\GUI\GUI_Menu_BuyUnits.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = -0.000119045;
			y = 0.000960164;
			w = 1.00024;
			h = 1.00046;
			moving = 1;
			colorBackground[] = cti_Background_Color;
		};
		class Background_H : RscText {
			x = -0.000119045;
			y = 0.000960164;
			w = 1.00024;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Header;
		};
		class Background_F : RscText {
			x = -0.000119045;
			y = 0.948079045;
			w = 1.00024;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = -0.000119045;
			y = 0.051619045;
			w = 1.00024;
			h = cti_Background_Border_Thick;
			colorBackground[] = cti_Background_Border;
		};
	};
	class controls {
		/* Controls */
		class CA_BuyList : RscListBoxA {
			idc = 12001;
			x = 0.000983551;
			y = 0.184483;
			w = 0.493697;
			h = 0.493299;
			columns[] = {0.01, 0.19, 0.75};
			drawSideArrows = 0;
			idcRight = -1;
			idcLeft = -1;
			
			onLBSelChanged = "WF_MenuAction = 302";
			onLBDblClick = "WF_MenuAction = 1";
		};
		class CA_Purchase : RscButton {
			idc = 12002;
			x = 0.688983;
			y = 0.956626;
			w = 0.12;
			text = $STR_WF_Purchase;
			action = "WF_MenuAction = 1";
		};
		class Title_BuyUnits : RscText_Title {
			idc = 12004;
			x = 0.00477695;
			y = 0.00775912;
			w = 0.3;
			text = $STR_WF_MAIN_Purchase_Units;
		};
		/* Factory-Picture */
		class WF_Con1 : RscClickableText {
			idc = 12005;
			x = 0.499874;
			y = 0.0612043;
			w = 0.072;
			h = 0.072;
			text = "Client\Images\con_barracks.paa";
			tooltip = $STR_WF_TOOLTIP_UnitPurchase_Con1;
			colorDisabled[] = {1,1,1,0.3};
			action = "WF_MenuAction = 101";
		};
		class WF_Con2 : WF_Con1 {
			idc = 12006;
			x = 0.585001;
			text = "Client\Images\con_light.paa";
			tooltip = $STR_WF_TOOLTIP_UnitPurchase_Con2;
			action = "WF_MenuAction = 102";
		};
		class WF_Con3 : WF_Con1 {
			idc = 12007;
			x = 0.670123;
			text = "Client\Images\con_heavy.paa";
			tooltip = $STR_WF_TOOLTIP_UnitPurchase_Con3;
			action = "WF_MenuAction = 103";
		};
		class WF_Con4 : WF_Con1 {
			idc = 12008;
			x = 0.753571;
			text = "Client\Images\con_aircraft.paa";
			tooltip = $STR_WF_TOOLTIP_UnitPurchase_Con4;
			action = "WF_MenuAction = 104";
		};
		class WF_Con7 : WF_Con1 {
			idc = 12021;
			x = 0.838699;
			text = "Client\Images\con_airport.paa";
			tooltip = $STR_WF_TOOLTIP_UnitPurchase_Con5;
			action = "WF_MenuAction = 106";
		};
		class WF_Con5 : WF_Con1 {
			idc = 12020;
			x = 0.923826;
			text = "Client\Images\con_depot.paa";
			tooltip = $STR_WF_TOOLTIP_UnitPurchase_Con6;
			action = "WF_MenuAction = 105";
		};
		/**/
		class CA_Portrait : RscPicture {
			idc = 12009;
			x = 0.00434637;
			y = 0.726386;
			w = 0.186974;
			h = 0.219467;
			style = 0x30 + 0x800;
		};
		/* Vehicle-Crew */
		class WF_Lock : RscClickableText {
			idc = 12023;
			x = 0.443363;
			y = 0.128362;
			w = 0.05;
			h = 0.05;
			text = "Client\Images\i_lock.paa";
			tooltip = $STR_WF_TOOLTIP_Buy_Locked;
			action = "WF_MenuAction = 401";
		};
		class WF_Driver : WF_Lock {
			idc = 12012;
			x = 0.242185;
			text = "Client\Images\i_driver.paa";
			tooltip = $STR_WF_TOOLTIP_Buy_Driver;
			action = "WF_MenuAction = 201";
		};
		class WF_Gunner : WF_Lock {
			idc = 12013;
			x = 0.292267;
			text = "Client\Images\i_gunner.paa";
			tooltip = $STR_WF_TOOLTIP_Buy_Gunner;
			action = "WF_MenuAction = 202";
		};
		class WF_Commander : WF_Lock {
			idc = 12014;
			x = 0.343194;
			text = "Client\Images\i_commander.paa";
			tooltip = $STR_WF_TOOLTIP_Buy_Commander;
			action = "WF_MenuAction = 203";
		};
		class WF_Extra : WF_Lock {
			idc = 12041;
			x = 0.393278;
			text = "Client\Images\i_extra.paa";
			tooltip = $STR_WF_TOOLTIP_Buy_Extra;
			action = "WF_MenuAction = 204";
		};
		/**/
		class WF_MiniMap : RscMapControl {
			idc = 12015;
			x = 0.5;
			y = 0.185168;
			w = 0.499378;
			h = 0.493457;
			ShowCountourInterval = 1;
		};
		class CA_Factory_Label : RscText {
			idc = 12016;
			x = 0.5;
			y = 0.140446;
			w = 0.3;
			text = $STR_WF_UNITS_Factory;
			sizeEx = 0.035;
		};
		class CA_Combo_Factory : RscCombo {
			idc = 12018;
			x = 0.626048;
			y = 0.140446;
			w = 0.368908;
			h = 0.037;
			onLBSelChanged = "WF_MenuAction = 301";
		};
		class CA_Cash_SubTitle : RscText_SubTitle {
			idc = 12019;
			x = 0.694657;
			y = 0.007759;
			w = 0.3;
			style = ST_RIGHT;
		};
		class CA_Details : RscStructuredText {
			idc = 12022;
			x = 0.5;
			y = 0.699494;
			w = 0.500294;
			h = 0.242927;
			size = 0.0250;
		};
		class CA_Queu_SubTitle : RscText_SubTitle {
			idc = 12024;
			x = 0.350419;
			y = 0.00775906;
			w = 0.3;
			style = ST_CENTER;
		};
		class CA_Faction_Label : RscText {
			idc = 12025;
			x = 0.000797182;
			y = 0.062964;
			w = 0.3;
			sizeEx = 0.035;
		};
		class CA_Combo_Faction : RscCombo {
			idc = 12026;
			x = 0.218874;
			y = 0.0652035;
			w = 0.261343;
			h = 0.035;
			onLBSelChanged = "WF_MenuAction = 303";
		};
		/* Info-Labels */
		class CA_Faction_Small : RscText_Small {
			idc = 12027;
			x = 0.194959;
			y = 0.692771;
			w = 0.3;
			h = 0.037;
			text = $STR_WF_UNITS_FactionLabel;
		};
		class CA_Price_Small : CA_Faction_Small {
			idc = 12010;
			x = 0.194959;
			y = 0.730336;
			text = $STR_WF_Price;
		};
		class CA_Time_Small : CA_Faction_Small {
			idc = 12028;
			x = 0.194957;
			y = 0.76566;
			text = $STR_WF_UNITS_DurationLabel;
		};
		class CA_Skill_Small : CA_Faction_Small {
			idc = 12029;
			x = 0.194959;
			y = 0.803222;
			text = $STR_WF_UNITS_SkillLabel;
		};
		class CA_TransportCapacity_Small : CA_Faction_Small {
			idc = 12030;
			x = 0.194959;
			y = 0.838545;
			text = $STR_WF_UNITS_TransportCabilityLabel;
		};
		class CA_MaxSpeed_Small : CA_Faction_Small {
			idc = 12031;
			x = 0.194959;
			y = 0.876108;
			text = $STR_WF_UNITS_MaxSpeedLabel;
		};
		class CA_Armor_Small : CA_Faction_Small {
			idc = 12032;
			x = 0.194959;
			y = 0.911431;
			text = $STR_WF_UNITS_ArmorLabel;
		};
		/* Info-Values */
		class CA_Faction_Value : RscText_Small {
			idc = 12033;
			x = 0.305041;
			y = 0.692773;
			w = 0.19;
			h = 0.037;
			style = 1;
		};
		class CA_Price_Value : CA_Faction_Value {
			idc = 12034;
			x = 0.305042;
			y = 0.730336;
			colorText[] = {1, 0, 0, 1};
		};
		class CA_Time_Value : CA_Faction_Value {
			idc = 12035;
			x = 0.305041;
			y = 0.765659;
		};
		class CA_Skill_Value : CA_Faction_Value {
			idc = 12036;
			x = 0.305041;
			y = 0.803222;
		};
		class CA_TransportCapacity_Value : CA_Faction_Value {
			idc = 12037;
			x = 0.305042;
			y = 0.838545;
		};
		class CA_MaxSpeed_Value : CA_Faction_Value{
			idc = 12038;
			x = 0.305041;
			y = 0.876109;
		};
		class CA_Armor_Value : CA_Faction_Value {
			idc = 12039;
			x = 0.30504;
			y = 0.911432;
		};
		/**/
		class CA_Unit_SubTitle : RscText_SubTitle {
			idc = 12040;
			x = 0.000575542;
			y = 0.686365;
			w = 0.3;
			text = $STR_WF_UNITS_InformationLabel;
		};
		
		
		
		
		/* Seperator */
		class LineTRH1 : RscText {
			x = 0.00470637;
			y = 0.685127;
			w = 0.990954;
			h = cti_SPT1;
			colorBackground[] = cti_SPC1;
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.892748;
			y = 0.953506;
			action = "WF_MenuAction = 2";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.953972;
			y = 0.953506;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- Command Menu. | ALL DONE!
class RscMenu_Command {
	movingEnable = 1;
	idd = 14000;//disabled for making a Mapvote on this place
	//onLoad = "_this ExecVM 'Client\GUI\GUI_Menu_Command.sqf'";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.000960961;
			y = 0.00128184;
			w = 0.999761;
			h = 1.00023;
			moving = 1;
			colorBackground[] = cti_Background_Color;
		};
		class Background_H : RscText {
			x = 0.000960961;
			y = 0.00128184;
			w = 0.999761;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.000960961;
			y = 0.94901184;
			w = 0.999761;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.000960961;
			y = 0.05278184;
			w = 0.999761;
			h = cti_Background_Border_Thick;
			colorBackground[] = cti_Background_Border;
		};
	};
	class controls {
		class WF_MiniMap : RscMapControl {
			idc = 14002;
			x = 0.468907;
			y = 0.0563169;
			w = 0.532152;
			h = 0.892336;
			ShowCountourInterval = 1;
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)";
			onMouseButtonDown = "mouseButtonDown = _this Select 1";
			onMouseButtonUp = "mouseButtonUp = _this Select 1";
		};
		class Title_OrderMenu : RscText_Title {
			idc = 14003;
			x = 0.00561695;
			y = 0.00775909;
			w = 0.3;
			text = $STR_WF_MAIN_CommandMenu;//its Placeholder Mapvote now
		};
		class CA_TakeTowns : RscButton {
			idc = 14005;
			x = 0.0057147;
			y = 0.423585;
			w = 0.22;
			text = $STR_WF_COMMAND_TakeTowns;
			action = "WF_MenuAction = 101";
		};
		class CA_Move : CA_TakeTowns {
			idc = 14006;
			x = 0.00487578;
			y = 0.473669;
			text = $STR_WF_COMMAND_Move;
			action = "WF_MenuAction = 102";
			
			/* spezial */
			colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
			colorFocused[] = {0.5882, 0.5882, 0.3529, 1};
		};
		class CA_Patrol : CA_TakeTowns {
			idc = 14007;
			x = 0.24437;
			y = 0.424035;
			text = $STR_WF_COMMAND_Patrol;
			action = "WF_MenuAction = 103";
			
			/* spezial */
			colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
			colorFocused[] = {0.5882, 0.5882, 0.3529, 1};
		};
		class CA_Defend : CA_TakeTowns {
			idc = 14008;
			x = 0.24353;
			y = 0.472995;
			text = $STR_WF_COMMAND_Defense;
			action = "WF_MenuAction = 104";
			
			/* spezial */
			colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
			colorFocused[] = {0.5882, 0.5882, 0.3529, 1};
		};
		/**/
		class CA_BuyType_Label : RscText {
			idc = 14009;
			x = -0.000420049;
			y = 0.752941;
			w = 0.17;
			text = $STR_WF_COMMAND_BuyType;
		};
		class CA_BuyType_Combo : RscCombo {
			idc = 14010;
			x = 0.162328;
			y = 0.755179;
			w = 0.302101;
			h = 0.035;
		};
		class CA_Respawn : RscButton {
			idc = 14011;
			x = 0.631344;
			y = 0.957504;
			w = 0.23;
			text = $STR_WF_COMMAND_RespawnButton;
			action = "WF_MenuAction = 201";
		};
		class CA_TeamList : RscListBox {
			idc = 14012;
			x = 0.00518636;
			y = 0.178967;
			w = 0.459244;
			h = 0.229759;
			rowHeight = 0.0219091;
			sizeEx = 0.03;
			style = 0x20;//--- MultiSelect LB.
			colorDisabled[] = {1,1,1,0.3};
			onLBSelChanged = "WF_MenuAction = 1";
			onLBDblClick = "WF_MenuAction = 2";
		};	
		class CA_Mission_Type : RscText {
			idc = 14013;
			x = 0.000842094;
			y = 0.142566;
			w = 0.3;
		};
		class CA_AutoAIOn : RscButton {
			idc = 14014;
			x = 0.00470574;
			y = 0.957504;
			w = 0.3;
			text = $STR_WF_COMMAND_AutoAI;
			action = "WF_MenuAction = 301";
		};
		class CA_AutoAIOff : CA_AutoAIOn {
			idc = 14015;
			x = 0.318572;
			text = $STR_WF_COMMAND_AutoAIOff;
			action = "WF_MenuAction = 301";
		};		
		class CA_SetBuy : RscButton {
			idc = 14016;
			x = 0.0440367;
			y = 0.801901;
			w = 0.42;
			text = $STR_WF_COMMAND_SetBuyType;
			action = "WF_MenuAction = 302";
		};
		/**/
		class CA_Behavior_Combo : RscCombo {
			idc = 14017;
			x = 0.214428;
			y = 0.531822;
			w = 0.25;
			h = 0.035;
		};
		class CA_Combat_Combo : CA_Behavior_Combo {
			idc = 14018;
			x = 0.214428;
			y = 0.572941;
		};
		class CA_Formation_Combo : CA_Behavior_Combo {
			idc = 14019;
			x = 0.214428;
			y = 0.614061;
		};
		class CA_Speed_Combo : CA_Behavior_Combo {
			idc = 14020;
			x = 0.214428;
			y = 0.656302;
		};
		/**/
		class CA_Behavior_Label : RscText {
			idc = 14021;
			x = -0.000420049;
			y = 0.52958;
			w = 0.17;
			text = $STR_WF_COMMAND_Behavior;
		};
		class CA_Combat_Label : CA_Behavior_Label {
			idc = 14022;
			x = -0.000420049;
			y = 0.5707;
			text = $STR_WF_COMMAND_CombatMode;
		};
		class CA_Formation_Label : CA_Behavior_Label {
			idc = 14031;
			x = -0.000420049;
			y = 0.61182;
			text = $STR_WF_COMMAND_Formation;
		};
		class CA_Speed_Label : CA_Behavior_Label {
			idc = 14023;
			x = -0.000420049;
			y = 0.654061;
			text = $STR_WF_COMMAND_Speed;
		};
		class CA_SetToTeam : RscButton {
			idc = 14024;
			x = 0.0440339;
			y = 0.703026;
			w = 0.42;
			text = $STR_WF_COMMAND_SetTeamProperties;
			action = "WF_MenuAction = 303";
		};
		class CA_Respawn_Combo : RscCombo {
			idc = 14025;
			x = 0.160647;
			y = 0.855182;
			w = 0.303781;
			h = 0.035;
			onLBSelChanged = "WF_MenuAction = 305";
		};
		class CA_Respawn_Label : CA_Behavior_Label {
			idc = 14026;
			x = -0.000420049;
			y = 0.852941;
			text = $STR_WF_COMMAND_Respawn;
		};
		class CA_SetRespawn : RscButton {
			idc = 14027;
			x = 0.0440337;
			y = 0.900783;
			w = 0.42;
			text = $STR_WF_COMMAND_SetRespawn;
			action = "WF_MenuAction = 304";
		};
		class CA_Funds_Label : RscText {
			idc = 14028;
			x = 0.168488;
			y = 0.142689;
			w = 0.3;
			style = ST_RIGHT;
		};
		class CA_Tab_Label : RscText_SubTitle {
			idc = 14030;
			x = 0.335;
			y = 0.0107146;
			w = 0.3;
			style = ST_CENTER;
			text = $STR_WF_COMMAND_SquadSettingsLabel;
		};
		class CA_SetTask : RscButton {
			idc = 14032;
			x = 0.0440328;
			y = 0.621904;
			w = 0.42;
			text = $STR_WF_COMMAND_TaskTO_Set;
			action = "WF_MenuAction = 306";
			
			/* spezial */
			colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
			colorFocused[] = {0.5882, 0.5882, 0.3529, 1};
		};
		/* HQ Team units details */
		class CA_UnitsDetailList : RscListBoxA {
			idc = 14041;
			x = 0.00518636;
			y = 0.527339;
			w = 0.463445;
			h = 0.366386;
			columns[] = {0.01, 0.19};
			drawSideArrows = 0;
			idcRight = -1;
			idcLeft = -1;
			rowHeight = 0.05;
			sizeEx = 0.023;
			colorDisabled[] = {1,1,1,0.3};
			onLBSelChanged = "WF_MenuAction = 401";
			onLBDblClick = "WF_MenuAction = 3";

			/* spezial */
			colorText[] = {0, 0.875, 0, 0.8};
			colorSelect[] = {0, 0.875, 0, 0.8};
			colorSelect2[] = {0, 0.875, 0, 0.8};
			/* extra */
			colorSelectBackground[] = {0, 0, 0, 0.5};
			colorSelectBackground2[] = {0, 0, 0, 0.5};
		};	
		class CA_FUnflip : RscButton {
			idc = 14042;
			x = 0.24384;
			y = 0.900286;
			w = 0.22;
			text = $STR_WF_COMMAND_UnflipButton;
			action = "WF_MenuAction = 402";
		};	
		class CA_FDisband : RscButton {
			idc = 14043;
			x = 0.00493164;
			y = 0.900296;
			w = 0.22;
			text = $STR_WF_TEAM_DisbandButton;
			action = "WF_MenuAction = 403";
		};		
		class WF_Con1 : RscClickableText {
			idc = 14500;
			x = 0.136976;
			y = 0.0589629;
			w = 0.072;
			h = 0.072;
			text = "Client\Images\con_barracks.paa";
			tooltip = $STR_WF_TOOLTIP_TeamOrders_Con1;
			colorDisabled[] = {1,1,1,0.3};
			action = "WF_MenuAction = 601";
		};
		class WF_Con2 : WF_Con1 {
			idc = 14501;
			x = 0.290419;
			text = "Client\Images\con_task.paa";
			tooltip = $STR_WF_TOOLTIP_TeamOrders_Con2;
			action = "WF_MenuAction = 602";
		};
		class WF_Con3 : WF_Con1 {
			idc = 14502;
			x = 0.213698;
			text = "Client\Images\con_hq.paa";
			tooltip = $STR_WF_TOOLTIP_TeamOrders_Con3;
			action = "WF_MenuAction = 603";
		};
		/* Separators */
		class LineTRH1 : RscText {
			idc = 14900;
			x = 0.00554727;
			y = 0.518182;
			w = 0.458181;
			h = cti_SPT1;
			colorBackground[] = cti_SPC1;
		};
		class LineTRH2 : LineTRH1 {
			idc = 14901;
			x = 0.00554727;
			y = 0.845784;
		};
		class LineTRH3 : LineTRH1 {
			idc = 14902;
			x = 0.00554727;
			y = 0.746904;
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.892507;
			y = 0.953825;
			action = "WF_MenuAction = 4";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.955773;
			y = 0.953825;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- Tactical Menu. | ALL DONE!
class RscMenu_Tactical {
	movingEnable = 1;
	idd = 17000;
	onLoad = "_this ExecVM 'Client\GUI\GUI_Menu_Tactical.sqf'";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.000960961;
			y = 0.00128125;
			w = 0.999759;
			h = 1.00023;
			moving = 1;
			colorBackground[] = cti_Background_Color;
		};
		class Background_H : RscText {
			x = 0.000960961;
			y = 0.00128125;
			w = 0.999759;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.000960961;
			y = 0.94901125;
			w = 0.999759;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.000960961;
			y = 0.05278125;
			w = 0.999759;
			h = cti_Background_Border_Thick;
			colorBackground[] = cti_Background_Border;
		};
	};
	class controls {
		class WF_MiniMap : RscMapControl {
			idc = 17002;
			x = 0.374789;
			y = 0.0574369;
			w = 0.625427;
			h = 0.888975;
			ShowCountourInterval = 1;
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)";
			onMouseButtonDown = "mouseButtonDown = _this Select 1";
			onMouseButtonUp = "mouseButtonUp = _this Select 1";
		};
		class Title_Tactical : RscText_Title {
			idc = 17003;
			x = 0.00561695;
			y = 0.00999998;
			w = 0.3;
			text = $STR_WF_MAIN_TacticalMenu;
		};
		class CA_Artillery_SubTitle : RscText_SubTitle {
			idc = 17004;
			x = 0.00434637;
			y = 0.0596783;
			w = 0.2;
			text = $STR_WF_TACTICAL_Artillery;
		};
		class CA_Artillery_Label_Radius : RscText {
			idc = 17030;
			x = 0.00602637;
			y = 0.182926;
			w = 0.2;
			text = $STR_WF_TACTICAL_ArtilleryRadius;
		};
		class CA_Artillery_Label_Unit : RscText {
			idc = 17031;
			x = 0.00434496;
			y = 0.14259;
			w = 0.2;
			text = $STR_WF_TACTICAL_Artillery;
		};
		class CA_Artillery_Slider : RscXSliderH {
			idc = 17005;
			x = 0.14652;
			y = 0.188795;
			w = 0.224033;
			h = 0.029412;
		};
		class CA_SetFMission_Button : RscButton {
			idc = 17006;
			x = 0.12047;
			y = 0.515631;
			w = 0.25;
			text = $STR_WF_TACTICAL_ArtillerySetFireMission;
			action = "WF_MenuAction = 1";
			/* spezial */
			colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
			colorFocused[] = {0.5882, 0.5882, 0.3529, 1};
		};
		class CA_FireMission_Button : RscButton {
			idc = 17007;
			x = 0.12047;
			y = 0.566833;
			w = 0.25;
			text = $STR_WF_TACTICAL_ArtilleryCallFireMission;
			action = "WF_MenuAction = 2";
		};
		class CA_Artillery_Combo : RscCombo {
			idc = 17008;
			x = 0.145945;
			y = 0.146217;
			w = 0.147;
			h = 0.029412;
			onLBSelChanged = "WF_MenuAction = 200";
		};
		class CA_Support_SubTitle : RscText_SubTitle {
			idc = 17009;
			x = 0.00518464;
			y = 0.622955;
			w = 0.2;
			text = $STR_WF_TACTICAL_Support;
		};
		class CA_Artillery_Label_Status : RscText {
			idc = 17032;
			x = 0.00602637;
			y = 0.102254;
			w = 0.2;
			text = $STR_WF_TACTICAL_ArtilleryStatus;
		};
		class CA_ArtilleryTimeout : RscStructuredText {
			idc = 17016;
			x = 0.139245;
			y = 0.107786;
			w = 0.213025;
			size = 0.03;
			shadow = 2;
		};
		class SupportList : RscListBox {
			idc = 17019;
			x = 0.00602497;
			y = 0.663556;
			w = 0.365965;
			h = 0.237187;
			rowHeight = 0.01;
			sizeEx = 0.026;
		};
		class CA_Button_Use : RscButton {
			idc = 17020;
			x = 0.22021;
			y = 0.905171;
			w = 0.15;
			text = $STR_WF_TACTICAL_RequestButton;
			action = "WF_MenuAction = 20";
			/* spezial */
			colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
			colorFocused[] = {0.5882, 0.5882, 0.3529, 1};
		};
		class CA_SupportCost_Label : RscText {
			idc = 17026;
			x = 0.0119054;
			y = 0.907169;
			w = 0.11;
			text = "$STR_WF_TACTICAL_Price";
			sizeEx = 0.032;
		};
		class CA_SupportCost : RscText {
			idc = 17021;
			x = 0.111905;
			y = 0.907169;
			w = 0.11;
			sizeEx = 0.032;
			colorText[] = {1, 0, 0, 1};
		};
		class CA_InformationText : RscStructuredText {
			idc = 17022;
			x = 0.380816;
			y = 0.0188458;
			w = 0.614286;
			h = 0.035;
			size = 0.03;
			class Attributes {
				align = "center";
			};
		};
		class Ca_ArtilleryToggle : RscClickableText {
			idc = 17023;
			x = 0.310672;
			y = 0.121233;
			w = 0.064;
			h = 0.064;
			text = "Client\Images\tog_arty.paa";
			action = "WF_MenuAction = 40";
			tooltip = $STR_WF_TOOLTIP_ArtilleryToggle;
		};
		class CA_ArtilleryList : RscListBoxA {
			idc = 17024;
			x = 0.00459768;
			y = 0.270084;
			w = 0.365209;
			h = 0.235;
			columns[] = {0.02, 0.55};
			drawSideArrows = 0;
			idcRight = -1;
			idcLeft = -1;
			rowHeight = 0.05;
			sizeEx = 0.023;
			
			/* extra */
			colorSelectBackground[] = {0, 0, 0, 0.5};
			colorSelectBackground2[] = {0, 0, 0, 0.5};
			
			onLBSelChanged = "WF_MenuAction = 60";
		};	
		class CA_ArtilleryTable_Label : RscText {
			idc = 17025;
			x = 0.00495766;
			y = 0.226604;
			w = 0.339999;
		};
		/* Separators */
		class LineTRH1 : RscText {
			x = 0.00638635;
			y = 0.61566;
			w = 0.364063;
			h = cti_SPT1;
			colorBackground[] = cti_SPC1;
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.892328;
			y = 0.953825;
			action = "WF_MenuAction = 30";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.956614;
			y = 0.953825;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- Service Menu. | ALL DONE!
class RscMenu_Service {
	movingEnable = 1;
	idd = 20000;
	onLoad = "ExecVM ""Client\GUI\GUI_Menu_Service.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.157263;
			y = 0.151421;
			w = 0.687155;
			h = 0.777949;
			moving = 1;
			colorBackground[] = cti_Background_Color;
		};
		class Background_H : RscText {
			x = 0.157263;
			y = 0.151421;
			w = 0.687155;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.157263;
			y = 0.876870;
			w = 0.687155;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.157263;
			y = 0.202921;
			w = 0.687155;
			h = cti_Background_Border_Thick;
			colorBackground[] = cti_Background_Border;
		};
	};
	class controls {
		class Title_Service : RscText_Title {
			idc = 20001;
			x = 0.161008;
			y = 0.157731;
			w = 0.3;
			text = $STR_WF_SupportMenu;
		};
		class CA_UnitList : RscListBox {
			idc = 20002;
			x = 0.162101;
			y = 0.209804;
			w = 0.677143;
			h = 0.429553;
			rowHeight = 0.025;
			colorDisabled[] = {1,1,1,0.3};
			sizeEx = 0.035;
			onLBSelChanged = "WF_MenuAction = 10";
		};
		class CA_Rearm_Button : RscButton {
			idc = 20003;
			x = 0.161261;
			y = 0.650391;
			w = 0.22;
			text = $STR_WF_SERVICE_Rearm;
			action = "WF_MenuAction = 1";
		};
		class CA_Repair_Button : RscButton {
			idc = 20004;
			x = 0.50748;
			y = 0.650391;
			w = 0.22;
			text = $STR_WF_SERVICE_Repair;
			action = "WF_MenuAction = 2";
		};
		class CA_Refuel_Button : RscButton {
			idc = 20005;
			x = 0.161261;
			y = 0.697899;
			w = 0.22;
			text = $STR_WF_SERVICE_Refuel;
			action = "WF_MenuAction = 3";
		};
		class CA_Heal_Button : RscButton {
			idc = 20008;
			x = 0.50748;
			y = 0.697899;
			w = 0.22;
			text = $STR_WF_SERVICE_Heal;
			action = "WF_MenuAction = 5";
		};
		class CA_EASA_Button : RscButton {
			idc = 20010;
			x = 0.161261;
			y = 0.747311;
			w = 0.565918;
			text = $STR_WF_SERVICE_EASA;
			action = "WF_MenuAction = 7";
		};
		class CA_LabelSKIN: RscText {
			idc = 20016;
			x = 0.16;
			y = 0.789311;
			w = 0.28;
		};
		class LB_SKIN_ARR : RscCombo {
			idc = 20015;
			x = 0.347507;
			y = 0.789311;
			w = 0.255918;
			h = 0.036;
			onLBSelChanged = "WF_MenuAction = 9";			
		};
		class CA_LabelRearm: RscText {
			idc = 20011;
			x = 0.388739;
			y = 0.653752;
			w = 0.12;
		};
		class CA_LabelRepair : CA_LabelRearm {
			idc = 20012;
			x = 0.734957;
			y = 0.653752;
			w = 0.12;
		};
		class CA_LabelRefuel : CA_LabelRearm {
			idc = 20013;
			x = 0.388739;
			y = 0.699691;
			w = 0.12;
		};
		class CA_LabelHeal : CA_LabelRearm {
			idc = 20014;
			x = 0.734957;
			y = 0.699691;
			w = 0.12;
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.737046;
			y = 0.881685;
			action = "WF_MenuAction = 8";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.800311;
			y = 0.881685;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- UnitCamera Menu. | ALL DONE!
class RscMenu_UnitCamera {
	movingEnable = 1;
	idd = 21000;
	onLoad = "_this ExecVM ""Client\GUI\GUI_Menu_UnitCamera.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.000119537;
			y = 0.70044;
			w = 0.999761;
			h = 0.298829;
			moving = 1;
			colorBackground[] = cti_Background_Color;
		};
		class Background_H : RscText {
			x = 0.000119537;
			y = 0.70044;
			w = 0.999761;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.000119537;
			y = 0.946769;
			w = 0.999761;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.000119537;
			y = 0.75194;
			w = 0.999761;
			h = cti_Background_Border_Thick;
			colorBackground[] = cti_Background_Border;
		};
	};
	class controls {
		class Title_UnitCam : RscText_Title {
			idc = 21001;
			x = 0.00470497;
			y = 0.706961;
			w = 0.3;
			text = $STR_WF_TACTICAL_UnitCam;
		};
		class CA_Camera_UnitList : RscListBox {
			idc = 21002;
			x = -0.000335053;
			y = 0.755239;
			w = 0.311932;
			h = 0.190877;
			rowHeight = 0.01;
			sizeEx = 0.024;
			colorDisabled[] = {1,1,1,0.3};
			onLBSelChanged = "WF_MenuAction = 101";
		};
		class CA_SquadKI_Label : RscText {
			idc = 21003;
			x = 0.312271;
			y = 0.714061;
			w = 0.3;
			colorText[] = {0.2588, 0.7137, 1, 1};
			text = $STR_WF_UNITCAM_SquadKI;
		};
		class CA_Camera_AIList : RscListBox {
			idc = 21004;
			x = 0.312269;
			y = 0.754063;
			w = 0.311932;
			h = 0.190877;
			rowHeight = 0.01;
			sizeEx = 0.024;
			colorDisabled[] = {1,1,1,0.3};
			onLBSelChanged = "WF_MenuAction = 102";
		};
		class CA_Camera_Mode : RscText {
			idc = 21005;
			x = 0.629077;
			y = 0.713836;
			w = 0.3;
			colorText[] = {0.2588, 0.7137, 1, 1};
			text = $STR_WF_UNITCAM_CamMode;
		};
		class CA_Camera_Combo : RscCombo {
			idc = 21006;
			x = 0.831595;
			y = 0.711259;
			w = 0.163193;
			h = 0.035;
			onLBSelChanged = "WF_MenuAction = 103";
		};
		class CA_MiniMap : RscMapControl {
			idc = 21007;
			x = 0.625041;
			y = 0.75514;
			w = 0.374504;
			h = 0.191614;
			ShowCountourInterval = 1;
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)";
			onMouseButtonDown = "mouseButtonDown = _this Select 1";
			onMouseButtonUp = "mouseButtonUp = _this Select 1";
		};		
		//--Unflip button in Unit Camera Menu--
		class CA_UN_Button : RscClickableText {
			idc = 160003;
			x = 0.76602464;
			y = 0.953825;	
			w = 0.045;
			h = 0.045;			
			text = "Client\Images\icon_turn_the_car.paa";
			//action = "WF_MenuAction = 140";
			onButtonClick = "WF_MenuAction = 140";
			colorDisabled[] = {1,1,1,0.3};
			tooltip = $STR_WF_TOOLTIP_UnitCamUnflip;
		};
		/* Exit */
		class CA_UN_Exit_Button : RscButton_Exit {
			x = 0.954933;
			y = 0.953825;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- Prameters Display. | ALL DONE!
class RscDisplay_Parameters {
	movingEnable = 1;
	idd = 22000;
	onLoad = "_this ExecVM ""Client\GUI\GUI_Display_Parameters.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = -0.000478864;
			y = 0.151421;
			w = 1.00096;
			h = 0.699949;
			moving = 1;
			colorBackground[] = cti_Background_Color;
		};
		class Background_H : RscText {
			x = -0.000478864;
			y = 0.151421;
			w = 1.00096;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Header;
		};
		class Background_F : RscText {
			x = -0.000478864;
			y = 0.798870;
			w = 1.00096;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = -0.000478864;
			y = 0.202921;
			w = 1.00096;
			h = cti_Background_Border_Thick;
			colorBackground[] = cti_Background_Border;
		};
	};
	class controls {
		class Title_Parameter : RscText_Title {
			idc = 22002;
			x = 0.00510308;
			y = 0.157759;
			w = 0.3;
			text = $STR_WF_PARAMETER_Parameters;
		};
		class LB_ParamsTitles : RscListBoxA {
			idc = 22003;
			columns[] = {0.01, 0.55};
			rowHeight = 0.036;
			drawSideArrows = 0;
			idcRight = -1;
			idcLeft = -1;
			colorDisabled[] = {1,1,1,0.3};
			x = 0.00204286;
			y = 0.211603;
			w = 0.997959;
			h = 0.579722;
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.892509;
			y = 0.804806;
			action = "WF_MenuAction = 1";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.955774;
			y = 0.804806;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- EASA Menu. | ALL DONE!
class RscMenu_EASA {
	movingEnable = 1;
	idd = 23000;
	onLoad = "_this ExecVM ""Client\GUI\GUI_Menu_EASA.sqf""";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.157263;
			y = 0.200721;
			w = 0.687155;
			h = 0.601349;
			moving = 1;
			colorBackground[] = cti_Background_Color;
		};
		class Background_H : RscText {
			x = 0.157263;
			y = 0.200721;
			w = 0.687155;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.157263;
			y = 0.749570;
			w = 0.687155;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.157263;
			y = 0.252221;
			w = 0.687155;
			h = cti_Background_Border_Thick;
			colorBackground[] = cti_Background_Border;
		};
	};
	class controls {
		class Title_EASA : RscText_Title {
			idc = 23002;
			x = 0.162105;
			y = 0.207843;
			w = 0.6;
			text = $STR_WF_EASA;
		};
		class Title_PYLONS : RscText_SubTitle {
			idc = 230002;
			x = 0.162186;
			y = 0.263187;
			w = 0.18075;			
			text = $STR_WF_EASA_PYLONS;
		};
		class LB_EASA_PYLONS : RscListBoxA {
			idc = 230033;
			columns[] = {0.005};
			rowHeight = 0.036;
			drawSideArrows = 1;
			idcRight = -1;
			idcLeft = -1;
			x = 0.162186;
			y = 0.303187;
			w = 0.18075;
			h = 0.426481;
			onLBSelChanged = "WF_MenuAction = 111";
			onLBDblClick = "WF_MenuAction = 102";
		};
		class Title_PYLONS_AMMO : RscText_SubTitle {
			idc = 230003;
			x = 0.352186;
			y = 0.263187;
			w = 0.32689;			
			text = $STR_WF_EASA_PYLONS_AMMO;
		};
		class LB_EASA_PYLONS_AMMO : RscListBoxA {
			idc = 230034;			
			columns[] = {0.005};
			rowHeight = 0.036;
			drawSideArrows = 1;
			idcRight = -1;
			idcLeft = -1;
			x = 0.350186;
			y = 0.303187;
			w = 0.32689;
			h = 0.426481;
			onLBSelChanged = "WF_MenuAction = 112";
		};
		class Title_PYLONS_MODE : RscText_SubTitle {
			idc = 230004;
			x = 0.637186;
			y = 0.263187;
			w = 0.28589;			
			text = $STR_WF_EASA_PYLONS_MODE;
		};
		class LB_EASA_PYLONS_MODE : RscListBoxA {
			idc = 230035;			
			columns[] = {0.005};
			rowHeight = 0.036;
			drawSideArrows = 1;
			idcRight = -1;
			idcLeft = -1;
			x = 0.68186;
			y = 0.303187;
			w = 0.15589;
			h = 0.426481;
			onLBSelChanged = "WF_MenuAction = 114";			
		};
		class CA_LabelRearm: RscText {
			idc = 230005;
			x = 0.162186;
			y = 0.758018;
			w = 0.12;
		};
		class CA_Purchase : RscButton {
			idc = 22004;
			x = 0.25;
			y = 0.758018;
			w = 0.1;
			text = $STR_WF_Purchase;
			action = "WF_MenuAction = 101";
		};
		class CA_LabelRearmDefault: RscText {
			idc = 230006;
			x = 0.35;
			y = 0.758018;
			w = 0.12;
		};
		class CA_PurchaseByDefault : RscButton {
			idc = 230007;
			x = 0.44;
			y = 0.758018;
			w = 0.35;
			text = $STR_WF_EASA_Rearm_default;
			action = "WF_MenuAction = 115";			
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.799471;
			y = 0.755506;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- Economy Menu. | ALL DONE!
class RscMenu_Economy {
	movingEnable = 1;
	idd = 23000;
	onLoad = "_this ExecVM 'Client\GUI\GUI_Menu_Economy.sqf'";
	
	class controlsBackground {
		class Background_M : RscText {
			x = 0.0318137;
			y = 0.2004;
			w = 0.938056;
			h = 0.59934;
			moving = 1;
			colorBackground[] = cti_Background_Color;
		};
		class Background_H : RscText {
			x = 0.0318137;
			y = 0.2004;
			w = 0.938056;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Header;
		};
		class Background_F : RscText {
			x = 0.0318137;
			y = 0.74724;
			w = 0.938056;
			h = 0.0525;
			moving = 1;
			colorBackground[] = cti_Background_Color_Footer;
		};
		class Background_L : RscText {
			x = 0.0318137;
			y = 0.2519;
			w = 0.938056;
			h = cti_Background_Border_Thick;
			colorBackground[] = cti_Background_Border;
		};
	};
	class controls {
		class WF_MiniMap : RscMapControl {
			idc = 23002;
			x = 0.5;
			y = 0.254636;
			w = 0.469125;
			h = 0.492337;
			ShowCountourInterval = 1;
			
			onMouseMoving = "mouseX = (_this Select 1);mouseY = (_this Select 2)";
			onMouseButtonDown = "mouseButtonDown = _this Select 1";
			onMouseButtonUp = "mouseButtonUp = _this Select 1";
		};
		class Title_CommanderMenu : RscText_Title {
			idc = 23003;
			x = 0.0367093;
			y = 0.207199;
			w = 0.3;
			text = $STR_WF_MAIN_EconomyMenu;
		};
		class CA_LabelPartWorkers : RscText_SubTitle {
			idc = 23008;
			x = 0.0322372;
			y = 0.264119;
			w = 0.25;
			text = $STR_WF_ECONOMY_Workers;
		};
		/* Income */
		class CA_LabelPartIncome : CA_LabelPartWorkers {
			idc = 23009;
			x = 0.0322358;
			y = 0.456346;
			w = 0.25;
			text = $STR_WF_ECONOMY_Income_Sys;
		};
		class CA_Slider_Income : RscXSliderH {
			idc = 23010;
			x = 0.0372786;
			y = 0.514272;
			w = 0.333109;
			h = 0.029412;
		};
		class CA_LabelIncomePercent : RscText {
			idc = 23011;
			x = 0.394873;
			y = 0.512032;
			w = 0.15;
		};
		class CA_IncomeSet_Button : RscButton {
			idc = 23012;
			x = 0.0372772;
			y = 0.567717;
			w = 0.334;
			text = $STR_WF_ECONOMY_SetIncome;
			action = "WF_MenuAction = 3";
		};
		class CA_LabelIncomeCommander : RscText {
			idc = 23013;
			x = 0.0372772;
			y = 0.634608;
			w = 0.399999;
		};
		class CA_LabelPlayerCommander : CA_LabelIncomeCommander {
			idc = 23014;
			x = 0.0372772;
			y = 0.687535;
			w = 0.399999;
		};
		/* Selling Structures */
		class CA_Sell : RscButton {
			idc = 23015;
			x = 0.501454;
			y = 0.757255;
			w = 0.28; 
			text = $STR_WF_ECONOMY_SellStructure;
			action = "WF_MenuAction = 105";
			/* spezial */
			colorBackground[] = {0.5882, 0.5882, 0.3529, 0.7};
			colorBackgroundActive[] = {0.5882, 0.5882, 0.3529, 1};
			colorFocused[] = {0.5882, 0.5882, 0.3529, 1};
		};
		/* Respawn Supply Truck Debug */
		class CA_RespST_Button : RscClickableText {
			idc = 23016;
			x = 0.0368904;
			y = 0.751251;
			w = 0.05;
			h = 0.05;
			text = "Client\Images\picturepapercar_ca.paa";
			action = "WF_MenuAction = 4";
			colorDisabled[] = {1,1,1,0.3};
			tooltip = $STR_WF_TOOLTIP_RespawnST;
		};
		/* Separators */
		class LineTRH1 : RscText {
			x = 0.0349591;
			y = 0.449622;
			w = 0.459861;
			h = cti_SPT1;
			colorBackground[] = cti_SPC1;
		};
		/* Back */
		class Back_Button : RscButton_Back {
			x = 0.861415;
			y = 0.754385;
			action = "WF_MenuAction = 5";
			tooltip = $STR_WF_TOOLTIP_BackButton;
		};
		/* Exit */
		class Exit_Button : RscButton_Exit {
			x = 0.924681;
			y = 0.754385;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////////////--- Help Menu
class RscMenu_Help {
	movingEnable = 1;
	idd = 508000;
	onLoad = "uiNamespace setVariable ['dialog_HelpPanel', _this select 0];['onLoad'] execVM 'Client\GUI\GUI_Menu_Help.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_onlinehelpmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\GUI\GUI_Menu_Help.sqf'";
	class controlsBackground {
		class WF_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.1)";
			y = "SafeZoneY + (SafezoneH * 0.105)";
			w = "SafeZoneW * 0.8";
			h = "SafeZoneH * 0.8";
			colorBackground[] = cti_Background_Color;
			moving = 1;
		};
		class WF_Background_Header : WF_Background {
			x = "SafeZoneX + (SafeZoneW * 0.1)";
			y = "SafeZoneY + (SafezoneH * 0.105)";
			w = "SafeZoneW * 0.8";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = cti_Background_Color_Header;
		};
		class Footer: RscText {
			x = "SafeZoneX + (SafeZoneW * 0.1)";
			y = 0.871195 * safezoneH + safezoneY;
			w = "SafeZoneW * 0.8";
			h = 0.034396 * safezoneH;
			colorBackground[] = cti_Background_Color_Footer;
		};
		class cti_Menu_Title : RscText_Title {
			style = ST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.12)";
			y = "SafeZoneY + (SafezoneH * 0.11)";
			w = "SafeZoneW * 0.78";
			h = "SafeZoneH * 0.037";
			text = "Warfare Information Panel";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class cti_Menu_InfoListFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.12)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.2";
			h = 0.676391 * safezoneH;
		};
		class cti_Menu_InfoResourcesFrame : RscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.34)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.54";
			h = 0.676391 * safezoneH;
		};
		class cti_Menu_Info_Background : RscText {
			x = "SafeZoneX + (SafeZoneW * 0.34)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.54";
			h = 0.676391 * safezoneH;
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
	};
	class controls {
		class cti_Menu_Help_Topics : RscListBox {
			idc = 160001;
			
			x = "SafeZoneX + (SafeZoneW * 0.12)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.2";
			h = 0.676389 * safezoneH;
			
			rowHeight = "1.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorDisabled[] = {1,1,1,0.3};
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			onLBSelChanged = "['onHelpLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_Menu_Help.sqf'";
		};
		
		class Menu_Help_ControlsGroup : RscControlsGroup {
			x = "SafeZoneX + (SafeZoneW * 0.34)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.54";
			h = 0.670389 * safezoneH;
			
			class controls {				
				class cti_Menu_Help_Explanation : RscStructuredText {
					
					idc = 160002;
					
					x = "0";
					y = "0";
					w = "SafeZoneW * 0.53";
					h = "SafeZoneH * 2.71";
					
					size = "0.85 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				};
			};
		};
		/* Separators */
		class Exit_Button : RscButton_Exit {
			x = 0.868374 * safezoneW + safezoneX;
			y = 0.878751 * safezoneH + safezoneY;
			onButtonClick = "closeDialog 0;";
			tooltip = $STR_WF_TOOLTIP_CloseButton;
		};		
	};	
};

