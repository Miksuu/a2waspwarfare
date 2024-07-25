/*
	Author : Marty. 
	Function that automatically adjust the view distance according to an FPS target.
*/
	_min_fps_targeted = 40 ; //we aim this fps at least.
	_max_fps_targeted = 45 ;
	_max_distance_view = 6000;
	_min_distance_view = 500;

	_player_fps =  diag_fps;
	_player_view_distance = viewDistance;
	
	if (_player_fps < _min_fps_targeted) then 
	{
		_player_view_distance = _player_view_distance - 200;
		if (_player_view_distance > _min_distance_view) then 
		{
			setViewDistance _player_view_distance;
			//systemChat format ["%1 m distance view", _player_view_distance];
		};
	};

	if (_player_fps > _max_fps_targeted) then 
	{
		_player_view_distance = _player_view_distance + 300;
		if (_player_view_distance < _max_distance_view) then // we do not increase the distance view beabove the maximum limit.
		{
			setViewDistance _player_view_distance;
			//systemChat format ["%1 m distance view", _player_view_distance];
		};
	};