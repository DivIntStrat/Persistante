/*
	groups creation
*/

private _groupsNumbers = floor (3 * (count allPlayers) * (1 + dificulty));
private _groupsParameters = [markerPos "marker_0", EAST, 3];

for "_i" from 1 + count patrolsGroups to _groupsNumbers
do
{
	patrolsGroups pushBack (_groupsParameters call BIS_fnc_spawnGroup);
};
