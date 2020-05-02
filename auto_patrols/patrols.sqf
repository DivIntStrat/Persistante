/*
	groups patrols
*/

{
	// remove previous waypoints
	for "_j" from count waypoints _x - 1 to 0 step -1
	do
	{
		deleteWaypoint [_x, _j];
	};
	// set nexts waypoints
	[_x, markerPos "marker_0", 1500] call bis_fnc_taskpatrol;
} forEach patrols_groups;
