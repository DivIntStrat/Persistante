/*
	groups creation
*/

private _groups_numbers = floor (3 * (count allPlayers) * (1 + dificulty));
private _groups_parameters = [markerPos "marker_0", EAST, 3];

for "_i" from 1 + count patrols_groups to _groups_numbers
do
{
	patrols_groups pushBack (_groups_parameters call BIS_fnc_spawnGroup);
};
