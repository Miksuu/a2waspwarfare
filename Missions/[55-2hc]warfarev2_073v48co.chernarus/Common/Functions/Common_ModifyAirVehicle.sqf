Private ["_lock","_position","_side","_type","_vehicle"];
_vehicle = _this select 0;
_type = typeof _vehicle;

switch (_type) do {

//LoadoutManagerInsertChanges

//LoadoutManagerInsertChanges_END

	default{
	
			_rearmor = {
   				_ammo = _this select 4;
   				_result = 0;

   				switch (_ammo) do {
     				default {_result = _this select 2;};
    			};
   				_result
  			};
			_vehicle addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];
	};
};
processinitcommands;
_vehicle