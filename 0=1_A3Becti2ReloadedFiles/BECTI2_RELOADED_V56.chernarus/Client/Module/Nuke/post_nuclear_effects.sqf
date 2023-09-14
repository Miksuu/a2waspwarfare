//enableenvironment false;
//if (viewdistance < 3500) then {setviewdistance 3500};
setwind [0.201112,0.204166,true];
0 setovercast 0.7;

//"colorCorrections" ppEffectAdjust [2, 30, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
"colorCorrections" ppEffectCommit 0;
//"colorCorrections" ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
"colorCorrections" ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];  
"colorCorrections" ppEffectCommit 3;
"colorCorrections" ppEffectEnable true;
"filmGrain" ppEffectEnable true; 
"filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
"filmGrain" ppEffectCommit 5;

//--- Ash
[] spawn {
	waituntil {alive player};
	_pos = position player;
	_parray = [
	/* 00 */		["\a3\data_f\ParticleEffects\Universal\Universal", 16, 12, 8, 1],//"\Ca\Data\cl_water",
	/* 01 */		"",
	/* 02 */		"Billboard",
	/* 03 */		1,
	/* 04 */		4,
	/* 05 */		[0,0,0],
	/* 06 */		[0,0,0],
	/* 07 */		1,
	/* 08 */		0.000001,
	/* 09 */		0,
	/* 10 */		1.4,
	/* 11 */		[0.05,0.05],
	/* 12 */		[[0.1,0.1,0.1,1]],
	/* 13 */		[0,1],
	/* 14 */		0.2,
	/* 15 */		1.2,
	/* 16 */		"",
	/* 17 */		"",
	/* 18 */		vehicle player
	];
	_snow = "#particlesource" createVehicleLocal _pos;  
	_snow setParticleParams _parray;
	_snow setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
	_snow setParticleCircle [0.0, [0, 0, 0]];
	_snow setDropInterval 0.01;

	_oldPlayer = vehicle player;
	while {true} do {
		waituntil {vehicle player != _oldPlayer};
		_parray set [18,vehicle player];
		_snow setParticleParams _parray;
		_oldPlayer = vehicle player;
	};
};

//--- Earthquake
//player spawn Earthquake; //принудительный запуск землятресения
Earthquake = {
	while {alive player} do {
		playsound "Earthquake";
		for "_i" from 0 to 140 do {
			_vx = vectorup _this select 0;
			_vy = vectorup _this select 1;
			_vz = vectorup _this select 2;
			_coef = 0.01 - (0.0001 * _i);
			_this setvectorup [
				_vx+(-_coef+random (2*_coef)),
				_vy+(-_coef+random (2*_coef)),
				_vz+(-_coef+random (2*_coef))
			];
			sleep (0.01 + random 0.01);
		};
		sleep (180 + random 60);
	};
};

//sleep 5;
player spawn Earthquake;

//--- Wind & Dust
[] spawn {
	waituntil {alive player};
	setwind [0.201112,0.204166,true];
	while {true} do {
		_ran = ceil random 5;
		playsound format ["wind_%1",_ran];
		_obj = vehicle player;
		_pos = position _obj;

		//--- Dust
		setwind [0.201112*2,0.204166*2,false];
		_velocity = [random 10,random 10,-1];
		_color = [1.0, 0.9, 0.8];
		_alpha = 0.02 + random 0.02;
		_ps = "#particlesource" createVehicleLocal _pos;  
		_ps setParticleParams [["\a3\data_f\ParticleEffects\Universal\universal.p3d", 16, 12, 8], "", "Billboard", 1, 3, [0, 0, -6], _velocity, 1, 1.275, 1, 0, [9], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", _obj];
		_ps setParticleRandom [3, [30, 30, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
		_ps setParticleCircle [0.1, [0, 0, 0]];
		_ps setDropInterval 0.01;

		sleep (random 1);
		deletevehicle _ps;
		_delay = 10 + random 20;
		sleep _delay;
	};
};