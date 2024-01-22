#include "UCStyles.hpp"
#include "UCTablet.hpp"

class CTI_UCRscPurchaseMenu {
	movingEnable = 0;
	type = UCCT_COMBO;
	idd = 110000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_purchasemenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_PurchaseMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_purchasemenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

	class controlsBackground {
		class CTI_Background: UCRscText
		{
			moving = 0;
			idc = 1000;

			x = -0.000156274 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 1.012 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class CTI_Background_Header: CTI_Background
		{
			idc = 1001;

			x = -0.000156274 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 1.00547 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class CTI_Menu_Title: UCRscText
		{
			idc = 1002;

			text = "Factory Menu"; //--- ToDo: Localize;
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.644531 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0.258824,0.713726,1,1};
			sizeEx = (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class CTI_Menu_UnitsListFrame: UCRscFrame
		{
			idc = 1800;

			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.407 * safezoneH;
		};
		class CTI_Menu_Info: CTI_Menu_UnitsListFrame
		{
			idc = 1801;

			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class CTI_Menu_Info_Background: UCRscText
		{
			idc = 1003;

			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {0.5,0.5,0.5,0.25};
		};
		class CTI_Menu_ResourcesInfo_Background: CTI_Menu_Info_Background
		{
			idc = 1004;

			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0.5,0.5,0.5,0.25};
		};
		class CTI_Menu_SubInfo: CTI_Menu_Info
		{
			idc = 1802;

			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class CTI_Menu_ComboFrame: CTI_Menu_Info
		{
			idc = 1803;

			x = 0.505156 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.176 * safezoneH;
		};
		class CTI_Menu_TeamComboLabel: UCRscText
		{
			idc = 1005;

			text = "Team :"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class CTI_Menu_FactoryComboLabel: CTI_Menu_TeamComboLabel
		{
			idc = 1006;

			text = "Factory :"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class CTI_Menu_MapFrame: CTI_Menu_ComboFrame
		{
			idc = 1804;

			x = 0.505156 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.297 * safezoneH;
		};
		class CTI_Menu_Info_MapIntel: UCRscText
		{
			idc = 1007;

			x = 0.505156 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.297 * safezoneH;
			colorBackground[] = {0.5,0.5,0.5,0.25};
		};
		class CTI_Menu_QueueFrame: CTI_Menu_MapFrame
		{
			idc = 1805;

			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class CTI_Menu_UnitsStatsFrame: UCRscFrame
		{
			idc = 110018;

			x = 0.505156 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class CTI_Menu_DescriptionFrame: UCRscText
		{
			idc = 1008;

			x = 0.505156 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class CTI_Menu_UnitsDescriptionFrame: UCRscFrame
		{
			idc = 1807;

			x = 0.505156 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.121 * safezoneH;
		};
	};

	class controls {

		class CTI_Menu_Map: UCRscMapControl
		{
			idc = 110010;
			showCountourInterval = 1;

			x = 0.505156 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.297 * safezoneH;
		};
		class CTI_Menu_Map_Info: UCRscStructuredText
		{
			idc = 110901;
			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";

			x = 0.515469 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.137499 * safezoneW;
			h = 0.0300001 * safezoneH;
		};
		class CTI_Menu_Group_Info: CTI_Menu_Map_Info
		{
			idc = 110902;

			x = 0.695937 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.137499 * safezoneW;
			h = 0.0300001 * safezoneH;
		};
		class CTI_Icon_Barracks: UCRscActiveText
		{
			idc = 110001;
			style = "0x30 + 0x800";
			color[] = {0.75,0.75,0.75,0.7};
			colorBackgroundSelected[] = {0.6,0.8392,0.4706,0.7};
			colorFocused[] = {0,0,0,0};
			action = "['onIconSet', 0, CTI_BARRACKS] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "UCRsc\Pictures\icon_wf_building_barracks.paa"; //--- ToDo: Localize;
			x = 0.04625 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.034 * safezoneW;
			h = 0.064 * safezoneH;
			colorBackground[] = {0.6,0.8392,0.4706,0.7};
			colorActive[] = {1,1,1,0.7};
		};
		class CTI_Icon_Light: CTI_Icon_Barracks
		{
			idc = 110002;
			action = "['onIconSet', 1, CTI_LIGHT] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "UCRsc\Pictures\icon_wf_building_lvs.paa"; //--- ToDo: Localize;
			x = 0.0926562 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.034 * safezoneW;
			h = 0.064 * safezoneH;
			colorBackground[] = {0.6,0.8392,0.4706,0.7};
			colorActive[] = {1,1,1,0.7};
		};
		class CTI_Icon_Heavy: CTI_Icon_Barracks
		{
			idc = 110003;
			action = "['onIconSet', 2, CTI_HEAVY] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "UCRsc\Pictures\icon_wf_building_hvs.paa"; //--- ToDo: Localize;
			x = 0.139062 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.034 * safezoneW;
			h = 0.064 * safezoneH;
			colorBackground[] = {0.6,0.8392,0.4706,0.7};
			colorActive[] = {1,1,1,0.7};
		};
		class CTI_Icon_Air_Rotary: CTI_Icon_Barracks
		{
			idc = 110004;
			action = "['onIconSet', 3, CTI_AIR_ROTARY] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "UCRsc\Pictures\icon_wf_building_air_rotary.paa"; //--- ToDo: Localize;
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.034 * safezoneW;
			h = 0.064 * safezoneH;
			colorBackground[] = {0.6,0.8392,0.4706,0.7};
			colorActive[] = {1,1,1,0.7};
		};
		class CTI_Icon_Air_Fixed: CTI_Icon_Barracks
		{
			idc = 110021;
			action = "['onIconSet', 4, CTI_AIR_FIXED] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "UCRsc\Pictures\icon_wf_building_air_fixed.paa"; //--- ToDo: Localize;
			x = 0.231875 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.034 * safezoneW;
			h = 0.064 * safezoneH;
			colorBackground[] = {0.6,0.8392,0.4706,0.7};
			colorActive[] = {1,1,1,0.7};
		};
		class CTI_Icon_Repair: CTI_Icon_Barracks
		{
			idc = 110005;
			action = "['onIconSet', 5, CTI_REPAIR] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "UCRsc\Pictures\icon_wf_building_repair.paa"; //--- ToDo: Localize;
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.034 * safezoneW;
			h = 0.064 * safezoneH;
			colorBackground[] = {0.6,0.8392,0.4706,0.7};
			colorActive[] = {1,1,1,0.7};
		};
		class CTI_Icon_Ammo: CTI_Icon_Barracks
		{
			idc = 110006;
			action = "['onIconSet', 6, CTI_AMMO] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "UCRsc\Pictures\icon_wf_building_ammo.paa"; //--- ToDo: Localize;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.034 * safezoneW;
			h = 0.064 * safezoneH;
			colorBackground[] = {0.6,0.8392,0.4706,0.7};
			colorActive[] = {1,1,1,0.7};
		};
		class CTI_Icon_Naval: CTI_Icon_Barracks
		{
			idc = 110007;
			action = "['onIconSet', 7, CTI_NAVAL] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "UCRsc\Pictures\icon_wf_building_naval.paa"; //--- ToDo: Localize;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.034 * safezoneW;
			h = 0.064 * safezoneH;
			colorBackground[] = {0.6,0.8392,0.4706,0.7};
			colorActive[] = {1,1,1,0.7};
		};
		class CTI_Icon_Depot: CTI_Icon_Barracks
		{
			idc = 110008;
			action = "['onIconSet', 8, CTI_DEPOT] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "UCRsc\Pictures\icon_wf_building_depot.paa"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.034 * safezoneW;
			h = 0.064 * safezoneH;
			colorBackground[] = {0.6,0.8392,0.4706,0.7};
			colorActive[] = {1,1,1,0.7};
		};
		class CTI_Icon_Driver: CTI_Icon_Barracks
		{
			idc = 110100;
			color[] = {0.258824,0.713726,1,1};
			colorBackgroundSelected[] = {0.6,0.8392,0.4706,0.7};
			colorFocused[] = {0,0,0,0};
			action = "['onVehicleIconClicked', 'driver', 110100] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "UCRsc\Pictures\i_driver.paa"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.0299999 * safezoneW;
			h = 0.048 * safezoneH;
			colorBackground[] = {0.6,0.8392,0.4706,0.7};
			colorActive[] = {1,1,1,0.7};
		};
		class CTI_Icon_Gunner: CTI_Icon_Driver
		{
			idc = 110101;
			action = "['onVehicleIconClicked', 'gunner', 110101] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "UCRsc\Pictures\i_gunner.paa"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.0299999 * safezoneW;
			h = 0.048 * safezoneH;
			colorBackground[] = {0.6,0.8392,0.4706,0.7};
			colorActive[] = {1,1,1,0.7};
		};
		class CTI_Icon_Commander: CTI_Icon_Driver
		{
			idc = 110102;
			action = "['onVehicleIconClicked', 'commander', 110102] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "UCRsc\Pictures\i_commander.paa"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.0299999 * safezoneW;
			h = 0.048 * safezoneH;
			colorBackground[] = {0.6,0.8392,0.4706,0.7};
			colorActive[] = {1,1,1,0.7};
		};
		class CTI_Icon_Turrets: CTI_Icon_Driver
		{
			idc = 110103;
			action = "['onVehicleIconClicked', 'turrets', 110103] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "UCRsc\Pictures\i_turrets.paa"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.0299999 * safezoneW;
			h = 0.048 * safezoneH;
			colorBackground[] = {0.6,0.8392,0.4706,0.7};
			colorActive[] = {1,1,1,0.7};
		};
		class CTI_Icon_Lock: CTI_Icon_Driver
		{
			idc = 110104;
			color[] = {1,0.227451,0.227451,1};
			action = "['onVehicleLockClicked'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "UCRsc\Pictures\i_lock.paa"; //--- ToDo: Localize;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.0299999 * safezoneW;
			h = 0.048 * safezoneH;
			colorBackground[] = {0.6,0.8392,0.4706,0.7};
			colorActive[] = {1,1,1,0.7};
		};
		class CTI_Menu_Control_UnitsList: UCRscListNBox
		{
			idc = 111007;
			rowHeight = "1.4 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.001,0.30,0.75,0.80,0.90};
			onLBSelChanged = "['onUnitsLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";
			onLBDblClick = "['onPurchase', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.407 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
		};
		class CTI_Menu_ComboTeam: UCRscCombo
		{
			idc = 110016;
			onLBSelChanged = "['onGroupLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			x = 0.654688 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 0.8 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class CTI_Menu_ComboFactory: CTI_Menu_ComboTeam
		{
			idc = 110009;
			onLBSelChanged = "['onFactoryLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			x = 0.654688 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 0.8 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class CTI_Menu_Control_Purchase: UCRscButton
		{
			idc = 100011;
			action = "['onPurchase', lnbCurSelRow 111007] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "Purchase"; //--- ToDo: Localize;
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class CTI_Menu_Control_CancelQueu: CTI_Menu_Control_Purchase
		{
			idc = 100012;
			action = "['onQueueCancel', lbCurSel 110013] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "Cancel Queue"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class CTI_Menu_Control_IndependentSalvager: CTI_Menu_Control_CancelQueu
		{
			idc = 100016;
			action = "['onIndependentSalvagerPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			text = "Buy Independent Salvager"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 5.896 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class CTI_Menu_Control_QueueList: UCRscListBox
		{
			idc = 110013;
			rowHeight = "1.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onLBDblClick = "['onQueueCancel', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.121 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
		};
		class CTI_Menu_Control_Cost: UCRscStructuredText
		{
			idc = 110014;
			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";

			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_Menu_Control_Resources: CTI_Menu_Control_Cost
		{
			idc = 110015;
			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";

			x = 0.350469 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_Control_Exit: UCRscButton
		{
			idc = 22555;
			action = "closeDialog 0";

			text = "X"; //--- ToDo: Localize;
			x = 0.95375 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class CTI_Menu_UnitsFilterFrame: UCRscFrame
		{
			idc = 1806;

			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class CTI_Menu_ComboFilter: CTI_Menu_ComboTeam
		{
			idc = 110017;
			onLBSelChanged = "['onFilterLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";

			x = 0.04625 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.443438 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 0.8 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class CTI_Menu_UnitsDescription: UCRscStructuredText
		{
			idc = 110019;
			style = 16;
			lineSpacing = 1;
			canDrag = 1;
			size = 0.03;

			text = " "; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.764 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.121 * safezoneH;
			sizeEx = 0.4 * 			(			(			((safezoneW / safezoneH) min 1.1) / 1.1) / 15);
		};
		class CTI_Menu_StatListContainer: UCRscControlsGroup
		{
			idc = 110021;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.198 * safezoneH;
			//style = UCST_UP + UCST_LEFT;
			colorBackground[] = {0,0,0,0};
			class HScrollbar {
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				height = 0.024;
				shadow = 0;
				color[] = {1,1,1,0.6};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};
			class controls {
				class CTI_Menu_StatList: UCRscListNBox
				{
					idc = 110020;
					rowHeight = "1.1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					itemBackground[] = {1,1,1,0.1};
					columns[] = {0,.05}; // originally {0.001, 0.35} when box width was at original value

					x = 0;
					y = 0;
					w = (SafezoneW  * 1);
					h = (SafezoneH  * 0.165);
					colorBackground[] = {0,0,0,0};
					sizeEx = "0.65 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					onLBDblClick = "['copyClassnameToClipboard', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_PurchaseMenu.sqf'";
					class Attributes {
						font = "PuristaMedium";
						color = "#E8F0FF";
						align = "left";
						shadow = false;
					};
				};
			};
		};

		class CTI_Menu_StatPic: UCRscStructuredText
		{
			idc = 111014;
			style = 16;

			x = 0.505156 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.198 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};
};



class CTI_UCRscRespawnMenu {
	movingEnable = 0;
	idd = 120000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_respawnmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_RespawnMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_respawnmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_RespawnMenu.sqf'";

	class controlsBackground {
		class CTI_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.15)";
			y = "SafeZoneY + (SafezoneH * 0.15)";
			w = "SafeZoneW * 0.7";
			h = "SafeZoneH * 0.7";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.15)";
			y = "SafeZoneY + (SafezoneH * 0.15)";
			w = "SafeZoneW * 0.7";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : UCRscText {
			style = UCST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.17)";
			y = "SafeZoneY + (SafezoneH * 0.155)";
			w = "SafeZoneW * 0.68";
			h = "SafeZoneH * 0.037";

			text = "Respawn Menu";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_MapFrame : UCRscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.16)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.40";
			h = "SafeZoneH * 0.58";
		};
		class CTI_Menu_InfoFrame : CTI_Menu_MapFrame {
			y = "SafeZoneY + (SafezoneH * 0.8)";
			w = "SafeZoneW * 0.40";
			h = "SafeZoneH * 0.04";
		};
		class CTI_Menu_ListLabelFrame : CTI_Menu_MapFrame {
			x = "SafeZoneX + (SafeZoneW * 0.57)";
			w = "SafeZoneW * 0.27";
			h = "SafeZoneH * 0.04";
		};
		class CTI_Menu_ListFrame : CTI_Menu_ListLabelFrame {
			y = "SafeZoneY + (SafezoneH * 0.26)";
			h = "SafeZoneH * 0.58";
		};
		class CTI_Menu_ListInfo_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.57)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.27";
			h = "SafeZoneH * 0.04";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_ListInfo_Text : UCRscText {
			style = UCST_CENTER;

			x = "SafeZoneX + (SafeZoneW * 0.57)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.27";
			h = "SafeZoneH * 0.04";

			text = "Available locations";
			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
	};

	class controls {
		class CTI_Menu_Map : UCRscMapControl {
			idc = 120001;

			x = "SafeZoneX + (SafeZoneW * 0.16)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.40";
			h = "SafeZoneH * 0.58";

			showCountourInterval = 1;

			onMouseMoving = "mouseX = (_this select 1);mouseY = (_this select 2)";
			onMouseButtonDown = "mouseButtonDown = _this select 1;";
			onMouseButtonUp = "mouseButtonUp = _this select 1;";
		};
		class CTI_Menu_Control_LocationList : UCRscListBox {
			idc = 120002;

			x = "SafeZoneX + (SafeZoneW * 0.57)";
			w = "SafeZoneW * 0.27";
			y = "SafeZoneY + (SafezoneH * 0.26)";
			h = "SafeZoneH * 0.58";

			rowHeight = "1.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};

			onLBSelChanged = "['onSpawnLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_RespawnMenu.sqf'";
		};
		class CTI_Menu_Respawn_Info : UCRscStructuredText {
			idc = 120003;

			x = "SafeZoneX + (SafeZoneW * 0.16)";
			y = "SafeZoneY + (SafezoneH * 0.805)";
			w = "SafeZoneW * 0.40";
			h = "SafeZoneH * 0.035";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
	};
};

class CTI_UCRscOptionsMenu {
	movingEnable = 0;
	idd = 130000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_optionsmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_OptionsMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_optionsmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";

	class controlsBackground {
		class CTI_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.3";
			h = "SafeZoneH * 0.75";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.3";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : UCRscText {
			style = UCST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.037";

			text = "Options & Info";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_InfoListFrame : UCRscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.15";
		};
		class CTI_Menu_Info_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.15";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
	};

	class controls {
		class CTI_Menu_Options_Info1 : UCRscStructuredText {
			idc = 130001;

			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.03";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			// text = "Victory: Destroy Enemy";
		};
		class CTI_Menu_Options_Info2 : CTI_Menu_Options_Info1 {
			idc = 130002;

			y = "SafeZoneY + (SafezoneH * 0.305)";

			// text = "Player Pool: 30%";
		};
		class CTI_Menu_Options_Info3 : CTI_Menu_Options_Info1 {
			idc = 130003;

			y = "SafeZoneY + (SafezoneH * 0.335)";

			// text = "Award Pool: 30%";
		};
		class CTI_Menu_Options_Info4 : CTI_Menu_Options_Info1 {
			idc = 130004;

			y = "SafeZoneY + (SafezoneH * 0.365)";

			// text = "Resources: $23125 (+$510/min)";
		};
		class CTI_Menu_Options_Info5 : CTI_Menu_Options_Info1 {
			idc = 130005;

			y = "SafeZoneY + (SafezoneH * 0.395)";

			// text = "Towns Held: 0/23";
		};
		class CTI_Menu_Options_OnlineHelp : UCRscButton {
			idc = 130006;

			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.445)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.04";

			text = "Online Help";
			action = "['onOnlineHelpPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_Video : CTI_Menu_Options_OnlineHelp {
			idc = 130007;

			y = "SafeZoneY + (SafezoneH * 0.495)";

			text = "Video Settings";
			action = "['onVideoSettingsPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_Music : CTI_Menu_Options_OnlineHelp {
			idc = 130008;

			y = "SafeZoneY + (SafezoneH * 0.545)";

			text = "Play Music: Off";
			action = "['onMusicPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_TransferFunds : CTI_Menu_Options_OnlineHelp {
			idc = 130009;

			y = "SafeZoneY + (SafezoneH * 0.595)";

			text = "Transfer Resources";
			action = "['onTransferResourcesPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_Unflip : CTI_Menu_Options_OnlineHelp {
			idc = 130010;

			y = "SafeZoneY + (SafezoneH * 0.645)";

			text = "Unflip Nearest Vehicle";
			action = "['onUnflipPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_Service : CTI_Menu_Options_OnlineHelp {
			idc = 130011;

			y = "SafeZoneY + (SafezoneH * 0.695)";

			text = "Service Menu";
			action = "['onServicePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_AIMicro : CTI_Menu_Options_OnlineHelp {
			idc = 130014;

			y = "SafeZoneY + (SafezoneH * 0.745)";

			text = "AI Management";
			action = "['onAIMicroPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_UnitsCam : CTI_Menu_Options_OnlineHelp { //--- Render out
			idc = 130012;

			y = "SafeZoneY + (SafezoneH * 3.795)";

			text = "Units Camera";
			action = "['onUnitsCamPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_SatCam : CTI_Menu_Options_OnlineHelp { //--- Render out
			idc = 130013;

			y = "SafeZoneY + (SafezoneH * 3.845)";

			text = "Satellite Camera";
			action = "['onSatCamPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Menu_Options_VoteMenu : CTI_Menu_Options_OnlineHelp {
			idc = 130015;

			y = "SafeZoneY + (SafezoneH * 0.895)";

			text = "Commander Vote";
			action = "['onCommanderVotePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OptionsMenu.sqf'";
		};
		class CTI_Control_Exit : UCRscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.45)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
	};
};

class CTI_UCRscTransferResourcesMenu {
	movingEnable = 0;
	idd = 140000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_transferresourcesmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_transferresourcesmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";

	class controlsBackground {
		class CTI_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.6";
			h = "SafeZoneH * 0.47";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.6";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : UCRscText {
			style = UCST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.58";
			h = "SafeZoneH * 0.037";

			text = "Resources Menu (Passive Income not shown here)";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_InfoListFrame : UCRscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.29";
			h = "SafeZoneH * 0.38";
		};
		class CTI_Menu_InfoResourcesFrame : UCRscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.06";
		};
		class CTI_Menu_TransferFrame : UCRscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.35)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.1";
		};
		class CTI_Menu_IncomeFrame : UCRscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.465)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.06";
		};
		class CTI_Menu_Info_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.06";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_CommanderFrame : CTI_Menu_InfoResourcesFrame {
			y = "SafeZoneY + (SafezoneH * 0.54)";
			h = "SafeZoneH * 0.115";
		};
		class CTI_Menu_Commander_Background : CTI_Menu_Info_Background {
			y = "SafeZoneY + (SafezoneH * 0.54)";
			h = "SafeZoneH * 0.115";
		};
		class CTI_Menu_Transfer_Background : CTI_Menu_Info_Background {
			y = "SafeZoneY + (SafezoneH * 0.35)";
			h = "SafeZoneH * 0.1";
		};
		class CTI_Menu_Income_Background : CTI_Menu_Info_Background {
			y = "SafeZoneY + (SafezoneH * 0.465)";
			h = "SafeZoneH * 0.06";
		};

		class CTI_Menu_Info_EditBackground : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.71)";
			y = "SafeZoneY + (SafezoneH * 0.36)";
			w = "SafeZoneW * 0.065";
			h = "SafeZoneH * 0.03";
			colorBackground[] = {0, 0, 0, 0.8};
		};

		class CTI_Menu_Players_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.29";
			h = "SafeZoneH * 0.38";
			colorBackground[] = {0.5, 0.5, 0.5, 0.10};
		};
		class CTI_Menu_PlayerPoolLabel : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.55)";
			w = "SafeZoneW * 0.16";
			h = "SafeZoneH * 0.035";

			text = "Player Resources %";

			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_AwardPoolLabel : CTI_Menu_PlayerPoolLabel {
			y = "SafeZoneY + (SafezoneH * 0.605)";

			text = "Award Pool %";
		};
	};

	class controls {
		class CTI_Menu_Funds_GroupsList : UCRscListNBox {
			idc = 140001;

			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.29";
			h = "SafeZoneH * 0.38";

			rowHeight = "1.22 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			// columns[] = {0.001, 0.26};
			columns[] = {0.001, 0.3};

			onLBDblClick = "['onGivePlayerPressed', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
			onLBSelChanged = "['onGroupLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
		};
		class CTI_Menu_Funds_MyResources : UCRscStructuredText {
			idc = 140002;

			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.03";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			// text = "Your Resources: $8000";
		};
		class CTI_Menu_Funds_TargetResources : CTI_Menu_Funds_MyResources {
			idc = 140003;

			y = "SafeZoneY + (SafezoneH * 0.305)";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			// text = "Player Resources: $8000";
		};
		class CTI_Menu_Funds_Slider : UCRscXSliderH {
			idc = 140008;

			x = "SafeZoneX + (SafeZoneW * 0.525)";
			y = "SafeZoneY + (SafezoneH * 0.36)";
			w = "SafeZoneW * 0.18";
			h = "SafeZoneH * 0.03";

			onSliderPosChanged = "['onFundSliderChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
		};
		class CTI_Menu_Funds_Box : UCRscEdit {
			idc = 140009;

			x = "SafeZoneX + (SafeZoneW * 0.71)";
			y = "SafeZoneY + (SafezoneH * 0.36)";
			w = "SafeZoneW * 0.065";
			h = "SafeZoneH * 0.03";

			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			text = "0";
		};
		class CTI_Menu_Funds_GivePlayer : UCRscButton {
			idc = 140004;

			x = "SafeZoneX + (SafeZoneW * 0.525)";
			y = "SafeZoneY + (SafezoneH * 0.4)";
			w = "SafeZoneW * 0.25";
			h = "SafeZoneH * 0.04";

			text = "Give Player";
			action = "['onGivePlayerPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
		};
		class CTI_Menu_Funds_Commander : UCRscStructuredText {
			idc = 140010;

			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.465)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.03";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Funds_Players : CTI_Menu_Funds_Commander {
			idc = 140011;

			y = "SafeZoneY + (SafezoneH * 0.495)";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Funds_ResourcesPool : UCRscCombo {
			idc = 140006;

			x = "SafeZoneX + (SafeZoneW * 0.7)";
			y = "SafeZoneY + (SafezoneH * 0.55)";
			w = "SafeZoneW * 0.07";
			h = "SafeZoneH * 0.04";

			onLBSelChanged = "['onResourcesPoolLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Funds_AwardPool : CTI_Menu_Funds_ResourcesPool {
			idc = 140007;

			y = "SafeZoneY + (SafezoneH * 0.605)";

			onLBSelChanged = "['onAwardPoolLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
		};
		class CTI_Control_Exit : UCRscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.74)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.695)";

			text = "<<";
			action = "['onGoBack'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
		};
	};
};

class CTI_UCRscVideoSettingsMenu {
	movingEnable = 0;
	idd = 150000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_videosettingsmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_VideoSettingsMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_videosettingsmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_VideoSettingsMenu.sqf'";

	class controlsBackground {
		class CTI_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.3";
			h = "SafeZoneH * 0.426";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.3";
			h = "SafeZoneH * 0.05";
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : UCRscText {
			style = UCST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.037";

			text = "Video Settings";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_InfoListFrame : UCRscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.2";
		};
		class CTI_Menu_Info_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.2";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_GridFrame : CTI_Menu_InfoListFrame {
			y = "SafeZoneY + (SafezoneH * 0.491)";
			h = "SafeZoneH * 0.07";
		};
		class CTI_Menu_Grid_Background : CTI_Menu_Info_Background {
			y = "SafeZoneY + (SafezoneH * 0.491)";
			h = "SafeZoneH * 0.07";
		};
	};

	class controls {
		class CTI_Menu_Video_ViewDistanceLabel : UCRscText {
			idc = 150001;
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.035";

			text = "View Distance: 1000m";

			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Video_ViewDistance : UCRscXSliderH {
			idc = 150002;

			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.31)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.025";

			onSliderPosChanged = "['onViewSliderChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_VideoSettingsMenu.sqf'";
		};
		class CTI_Menu_Video_ObjectDistanceLabel : CTI_Menu_Video_ViewDistanceLabel {
			idc = 150003;
			y = "SafeZoneY + (SafezoneH * 0.34)";

			text = "Objects Distance: 1000m";
		};
		class CTI_Menu_Video_ObjectDistance : CTI_Menu_Video_ViewDistance {
			idc = 150004;

			y = "SafeZoneY + (SafezoneH * 0.375)";

			onSliderPosChanged = "['onObjectSliderChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_VideoSettingsMenu.sqf'";
		};
		class CTI_Menu_Video_ShadowsDistanceLabel : CTI_Menu_Video_ViewDistanceLabel {
			idc = 150005;
			y = "SafeZoneY + (SafezoneH * 0.405)";

			// text = "Shadows Distance: 200m";
		};
		class CTI_Menu_Video_ShadowsDistance : CTI_Menu_Video_ViewDistance {
			idc = 150006;

			y = "SafeZoneY + (SafezoneH * 0.44)";
			onSliderPosChanged = "['onShadowsSliderChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_VideoSettingsMenu.sqf'";
		};

		class CTI_Menu_Video_GridLabel : CTI_Menu_Video_ViewDistanceLabel {
			idc = 150007;
			y = "SafeZoneY + (SafezoneH * 0.491)";

			// text = "Terrain Grid: 25";
		};
		class CTI_Menu_Video_GridLevel : CTI_Menu_Video_ViewDistance {
			idc = 150008;

			y = "SafeZoneY + (SafezoneH * 0.526)";

			onSliderPosChanged = "['onGridSliderChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_VideoSettingsMenu.sqf'";
		};
		class CTI_Menu_Hints : UCRscButton {
			idc = 150009;

			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.576)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.04";

			text = "";
			action = "['onHintsPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_VideoSettingsMenu.sqf'";
		};
		class CTI_Control_Exit : UCRscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.45)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.405)";

			text = "<<";
			action = "closeDialog 0; createDialog 'CTI_UCRscTabletDialogOptions';";
		};
	};
};

class CTI_UCRscOnlineHelpMenu {
	movingEnable = 0;
	idd = 160000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_onlinehelpmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_OnlineHelpMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_onlinehelpmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OnlineHelpMenu.sqf'";

	class controlsBackground {
		class CTI_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.1)";
			y = "SafeZoneY + (SafezoneH * 0.105)";
			w = "SafeZoneW * 0.8";
			h = "SafeZoneH * 0.8";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.1)";
			y = "SafeZoneY + (SafezoneH * 0.105)";
			w = "SafeZoneW * 0.8";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : UCRscText {
			style = UCST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.12)";
			y = "SafeZoneY + (SafezoneH * 0.11)";
			w = "SafeZoneW * 0.78";
			h = "SafeZoneH * 0.037";

			text = "Online Help";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_InfoListFrame : UCRscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.12)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.71";
		};
		class CTI_Menu_InfoResourcesFrame : UCRscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.34)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.54";
			h = "SafeZoneH * 0.71";
		};
		class CTI_Menu_Info_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.34)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.54";
			h = "SafeZoneH * 0.71";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Control_Exit : UCRscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.84)";
			y = "SafeZoneY + (SafezoneH * 0.11)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.795)";

			text = "<<";
			action = "closeDialog 0; createDialog 'CTI_UCRscTabletDialogOptions';";
		};
	};

	class controls {
		class CTI_Menu_Help_Topics : UCRscListBox {
			idc = 160001;

			x = "SafeZoneX + (SafeZoneW * 0.12)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.71";

			rowHeight = "1.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};

			onLBSelChanged = "['onHelpLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_OnlineHelpMenu.sqf'";
		};

		class CTI_Menu_Help_ControlsGroup : UCRscControlsGroup {
			x = "SafeZoneX + (SafeZoneW * 0.34)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.54";
			h = "SafeZoneH * 0.71";

			class controls {
				class CTI_Menu_Help_Explanation : UCRscStructuredText {
					idc = 160002;

					x = "0";
					y = "0";
					w = "SafeZoneW * 0.53";
					h = "SafeZoneH * 2.71";

					size = "0.85 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
					// text = "Your Resources: $8000";
				};
			};
		};
	};
};

class CTI_UCRscSatelitteCamera {
	movingEnable = 0;
	idd = 170000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_satcam', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_SatelitteCamera.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_satcam', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_SatelitteCamera.sqf'";

	class controlsBackground {
		class CTI_MouseArea : UCRscText {
			idc = 170001;
			style = UCST_MULTI;

			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			text = "";
		};
	};

	class controls {
		class CTI_Background : UCRscText { //--- Render out.
			idc = 170002;

			x = "SafeZoneX + (SafeZoneW * 0.8)";
			y = "SafeZoneY + (SafezoneH * 3.06)";
			w = "SafeZoneW * 0.19";
			h = "SafeZoneH * 0.55";
			colorBackground[] = {0, 0, 0, 0.5};
		};
		class CTI_Menu_Control_UnitsLiUCST_Label : UCRscText { //--- Render out.
			idc = 170003;

			x = "SafeZoneX + (SafeZoneW * 0.805)";
			y = "SafeZoneY + (SafezoneH * 3.0605)";
			w = "SafeZoneW * 0.19";
			h = "SafeZoneH * 0.03";

			text = "Teams :";
			colorText[] = {0.231372549, 0.580392157, 0.929411765, 1};
			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Control_UnitsLiUCST_Frame : UCRscFrame { //--- Render out.
			idc = 170004;

			x = "SafeZoneX + (SafeZoneW * 0.805)";
			y = "SafeZoneY + (SafeZoneH * 3.10)";
			h = "SafeZoneH * 0.3";
			w = "SafeZoneW * 0.18";
		};
		class CTI_Menu_Control_UnitsAILiUCST_Label : CTI_Menu_Control_UnitsLiUCST_Label { //--- Render out.
			idc = 170005;

			x = "SafeZoneX + (SafeZoneW * 0.805)";
			y = "SafeZoneY + (SafezoneH * 3.41)";
			w = "SafeZoneW * 0.19";
			h = "SafeZoneH * 0.03";

			text = "AI Members :";
		};
		class CTI_Menu_Control_UnitsAILiUCST_Frame : CTI_Menu_Control_UnitsLiUCST_Frame { //--- Render out.
			idc = 170006;

			x = "SafeZoneX + (SafeZoneW * 0.805)";
			y = "SafeZoneY + (SafeZoneH * 3.45)";
			h = "SafeZoneH * 0.15";
			w = "SafeZoneW * 0.18";
		};
		class CTI_Menu_Control_ToggleGroups : UCRscButton_Opac {
			idc = 170007;

			x = "SafeZoneX + (SafeZoneW * 0.8)";
			y = "SafeZoneY + (SafeZoneH * 0.01)";
			h = "SafeZoneH * 0.04";
			w = "SafeZoneW * 0.19";

			text = "";
			action = "['onToggleGroup'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_SatelitteCamera.sqf'";
		};
		class CTI_Menu_Control_ToggleMap : CTI_Menu_Control_ToggleGroups {
			idc = 170008;

			y = "SafeZoneY + (SafeZoneH * 0.95)";

			text = "";
			action = "['onToggleMap'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_SatelitteCamera.sqf'";
		};
		class CTI_Background_Map : CTI_Background { //--- Render out.
			idc = 170009;

			y = "SafeZoneY + (SafezoneH * 3.62)";
			h = "SafeZoneH * 0.32";
		};
		class CTI_Menu_Map : UCRscMapControl { //--- Render out.
			idc = 170010;

			x = "SafeZoneX + (SafeZoneW * 0.805)";
			y = "SafeZoneY + (SafezoneH * 3.63)";
			w = "SafeZoneW * 0.18";
			h = "SafeZoneH * 0.30";

			showCountourInterval = 1;
			onMouseButtonDown = "nullReturn = _this call CTI_UI_SatelitteCamera_MapClicked";
		};
		class CTI_Background_Top : CTI_Background {
			idc = 170011;
			style = UCST_CENTER;

			x = "SafeZoneX + (SafeZoneW * 0.33)";
			y = "SafeZoneY + (SafezoneH * 0.01)";
			w = "SafeZoneW * 0.34";
			h = "SafeZoneH * 0.04";

			text = "";
			sizeEx = "0.94 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Control_Exit : UCRscButton_Opac {
			idc = 170012;

			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafeZoneH * 0.95)";
			h = "SafeZoneH * 0.04";
			w = "SafeZoneW * 0.14";

			text = "Exit";
			action = "closeDialog 0";
		};
		class CTI_Menu_Control_Mode : CTI_Menu_Control_Exit {
			idc = 170013;

			x = "SafeZoneX + (SafeZoneW * 0.16)";

			text = "";
			action = "['onViewModeChanged'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_SatelitteCamera.sqf'";
		};
		class CTI_Menu_UnitCamJump : CTI_Menu_Control_Exit {
			idc = 170014;

			x = "SafeZoneX + (SafeZoneW * 0.31)";

			text = "Unit Camera";
			action = "['onUnitCameraJump'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_SatelitteCamera.sqf'";
		};
		class CTI_Menu_Control_ToggleInfo : CTI_Menu_Control_ToggleGroups {
			idc = 170015;

			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafeZoneH * 0.01)";

			text = "";
			action = "['onToggleInfo'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_SatelitteCamera.sqf'";
		};
		class CTI_Background_Info : CTI_Background { //--- Render out.
			idc = 170016;

			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 3.06)";
			w = "SafeZoneW * 0.31";
			h = "SafeZoneH * 0.6";
		};
		class CTI_Menu_Help_ControlsGroup : UCRscControlsGroup { //--- Render out.
			idc = 170018;
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 3.06)";
			w = "SafeZoneW * 0.31";
			h = "SafeZoneH * 0.6";

			class controls {
				class CTI_Menu_Control_Info : UCRscStructuredText {
					idc = 170017;

					x = 0;
					y = 0;
					w = "SafeZoneW * 0.31";
					h = "SafeZoneH * 1";

					size = "0.75 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				};
			};
		};

		class CTI_Menu_Control_UnitsList : UCRscListBox { //--- Render out.
			idc = 170100;

			x = "SafeZoneX + (SafeZoneW * 0.805)";
			y = "SafeZoneY + (SafeZoneH * 3.10)";
			h = "SafeZoneH * 0.3";
			w = "SafeZoneW * 0.18";

			rowHeight = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};

			onLBSelChanged = "['onUnitsLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_SatelitteCamera.sqf'";
		};
		class CTI_Menu_Control_UnitsAIList : CTI_Menu_Control_UnitsList { //--- Render out.
			idc = 170101;

			y = "SafeZoneY + (SafeZoneH * 3.45)";
			h = "SafeZoneH * 0.15";

			onLBSelChanged = "['onUnitsAILBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_SatelitteCamera.sqf'";
		};
	};
};

class CTI_UCRscBaseCamera {
	movingEnable = 0;
	idd = 177000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_basecam', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_BaseCamera.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_basecam', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_BaseCamera.sqf'";

	class controlsBackground {
		class CTI_MouseArea : UCRscText {
			idc = 177001;
			style = UCST_MULTI;

			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			text = "";
		};
	};

	class controls {
		class CTI_Menu_Control_ToggleMap : UCRscButton_Opac {
			idc = 177008;

			x = "SafeZoneX + (SafeZoneW * 0.8)";
			y = "SafeZoneY + (SafeZoneH * 0.95)";
			h = "SafeZoneH * 0.04";
			w = "SafeZoneW * 0.19";

			text = "";
			action = "['onToggleMap'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_BaseCamera.sqf'";
		};
		class CTI_Background_Map : UCRscText { //--- Render out.
			idc = 177009;

			x = "SafeZoneX + (SafeZoneW * 0.8)";
			y = "SafeZoneY + (SafezoneH * 3.62)";
			w = "SafeZoneW * 0.19";
			h = "SafeZoneH * 0.32";
			colorBackground[] = {0, 0, 0, 0.5};
		};
		class CTI_Menu_Map : UCRscMapControl { //--- Render out.
			idc = 177010;

			x = "SafeZoneX + (SafeZoneW * 0.805)";
			y = "SafeZoneY + (SafezoneH * 3.63)";
			w = "SafeZoneW * 0.18";
			h = "SafeZoneH * 0.30";

			showCountourInterval = 1;
			onMouseButtonDown = "nullReturn = _this call CTI_UI_BaseCamera_MapClicked";
		};
		class CTI_Menu_Control_Exit : UCRscButton_Opac {
			idc = 177012;

			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafeZoneH * 0.95)";
			h = "SafeZoneH * 0.04";
			w = "SafeZoneW * 0.14";

			text = "Exit";
			action = "closeDialog 0";
		};
		class CTI_Menu_Control_Mode : CTI_Menu_Control_Exit {
			idc = 177013;

			x = "SafeZoneX + (SafeZoneW * 0.16)";

			text = "";
			action = "['onViewModeChanged'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_BaseCamera.sqf'";
		};
	};
};

class CTI_UCRscUnitsCamera {
	movingEnable = 0;
	idd = 180000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_unitscam', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_UnitsCamera.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_unitscam', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";

	class controlsBackground {
		class CTI_MouseArea : UCRscText {
			idc = 180001;
			style = UCST_MULTI;

			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";

			text = "";
		};
	};

	class controls {
		class CTI_Background : UCRscText { //--- Render out.
			idc = 180002;

			x = "SafeZoneX + (SafeZoneW * 0.8)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.19";
			h = "SafeZoneH * 0.55";

			colorBackground[] = {0, 0, 0, 0.5};
		};
		class CTI_Menu_Control_UnitsLiUCST_Label : UCRscText { //--- Render out.
			idc = 180003;

			x = "SafeZoneX + (SafeZoneW * 0.805)";
			y = "SafeZoneY + (SafezoneH * 0.0605)";
			w = "SafeZoneW * 0.19";
			h = "SafeZoneH * 0.03";

			text = "Teams :";
			colorText[] = {0.231372549, 0.580392157, 0.929411765, 1};
			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Control_UnitsLiUCST_Frame : UCRscFrame { //--- Render out.
			idc = 180004;

			x = "SafeZoneX + (SafeZoneW * 0.805)";
			y = "SafeZoneY + (SafeZoneH * 0.10)";
			h = "SafeZoneH * 0.3";
			w = "SafeZoneW * 0.18";
		};
		class CTI_Menu_Control_UnitsAILiUCST_Label : CTI_Menu_Control_UnitsLiUCST_Label { //--- Render out.
			idc = 180005;

			x = "SafeZoneX + (SafeZoneW * 0.805)";
			y = "SafeZoneY + (SafezoneH * 0.41)";
			w = "SafeZoneW * 0.19";
			h = "SafeZoneH * 0.03";

			text = "AI Members :";
		};
		class CTI_Menu_Control_UnitsAILiUCST_Frame : CTI_Menu_Control_UnitsLiUCST_Frame { //--- Render out.
			idc = 180006;

			x = "SafeZoneX + (SafeZoneW * 0.805)";
			y = "SafeZoneY + (SafeZoneH * 0.45)";
			h = "SafeZoneH * 0.15";
			w = "SafeZoneW * 0.18";
		};
		class CTI_Menu_Control_ToggleGroups : UCRscButton_Opac {
			idc = 180007;

			x = "SafeZoneX + (SafeZoneW * 0.8)";
			y = "SafeZoneY + (SafeZoneH * 0.01)";
			h = "SafeZoneH * 0.04";
			w = "SafeZoneW * 0.19";

			text = "";
			action = "['onToggleGroup'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";
		};
		class CTI_Menu_Control_ToggleMap : CTI_Menu_Control_ToggleGroups {
			idc = 180008;

			y = "SafeZoneY + (SafeZoneH * 0.95)";

			text = "";
			action = "['onToggleMap'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";
		};
		class CTI_Background_Map : CTI_Background { //--- Render out.
			idc = 180009;

			y = "SafeZoneY + (SafezoneH * 0.62)";
			h = "SafeZoneH * 0.32";
		};
		class CTI_Menu_Map : UCRscMapControl { //--- Render out.
			idc = 180010;

			x = "SafeZoneX + (SafeZoneW * 0.805)";
			y = "SafeZoneY + (SafezoneH * 0.63)";
			w = "SafeZoneW * 0.18";
			h = "SafeZoneH * 0.30";

			showCountourInterval = 1;
		};
		class CTI_Background_Top : CTI_Background {
			idc = 180011;
			style = UCST_CENTER;

			x = "SafeZoneX + (SafeZoneW * 0.33)";
			y = "SafeZoneY + (SafezoneH * 0.01)";
			w = "SafeZoneW * 0.34";
			h = "SafeZoneH * 0.04";

			text = "";
			sizeEx = "0.94 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Control_Exit : UCRscButton_Opac {
			idc = 180012;

			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafeZoneH * 0.95)";
			h = "SafeZoneH * 0.04";
			w = "SafeZoneW * 0.14";

			text = "Exit";
			action = "closeDialog 0";
		};
		class CTI_Menu_Control_Mode : CTI_Menu_Control_Exit {
			idc = 180013;

			x = "SafeZoneX + (SafeZoneW * 0.16)";

			text = "";
			action = "['onViewModeChanged'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";
		};
		/*no satelitekey needed
		class CTI_Menu_UnitCamJump : CTI_Menu_Control_Exit { //--- Render out
			idc = 180014;

			x = "SafeZoneX + (SafeZoneW * 0.31)";

			text = "";
			action = "['onSatelliteCameraJump'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";
		};
		*/
		/*not needed, we just use this great remote solution from ofps
		class CTI_Menu_Control_ToggleInfo : CTI_Menu_Control_ToggleGroups {
			idc = 180015;

			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafeZoneH * 0.01)";

			text = "";
			action = "['onToggleInfo'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";
		};
		
		class CTI_Background_Info : CTI_Background { //--- Render out.
			idc = 180016;

			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.31";
			h = "SafeZoneH * 0.6";
		};
		
		class CTI_Menu_Help_ControlsGroup : UCRscControlsGroup { //--- Render out.
			idc = 180018;
			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.31";
			h = "SafeZoneH * 0.6";
		
			class controls {
				class CTI_Menu_Control_Info : UCRscStructuredText {
					idc = 180017;

					x = 0;
					y = 0;
					w = "SafeZoneW * 0.31";
					h = "SafeZoneH * 1";

					size = "0.75 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				};
			};
		};
		*/
		class CTI_Menu_Control_IronSight : UCRscButton_Opac {
			idc = 180019;

			x = "SafeZoneX + (SafeZoneW * 0.01)";
			y = "SafeZoneY + (SafeZoneH * 0.90)";
			h = "SafeZoneH * 0.04";
			w = "SafeZoneW * 0.14";

			text = "Iron Sight";
			action = "['onCamChange', 'ironsight'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";
		};
		class CTI_Menu_Control_Internal : CTI_Menu_Control_IronSight {
			idc = 180020;

			y = "SafeZoneY + (SafeZoneH * 0.85)";

			text = "Internal";
			action = "['onCamChange', 'internal'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";
		};
		class CTI_Menu_Control_External : CTI_Menu_Control_IronSight { //--- Render out.
			idc = 180021;

			y = "SafeZoneY + (SafeZoneH * 0.80)";

			text = "External";
			action = "['onCamChange', 'external'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";
		};
		/*unflip not needed
		class CTI_Menu_Control_Unflip : CTI_Menu_Control_IronSight {
			idc = 180022;

			y = "SafeZoneY + (SafeZoneH * 0.75)";
			
			text = "";
			action = "['onUnitUnflip'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";
		};
		*/
		class CTI_Menu_Control_Disband : CTI_Menu_Control_IronSight { //--- Render out.
			idc = 180023;

			y = "SafeZoneY + (SafeZoneH * 0.70)";

			text = "Disband Unit";
			action = "['onUnitDisband'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";
		};
		class CTI_Menu_Control_Remote : CTI_Menu_Control_IronSight {
			idc = 180024;

			y = "SafeZoneY + (SafeZoneH * 0.65)";

			text = "Remote Control";
			action = "['onRemote'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";
		};
	/*Removed in favor of HALO vehicle fast travel
		class CTI_Menu_Paradrop : CTI_Menu_Control_IronSight {
			idc = 180025;

			y = "SafeZoneY + (SafeZoneH * 0.6)";

			text = "Paradrop";
			action = "['onParadrop'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";
		};
	*/
		class CTI_Menu_Control_UnitsList : UCRscListBox { //--- Render out.
			idc = 180100;

			x = "SafeZoneX + (SafeZoneW * 0.805)";
			y = "SafeZoneY + (SafeZoneH * 0.10)";
			h = "SafeZoneH * 0.3";
			w = "SafeZoneW * 0.18";

			rowHeight = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};

			onLBSelChanged = "['onUnitsLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";
		};
		class CTI_Menu_Control_UnitsAIList : CTI_Menu_Control_UnitsList { //--- Render out.
			idc = 180101;

			y = "SafeZoneY + (SafeZoneH * 0.45)";
			h = "SafeZoneH * 0.15";

			onLBSelChanged = "['onUnitsAILBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UnitsCamera.sqf'";
		};
	};
};

class CTI_UCRscTeamsMenu {
	movingEnable = 0;
	idd = 190000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_teamsmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_TeamsMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_teamsmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TeamsMenu.sqf'";

	class controlsBackground {
		class CTI_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.025)";//0.1
			y = "SafeZoneY + (SafezoneH * 0.025)";//0.105
			w = "SafeZoneW * 0.95";
			h = "SafeZoneH * 0.95";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.025)";
			y = "SafeZoneY + (SafezoneH * 0.025)";
			w = "SafeZoneW * 0.95";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : UCRscText {
			style = UCST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.045)";
			y = "SafeZoneY + (SafezoneH * 0.03)";
			w = "SafeZoneW * 0.93";
			h = "SafeZoneH * 0.037";

			text = "Teams";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_InfoListFrame : UCRscFrame {
			// x = "SafeZoneX + (SafeZoneW * 0.11)";
			x = "SafeZoneX + (SafeZoneW * 0.035)";
			// y = "SafeZoneY + (SafezoneH * 0.175)";
			y = "SafeZoneY + (SafezoneH * 0.09)";
			w = "SafeZoneW * 0.93";
			h = "SafeZoneH * 0.625";
		};
		class CTI_Menu_ActionListFrame : CTI_Menu_InfoListFrame {
			y = "SafeZoneY + (SafezoneH * 0.73)";
			w = "SafeZoneW * 0.22";
			h = "SafeZoneH * 0.23";
		};
		class CTI_Menu_ActionTeamListFrame : CTI_Menu_ActionListFrame {
			x = "SafeZoneX + (SafeZoneW * 0.265)";
			// x = "SafeZoneX + (SafeZoneW * 0.34)";
			w = "SafeZoneW * 0.7";
		};
		class CTI_Menu_Info_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.035)";
			y = "SafeZoneY + (SafezoneH * 0.09)";
			w = "SafeZoneW * 0.93";
			h = "SafeZoneH * 0.04";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_Header_Team : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.04)";
			y = "SafeZoneY + (SafezoneH * 0.09)";
			w = "SafeZoneW * 0.1";
			h = "SafeZoneH * 0.04";

			colorText[] = {0.678431373, 0.815686275, 1};
			text = "Team";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class CTI_Menu_Header_Size : CTI_Menu_Header_Team {
			x = "SafeZoneX + (SafeZoneW * 0.271)";

			text = "Size";
		};
		class CTI_Menu_Header_Funds : CTI_Menu_Header_Team {
			x = "SafeZoneX + (SafeZoneW * 0.366)";

			text = "Resources";
		};
		class CTI_Menu_Header_Independent : CTI_Menu_Header_Team {
			x = "SafeZoneX + (SafeZoneW * 0.485)";

			text = "Independent";
		};
		class CTI_Menu_Header_Role : CTI_Menu_Header_Team {
			x = "SafeZoneX + (SafeZoneW * 0.597)";

			text = "Role";
		};
		class CTI_Menu_Header_Order : CTI_Menu_Header_Team {
			x = "SafeZoneX + (SafeZoneW * 0.782)";

			text = "Order";
		};

		class CTI_Menu_Action_Independent : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.27)";//.345
			y = "SafeZoneY + (SafezoneH * 0.75)";
			w = "SafeZoneW * 0.1";
			h = "SafeZoneH * 0.04";

			text = "Independent:";
			sizeEx = "0.84 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class CTI_Menu_Action_Role : CTI_Menu_Action_Independent {
			y = "SafeZoneY + (SafezoneH * 0.8)";

			text = "Role:";
		};
		class CTI_Menu_Action_Order : CTI_Menu_Action_Independent {
			y = "SafeZoneY + (SafezoneH * 0.85)";

			text = "Order:";
		};
		class CTI_Menu_Action_Transfer : CTI_Menu_Action_Independent {
			y = "SafeZoneY + (SafezoneH * 0.9)";

			text = "Transfer:";
		};

		class CTI_Control_Exit : UCRscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.925)";
			y = "SafeZoneY + (SafezoneH * 0.03)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.88)";

			text = "<<";
			action = "closeDialog 0; createDialog 'CTI_UCRscTabletCommandMenu';";
		};
	};

	class controls {
		class CTI_Menu_Control_TeamsList : UCRscListNBox {
			idc = 190001;

			x = "SafeZoneX + (SafeZoneW * 0.035)";
			y = "SafeZoneY + (SafezoneH * 0.13)";
			w = "SafeZoneW * 0.93";
			h = "SafeZoneH * 0.585";

			rowHeight = "1.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.001, 0.25, 0.35, 0.48, 0.6, 0.8};

			onLBSelChanged = "['onTeamListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TeamsMenu.sqf'";
		};
		class CTI_Control_Button_AIIndependent : UCRscButton {
			idc = 190002;

			x = "SafeZoneX + (SafeZoneW * 0.045)";
			y = "SafeZoneY + (SafezoneH * 0.74)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.04";

			text = "All AI Independent";
			action = "['onAllAIIndependentPressed', 0] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TeamsMenu.sqf'";
		};
		class CTI_Control_Button_AINotIndependent : CTI_Control_Button_AIIndependent {
			idc = 190003;

			y = "SafeZoneY + (SafezoneH * 0.79)";

			text = "No AI Independent";
			action = "['onAllAIIndependentPressed', 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TeamsMenu.sqf'";
		};
		class CTI_Menu_Control_Info : UCRscStructuredText {
			idc = 190004;

			x = "SafeZoneX + (SafeZoneW * 0.045)";
			y = "SafeZoneY + (SafezoneH * 0.85)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.03";

			// text = "Resources: $900000";
			size = "0.85 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Combo_Independent : UCRscCombo {
			idc = 190005;

			x = "SafeZoneX + (SafeZoneW * 0.37)";//.445
			y = "SafeZoneY + (SafezoneH * 0.75)";
			w = "SafeZoneW * 0.15";
			h = "SafeZoneH * 0.04";

			sizeEx = "0.78 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Combo_Role : CTI_Menu_Combo_Independent {
			idc = 190006;

			y = "SafeZoneY + (SafezoneH * 0.8)";

			sizeEx = "0.78 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Combo_Order : CTI_Menu_Combo_Independent {
			idc = 190016;

			y = "SafeZoneY + (SafezoneH * 0.85)";

			sizeEx = "0.78 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Combo_Funds : CTI_Menu_Combo_Independent {
			idc = 190007;

			y = "SafeZoneY + (SafezoneH * 0.9)";

			sizeEx = "0.78 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Control_Button_SetIndependent : UCRscButton {
			idc = 190008;

			x = "SafeZoneX + (SafeZoneW * 0.53)";//.605
			y = "SafeZoneY + (SafezoneH * 0.75)";
			w = "SafeZoneW * 0.21";//.12
			h = "SafeZoneH * 0.04";

			text = "Set";
			action = "['onSetTeamIndependentPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TeamsMenu.sqf'";
		};
		class CTI_Control_Button_SetRole : CTI_Control_Button_SetIndependent {
			idc = 190009;

			y = "SafeZoneY + (SafezoneH * 0.8)";

			text = "Set";
			action = "['onSetRolePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TeamsMenu.sqf'";
		};
		class CTI_Control_Button_Order : CTI_Control_Button_SetIndependent {
			idc = 190010;

			y = "SafeZoneY + (SafezoneH * 0.85)";

			text = "Order";
			action = "['onOrderPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TeamsMenu.sqf'";
		};
		class CTI_Control_Button_SendFunds : CTI_Control_Button_SetIndependent {
			idc = 190014;

			y = "SafeZoneY + (SafezoneH * 0.9)";

			text = "Transfer";
			action = "['onTransferFundsPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TeamsMenu.sqf'";
		};
		class CTI_Control_Button_SetIndependentAll : CTI_Control_Button_SetIndependent {
			idc = 190011;

			x = "SafeZoneX + (SafeZoneW * 0.75)";
			y = "SafeZoneY + (SafezoneH * 0.75)";
			w = "SafeZoneW * 0.205";
			h = "SafeZoneH * 0.04";

			text = "Set to All";
			action = "['onSetAllTeamIndependentPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TeamsMenu.sqf'";
		};
		class CTI_Control_Button_SetRoleAll : CTI_Control_Button_SetIndependentAll {
			idc = 190012;

			y = "SafeZoneY + (SafezoneH * 0.8)";

			text = "Set to All";
			action = "['onSetAllRolePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TeamsMenu.sqf'";
		};
		class CTI_Control_Button_OrderAll : CTI_Control_Button_SetIndependentAll {
			idc = 190015;

			y = "SafeZoneY + (SafezoneH * 0.85)";

			text = "Order to All";
			action = "['onOrderAllPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TeamsMenu.sqf'";
		};
		class CTI_Control_Button_TransferAll : CTI_Control_Button_SetIndependentAll {
			idc = 190013;

			y = "SafeZoneY + (SafezoneH * 0.9)";

			text = "Transfer to All";
			action = "['onTransferAllPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TeamsMenu.sqf'";
		};
		class CTI_Control_Button_Disbands : UCRscButton_Lesser {
			idc = 190017;
			x = "SafeZoneX + (SafeZoneW * 0.045)";
			y = "SafeZoneY + (SafezoneH * 0.9)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.04";

			text = "Disband Team";
			action = "['onTeamDisband', lnbCurSelRow 190001] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TeamsMenu.sqf'";
		};
	};
};

class CTI_UCRscCommandMenu {
	movingEnable = 0;
	idd = 210000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_commandmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_CommandMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_commandmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";

	class controlsBackground {
		class CTI_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.3";
			h = "SafeZoneH * 0.42";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.3";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : UCRscText {
			style = UCST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.037";

			text = "Command Menu";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
	};

	class controls {
		class CTI_Control_Resources : UCRscButton {
			idc = 210002;

			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.27)";
			w = "SafeZoneW * 0.28";
			h = "SafeZoneH * 0.04";

			text = "Resources";
			action = "['onResourcesPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";
		};
		class CTI_Control_Teams : CTI_Control_Resources {
			idc = 210003;

			y = "SafeZoneY + (SafezoneH * 3.32)"; //--- Render out

			text = "Teams";
			action = "['onTeamsPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";
		};
		class CTI_Control_Map : CTI_Control_Resources {
			idc = 210004;

			y = "SafeZoneY + (SafezoneH * 3.37)"; //--- Render out

			text = "Map Commanding";
			action = "['onMapPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";
		};
		class CTI_Control_Upgrades : CTI_Control_Resources {
			idc = 210005;

			y = "SafeZoneY + (SafezoneH * 3.42)"; //--- Render out

			text = "Upgrades";
			action = "['onUpgradesPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";
		};
		class CTI_Control_Workers : CTI_Control_Resources {
			idc = 210006;

			y = "SafeZoneY + (SafezoneH * 3.47)"; //--- Render out

			text = "Base Management";
			action = "['onWorkersPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";
		};
		class CTI_Control_RequestMenu : CTI_Control_Resources {
			idc = 210008;

			y = "SafeZoneY + (SafezoneH * 3.52)"; //--- Render out

			text = "Team Requests";
			action = "['onRequestMenuPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";
		};
		class CTI_Control_ArtilleryMenu : CTI_Control_Resources {
			idc = 210009;

			y = "SafeZoneY + (SafezoneH * 3.57)"; //--- Render out

			text = "Artillery";
			action = "['onArtilleryMenuPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_CommandMenu.sqf'";
		};
		class CTI_Control_Exit : UCRscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.45)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
	};
};

class CTI_UCRscMapCommandMenu {
	movingEnable = 0;
	idd = 220000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_mapcommandmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_MapCommandMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_mapcommandmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_MapCommandMenu.sqf'";

	class controlsBackground {
		class CTI_Background : UCRscText {
			x = "SafeZoneX";
			y = "SafeZoneY";
			w = "SafeZoneW";
			h = "SafeZoneH";
			colorBackground[] = {0, 0, 0, 0.7};
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX";
			y = "SafeZoneY";
			w = "SafeZoneW";
			h = "SafeZoneH * 0.05";
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : UCRscText {
			style = UCST_LEFT;
			x = "SafeZoneX + (SafezoneH * 0.02)";
			y = "SafeZoneY + (SafezoneH * 0.005)";
			w = "SafeZoneW * 0.98";
			h = "SafeZoneH * 0.037";

			text = "Map Commanding";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Map : UCRscMapControl {
			idc = 220001;

			x = "SafeZoneX";
			y = "SafeZoneY + (SafezoneH * 0.05)";
			w = "SafeZoneW";
			h = "SafeZoneH * 0.95";

			// showCountourInterval = 1;
			onMouseButtonDown = "['onMapButtonDown', _this] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_MapCommandMenu.sqf'";
		};
	};

	class controls {
		class CTI_Background_List : UCRscText {
			idc = 220701;
			x = "SafeZoneX + (SafeZoneW * 0.78)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.21";
			h = "SafeZoneH * 0.9";
			colorBackground[] = {0, 0, 0, 0.7};
		};
		class CTI_Menu_UnitsListFrame : UCRscFrame {
			idc = 220702;
			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.095)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.30";
		};
		class CTI_Menu_LiUCST_Background : UCRscText {
			idc = 220708;
			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.095)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.30";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_Control_UnitsLiUCST_Label : UCRscText { //--- Render out.
			idc = 220703;

			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.19";
			h = "SafeZoneH * 0.03";

			text = "Teams :";
			colorText[] = {0.231372549, 0.580392157, 0.929411765, 1};
			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Control_OrdersLiUCST_Label : CTI_Menu_Control_UnitsLiUCST_Label { //--- Render out.
			idc = 220704;

			y = "SafeZoneY + (SafezoneH * 0.405)";
			h = "SafeZoneH * 0.03";

			text = "Orders :";
		};
		class CTI_Menu_OrdersListFrame : CTI_Menu_UnitsListFrame {
			idc = 220705;

			y = "SafeZoneY + (SafezoneH * 0.44)";
			h = "SafeZoneH * 0.16";
		};
		class CTI_Menu_Orders_Background : CTI_Menu_LiUCST_Background {
			idc = 220709;

			y = "SafeZoneY + (SafezoneH * 0.44)";
			h = "SafeZoneH * 0.16";
		};
		class CTI_Menu_Control_OrdersParamLiUCST_Label : CTI_Menu_Control_UnitsLiUCST_Label { //--- Render out.
			idc = 220706;

			y = "SafeZoneY + (SafezoneH * 0.61)";
			h = "SafeZoneH * 0.03";

			text = "Order Parameters :";
		};
		class CTI_Menu_OrdersParamListFrame : CTI_Menu_UnitsListFrame {
			idc = 220707;

			y = "SafeZoneY + (SafezoneH * 0.645)";
			h = "SafeZoneH * 0.20";
		};
		class CTI_Menu_OrdersParam_Background : CTI_Menu_LiUCST_Background {
			idc = 220710;

			y = "SafeZoneY + (SafezoneH * 0.645)";
			h = "SafeZoneH * 0.20";
		};
		class CTI_Background_Intel : UCRscText {
			idc = 220711;
			x = "SafeZoneX + (SafeZoneW * 0.26)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.48";
			h = "SafeZoneH * 0.03";
			colorBackground[] = {0, 0, 0, 0.7};
		};
		class CTI_Menu_Control_UnitsList : UCRscListNBox {
			idc = 220002;

			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.095)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.30";

			rowHeight = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.001, 0.4};

			onLBDblClick = "['onUnitListLBDblClick', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_MapCommandMenu.sqf'";
			onLBSelChanged = "['onUnitListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_MapCommandMenu.sqf'";
		};
		class CTI_Menu_Control_OrdersList : UCRscListBox {
			idc = 220009;

			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.44)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.16";

			rowHeight = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};

			onLBSelChanged = "['onOrdersListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_MapCommandMenu.sqf'";
			onLBDblClick = "['onOrdersListLBDblClick', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_MapCommandMenu.sqf'";
		};
		class CTI_Menu_Control_OrdersParamList : CTI_Menu_Control_OrdersList {
			idc = 220010;

			y = "SafeZoneY + (SafezoneH * 0.645)";
			h = "SafeZoneH * 0.20";

			onLBDblClick = "['onOrdersParamLBDblClick', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_MapCommandMenu.sqf'";
			onLBSelChanged = "";
		};

		class CTI_Menu_Control_SetOrder : UCRscButton_Opac {
			idc = 220011;

			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafeZoneH * 0.86)";
			h = "SafeZoneH * 0.04";
			w = "SafeZoneW * 0.2";

			sizeEx = "0.85 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			text = "Set Order";
			action = "['onSetOrderPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_MapCommandMenu.sqf'";
		};
		class CTI_Menu_Control_SetMapOrder : CTI_Menu_Control_SetOrder {
			idc = 220012;

			y = "SafeZoneY + (SafeZoneH * 0.91)";

			text = "Set Order (Map Click)";
			action = "['onSetMapOrderPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_MapCommandMenu.sqf'";
		};
		class CTI_Menu_Control_IntelText : UCRscStructuredText {
			idc = 220013;

			x = "SafeZoneX + (SafeZoneW * 0.26)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.48";
			h = "SafeZoneH * 0.03";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Control_Exit : UCRscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.95)";
			y = "SafeZoneY + (SafezoneH * 0.005)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.905)";

			text = "<<";
			action = "closeDialog 0; createDialog 'CTI_UCRscTabletCommandMenu';";
		};
	};
};

class CTI_UCRscServiceMenu {
	movingEnable = 0;
	idd = 230000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_servicemenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_ServiceMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_servicemenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ServiceMenu.sqf'";

	class controlsBackground {
		class CTI_Background: UCRscText
		{
			moving = 1;
			x = 0.19915 * safezoneW + safezoneX;
			y = 0.20366 * safezoneH + safezoneY;
			w = 0.55 * safezoneW;
			h = 0.48 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class CTI_Background_Header: CTI_Background
		{
			x = 0.199952 * safezoneW + safezoneX;
			y = 0.20498 * safezoneH + safezoneY;
			w = 0.55 * safezoneW;
			h = 0.0500001 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class CTI_Menu_Title: UCRscText
		{
			text = "Service Menu"; //--- ToDo: Localize;
			x = 0.220001 * safezoneW + safezoneX;
			y = 0.21004 * safezoneH + safezoneY;
			w = 0.53 * safezoneW;
			h = 0.037 * safezoneH;
			colorText[] = {0.258824,0.713726,1,1};
			sizeEx = (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class CTI_Menu_ListFrame: UCRscFrame
		{
			x = 0.210263 * safezoneW + safezoneX;
			y = 0.26746 * safezoneH + safezoneY;
			w = 0.527002 * safezoneW;
			h = 0.248624 * safezoneH;
		};
		class CTI_Menu_ListHeaders_Background: UCRscText
		{
			x = 0.210034 * safezoneW + safezoneX;
			y = 0.2701 * safezoneH + safezoneY;
			w = 0.53 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0.5,0.5,0.5,0.25};
		};
		class CTI_Menu_Repair_Background: UCRscText
		{
			x = 0.210034 * safezoneW + safezoneX;
			y = 0.58008 * safezoneH + safezoneY;
			w = 0.26 * safezoneW;
			h = 0.04 * safezoneH;
			colorBackground[] = {0.5,0.5,0.5,0.25};
		};
		class CTI_Menu_Rearm_Background: CTI_Menu_Repair_Background
		{
			y = 0.63002 * safezoneH + safezoneY;
		};
		class CTI_Menu_Refuel_Background: CTI_Menu_Repair_Background
		{
			x = 0.479951 * safezoneW + safezoneX;
			y = 0.58008 * safezoneH + safezoneY;
		};
		class CTI_Menu_Heal_Background: CTI_Menu_Refuel_Background
		{
			y = 0.63002 * safezoneH + safezoneY;
		};
		
		class CTI_Menu_Sell_Background: CTI_Menu_Refuel_Background
		{
			y = 0.5286 * safezoneH + safezoneY;
		};
		
		class CTI_Menu_Header_Unit: UCRscText
		{
			text = "Unit"; //--- ToDo: Localize;
			x = 0.214961 * safezoneW + safezoneX;
			y = 0.2701 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {0.678431,0.815686,1};
			sizeEx = 0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
		};
		class CTI_Menu_Header_Damage: CTI_Menu_Header_Unit
		{
			text = "Damage"; //--- ToDo: Localize;
			x = 0.479951 * safezoneW + safezoneX;
			y = 0.2701 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {0.678431,0.815686,1};
			sizeEx = 0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
		};
		class CTI_Menu_Header_Fuel: CTI_Menu_Header_Unit
		{
			text = "Fuel"; //--- ToDo: Localize;
			x = 0.55797 * safezoneW + safezoneX;
			y = 0.2701 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {0.678431,0.815686,1};
			sizeEx = 0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
		};
		class CTI_Menu_Header_Health: CTI_Menu_Header_Unit
		{
			text = "Health"; //--- ToDo: Localize;
			x = 0.638052 * safezoneW + safezoneX;
			y = 0.2701 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.04 * safezoneH;
			colorText[] = {0.678431,0.815686,1};
			sizeEx = 0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
		};
	};

	class controls {
		class CTI_Menu_Control_Repair: UCRscButton
		{
			idc = 230001;
			action = "['onRepairPressed', lnbCurSelRow 230005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ServiceMenu.sqf'";

			text = "Repair"; //--- ToDo: Localize;
			x = 0.210034 * safezoneW + safezoneX;
			y = 0.58008 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class CTI_Menu_Control_Rearm: CTI_Menu_Control_Repair
		{
			idc = 230002;
			action = "['onRearmPressed', lnbCurSelRow 230005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ServiceMenu.sqf'";

			text = "Rearm"; //--- ToDo: Localize;
			x = 0.210034 * safezoneW + safezoneX;
			y = 0.63002 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class CTI_Menu_Control_Refuel: CTI_Menu_Control_Repair
		{
			idc = 230003;
			action = "['onRefuelPressed', lnbCurSelRow 230005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ServiceMenu.sqf'";

			text = "Refuel"; //--- ToDo: Localize;
			x = 0.479951 * safezoneW + safezoneX;
			y = 0.58008 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class CTI_Menu_Control_Heal: CTI_Menu_Control_Refuel
		{
			idc = 230004;
			action = "['onHealPressed', lnbCurSelRow 230005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ServiceMenu.sqf'";

			text = "Heal"; //--- ToDo: Localize;
			x = 0.479951 * safezoneW + safezoneX;
			y = 0.63002 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class CTI_Menu_RepairCost: UCRscStructuredText
		{
			idc = 230011;

			x = 0.369968 * safezoneW + safezoneX;
			y = 0.58492 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.0300001 * safezoneH;
			sizeEx = 0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class CTI_Menu_Rearm: CTI_Menu_RepairCost
		{
			idc = 230012;

			x = 0.369968 * safezoneW + safezoneX;
			y = 0.63508 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.0300001 * safezoneH;
			sizeEx = 0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class CTI_Menu_Refuel: CTI_Menu_RepairCost
		{
			idc = 230013;

			x = 0.639999 * safezoneW + safezoneX;
			y = 0.58492 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.0300001 * safezoneH;
			sizeEx = 0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class CTI_Menu_Heal: CTI_Menu_RepairCost
		{
			idc = 230014;

			x = 0.639999 * safezoneW + safezoneX;
			y = 0.63508 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.0300001 * safezoneH;
			sizeEx = 0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class CTI_Menu_Control_EntityList: UCRscListNBox
		{
			idc = 230005;
			rowHeight = "1.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.001,0.5,0.65,0.8};
			onLBSelChanged = "['onEntityListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ServiceMenu.sqf'";

			x = 0.212555 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.522315 * safezoneW;
			h = 0.197375 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
		};
		class CTI_Control_Exit: UCRscButton
		{
			idc = 22555;
			action = "closeDialog 0";

			text = "X"; //--- ToDo: Localize;
			x = 0.700032 * safezoneW + safezoneX;
			y = 0.21004 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class CTI_Control_Back: CTI_Control_Exit
		{
			idc = 22555;
			action = "closeDialog 0; createDialog CTI_P_LastRootMenu;";

			text = "<<"; //--- ToDo: Localize;
			x = 0.655007 * safezoneW + safezoneX;
			y = 0.21004 * safezoneH + safezoneY;
			w = 0.04 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class CTI_Menu_Control_Loadout: UCRscButton
		{
			idc = 230006;
			action = "['onLoadoutPressed', lnbCurSelRow 230005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ServiceMenu.sqf'";

			text = "Loadout"; //--- ToDo: Localize;
			x = 0.210378 * safezoneW + safezoneX;
			y = 0.5286 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.04 * safezoneH;
		};
		
		class CTI_Menu_LoadoutCost: CTI_Menu_RepairCost //---not in use yet...may do single fee to open loadout menu
		{
			idc = 230007;
			x = 0.369853 * safezoneW + safezoneX;
			y = 0.53366 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.0300001 * safezoneH;
			sizeEx = 0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class CTI_Menu_Control_Sell: UCRscButton
		{
			idc = 230008;
			action = "['onSellPressed', lnbCurSelRow 230005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ServiceMenu.sqf'";

			text = "Sell"; //--- ToDo: Localize;
			x = 0.479951 * safezoneW + safezoneX;
			y = 0.5286 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.04 * safezoneH;
		};
		class CTI_Menu_SellPrice: CTI_Menu_RepairCost
		{
			idc = 230015;
			x = 0.639999 * safezoneW + safezoneX;
			y = 0.53366 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.0300001 * safezoneH;
			sizeEx = 0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
	};
};

class CTI_UCRscUpgradeMenu {
	movingEnable = 0;
	idd = 250000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_upgrademenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_UpgradeMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_upgrademenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UpgradeMenu.sqf'";

	class controlsBackground {
		class CTI_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.615";
			h = "SafeZoneH * 0.705";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.615";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : UCRscText {
			style = UCST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.23)";
			y = "SafeZoneY + (SafezoneH * 0.180)";
			w = "SafeZoneW * 0.595";
			h = "SafeZoneH * 0.037";

			text = "Upgrade Menu";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_UpgradeListFrame : UCRscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.24)";
			w = "SafeZoneW * 0.2925";
			h = "SafeZoneH * 0.625";
		};
		class CTI_Menu_UpgradeInfoFrame : UCRscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.5225)";
			y = "SafeZoneY + (SafezoneH * 0.24)";
			w = "SafeZoneW * 0.2925";
			h = "SafeZoneH * 0.525";
		};
		class CTI_Menu_UpgradeRunningFrame : CTI_Menu_UpgradeInfoFrame {
			y = "SafeZoneY + (SafezoneH * 0.78)";
			h = "SafeZoneH * 0.03";
		};
		class CTI_Menu_UpgradeInfo_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.5225)";
			y = "SafeZoneY + (SafezoneH * 0.24)";
			w = "SafeZoneW * 0.2925";
			h = "SafeZoneH * 0.525";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_UpgradeRunning_Background : CTI_Menu_UpgradeInfo_Background {
			y = "SafeZoneY + (SafezoneH * 0.78)";
			h = "SafeZoneH * 0.03";
		};
	};

	class controls {
		class CTI_Control_Upgrade : UCRscButton {
			idc = 250001;

			x = "SafeZoneX + (SafeZoneW * 0.5225)";
			y = "SafeZoneY + (SafezoneH * 0.825)";
			w = "SafeZoneW * 0.2925";
			h = "SafeZoneH * 0.04";

			text = "Upgrade";
			action = "['onUpgradePressed', lnbCurSelRow 250002] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UpgradeMenu.sqf'";
		};
		class CTI_Menu_Control_UpgradeList : UCRscListNBox {
			idc = 250002;

			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.24)";
			w = "SafeZoneW * 0.2925";
			h = "SafeZoneH * 0.625";

			rowHeight = "1.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			// columns[] = {0.001, 0.26};
			columns[] = {0.001, 0.18};

			onLBDblClick = "['onUpgradePressed', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UpgradeMenu.sqf'";
			onLBSelChanged = "['onUpgradeListSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_UpgradeMenu.sqf'";
		};
		class CTI_Menu_Upgrade_Label : UCRscText {
			idc = 250003;

			x = "SafeZoneX + (SafeZoneW * 0.5375)";
			y = "SafeZoneY + (SafezoneH * 0.24)";
			w = "SafeZoneW * 0.2775";
			h = "SafeZoneH * 0.05";

			colorText[] = {0.258823529, 0.713725490, 1, 1};
			size = "1.2 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Upgrade_Info : UCRscStructuredText {
			idc = 250004;

			x = "SafeZoneX + (SafeZoneW * 0.5275)";
			y = "SafeZoneY + (SafezoneH * 0.29)";
			w = "SafeZoneW * 0.2825";
			h = "SafeZoneH * 0.10";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Upgrade_DepLabel : CTI_Menu_Upgrade_Label {
			idc = 250005;

			y = "SafeZoneY + (SafezoneH * 0.39)";
		};
		class CTI_Menu_Upgrade_DepInfo : CTI_Menu_Upgrade_Info {
			idc = 250006;

			y = "SafeZoneY + (SafezoneH * 0.44)";
			h = "SafeZoneH * 0.10";
		};
		class CTI_Menu_Upgrade_DescLabel : CTI_Menu_Upgrade_Label {
			idc = 250007;

			y = "SafeZoneY + (SafezoneH * 0.54)";
		};
		class CTI_Menu_Upgrade_DescInfo : CTI_Menu_Upgrade_Info {
			idc = 250008;

			y = "SafeZoneY + (SafezoneH * 0.59)";
			h = "SafeZoneH * 0.175";
		};
		class CTI_Menu_Upgrade_RunInfo : UCRscStructuredText {
			idc = 250009;

			x = "SafeZoneX + (SafeZoneW * 0.5225)";
			y = "SafeZoneY + (SafezoneH * 0.78)";
			w = "SafeZoneW * 0.2925";
			h = "SafeZoneH * 0.03";

			size = "0.85 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Control_Exit : UCRscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.775)";
			y = "SafeZoneY + (SafezoneH * 0.18)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.73)";

			text = "<<";
			action = "closeDialog 0; createDialog 'CTI_UCRscTabletCommandMenu';";
		};
	};
};

class CTI_UCRscWorkersMenu {
	movingEnable = 0;
	idd = 260000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_workersmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_WorkersMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_workersmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_WorkersMenu.sqf'";

	class controlsBackground {
		class CTI_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.6";
			h = "SafeZoneH * 0.47";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.2)";
			y = "SafeZoneY + (SafezoneH * 0.205)";
			w = "SafeZoneW * 0.6";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : UCRscText {
			style = UCST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.58";
			h = "SafeZoneH * 0.037";

			text = "Base Management";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_InfoListFrame : UCRscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.38";
		};
		class CTI_Menu_InfoResourcesFrame : UCRscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.1825";
		};
		class CTI_Menu_Info_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.1825";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_CommanderFrame : CTI_Menu_InfoResourcesFrame {
			y = "SafeZoneY + (SafezoneH * 0.4725)";
			h = "SafeZoneH * 0.1825";
		};
		class CTI_Menu_Commander_Background : CTI_Menu_Info_Background {
			y = "SafeZoneY + (SafezoneH * 0.4725)";
			h = "SafeZoneH * 0.1825";
		};

	};

	class controls {
		class CTI_Menu_Map : UCRscMapControl {
			idc = 260001;

			x = "SafeZoneX + (SafeZoneW * 0.22)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.38";

			showCountourInterval = 0;
			onMouseButtonDown = "['onMapButtonDown', _this] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_WorkersMenu.sqf'";
		};
		class CTI_Menu_Control_WorkersList : UCRscListNBox {
			idc = 260002;

			x = "SafeZoneX + (SafeZoneW * 0.52)";
			y = "SafeZoneY + (SafezoneH * 0.275)";
			w = "SafeZoneW * 0.26";
			h = "SafeZoneH * 0.1825";

			rowHeight = "1.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.001, 0.35};

			onLBSelChanged = "['onWorkersListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_WorkersMenu.sqf'";
		};
		class CTI_Menu_Control_Disband : UCRscButton {
			idc = 260003;

			x = "SafeZoneX + (SafeZoneW * 0.53)";
			y = "SafeZoneY + (SafezoneH * 0.4825)";
			w = "SafeZoneW * 0.24";
			h = "SafeZoneH * 0.04";

			text = "Disband Worker";
			action = "['onWorkerDisbandPressed', lnbCurSelRow 260002] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_WorkersMenu.sqf'";
		};
		class CTI_Menu_Control_Sell : CTI_Menu_Control_Disband {
			idc = 260004;

			y = "SafeZoneY + (SafezoneH * 0.5325)";

			text = "Sell Structure";
			action = "['onStructureSellPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_WorkersMenu.sqf'";
		};
		class CTI_Control_Exit : UCRscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.74)";
			y = "SafeZoneY + (SafezoneH * 0.21)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.695)";

			text = "<<";
			action = "closeDialog 0; createDialog 'CTI_UCRscTabletCommandMenu';";
		};
	};
};

class CTI_UCRscAIMicromanagementMenu {
	movingEnable = 0;
	idd = 270000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_aimicromenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_AIMicromanagementMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_aimicromenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_AIMicromanagementMenu.sqf'";

	class controlsBackground {
		class CTI_Background : UCRscText {
			x = "SafeZoneX";
			y = "SafeZoneY";
			w = "SafeZoneW";
			h = "SafeZoneH";
			colorBackground[] = {0, 0, 0, 0.7};
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX";
			y = "SafeZoneY";
			w = "SafeZoneW";
			h = "SafeZoneH * 0.05";
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : UCRscText {
			style = UCST_LEFT;
			x = "SafeZoneX + (SafezoneH * 0.02)";
			y = "SafeZoneY + (SafezoneH * 0.005)";
			w = "SafeZoneW * 0.98";
			h = "SafeZoneH * 0.037";

			text = "AI Micromanagement";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Map : UCRscMapControl {
			idc = 270001;

			x = "SafeZoneX";
			y = "SafeZoneY + (SafezoneH * 0.05)";
			w = "SafeZoneW";
			h = "SafeZoneH * 0.95";

			// showCountourInterval = 1;
			onMouseButtonDown = "['onMapButtonDown', _this] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_AIMicromanagementMenu.sqf'";
		};
	};

	class controls {
		class CTI_Background_List : UCRscText {
			idc = 270701;
			x = "SafeZoneX + (SafeZoneW * 0.78)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.21";
			h = "SafeZoneH * 0.9";
			colorBackground[] = {0, 0, 0, 0.7};
		};
		class CTI_Menu_UnitsListFrame : UCRscFrame {
			idc = 270702;
			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.095)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.25";
		};
		class CTI_Menu_LiUCST_Background : UCRscText {
			idc = 270708;
			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.095)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.25";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_Control_UnitsLiUCST_Label : UCRscText {
			idc = 270703;

			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.19";
			h = "SafeZoneH * 0.03";

			text = "AI :";
			colorText[] = {0.231372549, 0.580392157, 0.929411765, 1};
			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Control_OrdersLiUCST_Label : CTI_Menu_Control_UnitsLiUCST_Label {
			idc = 270704;

			y = "SafeZoneY + (SafezoneH * 0.405)";
			h = "SafeZoneH * 0.03";

			text = "Orders :";
		};
		class CTI_Menu_OrdersListFrame : CTI_Menu_UnitsListFrame {
			idc = 270705;

			y = "SafeZoneY + (SafezoneH * 0.44)";
			h = "SafeZoneH * 0.16";
		};
		class CTI_Menu_Orders_Background : CTI_Menu_LiUCST_Background {
			idc = 270709;

			y = "SafeZoneY + (SafezoneH * 0.44)";
			h = "SafeZoneH * 0.16";
		};
		class CTI_Menu_Control_OrdersParamLiUCST_Label : CTI_Menu_Control_UnitsLiUCST_Label { //--- Render out.
			idc = 270706;

			y = "SafeZoneY + (SafezoneH * 0.61)";
			h = "SafeZoneH * 0.03";

			text = "Order Parameters :";
		};
		class CTI_Menu_OrdersParamListFrame : CTI_Menu_UnitsListFrame {
			idc = 270707;

			y = "SafeZoneY + (SafezoneH * 0.645)";
			h = "SafeZoneH * 0.2";
		};
		class CTI_Menu_OrdersParam_Background : CTI_Menu_LiUCST_Background {
			idc = 270710;

			y = "SafeZoneY + (SafezoneH * 0.645)";
			h = "SafeZoneH * 0.2";
		};
		class CTI_Background_Intel : UCRscText {
			idc = 270711;
			x = "SafeZoneX + (SafeZoneW * 0.26)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.48";
			h = "SafeZoneH * 0.03";
			colorBackground[] = {0, 0, 0, 0.7};
		};
		class CTI_Menu_Control_UnitsList : UCRscListBox {
			idc = 270002;
			style = UCLB_MULTI;

			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.095)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.25";

			rowHeight = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};

			onLBDblClick = "['onUnitListLBDblClick', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_AIMicromanagementMenu.sqf'";
			// onLBSelChanged = "['onUnitListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_AIMicromanagementMenu.sqf'";
		};
		class CTI_Menu_Control_OrdersList : UCRscListBox {
			idc = 270009;

			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.44)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.16";

			rowHeight = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};

			onLBSelChanged = "['onOrdersListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_AIMicromanagementMenu.sqf'";
			onLBDblClick = "['onOrdersListLBDblClick', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_AIMicromanagementMenu.sqf'";
		};
		class CTI_Menu_Control_OrdersParamList : CTI_Menu_Control_OrdersList {
			idc = 270010;

			y = "SafeZoneY + (SafezoneH * 0.645)";
			h = "SafeZoneH * 0.2";

			// onLBDblClick = "['onOrdersParamLBDblClick', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_AIMicromanagementMenu.sqf'";
			onLBSelChanged = "";
		};

		class CTI_Menu_Control_SetOrder : UCRscButton_Opac {
			idc = 270011;

			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafeZoneH * 0.86)";
			h = "SafeZoneH * 0.04";
			w = "SafeZoneW * 0.2";

			sizeEx = "0.85 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			text = "Set Order";
			action = "['onSetOrderPressed', lbCurSel 270009] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_AIMicromanagementMenu.sqf'";
		};
		class CTI_Menu_Control_SetMapOrder : CTI_Menu_Control_SetOrder {
			idc = 270012;

			y = "SafeZoneY + (SafeZoneH * 0.91)";

			text = "Set Order (Map Click)";
			action = "['onSetMapOrderPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_AIMicromanagementMenu.sqf'";
		};
		class CTI_Menu_Control_Disband : CTI_Menu_Control_SetOrder {
			idc = 270014;

			y = "SafeZoneY + (SafeZoneH * 0.355)";

			text = "Disband";
			action = "['onUnitDisbandPressed', lbSelection ((uiNamespace getVariable 'cti_dialog_ui_aimicromenu') displayCtrl 270002)] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_AIMicromanagementMenu.sqf'";
		};
		class CTI_Menu_Control_IntelText : UCRscStructuredText {
			idc = 270013;

			x = "SafeZoneX + (SafeZoneW * 0.26)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.48";
			h = "SafeZoneH * 0.03";

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Control_SelectAll : UCRscButton {
			idc = 270015;

			x = "SafeZoneX + (SafeZoneW * 0.935)";
			y = "SafeZoneY + (SafezoneH * 0.0625)";
			w = "SafeZoneW * 0.05";
			h = "SafeZoneH * 0.0275";

			text = "All";
			action = "['onSelectAll'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_AIMicromanagementMenu.sqf'";
		};

		class CTI_Control_Exit : UCRscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.95)";
			y = "SafeZoneY + (SafezoneH * 0.005)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.905)";

			text = "<<";
			action = "closeDialog 0; createDialog 'CTI_UCRscTabletDialogOptions';";
		};
	};
};

class CTI_UCRscRequestMenu {
	movingEnable = 0;
	idd = 280000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_requestmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_RequestMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_requestmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_RequestMenu.sqf'";

	class controlsBackground {
		class CTI_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.615";
			h = "SafeZoneH * 0.65";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.21)";
			y = "SafeZoneY + (SafezoneH * 0.175)";
			w = "SafeZoneW * 0.615";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : UCRscText {
			style = UCST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.23)";
			y = "SafeZoneY + (SafezoneH * 0.180)";
			w = "SafeZoneW * 0.595";
			h = "SafeZoneH * 0.037";

			text = "Team Requests";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class CTI_Menu_RequestsListFrame : UCRscFrame {
			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.245)";
			w = "SafeZoneW * 0.285";
			h = "SafeZoneH * 0.505";
		};
		class CTI_Menu_MapListFrame : CTI_Menu_RequestsListFrame {
			x = "SafeZoneX + (SafeZoneW * 0.525)";
			h = "SafeZoneH * 0.28";
		};
		class CTI_Menu_RequestInfoFrame : CTI_Menu_MapListFrame {
			y = "SafeZoneY + (SafezoneH * 0.54)";
			h = "SafeZoneH * 0.21";
		};
		class CTI_Menu_RequestInfo_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.525)";
			y = "SafeZoneY + (SafezoneH * 0.54)";
			w = "SafeZoneW * 0.285";
			h = "SafeZoneH * 0.21";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
	};

	class controls {
		class CTI_Menu_Control_Accept : UCRscButton {
			idc = 280001;

			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.765)";
			w = "SafeZoneW * 0.285";
			h = "SafeZoneH * 0.04";

			text = "Accept";
			action = "['onRequestAccept', lnbCurSelRow 280005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_RequestMenu.sqf'";
		};
		class CTI_Menu_Control_Deny : CTI_Menu_Control_Accept {
			idc = 280002;

			x = "SafeZoneX + (SafeZoneW * 0.525)";

			text = "Deny";
			action = "['onRequestDeny', lnbCurSelRow 280005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_RequestMenu.sqf'";
		};
		class CTI_Menu_Map : UCRscMapControl {
			idc = 280003;

			x = "SafeZoneX + (SafeZoneW * 0.525)";
			y = "SafeZoneY + (SafezoneH * 0.245)";
			w = "SafeZoneW * 0.285";
			h = "SafeZoneH * 0.28";

			showCountourInterval = 0;
		};
		class CTI_Menu_Control_Info : UCRscStructuredText {
			idc = 280004;

			x = "SafeZoneX + (SafeZoneW * 0.525)";
			y = "SafeZoneY + (SafezoneH * 0.54)";
			w = "SafeZoneW * 0.285";
			h = "SafeZoneH * 0.21";

			size = "0.85 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Control_RequestsList : UCRscListNBox {
			idc = 280005;

			x = "SafeZoneX + (SafeZoneW * 0.225)";
			y = "SafeZoneY + (SafezoneH * 0.245)";
			w = "SafeZoneW * 0.285";
			h = "SafeZoneH * 0.505";

			rowHeight = "1.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			// columns[] = {0.001, 0.26};
			columns[] = {0.001, 0.26};

			onLBDblClick = "['onRequestAccept', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_RequestMenu.sqf'";
			onLBSelChanged = "['onRequestSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_RequestMenu.sqf'";
		};
		class CTI_Control_Exit : UCRscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.77)";
			y = "SafeZoneY + (SafezoneH * 0.18)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.725)";

			text = "<<";
			action = "closeDialog 0; createDialog 'CTI_UCRscTabletCommandMenu';";
		};
		// class CTI_Control_Exit : UCRscButton {
			// idc = 22555;

			// x = "SafeZoneX + (SafeZoneW * 0.74)";
			// y = "SafeZoneY + (SafezoneH * 0.21)";
			// w = "SafeZoneW * 0.04";
			// h = "SafeZoneH * 0.04";

			// text = "X";
			// action = "closeDialog 0";
		// };
		// class CTI_Control_Back : CTI_Control_Exit {
			// idc = 22555;

			// x = "SafeZoneX + (SafeZoneW * 0.695)";

			// text = "<<";
			// action = "['onGoBack'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TransferResourcesMenu.sqf'";
		// };
	};
};

class CTI_UCRscArtilleryMenu {
	movingEnable = 0;
	idd = 290000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_artillerymenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_ArtilleryMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_artillerymenu', nil];['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ArtilleryMenu.sqf'";

	class controlsBackground {
		class CTI_Background : UCRscText {
			x = "SafeZoneX";
			y = "SafeZoneY";
			w = "SafeZoneW";
			h = "SafeZoneH";
			colorBackground[] = {0, 0, 0, 0.7};
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX";
			y = "SafeZoneY";
			w = "SafeZoneW";
			h = "SafeZoneH * 0.05";
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : UCRscText {
			style = UCST_LEFT;
			x = "SafeZoneX + (SafezoneH * 0.02)";
			y = "SafeZoneY + (SafezoneH * 0.005)";
			w = "SafeZoneW * 0.98";
			h = "SafeZoneH * 0.037";

			text = "Artillery";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_Map : UCRscMapControl {
			idc = 290001;

			x = "SafeZoneX";
			y = "SafeZoneY + (SafezoneH * 0.05)";
			w = "SafeZoneW";
			h = "SafeZoneH * 0.95";

			showCountourInterval = 1;
			onMouseButtonDown = "['onMapButtonDown', _this] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ArtilleryMenu.sqf'";
		};
	};

	class controls {
		class CTI_Background_List : UCRscText {
			idc = 290002;
			x = "SafeZoneX + (SafeZoneW * 0.78)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.21";
			h = "SafeZoneH * 0.68";
			colorBackground[] = {0, 0, 0, 0.7};
		};
		class CTI_Menu_FireMission_Frame : UCRscFrame {
			idc = 290003;
			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.095)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.215";
		};
		class CTI_Menu_FireMission_Background : UCRscText {
			idc = 290004;
			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.095)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.215";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_FireMission_Label : UCRscText {
			idc = 290005;

			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.06)";
			w = "SafeZoneW * 0.19";
			h = "SafeZoneH * 0.03";

			text = "Fire Mission :";
			colorText[] = {0.231372549, 0.580392157, 0.929411765, 1};
			sizeEx = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_FireMission_Type_Label : CTI_Menu_FireMission_Label {
			idc = 290006;

			x = "SafeZoneX + (SafeZoneW * 0.788)";
			y = "SafeZoneY + (SafezoneH * 0.095)";
			w = "SafeZoneW * 0.18";
			h = "SafeZoneH * 0.03";

			text = "Artillery Type :";
			colorText[] = {0.537254902, 0.843137255, 1, 1};
			sizeEx = "0.8 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class CTI_Menu_FireMission_Type_Combo : UCRscCombo {
			idc = 290007;

			x = "SafeZoneX + (SafeZoneW * 0.79)";
			y = "SafeZoneY + (SafezoneH * 0.125)";
			w = "SafeZoneW * 0.19";
			h = "SafeZoneH * 0.035";

			sizeEx = "0.8 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			onLBSelChanged = "['onArtilleryTypeChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ArtilleryMenu.sqf'";
		};
		class CTI_Menu_FireMission_Magazine_Label : CTI_Menu_FireMission_Type_Label {
			idc = 290008;

			y = "SafeZoneY + (SafezoneH * 0.165)";

			text = "Artillery Magazine :";
		};
		class CTI_Menu_FireMission_Magazine_Combo : CTI_Menu_FireMission_Type_Combo {
			idc = 290009;

			y = "SafeZoneY + (SafezoneH * 0.195)";
			onLBSelChanged = "['onArtilleryMagazineChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ArtilleryMenu.sqf'";
		};
		class CTI_Menu_FireMission_BurUCST_Label : CTI_Menu_FireMission_Type_Label {
			idc = 290010;

			y = "SafeZoneY + (SafezoneH * 0.235)";

			text = "Artillery Burst :";
		};
		class CTI_Menu_FireMission_BurUCST_Combo : CTI_Menu_FireMission_Type_Combo {
			idc = 290011;

			y = "SafeZoneY + (SafezoneH * 0.265)";
			onLBSelChanged = "";
		};
		class CTI_Menu_Units_Frame : UCRscFrame {
			idc = 290012;

			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.325)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.3";
		};
		class CTI_Menu_Units_Background : UCRscText {
			idc = 290013;

			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.325)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.3";
			colorBackground[] = {0.5, 0.5, 0.5, 0.25};
		};
		class CTI_Menu_Units_List : UCRscListBox {
			idc = 290014;
			style = UCLB_MULTI;

			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafezoneH * 0.325)";
			w = "SafeZoneW * 0.2";
			h = "SafeZoneH * 0.3";

			rowHeight = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};
		class CTI_Menu_FireMission_Call : UCRscButton {
			idc = 290015;

			x = "SafeZoneX + (SafeZoneW * 0.785)";
			y = "SafeZoneY + (SafeZoneH * 3.69)"; //--- Render out
			h = "SafeZoneH * 0.04";
			w = "SafeZoneW * 0.2";

			sizeEx = "0.85 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			text = "call Fire Mission";
			action = "['onFireMissionCall'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ArtilleryMenu.sqf'";
		};
		class CTI_Menu_FireMission_SelectAll : CTI_Menu_FireMission_Call {
			idc = 290016;

			y = "SafeZoneY + (SafeZoneH * 0.64)";

			text = "Select All";
			action = "['onSelectAll'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_ArtilleryMenu.sqf'";
		};
		class CTI_Control_Exit : UCRscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.95)";
			y = "SafeZoneY + (SafezoneH * 0.005)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.905)";

			text = "<<";
			action = "closeDialog 0; createDialog 'CTI_UCRscTabletCommandMenu';";
		};
	};
};

class CTI_UCRscVoteMenu {
	movingEnable = 0;
	idd = 300000;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_votemenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_VoteMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_votemenu', nil]";

	class controlsBackground {
		class CTI_Background : UCRscText {
			x = "SafeZoneX + (SafeZoneW * 0.273)";
			y = "SafeZoneY + (SafezoneH * 0.134)";
			w = "SafeZoneW * 0.5";
			h = "SafeZoneH * 0.8";
			colorBackground[] = {0, 0, 0, 0.7};
			moving = 1;
		};
		class CTI_Background_Header : CTI_Background {
			x = "SafeZoneX + (SafeZoneW * 0.273)";
			y = "SafeZoneY + (SafezoneH * 0.134)";
			w = "SafeZoneW * 0.5";
			h = "SafeZoneH * 0.05"; //0.06 stock
			colorBackground[] = {0, 0, 0, 0.4};
		};
		class CTI_Menu_Title : UCRscText {
			idc = 300011;
			style = UCST_LEFT;
			x = "SafeZoneX + (SafeZoneW * 0.293)";
			y = "SafeZoneY + (SafezoneH * 0.139)";
			w = "SafeZoneW * 0.48";
			h = "SafeZoneH * 0.037";

			text = "Commander Vote";
			colorText[] = {0.258823529, 0.713725490, 1, 1};

			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
	};
	class controls {
		class CTI_Menu_Vote_List : UCRscListNBox {
			idc = 300001;

			x = "SafeZoneX + (SafeZoneW * 0.28)";
			y = "SafeZoneY + (SafezoneH * 0.207)";
			w = "SafeZoneW * 0.489";
			h = "SafeZoneH * 0.665";

			// rowHeight = "1.22 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			rowHeight = "1.3 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			// sizeEx = "0.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.95 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.01, 0.75};

			onLBSelChanged = "['onVoteLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_VoteMenu.sqf'";
		};
		class CTI_Menu_Vote_Time : UCRscText {
			idc = 300002;

			x = "SafeZoneX + (SafeZoneW * 0.739)";
			y = "SafeZoneY + (SafezoneH * 0.896)";
			w = "SafeZoneW * 0.25";
			shadow = 2;
		};
		class CTI_Menu_Vote_Elected : CTI_Menu_Vote_Time {
			idc = 300003;
			style = UCST_LEFT;

			x = "SafeZoneX + (SafeZoneW * 0.28)";
			w = "SafeZoneW * 0.3";
		};
		class CTI_Menu_Vote_Time_Static : CTI_Menu_Vote_Time {
			idc = 300004;
			style = UCST_RIGHT;

			x = "SafeZoneX + (SafeZoneW * 0.433)";
			w = "SafeZoneW * 0.3";

			text = "Time :";
		};
		class CTI_Menu_Vote_Confirm : UCRscButton {
			idc = 300005;

			//x = "SafeZoneX + (SafeZoneW * 0.71)";
			x = "SafeZoneX + (SafeZoneW * 1)";
			y = "SafeZoneY + (SafezoneH * 0.896)";
			w = "SafeZoneW * 0.05";
			h = "SafeZoneH * 0.04";
			
			text = "Confirm";
			action = "closeDialog 0; ['onVoteConfirmPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_VoteMenu.sqf'";
		};
		class CTI_Control_Exit : UCRscButton {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.723)";
			y = "SafeZoneY + (SafezoneH * 0.139)";
			w = "SafeZoneW * 0.04";
			h = "SafeZoneH * 0.04";

			text = "X";
			action = "closeDialog 0";
		};
		class CTI_Control_Back : CTI_Control_Exit {
			idc = 22555;

			x = "SafeZoneX + (SafeZoneW * 0.678)";

			text = "<<";
			action = "closeDialog 0; createDialog 'CTI_UCRscTabletDialogOptions';";
		};
	};
};
class CTI_UCRscTabletDialog
{
	idd=777777;
	movingEnable=true;
	enableSimulation=true;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_tabletmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_TabletMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_tabletmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";
	class controls
	{

		class UCRscTabletFrameTablet_image: UCRscTabletPictureFrame
		{
			idc = 777000;
			moving = 1;

			text = "UCRsc\Pictures\Tablet_background_ca.paa";
			x = 0.184944 * safezoneW + safezoneX;
			y = -0.039 * safezoneH + safezoneY;
			w = 0.693122 * safezoneW;
			h = 1.122 * safezoneH;

		};
		class CTI_UCRscTabletMenu_bg: UCRscTabletScreen
		{
			idc = 777002;

			x = 0.2715 * safezoneW + safezoneX;
			y = 0.23 * safezoneH + safezoneY;
			w = 0.453 * safezoneW;
			h = 0.5460 * safezoneH;
			colorBackground[] = {0.063,0.063,0.063,0.5};
		};
		class CTI_UCRscTabletInfo_os: UCRscTabletTextos
		{
			idc = 777003;

			//text = "OFPS OS"; //--- ToDo: Localize;
			x = 0.431261 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletInfo_oslink: UCRscTabletTextlink
		{
			idc = 777004;

			x = 0.431261 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Title: UCRscTabletTitle
		{
			idc = 777005;

			text = ""; //--- ToDo: Localize;
			x = 0.431261 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_MissionTime: UCRscTabletStructuredText
		{
			idc = 777006;

			//text = "TIME: 30%"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_TownsNum: UCRscTabletStructuredText
		{
			idc = 777007;

			//text = "TOWNS: 30%"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Awards: UCRscTabletStructuredText
		{
			idc = 777008;

			//text = "AWARDS: 30%"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Resources: UCRscTabletStructuredText
		{
			idc = 777009;

			//text = "RESOURCES: 30%"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Supply: UCRscTabletStructuredText
		{
			idc = 777010;

			//text = "SUPPLY: 30%"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Income: UCRscTabletStructuredText
		{
			idc = 777011;

			//text = "INCOME: 30%"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Equipment: UCRscTabletButtonMenu
		{
			idc = 777101;
			action = "['onEquipmentPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "EQUIPMENT"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.176 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Factory: UCRscTabletButtonMenu
		{
			idc = 777102;
			action = "['onFactoryPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "FACTORY"; //--- ToDo: Localize;
			x = 0.431261 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.176 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Build: UCRscTabletButtonMenu
		{
			idc = 777103;
			action = "['onBuildPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "BUILD"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.176 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Command: UCRscTabletButtonMenu
		{
			idc = 777104;
			action = "['onCommandPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "COMMAND"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.176 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Options: UCRscTabletButtonMenu
		{
			idc = 777105;
			action = "['onOptionsPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "OPTIONS"; //--- ToDo: Localize;
			x = 0.431261 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.176 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Halo: UCRscTabletButtonMenu
		{
			idc = 777106;
			action = "['onHaloPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "HALO"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.176 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Close: UCRscTabletCloseButton
		{
			idc = 777300;
			action = "['onClosePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Back: UCRscTabletBackButton
		{
			idc = 777301;
			action = "['onBackPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "BACK"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Home: UCRscTabletHomeButton
		{
			idc = 777302;
			action = "['onHomePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "HOME"; //--- ToDo: Localize;
			x = 0.431261 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Service: UCRscTabletServiceButton
		{
			idc = 777304;
			action = "['onTransferPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "TRANSFER FUNDS"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Transfer: UCRscTabletTransferButton
		{
			idc = 777305;
			action = "['onServicePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "SERVICE"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};

};
};
class CTI_UCRscTabletDialogWelcome
{
	idd=778777;
	movingEnable=true;
	enableSimulation=true;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_tabletmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_TabletMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_tabletmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";
	class controls
	{
		class UCRscTabletFrameTablet_image: UCRscTabletPictureFrame
		{
			idc = 7.787e+006;
			moving = 1;

			text = "UCRsc\Pictures\Tablet_background_ca.paa"; //--- ToDo: Localize;
			x = 0.184944 * safezoneW + safezoneX;
			y = -0.039 * safezoneH + safezoneY;
			w = 0.693122 * safezoneW;
			h = 1.122 * safezoneH;
		};
		class CTI_UCRscTabletMenu_bg: UCRscTabletScreen
		{
			idc = 778002;

			x = 0.2715 * safezoneW + safezoneX;
			y = 0.23 * safezoneH + safezoneY;
			w = 0.453 * safezoneW;
			h = 0.5460 * safezoneH;
			colorBackground[] = {0.063,0.063,0.063,0.5};
		};
		class CTI_UCRscTabletInfo_os: UCRscTabletTextos
		{
			idc = 778003;

			//text = "OFPS OS"; //--- ToDo: Localize;
			x = 0.431261 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
		};
		class CTI_UCRscTabletMenu_MissionTime: UCRscTabletStructuredText
		{
			idc = 778006;

			x = 0.580196 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
		};
		class CTI_UCRscTabletMenu_TownsNum: UCRscTabletStructuredText
		{
			idc = 778007;

			x = 0.580196 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
		};
		class CTI_UCRscTabletMenu_Awards: UCRscTabletStructuredText
		{
			idc = 778008;

			x = 0.580196 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
		};
		class CTI_UCRscTabletMenu_Resources: UCRscTabletStructuredText
		{
			idc = 778009;

			x = 0.282325 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
		};
		class CTI_UCRscTabletMenu_Supply: UCRscTabletStructuredText
		{
			idc = 778010;

			x = 0.282325 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
		};
		class CTI_UCRscTabletMenu_Income: UCRscTabletStructuredText
		{
			idc = 778011;

			x = 0.282325 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
		};
		class CTI_UCRscTabletMenu_Welcome: UCRscTabletTextWelcome
		{
			idc = 778100;

			x = 0.282325 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.43535 * safezoneW;
			h = 0.451 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
		};
		class CTI_UCRscTabletMenu_Close: UCRscTabletCloseButton
		{
			idc = 778300;
			action = "['onClosePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_UCRscTabletMenu_Home: UCRscTabletHomeButton
		{
			idc = 778302;
			action = "['onHomePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "HOME"; //--- ToDo: Localize;
			x = 0.431261 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
		};
};
};

class CTI_UCRscTabletDialogOptions
{
	idd=779777;
	movingEnable=true;
	enableSimulation=true;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_tabletmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_TabletMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_tabletmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";
	class controls
	{
		class UCRscTabletFrameTablet_image: UCRscTabletPictureFrame
		{
			idc = 779000;
			moving = 1;

			text = "UCRsc\Pictures\Tablet_background_ca.paa";
			x = 0.184944 * safezoneW + safezoneX;
			y = -0.039 * safezoneH + safezoneY;
			w = 0.693122 * safezoneW;
			h = 1.122 * safezoneH;

		};
		class CTI_UCRscTabletMenu_bg: UCRscTabletScreen
		{
			idc = 779002;

			x = 0.2715 * safezoneW + safezoneX;
			y = 0.23 * safezoneH + safezoneY;
			w = 0.453 * safezoneW;
			h = 0.5460 * safezoneH;
			colorBackground[] = {0.063,0.063,0.063,0.5};
		};
		class CTI_UCRscTabletInfo_os: UCRscTabletTextos
		{
			idc = 779003;

			//text = "OFPS OS"; //--- ToDo: Localize;
			x = 0.431261 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletInfo_oslink: UCRscTabletTextlink
		{
			idc = 779004;

			x = 0.431261 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Title: UCRscTabletTitle
		{
			idc = 779005;

			text = "OPTIONS MENU"; //--- ToDo: Localize;
			x = 0.431261 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_MissionTime: UCRscTabletStructuredText
		{
			idc = 779006;

			//text = "TIME: 30%"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_TownsNum: UCRscTabletStructuredText
		{
			idc = 779007;

			//text = "TOWNS: 30%"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Awards: UCRscTabletStructuredText
		{
			idc = 779008;

			//text = "AWARDS: 30%"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Resources: UCRscTabletStructuredText
		{
			idc = 779009;

			//text = "RESOURCES: 30%"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Supply: UCRscTabletStructuredText
		{
			idc = 779010;

			//text = "SUPPLY: 30%"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Income: UCRscTabletStructuredText
		{
			idc = 779011;

			//text = "INCOME: 30%"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_1: UCRscTabletButtonMenu
		{
			idc = 779101;
			action = "['onUnflipPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "UNFLIP NEAREST VEHICLE"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_2: UCRscTabletButtonMenu
		{
			idc = 779102;
			action = "['onAIMicroPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "AI MANAGEMENT"; //--- ToDo: Localize;

			x = 0.282325 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};


		};
		class CTI_UCRscTabletMenu_3: UCRscTabletButtonMenu
		{
			idc = 779103;
			action = "['onUnitsCamPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "UNITS CAM"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};

		};
		class CTI_UCRscTabletMenu_4: UCRscTabletButtonMenu
		{
			idc = 779104;
			action = "['onSatCamPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "SAT CAM"; //--- ToDo: Localize;

			x = 0.282325 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};

		};
		class CTI_UCRscTabletMenu_5: UCRscTabletButtonMenu
		{
			idc = 779105;
			action = "['onCommanderVotePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "CALL COMMANDER VOTE"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_6: UCRscTabletButtonMenu
		{
			idc = 779106;
			action = "['onVideoSettingsPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "VIDEO SETTINGS"; //--- ToDo: Localize;
			x = 0.505728 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_7: UCRscTabletButtonMenu
		{
			idc = 779107;
			action = "['onOnlineHelpPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "ONLINE HELP"; //--- ToDo: Localize;
			x = 0.505728 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_8: UCRscTabletButtonMenu
		{
			idc = 779108;
			action = "['onMusicPressedonMusicPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "Play Music: Off"; //--- ToDo: Localize;
			x = 0.505728 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		/*class CTI_UCRscTabletMenu_9: UCRscTabletButtonMenu
		{
			idc = 779109;
			action = "['onEquipmentPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "9"; //--- ToDo: Localize;
			x = 0.505728 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_10: UCRscTabletButtonMenu
		{
			idc = 779110;
			action = "['onEquipmentPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "10"; //--- ToDo: Localize;
			x = 0.505728 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};*/
		class CTI_UCRscTabletMenu_Close: UCRscTabletCloseButton
		{
			idc = 779300;
			action = "['onClosePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Back: UCRscTabletBackButton
		{
			idc = 779301;
			action = "['onBackPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "BACK"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Home: UCRscTabletHomeButton
		{
			idc = 779302;
			action = "['onHomePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "HOME"; //--- ToDo: Localize;
			x = 0.431261 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Service: UCRscTabletServiceButton
		{
			idc = 779304;
			action = "['onTransferPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "TRANSFER FUNDS"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Transfer: UCRscTabletTransferButton
		{
			idc = 779305;
			action = "['onServicePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "SERVICE"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};

};
};
class CTI_UCRscTabletCommandMenu
{
	idd=780777;
	movingEnable=true;
	enableSimulation=true;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_tabletmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_TabletMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_tabletmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";
	class controls
	{
		class UCRscTabletFrameTablet_image: UCRscTabletPictureFrame
		{
			idc = 780000;
			moving = 1;

			text = "UCRsc\Pictures\Tablet_background_ca.paa";
			x = 0.184944 * safezoneW + safezoneX;
			y = -0.039 * safezoneH + safezoneY;
			w = 0.693122 * safezoneW;
			h = 1.122 * safezoneH;

		};
		class CTI_UCRscTabletMenu_bg: UCRscTabletScreen
		{
			idc = 780002;

			x = 0.2715 * safezoneW + safezoneX;
			y = 0.23 * safezoneH + safezoneY;
			w = 0.453 * safezoneW;
			h = 0.5460 * safezoneH;
			colorBackground[] = {0.063,0.063,0.063,0.5};
		};
		class CTI_UCRscTabletInfo_os: UCRscTabletTextos
		{
			idc = 780003;

			//text = "OFPS OS"; //--- ToDo: Localize;
			x = 0.431261 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletInfo_oslink: UCRscTabletTextlink
		{
			idc = 780004;

			x = 0.431261 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Title: UCRscTabletTitle
		{
			idc = 780005;

			text = "COMMAND MENU"; //--- ToDo: Localize;
			x = 0.431261 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_MissionTime: UCRscTabletStructuredText
		{
			idc = 780006;

			//text = "TIME: 30%"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_TownsNum: UCRscTabletStructuredText
		{
			idc = 780007;

			//text = "TOWNS: 30%"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Awards: UCRscTabletStructuredText
		{
			idc = 780008;

			//text = "AWARDS: 30%"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Resources: UCRscTabletStructuredText
		{
			idc = 780009;

			//text = "RESOURCES: 30%"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Supply: UCRscTabletStructuredText
		{
			idc = 780010;

			//text = "SUPPLY: 30%"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Income: UCRscTabletStructuredText
		{
			idc = 780011;

			//text = "INCOME: 30%"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {0.886,0.871,0.871,1};
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_1: UCRscTabletButtonMenu
		{
			idc = 780101;
			action = "['onUpgradesPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "UPGRADES"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_2: UCRscTabletButtonMenu
		{
			idc = 780102;
			action = "['onMapPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "MAP COMMANDING"; //--- ToDo: Localize;

			x = 0.282325 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};


		};
		class CTI_UCRscTabletMenu_3: UCRscTabletButtonMenu
		{
			idc = 780103;
			action = "['onWorkersPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "BASE MANAGEMENT"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};

		};
		class CTI_UCRscTabletMenu_4: UCRscTabletButtonMenu
		{
			idc = 780104;
			action = "['onDefensesPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "DEFENSE MANAGEMENT"; //--- ToDo: Localize;

			x = 0.282325 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};

		};
		/*class CTI_UCRscTabletMenu_5: UCRscTabletButtonMenu
		{
			idc = 780105;
			//action = "['onCommanderVotePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "5"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};*/
		class CTI_UCRscTabletMenu_6: UCRscTabletButtonMenu
		{
			idc = 780106;
			action = "['onTeamsPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "TEAMS"; //--- ToDo: Localize;
			x = 0.505728 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_7: UCRscTabletButtonMenu
		{
			idc = 780107;
			action = "['onRequestMenuPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "TEAM REQUESTS"; //--- ToDo: Localize;
			x = 0.505728 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_8: UCRscTabletButtonMenu
		{
			idc = 780108;
			action = "['onArtilleryMenuPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "ARTILLERY"; //--- ToDo: Localize;
			x = 0.505728 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		/*class CTI_UCRscTabletMenu_9: UCRscTabletButtonMenu
		{
			idc = 780109;
			//action = "['onEquipmentPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "9"; //--- ToDo: Localize;
			x = 0.505728 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_10: UCRscTabletButtonMenu
		{
			idc = 780110;
			//action = "['onEquipmentPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "10"; //--- ToDo: Localize;
			x = 0.505728 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.211947 * safezoneW;
			h = 0.055 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};*/
		class CTI_UCRscTabletMenu_Close: UCRscTabletCloseButton
		{
			idc = 780300;
			action = "['onClosePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Back: UCRscTabletBackButton
		{
			idc = 780301;
			action = "['onBackPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "BACK"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Home: UCRscTabletHomeButton
		{
			idc = 780302;
			action = "['onHomePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "HOME"; //--- ToDo: Localize;
			x = 0.431261 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Service: UCRscTabletServiceButton
		{
			idc = 780304;
			action = "['onTransferPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "TRANSFER FUNDS"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Transfer: UCRscTabletTransferButton
		{
			idc = 780305;
			action = "['onServicePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "SERVICE"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};

	};
};
class CTI_UCRscDefenseMenu
{
	idd=785000;
	movingEnable=true;
	enableSimulation=true;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_defensemenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_DefenseMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_defensemenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_DefenseMenu.sqf'";
	class controls
	{
		class UCRscTabletFrameTablet_image: UCRscTabletPictureFrame
		{
			idc = 780001;
			moving = 1;

			text = "UCRsc\Pictures\Tablet_background_ca.paa";
			x = 0.184944 * safezoneW + safezoneX;
			y = -0.039 * safezoneH + safezoneY;
			w = 0.693122 * safezoneW;
			h = 1.122 * safezoneH;

		};
		class CTI_UCRscTabletMenu_bg: UCRscTabletScreen
		{
			idc = 785002;

			x = 0.2715 * safezoneW + safezoneX;
			y = 0.23 * safezoneH + safezoneY;
			w = 0.453 * safezoneW;
			h = 0.5460 * safezoneH;
			colorBackground[] = {0.063,0.063,0.063,0.5};
		};
		class CTI_UCRscTabletMenu_Title: UCRscTabletTitle
		{
			idc = 785005;

			text = "DEFENSE MENU"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		
		class CTI_UCRscDefenseList: UCRscListNBox
		{
			idc = 785006;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.352 * safezoneH;

			style = UCLB_MULTI;
			rowHeight = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.063,0.063,0.063,0.5};
		};
		class CTI_UCRscDefenseText: UCRscStructuredText
		{
			type = UCCT_STRUCTURED_TEXT;
			style = UCST_MULTI;
			text = ""; //--- ToDo: Localize;
			idc = 785007;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.055 * safezoneH;

			size = "0.9 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			sizeEx = "0.75 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class CTI_UCRscTabletMenu_Close: UCRscTabletCloseButton
		{
			idc = 785300;
			action = "['onClosePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.580196 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Back: UCRscTabletBackButton
		{
			idc = 785301;
			action = "['onBackPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "BACK"; //--- ToDo: Localize;
			x = 0.282325 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};
		class CTI_UCRscTabletMenu_Home: UCRscTabletHomeButton
		{
			idc = 785302;
			action = "['onHomePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_TabletMenu.sqf'";

			text = "HOME"; //--- ToDo: Localize;
			x = 0.431261 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.137479 * safezoneW;
			h = 0.022 * safezoneH;
			//colorBackground[] = {0,0,0,0.5};
		};

	};
};
class CTI_UCRscLoadoutMenu
{
	idd=790000;
	movingEnable=true;
	enableSimulation=true;
	onLoad = "uiNamespace setVariable ['cti_dialog_ui_loadoutmenu', _this select 0];['onLoad'] execVM 'Client\Events\Events_UI_LoadoutMenu.sqf'";
	onUnload = "uiNamespace setVariable ['cti_dialog_ui_loadoutmenu', nil]; ['onUnload'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";
	class controls
	{
		class CTI_UCRscLoadoutMenu_bg: UCRscTabletScreen
		{
			idc = 790001;

			x = -0.00408908 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 1.00245 * safezoneW;
			h = 0.297 * safezoneH;
			colorBackground[] = {0.063,0.063,0.063,0.5};
		};
		class CTI_UCRscLoadoutMenu_UnitTitle: UCRscStructuredText
		{
			idc = 790002;
			style = 16;
			lineSpacing = 1;
			canDrag = 1;
			size = "1.4 * (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";

			text = " "; //--- ToDo: Localize;
			x = 0.73486 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.257773 * safezoneW;
			h = 0.088 * safezoneH;
			sizeEx = 1.4 * 			(			(			((safezoneW / safezoneH) min 1.1) / 1.1) / 15);
		};
		class CTI_UCRscLoadoutMenu_UnitInfo: UCRscListNBox
		{
			idc = 790003;
			rowHeight = "1.1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.001,0.35};

			x = 0.73486 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.257773 * safezoneW;
			h = 0.275 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 1.0 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
		};
		class CTI_UCRscLoadoutMenu_PylonTitle: UCRscStructuredText
		{
			idc = 790004;

			text = "OFPS Unit Loadout System"; //--- ToDo: Localize;
			x = 0.0360406 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.022 * safezoneH;
            class Attributes {
                font = "PuristaMedium";
                color = "#2b76a5";
                align = "left";
                shadow = false;
            };
		};
		class CTI_UCRscLoadoutMenu_PylonTitle2: UCRscStructuredText
		{
			idc = 790104;

			text = "Select Loadout"; //--- ToDo: Localize;
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
            class Attributes {
                font = "PuristaMedium";
                color = "#2b76a5";
                align = "left";
                shadow = false;
            };
		};
		class CTI_UCRscLoadoutMenu_PylonList: UCRscListNBox
		{
			idc = 790005;
			rowHeight = "1.1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			itemBackground[] = {1,1,1,0.1};
			onLBSelChanged = "['onPylonListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";

			x = 0.273125 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.231 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
		};
		class CTI_UCRscLoadoutMenu_AmmoListTitle: UCRscStructuredText
		{
			idc = 790006;

			text = "Compatible Mags"; //--- ToDo: Localize;
			x = 0.437506 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
            class Attributes {
                font = "PuristaMedium";
                color = "#2b76a5";
                align = "left";
                shadow = false;
            };
		};
		class CTI_UCRscLoadoutMenu_AmmoList: UCRscListNBox
		{
			idc = 790007;
			rowHeight = "1.1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			itemBackground[] = {1,1,1,0.1};
			onLBSelChanged = "['onMagListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";

			x = 0.439259 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.154 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.6 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
		};
		class CTI_UCRscLoadoutMenu_AmmoStatTitle: UCRscStructuredText
		{
			idc = 790008;

			text = "Selected Mag Stats"; //--- ToDo: Localize;
			x = 0.637479 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
            class Attributes {
                font = "PuristaMedium";
                color = "#2b76a5";
                align = "left";
                shadow = false;
            };
		};
		class CTI_UCRscLoadoutMenu_AmmoStatList: UCRscListNBox
		{
			idc = 790009;
			rowHeight = "1.1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.001,0.35};

			x = 0.636847 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.176 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.6 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
		};
		class CTI_UCRscLoadoutMenu_Qty: UCRscEdit
		{
			idc = 790010;
			onKeyUp = "['onQtyChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";

			x = 0.639219 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_Camo: UCRscCombo
		{
			idc = 790111;
			onLBSelChanged = "['onCamoLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";

			text = "Camo"; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_RearmPrice: UCRscStructuredText
		{
			idc = 790012;
			style = 16;
			lineSpacing = 1;

			text = "ReArmAllPrice"; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.863 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * 			(			(			((safezoneW / safezoneH) min 1.1) / 1.1) / 15);
		};
		class CTI_UCRscLoadoutMenu_Price: UCRscStructuredText
		{
			idc = 790013;
			style = 16;
			lineSpacing = 1;

			text = "Price"; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 0.8 * 			(			(			((safezoneW / safezoneH) min 1.1) / 1.1) / 15);
		};
		class CTI_UCRscLoadoutMenu_Clear: UCRscButton
		{
			idc = 790014;
			action = "['onClearPressed', lnbCurSelRow 230005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";

			text = "Clear/Refund All"; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_Rearm: UCRscButton
		{
			idc = 790015;
			action = "['onRearmPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";

			text = "Rearm All"; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.885 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_Purchase: UCRscButton
		{
			idc = 790016;
			action = "['onPurchasePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";

			text = "Purchase Magazines"; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.951 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_Exit: UCRscButton
		{
			idc = 790017;
			action = "['onExitPressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";

			text = "EXIT"; //--- ToDo: Localize;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.94 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_CurrentMagTitle: UCRscStructuredText
		{
			idc = 790019;

			text = "Current Mag(s)"; //--- ToDo: Localize;
			x = 0.439259 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
            class Attributes {
                font = "PuristaMedium";
                color = "#2b76a5";
                align = "left";
                shadow = false;
            };
		};
		class CTI_UCRscLoadoutMenu_CurrentMag: UCRscListNBox
		{
			idc = 790020;
			onLBSelChanged = "['onCurMagListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";
			rowHeight = "1.1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			itemBackground[] = {1,1,1,0.1};

			x = 0.439259 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.9 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
		};
		class CTI_UCRscLoadoutMenu_Status: UCRscStructuredText
		{
			idc = 790021;

			x = 0.73486 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.257773 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_SkinTitle: UCRscStructuredText
		{
			idc = 790022;

			text = "Select Skin"; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
            class Attributes {
                font = "PuristaMedium";
                color = "#2b76a5";
                align = "left";
                shadow = false;
            };
		};
		class CTI_UCRscLoadoutMenu_AmmoQtyTitle: UCRscStructuredText
		{
			idc = 790023;

			text = "Ammo Count"; //--- ToDo: Localize;
			x = 0.639219 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.148935 * safezoneW;
			h = 0.022 * safezoneH;
            class Attributes {
                font = "PuristaMedium";
                color = "#2b76a5";
                align = "left";
                shadow = false;
            };
		};
		class CTI_UCRscLoadoutMenu_StatusBar: UCRscProgress
		{
			idc = 790024;

			x = 0.734816 * safezoneW + safezoneX;
			y = 0.6045 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_Customizations: UCRscListNBox
		{
			idc = 790025;
			onLBSelChanged = "['onCustomListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.121 * safezoneH;

			rowHeight = "1.1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.001,0.40,0.80};
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.6 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
			lineSpacing = 1;
			text = "Customizations";
		};
		class CTI_UCRscLoadoutMenu_Custom_Clear: UCRscButton
		{
			idc = 790026;
			action = "['onCustomClearPressed', lnbCurSelRow 230005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";

			text = "Remove Customization"; //--- ToDo: Localize;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_Custom_Purchase: UCRscButton
		{
			idc = 790027;
			action = "['onCustomPurchasePressed', lnbCurSelRow 230005] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";

			text = "Purchase Customization"; //--- ToDo: Localize;
			x = 0.159687 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_ClearPrice: UCRscStructuredText
		{
			idc = 790028;
			text = "Clear All: "; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_Templates: UCRscListNBox
		{
			idc = 790029;
			onLBSelChanged = "['onTemplateListLBSelChanged', _this select 1] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.143 * safezoneH;

			rowHeight = "1.1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			itemBackground[] = {1,1,1,0.1};
			columns[] = {0.001,0.40,0.80};
			colorBackground[] = {0,0,0,0};
			sizeEx = 0.6 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25);
			lineSpacing = 1;
			text = "Template List"; //--- ToDo: Localize;
		};
		class CTI_UCRscLoadoutMenu_Template_Delete: UCRscButton
		{
			idc = 790030;
			action = "['onTemplateDeletePressed', lnbCurSelRow 790029] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";
			text = "Delete Template"; //--- ToDo: Localize;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};						
		class CTI_UCRscLoadoutMenu_TemplateRenameInput: UCRscEdit
		{
			idc = 790031;
			text = "Enter a new template name..."; //--- ToDo: Localize;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_Template_Create: UCRscButton
		{
			idc = 790032;
			action = "['onTemplateCreatePressed'] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";
			text = "Create Template"; //--- ToDo: Localize;
			x = 0.159687 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_Template_Rename: UCRscButton
		{
			idc = 790033;
			action = "['onTemplateRenamePressed', lnbCurSelRow 790033] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";
			text = "Rename Template"; //--- ToDo: Localize;
			x = 0.159687 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.022 * safezoneH;
		};		
		class CTI_UCRscLoadoutMenu_Template_Title: UCRscStructuredText
		{
			idc = 790034;
			text = "Templates"; //--- ToDo: Localize;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.022 * safezoneH;
            class Attributes {
                font = "PuristaMedium";
                color = "#2b76a5";
                align = "left";
                shadow = false;
            };
		};
		class CTI_UCRscLoadoutMenu_Customizations_Title: UCRscStructuredText
		{
			idc = 790035;
			text = "Customizations"; //--- ToDo: Localize;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.022 * safezoneH;
            class Attributes {
                font = "PuristaMedium";
                color = "#2b76a5";
                align = "left";
                shadow = false;
            };
		};
		class CTI_UCRscLoadoutMenu_Credit: UCRscStructuredText
		{
			idc = 790036;
			text = "Credit: "; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.907 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_ClearMagPrice: UCRscStructuredText
		{
			idc = 790037;
			text = "Clear Mag: "; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CTI_UCRscLoadoutMenu_ClearMag: UCRscButton
		{
			idc = 790038;
			action = "['onClearMagPressed', lnbCurSelRow 790020] call compile preprocessFileLineNumbers 'Client\Events\Events_UI_LoadoutMenu.sqf'";
			text = "Clear/Refund Mag"; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};