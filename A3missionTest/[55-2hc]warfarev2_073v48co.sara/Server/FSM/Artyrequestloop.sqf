_artyvehicle=[

'CUP_I_Hilux_UB32_TK'
,'CUP_I_Hilux_MLRS_TK'
,'CUP_I_Hilux_podnos_TK'
,'CUP_I_M119_RACS'
,'CUP_I_D30_TK_GUE'
,'pook_M777_IND'

,'pook_TOS1A_OPFOR'
,'pook_9K58_OPFOR'
,'pook_A222_OPFOR'
,'pook_9K57M_OPFOR'
,'CUP_O_BM21_RU'
,'CUP_O_2b14_82mm_RU'
,'CUP_O_D30_RU'

,'CUP_B_M270_HE_BAF_WOOD'
,'CUP_B_M270_HE_USMC'
,'pook_CAESAR_BLUFOR'
,'pook_Pandur_Mortar_BLUFOR'
,'pook_MLRS_BLUFOR'
,'CUP_B_FV432_Mortar'
,'CUP_B_M1129_MC_MK19_Woodland'
,'CUP_B_L16A2_BAF_DDPM'
,'cwr3_b_uk_l118'
,'CUP_B_M252_USMC'
,'pook_M777'
];

_artyvehicle_short=[//2000 range
'CUP_I_Hilux_UB32_TK'
,'CUP_I_Hilux_MLRS_TK'
,'CUP_I_Hilux_podnos_TK'
,'CUP_O_2b14_82mm_RU'
,'CUP_B_M252_USMC'
];




while {true} do {

_playergroups = [];
{_playergroups pushBack (group _x);} forEach allPlayers;


_playerunits=[];
{_playerunits = _playerunits + (units _x);} forEach _playergroups;

_allunits=[];
{if (alive _x)  then {_allunits pushBack _x};} forEach allUnits;	


_all_nonPlayerAI=_allunits -_playerunits ;


_res = [];
{if ((side _x) == resistance) then {_res pushBack _x};} forEach _all_nonPlayerAI;		

/*will get seperate loops
_opf =[];
{if ((side _x) == east) then {_opf pushBack _x};} forEach _all_nonPlayerAI;
//extract HC part
_HCopf=[(_opf#0),(_opf#1)];
_opf=_opf - _HCopf;


_blu=[];
{if ((side _x) == west) then {_blu pushBack _x};} forEach _all_nonPlayerAI;
//extract HC part
_HCblu=[(_blu#0),(_blu#1)];
_blu=_blu - _HCblu;
*/







//GET ARTYTARGETS
if ((count _res) > 0) then{





_enemyRES=[];
{
_temp= _x findNearestEnemy _x;
if !(_temp isEqualTo objNull) then {
_enemyRES pushBackUnique _temp;
};} forEach _res;
//systemChat str _enemyRES;


//GET ARTYUNITS
_artyRES=[];
{if ((typeOf vehicle _x) in _artyvehicle) then {_artyRES pushBack _x};} forEach _res;
//systemChat str _artyRES;

//DO ARTYREQUEST

if ((count _enemyRES) > 0) then{


_target=_enemyRES#0;
_targetPos= getPos _target;


_artyINrange=[];

{if ((_target distance2D _x) < 4000) then {_artyINrange pushBack _x};} forEach _artyRES;

//systemChat "in Range=";
//systemChat str _artyINrange;

_minus_short_range_Units=[];
{if (((_target distance2D _x) > 2000)&&(_x in _artyvehicle_short)) then {_minus_short_range_Units pushBack _x};} forEach _artyRES;

_artyINrange=_artyINrange - _minus_short_range_Units;
//systemChat "in Teilungsrange=";
//systemChat str _artyINrange;

if ((random 100)< 50) then {

{_x commandArtilleryFire [_targetPos, (getArtilleryAmmo [vehicle _x]) select 0, 2]}forEach _artyINrange;
//systemChat "RES FEUERT";
_enemyRES= [];
_artyINrange=[];
}else {
//shortrange arty fires everytime

_shortrange_in_range=[];
{if (_x in _artyvehicle_short) then {_shortrange_in_range pushBack _x};} forEach _artyRES;
_shortrange_in_range=_shortrange_in_range - _minus_short_range_Units;


if ((count _shortrange_in_range) > 0) then{
{_x commandArtilleryFire [_targetPos, (getArtilleryAmmo [vehicle _x]) select 0, 2]}forEach _shortrange_in_range;
};
//systemChat "RES FEUERT NUR KURZ";
//systemChat str _shortrange_in_range;

_enemyRES= [];
_artyINrange=[];
_shortrange_in_range=[];
};



sleep (60 +random 240);

};

};










sleep 5;
};