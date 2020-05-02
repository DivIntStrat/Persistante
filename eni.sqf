private _grp = [markerPos "marker_0", EAST, 3];
private _patrols = [];
private _t1 = 5;
private _t2 = 30;


for "_i" from 0 to 2 do {
	private _temp = _grp call BIS_fnc_spawnGroup;
	_patrols pushBack _temp;
	[_temp, markerPos "marker_0", 1500] call bis_fnc_taskpatrol;
	sleep _t1;
};

while {count _patrols > 0} do {
	sleep _t2;
	for "_i" from 0 to (count _patrols) - 1 do {
		private _patrol = _patrols select _i; 
    	if ((count units _patrol) != 0)
		then {
			for "_j" from count waypoints _patrol - 1 to 0 step -1 do { deleteWaypoint [_patrol, _j];};
			[_patrol, markerPos "marker_0", 1500] call bis_fnc_taskpatrol;} 
		else {_patrols set [_i, _grp call BIS_fnc_spawnGroup];
			[_patrols select _i, markerPos "marker_0", 1500] call bis_fnc_taskpatrol};
	};
};


//grp = [position, side, character details, relative positions, list of ranks, skill range, ammo count range, randomization controls, azimuth] call bis_fnc_spawngroup;
//[grp, position leader grp, 50] call bis_fnc_taskpatrol;
//({side _x == OPFOR} count allGroups);

/*
for "_i" from 0 to 1 do {
	//private _azmt = floor random 361;
	_patrols pushBack (_grp call BIS_fnc_spawnGroup);
	//sleep 5;
};

{
	[_x, markerPos "marker_0", 1500,["water"]] call bis_fnc_taskpatrol;
	sleep 5;
} forEach _patrols;
*/

/* removes all WP
for "_j" from count waypoints _group - 1 to 0 step -1 do { deleteWaypoint [_group, _j];};
*/

/*
private _myArray = [1, 2, 3, 4, 5];
_myArray deleteAt 0; // _myArray is [2, 3, 4, 5]
*/
