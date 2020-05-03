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


private _position = _this select 0;
private _radius = _this select 1;
private _local_dificulty = _this select 2;


private _groups_parameters = [_position, EAST, 3];
private _delay = 30; // s (time between each loops)


while {true}
do
{
	// SPAWN
	private _groupsNumbers = floor (3 * (count allPlayers) * (1 + _local_dificulty));
	for "_i" from 1 + count _patrolsGroups to _groupsNumbers
	do
	{
		_patrolsGroups pushBack (_groups_parameters call BIS_fnc_spawnGroup);
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
