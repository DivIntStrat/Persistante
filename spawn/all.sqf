/*
	all ia generation
	args :
		_center
		_radius
*/


private _center = _this select 0;
private _radius = _this select 1;


[_center, _radius, {15 + (count (allPlayers - entities "HeadlessClient_F"))/3;}] execVM "spawn\inf.sqf";
[_center, _radius, {2 + (count (allPlayers - entities "HeadlessClient_F"))/5;}, hVls] execVM "spawn\vh.sqf";
[_center, _radius, {5 + (count (allPlayers - entities "HeadlessClient_F"))/2;}, lVls] execVM "spawn\vh.sqf";


{
	[locationPosition _x, 1000, {2 + (count (allPlayers - entities "HeadlessClient_F"))/5;}, hVls, true] execVM "spawn\vh.sqf";
	[locationPosition _x, 1000, {3 + (count (allPlayers - entities "HeadlessClient_F"))/5;}, lVls, true] execVM "spawn\vh.sqf";
	[locationPosition _x, 1000, {15 + (count (allPlayers - entities "HeadlessClient_F"))/3;}, true] execVM "spawn\inf.sqf";
	[locationPosition _x, 1000, {15 + (count (allPlayers - entities "HeadlessClient_F"))/3;}] execVM "spawn\civ.sqf";
}
forEach nearestLocations [_center, ["NameCityCapital"], _radius];

{
	[locationPosition _x, 400, {(count (allPlayers - entities "HeadlessClient_F"))/6;}, hVls, true] execVM "spawn\vh.sqf";
	[locationPosition _x, 400, {2 + (count (allPlayers - entities "HeadlessClient_F"))/5;}, lVls, true] execVM "spawn\vh.sqf";
	[locationPosition _x, 400, {10 + (count (allPlayers - entities "HeadlessClient_F"))/2;}, true] execVM "spawn\inf.sqf";
	[locationPosition _x, 400, {15 + (count (allPlayers - entities "HeadlessClient_F"))/3;}] execVM "spawn\civ.sqf";
}
forEach nearestLocations [_center, ["Name", "NameCity"], _radius];

{
	[locationPosition _x, 200, {1 + (count (allPlayers - entities "HeadlessClient_F"))/6;}, lVls, true] execVM "spawn\vh.sqf";
	[locationPosition _x, 200, {8 + (count (allPlayers - entities "HeadlessClient_F"))/2;}, true] execVM "spawn\inf.sqf";
	[locationPosition _x, 200, {15 + (count (allPlayers - entities "HeadlessClient_F"))/3;}] execVM "spawn\civ.sqf";
}
forEach nearestLocations [_center, ["NameVillage"], _radius];

{
	[locationPosition _x, 100, {8 + (count (allPlayers - entities "HeadlessClient_F"))/4;}, true] execVM "spawn\inf.sqf";
	[locationPosition _x, 100, {15 + (count (allPlayers - entities "HeadlessClient_F"))/3;}] execVM "spawn\civ.sqf";
}
forEach nearestLocations [_center, ["NameLocal"], _radius]; 
