/*
	opfor spawn and patrol main script
	create some groups
	check for each if alive
	define new patrols
	args :
		_position
		_radius
		_local_dificulty
		_spawn_can_stop (optional)
*/

private _patrolsGroups = [];


// systemChat str(_this);
private _position = _this select 0;
private _radius = _this select 1;
private _local_dificulty = _this select 2;
private _spawn_can_stop = _this select 3;
if (isNil "_spawn_can_stop") then {_spawn_can_stop = false};


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
private _big_delay = 10; // s (time between each loops)
private _min_dist = 750; // m (stop spawn distance)
private _max_dist = 3000; // m (start despawn distance)
private _grp_spawn_cap = 2; // max number of group that can spawn each turn
private _garnison_ratio = 0.5;
private _aera_captured = false;
private _aera_engaged = false;


while {true}
do
{
	private _human_players = allPlayers - entities "HeadlessClient_F"; // removing Headless Clients
	private _groupsNumbers = floor (1 + (count _human_players) * _local_dificulty);

	// systemChat format ["Groups : %1", count _patrolsGroups];
	// systemChat format ["Distance : %1", [_position, _human_players] call _closest_player_distance];
	// SPAWN
	if (([_position, _human_players] call _closest_player_distance) < (_max_dist + _radius))
	then
	{
		private _units_in_range = count (allUnits select {((_x distance _position) < _radius) && ((side _x) == east)});
		private _players_in_range = count (allPlayers select {_x distance _position < _radius});
		private _condition_to_spawn = _units_in_range >= _players_in_range;
		if ((_players_in_range == 0) && (_units_in_range > 0) && (_aera_engaged))
		then
		{
			_aera_captured = false;
			// systemChat "aera no longer under control";
		};
		if ((!_spawn_can_stop) || (_spawn_can_stop && _condition_to_spawn && !_aera_captured))
		then
		{
			for "_i" from 1 + count _patrolsGroups to (_groupsNumbers min (count _patrolsGroups + _grp_spawn_cap))
			do
			{
				// systemChat "aera active";
				// systemChat "Spawn 1 group";
				private _pos = [[[_position, _radius]],["water"]] call BIS_fnc_randomPos;
				// systemChat format ["Position test : %1", _pos];
				while {([_pos, _human_players] call _closest_player_distance < _min_dist) || ([_pos, _human_players] call _closest_player_distance > _max_dist)}
				do
				{
					_pos = [[[_position, _radius]],["water"]] call BIS_fnc_randomPos;
				};
				// systemChat format ["Position : %1", _pos];
				private _groups_parameters = [_pos, EAST, 3];
				private _new_grp = _groups_parameters call BIS_fnc_spawnGroup;
				_patrolsGroups pushBack _new_grp;
				if (_garnison_ratio > random 1)
				then
				{
					// systemChat "garnison";
					[_new_grp, _position] execVM "\x\cba\addons\ai\fnc_waypointGarrison.sqf";
				}
				else
				{
					// systemChat "patrol";
					[_new_grp, getPos (units _new_grp select 0), _radius] call bis_fnc_taskpatrol;
				};
			};
		}
		else
		{
			if (_spawn_can_stop)
			then
			{
				// systemChat "aera captured";
				_aera_captured = true;
				_aera_engaged = false;
				sleep _big_delay;
			};
		};
	};
	
	// CHECKUP
	{
		if (!isNull ((units _x) select 0))
		then
		{
			if ( ([((units _x) select 0), _human_players] call _closest_player_distance) > _max_dist )
			then
			{
				// systemChat "Player too far :\";
				{
					deleteVehicle _x;
				} forEach units _x;
				deleteGroup _x;
			};
		};
	} forEach _patrolsGroups;
	private _tmp = _patrolsGroups select {(count units _x) > 0};
	if (count _tmp == count _patrolsGroups)
	then
	{
		_aera_engaged = true;
	};
	_patrolsGroups = _tmp;

	// WAYPOINTS
	{
		// systemChat format ["Group %1 : %2", _x, waypoints _x];
		// remove previous waypoints
		if (count waypoints _x > 1)
		then
		{
			for "_j" from count waypoints _x - 1 to 0 step -1
			do
			{
				deleteWaypoint [_x, _j];
			};
			// set nexts waypoints
			[_x, getPos (units _x select 0), _radius] call bis_fnc_taskpatrol;
		};
	} forEach _patrolsGroups;
	sleep _delay;
};
