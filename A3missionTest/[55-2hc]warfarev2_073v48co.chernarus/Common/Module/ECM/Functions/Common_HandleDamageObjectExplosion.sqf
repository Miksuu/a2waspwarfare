_ecm=_this#0;
_charge=_this#2;
_distance=_ecm distance _charge;
_type=typeof _charge;  



_distance=_distance/1.4;

_coef=1/_distance;


_ARMORPOINTS=3000;



//ID
_varname= str _ecm;
_OBJECTid=_varname+"id";

_CHECKVALUE= 0;

_CHECK= _ecm getVariable _OBJECTid;
if (isNil "_CHECK") then {//STARTDAMAGE
_ecm setVariable [_OBJECTid,0];
};



_damage=0;

_damage = getNumber(configFile >> 'CfgAmmo' >> _type >> 'hit');

//sometimes it gives back  0

if (_damage == 0) then {
if (_type == "DemoCharge_Remote_Ammo")then{_damage=1000;};
if (_type == "SatchelCharge_Remote_Ammo")then{_damage=3000;};
if (_type == "CUP_PipeBomb_Ammo")then{_damage=3000;};
};				

_damage=_damage*_coef;



_CHECKVALUE= _ecm getVariable _OBJECTid;
_CHECKVALUE=_CHECKVALUE+_damage;
_ecm setVariable [_OBJECTid,_CHECKVALUE];   
 
if (_CHECKVALUE > _ARMORPOINTS) then {
	
	_ecm setVariable [_OBJECTid,nil];
	_ecm setDamage 1;//end ECM script
	_pos= getPosATL _ecm;
	
	_unitVD=vectorDir _ecm;_unitVD_1= [(-1*_unitVD#0),(-1*_unitVD#1),(-1*_unitVD#2)];
	_unitVU=vectorUp _ecm;
	
	if (_unitVU#2 <0) then{
	_pos=[_pos#0,_pos#1,_pos#2 -1.4];
	};
	
	_ecm	setPos [_pos#0,_pos#1,_pos#2+20000] ;	//deleteVehicle  _ecm;
	
	_wreck=createVehicle ["Land_Device_assembled_F",_pos, [], 0, "CAN_COLLIDE"];
	_wreck setVectorDirAndUp [_unitVD_1, _unitVU];
	_wreck setDamage 1;
	
	sleep 30;
	deleteVehicle  _ecm;
	
}; 
 