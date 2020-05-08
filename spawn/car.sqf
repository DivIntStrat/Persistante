/*
	script that spawn some crates
	args :
		_position
		_radius
		_number_function
*/

private _all_vls = [];


// systemChat str(_this);
private _position = _this select 0;
private _radius = _this select 1;
private _number_function = _this select 2;


private _closest_player_distance = {
	private _position_to_test = _this select 0;
	private _human_players = _this select 1;
	private _all_dists = [];
 	// systemChat format ["DEBUG : %1, %2", _position_to_test, _human_players];
	{_all_dists pushBack ((getPos _x) distance _position_to_test)} forEach _human_players;
	_all_dists sort true;
	_all_dists select 0;
};


private _near_road = {
	private _pos = _this;

	_rad = 50;
	_spawnVh = _pos nearRoads _rad;
	while {count _spawnVh == 0} do
	{
		_rad = _rad + 50;
		_spawnVh = _pos nearRoads _rad;
	};
	_spawnVh call BIS_fnc_arrayShuffle;
  	getPos (_spawnVh select 0);
};

private _delay = 10; // s (time between each loops)
private _big_delay = 10; // s (time between each loops)
private _min_dist = 1500; // m (stop spawn distance)
private _max_dist = 4500; // m (start despawn distance)
private _vl_spawn_cap = 1; // max number of group that can spawn each turn
private _patrols_radius = 1.3 * _radius;



while {currMiss != 0}
do
{
	private _human_players = allPlayers - entities "HeadlessClient_F";
	private _vl_numbers = floor ([] call _number_function);
	if (([_position, _human_players] call _closest_player_distance) < (_max_dist + _radius))
	then
	{
		for "_i" from 1 + count _all_vls to (_vl_numbers min (count _all_vls + _vl_spawn_cap))
		do
		{
			private _pos = [[[_position, _radius]],["water"]] call BIS_fnc_randomPos;
			while {([_pos, _human_players] call _closest_player_distance < _min_dist) || ([_pos, _human_players] call _closest_player_distance > _max_dist)}
			do
			{
				_pos = [[[_position, _radius]],["water"]] call BIS_fnc_randomPos;
			};
			private _type = car select (floor random (count car));
			private _groups_parameters = [_pos call _near_road, CIVILIAN, _type];
			_all_vls pushBack (_groups_parameters call BIS_fnc_spawnGroup);
		};
	};
	
	// CHECKUP
	{
		if (!isNull ((units _x) select 0))
		then
		{
			if ( ([getPos ((units _x) select 0), _human_players] call _closest_player_distance) > _max_dist )
			then
			{
				if ((vehicle ((units _x) select 0)) != ((units _x) select 0))
				then
				{
					deleteVehicle (vehicle ((units _x) select 0));
				};
				{
					deleteVehicle _x;
				} forEach units _x;
				deleteGroup _x;
			};
		};
	} forEach _all_vls;
	_all_vls = _all_vls select {(count units _x) > 0};

	// WAYPOINTS
	{
		// remove previous waypoints
		for "_j" from count waypoints _x - 1 to 0 step -1
		do
		{
			deleteWaypoint [_x, _j];
		};
		// set nexts waypoints
		private _wp = 0;
		for "_i" from 1 to 5
		do
		{
			private _pos = ([[[getPos (units _x select 0), _patrols_radius]],["water"]] call BIS_fnc_randomPos) call _near_road;
			private _dist = [_pos, _human_players] call _closest_player_distance;
			while {(_dist < _min_dist) || (_dist > _max_dist)}
			do
			{
				_pos = ([[[getPos (units _x select 0), _patrols_radius]],["water"]] call BIS_fnc_randomPos) call _near_road;
				_dist = [_pos, _human_players] call _closest_player_distance;
			};
			_wp =_x addWaypoint [_pos, -1];
			_wp setWaypointSpeed "LIMITED";
		};
		_wp setWaypointType "CYCLE";
	} forEach _all_vls;
	sleep _delay;
};


{
	if ((vehicle ((units _x) select 0)) != ((units _x) select 0))
	then
	{
		deleteVehicle (vehicle ((units _x) select 0));
	};
	{
		deleteVehicle _x;
	} forEach units _x;
	deleteGroup _x;
} forEach _all_vls;
