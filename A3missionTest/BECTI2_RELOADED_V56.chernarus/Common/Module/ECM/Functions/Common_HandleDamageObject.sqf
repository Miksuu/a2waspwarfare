
_mainlist=_this#0;
_ecm=_mainlist#0;
_ammo= _this#0#6;
_direct= _this#0#10;
_values=[_ammo#0,_ammo#1];

_ARMORPOINTS=3000;



//ID
_varname= str _ecm;
_OBJECTid=_varname+"id";

_CHECKVALUE= 0;

_CHECK= _ecm getVariable _OBJECTid;
if (isNil "_CHECK") then {//STARTDAMAGE
_ecm setVariable [_OBJECTid,0];
};


if (_direct == true) then {

_CHECKVALUE= _ecm getVariable _OBJECTid;
_CHECKVALUE=_CHECKVALUE+_values#0;
_ecm setVariable [_OBJECTid,_CHECKVALUE];

}else{

_CHECKVALUE= _ecm getVariable _OBJECTid;
_CHECKVALUE=_CHECKVALUE+_values#1;
_ecm setVariable [_OBJECTid,_CHECKVALUE];

};

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

