switch (typeOf _this) do 
{
	case "CUP_O_Ka60_Grey_RU": {
		//_this removeWeapon ["CUP_Vmlauncher_S5_veh",[0]];
	    
		/*works but no easa possible
		for "_i" from 1 to 10 do {
		_this setPylonLoadout [_i, "", true];
		};
		*/
		//_this setPylonLoadout ["pylon1", ""];
		//_this setPylonLoadout ["pylon2", ""];
		_this removeWeapon "CUP_Vmlauncher_S5_veh";
		for "_i" from 1 to 2 do {
		_this setPylonLoadout [_i, "", false];
		};
	};
	
	
	
	case "UK3CB_BAF_Apache_AH1_JS": {
		_this removeMagazineTurret ["FakeMagazine",[-1]];
		_this removeWeaponTurret ["UK3CB_BAF_Safe",[-1]];
		
		_this removeMagazineTurret ["UK3CB_BAF_PylonPod_19Rnd_CRV7_HEISAP",[-1]];
		_this removeWeaponTurret ["UK3CB_BAF_Missiles_CRV7_HEISAP",[-1]];
		
		
		
		
		_this removeMagazineTurret ["UK3CB_BAF_1200Rnd_30mm_M230_HEDP_T",[0]];
		_this removeWeaponTurret ["UK3CB_BAF_CannonM230",[0]];
		
		_this addMagazineTurret ["UK3CB_BAF_1200Rnd_30mm_M230_HEDP_T",[-1]];
		_this addWeaponTurret ["UK3CB_BAF_CannonM230",[-1]];
		
		
		
		

	};
	
	
	
	
	case "CUP_O_Ka52_Blk_RU": {
		
		_this removeWeaponTurret ["CUP_Vmlauncher_S8_CCIP_veh",[-1]];
		_this addMagazineTurret ["CUP_230Rnd_TE1_Green_Tracer_30mmHEIF_2A42_M",[-1]];
		_this addMagazineTurret ["CUP_230Rnd_TE1_Green_Tracer_30mmAPBC_2A42_M",[-1]];

		_this addMagazineTurret ["CUP_230Rnd_TE1_Green_Tracer_30mmAP_2A42_M",[-1]];
		_this addMagazineTurret ["CUP_230Rnd_TE1_Green_Tracer_30mmHE_2A42_M",[-1]];



		_this addWeaponTurret ["CUP_Vacannon_2A42_Ka50",[-1]];

	};
	
	
	
	
	
	case "CUP_O_2S6M_RU": {
		_this removeWeaponTurret ["CUP_Vmlauncher_9M311M_veh",[0]];
		_this removeMagazineTurret ["CUP_8Rnd_9M311M_Tunguska_M",[0]];
		_this addMagazineTurret ["magazine_Missile_rim116_x21",[0]];
		_this addWeaponTurret ["weapon_rim116Launcher",[0]];
	};
	
	case "CUP_B_M6LineBacker_USA_W": {
		_this removeWeaponTurret ["CUP_Vmlauncher_Stinger_vehicle_veh",[0]];
		_this removeMagazineTurret ["CUP_4Rnd_Stinger_M",[0]];
		_this removeMagazineTurret ["CUP_4Rnd_Stinger_M",[0]];
		_this removeMagazineTurret ["CUP_4Rnd_Stinger_M",[0]];
		
		_this addMagazineTurret ["magazine_Missile_rim116_x21",[0]];
		_this addWeaponTurret ["weapon_rim116Launcher",[0]];
	};
	/*
	case "pook_MLRS_BLUFOR": {
		_this removeWeaponTurret ["pook_MLRS_Launcher",[0]];
		_this removeMagazineTurret ["POOK_ARTY_MLRS_HE",[0]];
		
		
		_this addMagazineTurret ["CUP_12Rnd_MLRS_HE",[0]];
		_this addWeaponTurret ["CUP_Vmlauncher_MLRS_veh",[0]];
	};
	*/
	
	/*
	
Sam_klein_weapon-->	weapon_rim116Launcher   ammo= magazine_Missile_rim116_x21
	
tung 			--<  CUP_Vmlauncher_9M311_veh	--< CUP_8Rnd_9M311_Tunguska_M	

tungM			--<	CUP_Vmlauncher_9M311M_veh	--<	CUP_8Rnd_9M311M_Tunguska_M

liner			--<	CUP_Vmlauncher_Stinger_vehicle_veh  --<     CUP_4Rnd_Stinger_M ; CUP_8Rnd_Stinger_M


tung

_this removeWeaponTurret ["CUP_Vmlauncher_9M311_veh",[0]];
_this removeMagazineTurret ["CUP_8Rnd_9M311_Tunguska_M",[0]];
_this addMagazineTurret ["magazine_Missile_rim116_x21",[0]];
_this addWeaponTurret ["weapon_rim116Launcher",[0]];


liner
	_this removeWeaponTurret ["CUP_Vmlauncher_Stinger_vehicle_veh",[0]];
	_this removeMagazineTurret ["CUP_4Rnd_Stinger_M",[0]];
	_this removeMagazineTurret ["CUP_4Rnd_Stinger_M",[0]];
	_this removeMagazineTurret ["CUP_4Rnd_Stinger_M",[0]];
	
	_this addMagazineTurret ["magazine_Missile_rim116_x21",[0]];
	_this addWeaponTurret ["weapon_rim116Launcher",[0]];


	case "RHS_M2A2_BUSKI";
	case "RHS_M2A2";
	case "RHS_M2A3";
	case "RHS_M2A3_BUSKI";
	case "RHS_M2A3_BUSKIII";
	case "RHS_M2A2_BUSKI_wd";
	case "RHS_M2A2_wd";
	case "RHS_M2A3_wd";
	case "RHS_M2A3_BUSKI_wd";
	case "RHS_M2A3_BUSKIII_wd": {
		_this removeWeaponTurret ["Rhs_weap_TOW_Launcher",[0]];
		_this removeMagazineTurret ["rhs_mag_2Rnd_TOW2A",[0]];
		_this removeMagazineTurret ["rhs_mag_2Rnd_TOW2A",[0]];
		_this removeMagazineTurret ["rhs_mag_2Rnd_TOW2A",[0]];
		_this removeMagazineTurret ["rhs_mag_2Rnd_TOW2A",[0]];
		_this addMagazineTurret ["rhs_mag_9m133_2",[0]];
		_this addMagazineTurret ["rhs_mag_9m133_2",[0]];
		_this addMagazineTurret ["rhs_mag_9m133_2",[0]];
		_this addMagazineTurret ["rhs_mag_9m133_2",[0]];
		_this addWeaponTurret ["rhs_weap_9k133",[0]];
		_current_heavy_level = ((side player) Call cti_CO_FNC_GetSideUpgrades) select cti_UP_HEAVY;
        if(_current_heavy_level < 2)then{
            _this disableTIEquipment true;
        };
	};
	
	case "CUP_B_LAV25_desert_USMC";
	case "CUP_B_LAV25_USMC":{
    	_current_light_level = ((side player) Call cti_CO_FNC_GetSideUpgrades) select cti_UP_LIGHT;
        if(_current_light_level < 4)then{
            _this disableTIEquipment true;
    	};
    };
	
	case "rhs_bmd1pk":{
        _current_heavy_level = ((side player) Call cti_CO_FNC_GetSideUpgrades) select cti_UP_HEAVY;
        if(_current_heavy_level < 1)then{
            _this removeMagazineTurret ["rhs_mag_pg15v_24",[0]];
            _this removeMagazineTurret ["rhs_mag_pg15v_24",[0]];
            _this removeMagazineTurret ["rhs_mag_pg15v_24",[0]];
            _this removeMagazineTurret ["rhs_mag_pg15v_24",[0]];
        };
    };
*/

};



