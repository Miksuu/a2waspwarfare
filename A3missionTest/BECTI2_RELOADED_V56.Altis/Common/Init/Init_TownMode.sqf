Private ['_towns','_value'];

_towns = [7000,7500,0] nearEntities [["LocationFOB_F"], 30000];
totalTowns = (count _towns) ;

//["INITIALIZATION", Format["Init_TownMode.sqf: Towns mode initialization is done for island [%1].",worldName]] Call cti_CO_FNC_LogContent;