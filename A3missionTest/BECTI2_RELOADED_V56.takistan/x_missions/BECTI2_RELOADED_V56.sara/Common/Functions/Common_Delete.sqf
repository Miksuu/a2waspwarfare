//CTI_CO_FNC_DELETE (fix ghost ai and stuff for crew)
private _to_delete=_this;



if ((_to_delete isKindOf 'Man')&&(_to_delete==vehicle _to_delete)) then{//its inf,just delete it
deleteVehicle _to_delete;
};

if (!(_to_delete isKindOf 'Man')&&(_to_delete==vehicle _to_delete)) then{//its vehicle
deleteVehicleCrew _to_delete;
deleteVehicle _to_delete;
};


if ((_to_delete isKindOf 'Man')&&(_to_delete!=vehicle _to_delete)) then{//its crew or cargo inf
deleteVehicleCrew (vehicle _to_delete);
//deleteVehicle _to_delete;
};
