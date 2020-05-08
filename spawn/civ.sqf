/*
	civilian spawn script
	create some groups
	check for each if alive
	define new patrols
	args :
		_position
		_radius
		_number_function
*/

private _patrolsGroups = [];


// systemChat str(_this);
private _position = _this select 0;
private _radius = _this select 1;
private _number_function = _this select 2;


private _closest_player_distance = {
	private _position_to_test = _this select 0;
	private _human_players = _this select 1;
	private _all_dists = [];
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


while {currMiss != 0}
do
{
	private _human_players = allPlayers - entities "HeadlessClient_F"; // removing Headless Clients
	private _groupsNumbers = floor ([] call _number_function);

	// systemChat format ["Groups : %1", count _patrolsGroups];
	// systemChat format ["Distance : %1", [_position, _human_players] call _closest_player_distance];
	// SPAWN
	if (([_position, _human_players] call _closest_player_distance) < (_max_dist + _radius))
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
			private _type = civ select (floor random (count civ));
			private _groups_parameters = [_pos, CIVILIAN, _type];
			private _new_grp = _groups_parameters call BIS_fnc_spawnGroup;
			_patrolsGroups pushBack _new_grp;
			if (_garnison_ratio > random 1)
			then
			{
				// systemChat "garnison";
				[_new_grp, getPos nearestBuilding (units _new_grp select 0)] execVM "\x\cba\addons\ai\fnc_waypointGarrison.sqf";
			}
			else
			{
				// systemChat "patrol";
				[_new_grp, getPos (units _new_grp select 0), _radius] call bis_fnc_taskpatrol;
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
	_patrolsGroups = _patrolsGroups select {(count units _x) > 0};
	
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


{
	{
		deleteVehicle _x;
	} forEach units _x;
	deleteGroup _x;
} forEach _patrolsGroups;
