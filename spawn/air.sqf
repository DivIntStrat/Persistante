/*
	script that spawn some crates
	args :
		_position
		_radius
		_number_function
*/

private _all_air = [];


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


private _delay = 10; // s (time between each loops)
private _min_dist = 1500; // m (stop spawn distance)
private _max_dist = 4500; // m (start despawn distance)
private _vl_spawn_cap = 1; // max number of group that can spawn each turn



while {currMiss != 0}
do
{
	private _human_players = allPlayers - entities "HeadlessClient_F";
	private _air_numbers = floor (call _number_function);
	for "_i" from 1 + count _all_air to (_air_numbers min (count _all_air + _vl_spawn_cap))
	do
	{
		private _pos = [[[_position, _radius]]] call BIS_fnc_randomPos;
		while {[_pos, _human_players] call _closest_player_distance < _min_dist}
		do
		{
			_pos = [[[_position, _radius]]] call BIS_fnc_randomPos;
		};
		private _type = aVls select (floor random (count aVls));
		private _groups_parameters = [_pos, EAST, _type];
		_all_air pushBack (_groups_parameters call BIS_fnc_spawnGroup);
	};
	
	// CHECKUP
	_all_air = _all_air select {(count units _x) > 0};

	// WAYPOINTS
	{
		// remove previous waypoints
		for "_j" from count waypoints _x - 1 to 0 step -1
		do
		{
			deleteWaypoint [_x, _j];
		};
		// set nexts waypoints
		[_x, _position, _radius] call bis_fnc_taskpatrol;
	} forEach _all_air;
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
} forEach _all_air;
