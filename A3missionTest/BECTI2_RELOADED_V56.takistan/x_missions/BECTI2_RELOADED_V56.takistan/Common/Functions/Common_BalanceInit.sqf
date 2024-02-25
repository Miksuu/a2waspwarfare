//its possible to take vehicle from other player and objectspawner leave after that,so change to remote exec here too



REMOVE_ALL={
private _veh=_this;
private _mags=magazines _veh;
{[_veh,_x] remoteexec ["removeMagazineGlobal",_veh]} forEach (_mags);
private _nonpylonWeaponslist = [];
{ _nonpylonWeaponslist append getArray (_x >> "weapons") } forEach ([_veh, configNull] call BIS_fnc_getTurrets);
{[_veh,_x] remoteexec ["removeWeaponGlobal",_veh]} forEach (_nonpylonWeaponslist);

};
//pook_ZSU_base_IND
//pook_ZSU57_base_IND
switch (typeOf _this) do 
{	

	case "cwr3_o_zu23": {//replaced pook zu and stuff to fix soundbug and give balance weapon for CRAM
		_this call REMOVE_ALL;
		[_this,["CUP_2000Rnd_23mm_AZP23_M",[0]]] remoteexec ["addMagazineTurret",_this];
		[_this,["CUP_Vacannon_AZP23_veh",[0]]] remoteexec ["addWeaponTurret",_this];		
			
		
	};
	
	
	case "pook_ZSU57_base_IND": {
		_this call REMOVE_ALL;
		[_this,["CUP_2000Rnd_23mm_AZP23_M",[0]]] remoteexec ["addMagazineTurret",_this];
		[_this,["CUP_Vacannon_AZP23_veh",[0]]] remoteexec ["addWeaponTurret",_this];		
			
		
	};
	
	case "pook_ZSU_base_IND": {
		_this call REMOVE_ALL;
		
		[_this,["CUP_2000Rnd_23mm_AZP23_M",[0]]] remoteexec ["addMagazineTurret",_this];
		[_this,["CUP_Vacannon_AZP23_veh",[0]]] remoteexec ["addWeaponTurret",_this];		
			
		
	};
	
	case "pook_ZSUM4_base_IND": {
		_this call REMOVE_ALL;
		
		[_this,["CUP_2000Rnd_23mm_AZP23_M",[0]]] remoteexec ["addMagazineTurret",_this];
		[_this,["CUP_Vacannon_AZP23_veh",[0]]] remoteexec ["addWeaponTurret",_this];		
		[_veh,["CUP_2Rnd_Igla_M",[0]]] remoteexec ["addMagazineTurret",_veh];
		[_veh,["CUP_2Rnd_Igla_M",[0]]] remoteexec ["addMagazineTurret",_veh];
		[_veh,["CUP_2Rnd_Igla_M",[0]]] remoteexec ["addMagazineTurret",_veh];
		[_veh,["CUP_igla_twice_W",[0]]] remoteexec ["addWeaponTurret",_veh];
		
	};
	
	
	case "pook_ZU23_base": {
		
		private _veh=_this;
		[_veh,1000] remoteexec ["setMass",_veh];
		_this call REMOVE_ALL;

		[_veh,["CUP_100Rnd_23mm_AZP23_M",[0]]] remoteexec ["addMagazineTurret",_veh];
		[_veh,["CUP_100Rnd_23mm_AZP23_M",[0]]] remoteexec ["addMagazineTurret",_veh];
		[_veh,["CUP_Vacannon_2A14_veh",[0]]] remoteexec ["addWeaponTurret",_veh];
		
	};
	case "pook_ZU23M_base": {
		
		private _veh=_this;
		[_veh,1000] remoteexec ["setMass",_veh];
		_this call REMOVE_ALL;

		[_veh,["CUP_100Rnd_23mm_AZP23_M",[0]]] remoteexec ["addMagazineTurret",_veh];
		[_veh,["CUP_100Rnd_23mm_AZP23_M",[0]]] remoteexec ["addMagazineTurret",_veh];
		[_veh,["CUP_Vacannon_2A14_veh",[0]]] remoteexec ["addWeaponTurret",_veh];

		[_veh,["CUP_2Rnd_Igla_M",[0]]] remoteexec ["addMagazineTurret",_veh];
		[_veh,["CUP_igla_twice_W",[0]]] remoteexec ["addWeaponTurret",_veh];
		
	};
	
	case "pook_S60_base_IND": {//add bushmaster to fix sound
		
		_this call REMOVE_ALL;
		[_this,["CUP_150Rnd_TE1_Red_Tracer_25mm_M242_HE",[0]]] remoteexec ["addMagazineTurret",_this];
		[_this,["CUP_150Rnd_TE1_Red_Tracer_25mm_M242_HE",[0]]] remoteexec ["addMagazineTurret",_this];
		[_this,["CUP_Vacannon_M242_veh_LAV25",[0]]] remoteexec ["addWeaponTurret",_this];		
					
		
	};
	
	case "pook_S60_base": {//add bushmaster to fix sound
		_this call REMOVE_ALL;
		[_this,["CUP_150Rnd_TE1_Red_Tracer_25mm_M242_HE",[0]]] remoteexec ["addMagazineTurret",_this];
		[_this,["CUP_150Rnd_TE1_Red_Tracer_25mm_M242_HE",[0]]] remoteexec ["addMagazineTurret",_this];
		[_this,["CUP_Vacannon_M242_veh_LAV25",[0]]] remoteexec ["addWeaponTurret",_this];		
			
		
	};
	
	
	
	
	case "CUP_O_Ka60_Grey_RU": {

		private _veh=_this;
		private _worklist=getAllPylonsInfo _veh;
		for "_i" from 0 to (count _worklist) - 1 do {
		private _activePylonMag = [_worklist#_i#3]; 
		private _weapon = _activePylonMag apply {getText ((configfile >> "CfgMagazines" >> _x >> "pylonWeapon"))}; 
		[_veh,[_weapon#0,_worklist#_i#2]] remoteexec ["removeWeaponTurret",_veh] ;
		[_veh,[_worklist#_i#3,_worklist#_i#2]] remoteexec ["removeMagazineTurret",_veh] ;
		[_veh,[_i + 1,"",true,_worklist#_i#2]] remoteexec ["setPylonLoadOut",_veh] ;
		[_veh,[_i + 1,0]] remoteexec ["SetAmmoOnPylon",_veh] ;
		};
		
		
	};
	
	
	
	case "UK3CB_BAF_Apache_AH1_JS": {//asraam added with requipair too
		[_this,["FakeMagazine",[-1]]] remoteexec ["removeMagazineTurret",_this];
		[_this,["UK3CB_BAF_Safe",[-1]]] remoteexec ["removeWeaponTurret",_this];
		
		
		[_this,["UK3CB_BAF_PylonPod_19Rnd_CRV7_HEISAP",[-1]]] remoteexec ["removeMagazineTurret",_this];
		[_this,["UK3CB_BAF_Missiles_CRV7_HEISAP",[-1]]] remoteexec ["removeWeaponTurret",_this];
		
		
		[_this,["UK3CB_BAF_1200Rnd_30mm_M230_HEDP_T",[0]]] remoteexec ["removeMagazineTurret",_this];
		[_this,["UK3CB_BAF_CannonM230",[0]]] remoteexec ["removeWeaponTurret",_this];
		
		
		
		[_this,["UK3CB_BAF_1200Rnd_30mm_M230_HEDP_T",[-1]]] remoteexec ["addMagazineTurret",_this];
		[_this,["UK3CB_BAF_CannonM230",[-1]]] remoteexec ["addWeaponTurret",_this];
		
		
		
		
		
		

	};
	
	
	
	
	case "CUP_O_Ka52_Blk_RU": {
		
		//_this removeWeaponTurret ["CUP_Vmlauncher_S8_CCIP_veh",[-1]];made in new requipscript now
		//_this addMagazineTurret ["CUP_230Rnd_TE1_Green_Tracer_30mmHEIF_2A42_M",[-1]];
		//_this addMagazineTurret ["CUP_230Rnd_TE1_Green_Tracer_30mmAPBC_2A42_M",[-1]];

		//_this addMagazineTurret ["CUP_230Rnd_TE1_Green_Tracer_30mmAP_2A42_M",[-1]];
		//_this addMagazineTurret ["CUP_230Rnd_TE1_Green_Tracer_30mmHE_2A42_M",[-1]];



		//_this addWeaponTurret ["CUP_Vacannon_2A42_Ka50",[-1]];
		
		[_this,["CUP_230Rnd_TE1_Green_Tracer_30mmHEIF_2A42_M",[-1]]] remoteexec ["addMagazineTurret",_this];
		[_this,["CUP_230Rnd_TE1_Green_Tracer_30mmAPBC_2A42_M",[-1]]] remoteexec ["addMagazineTurret",_this];
		[_this,["CUP_230Rnd_TE1_Green_Tracer_30mmAP_2A42_M",[-1]]] remoteexec ["addMagazineTurret",_this];
		[_this,["CUP_230Rnd_TE1_Green_Tracer_30mmHE_2A42_M",[-1]]] remoteexec ["addMagazineTurret",_this];
		[_this,["CUP_Vacannon_2A42_Ka50",[-1]]] remoteexec ["addWeaponTurret",_this];
		
		
	};
	
	
	
	
	
	case "CUP_O_2S6M_RU": {
		//_this removeWeaponTurret ["CUP_Vmlauncher_9M311M_veh",[0]];
		//_this removeMagazineTurret ["CUP_8Rnd_9M311M_Tunguska_M",[0]];
		//_this addMagazineTurret ["magazine_Missile_rim116_x21",[0]];
		//_this addWeaponTurret ["weapon_rim116Launcher",[0]];
		
		
		[_this,["CUP_8Rnd_9M311M_Tunguska_M",[0]]] remoteexec ["removeMagazineTurret",_this];
		[_this,["CUP_Vmlauncher_9M311M_veh",[0]]] remoteexec ["removeWeaponTurret",_this];
		
		[_this,["weapon_rim116Launcher",[0]]] remoteexec ["addWeaponTurret",_this];
		[_this,["magazine_Missile_rim116_x21",[0]]] remoteexec ["addMagazineTurret",_this];
		
		
	};
	
	case "CUP_B_M6LineBacker_USA_W": {
		[_this,["CUP_4Rnd_Stinger_M",[0]]] remoteexec ["removeMagazineTurret",_this];
		[_this,["CUP_4Rnd_Stinger_M",[0]]] remoteexec ["removeMagazineTurret",_this];
		[_this,["CUP_4Rnd_Stinger_M",[0]]] remoteexec ["removeMagazineTurret",_this];
		[_this,["CUP_4Rnd_Stinger_M",[0]]] remoteexec ["removeMagazineTurret",_this];
		[_this,["CUP_Vmlauncher_Stinger_vehicle_veh",[0]]] remoteexec ["removeWeaponTurret",_this];
		
		//_this removeWeaponTurret ["CUP_Vmlauncher_Stinger_vehicle_veh",[0]];
		//_this removeMagazineTurret ["CUP_4Rnd_Stinger_M",[0]];
		//_this removeMagazineTurret ["CUP_4Rnd_Stinger_M",[0]];
		//_this removeMagazineTurret ["CUP_4Rnd_Stinger_M",[0]];
		
		//_this addMagazineTurret ["magazine_Missile_rim116_x21",[0]];
		//_this addWeaponTurret ["weapon_rim116Launcher",[0]];
		
		[_this,["weapon_rim116Launcher",[0]]] remoteexec ["addWeaponTurret",_this];
		[_this,["magazine_Missile_rim116_x21",[0]]] remoteexec ["addMagazineTurret",_this];
		
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



