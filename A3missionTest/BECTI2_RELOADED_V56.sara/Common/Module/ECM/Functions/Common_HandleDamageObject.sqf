
_mainlist=_this#0;
_unit=_mainlist#0;
_ammo= _this#0#6;
_direct= _this#0#10;
_values=[_ammo#0,_ammo#1];

_ARMORPOINTS=3000;



//ID
_varname= str _unit;
_OBJECTid=_varname+"id";

_CHECKVALUE= 0;

_CHECK= _unit getVariable _OBJECTid;
if (isNil "_CHECK") then {//STARTDAMAGE
_unit setVariable [_OBJECTid,0];
};


if (_direct == true) then {

_CHECKVALUE= _unit getVariable _OBJECTid;
_CHECKVALUE=_CHECKVALUE+_values#0;
_unit setVariable [_OBJECTid,_CHECKVALUE];

}else{

_CHECKVALUE= _unit getVariable _OBJECTid;
_CHECKVALUE=_CHECKVALUE+_values#1;
_unit setVariable [_OBJECTid,_CHECKVALUE];

};

if (_CHECKVALUE > _ARMORPOINTS) then {
_CHECKVALUE= _unit getVariable _OBJECTid;
	if !(isNil "_CHECK") then {//ONEWAY
	_unit setVariable [_OBJECTid,nil];
	_unit setDamage 1;//end ECM script
	_pos= getPosATL _unit;//_dir= (getDir _unit)+180;
	
	_unitVD=vectorDir _unit;_unitVD_1= [(-1*_unitVD#0),(-1*_unitVD#1),(-1*_unitVD#2)];
	_unitVU=vectorUp _unit;
	_unit	setPos [_pos#0,_pos#1,_pos#2+20000] ;	//deleteVehicle  _unit;
	_wreck=createVehicle ["Land_Device_assembled_F",_pos, [], 0, "CAN_COLLIDE"];
	_wreck setDir _dir;	
	
	//_wreck setVectorUp surfaceNormal (getposATL _wreck);	
	
	_wreck setVectorDirAndUp [_unitVD_1, _unitVU];
	
	_wreck setDamage 1;
	_wreck setVariable [_OBJECTid,0];
	sleep 10;
	deleteVehicle  _unit;
	};
};

