/*
	opfor spawn and patrol main script
	create some groups
	check for each if alive
	define new patrols
	args :
		_position
		_radius
		_local_dificulty
*/

private _patrolsGroups = [];


// systemChat str(_this);
private _position = _this select 0;
private _radius = _this select 1;
private _local_dificulty = _this select 2;


private _closest_player_distance = {
	private _pos = _this select 0;
	private _human_players = _this select 1;
	private _all_dists = [];
	{_all_dists pushBack ((getPos _x) distance _pos)} forEach _human_players;
	_all_dists sort true;
	_all_dists select 0;
};


private _groups_parameters = [_position, EAST, 3];
private _delay = 30; // s (time between each loops)
private _min_dist = 750; // m (stop spawn distance)
private _max_dist = 3000; // m (start despawn distance)


while {true}
do
{
	private _human_players = allPlayers - entities "HeadlessClient_F"; // removing Headless Clients
	// systemChat format ["Groups : %1", count _patrolsGroups];
	// systemChat format ["Distance : %1", [_position, _human_players] call _closest_player_distance];
	// SPAWN
	if ( ([_position, _human_players] call _closest_player_distance) < _min_dist )
	then
	{
		// systemChat "Player too close :/";
	}
	else
	{
		if ( ([_position, _human_players] call _closest_player_distance) < _max_dist )
		then
		{
			// systemChat "Player in good range :)";
			private _groupsNumbers = floor (3 * (count _human_players) * (1 + _local_dificulty));
			for "_i" from 1 + count _patrolsGroups to _groupsNumbers
			do
			{
				// systemChat "Spawn 1 group";
				_patrolsGroups pushBack (_groups_parameters call BIS_fnc_spawnGroup);
			};
		}
		else
		{
			// systemChat "Player too far :\";
			{
				{
					deleteVehicle _x;
				} forEach units _x;
				deleteGroup _x;
			} forEach _patrolsGroups;
		};
	};
	
	// CHECKUP
	_patrolsGroups = _patrolsGroups select {(count units _x) > 0};

	// WAYPOINTS
	{
		// remove previous waypoints
		for "_j" from count waypoints _x - 1 to 0 step -1
		do
		{
			deleteWaypoint [_x, _j];
		};
		// set nexts waypoints
		[_x, getPos (units _x select 0), _radius] call bis_fnc_taskpatrol;
	} forEach _patrolsGroups;
	sleep _delay;
};
