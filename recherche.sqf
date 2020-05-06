/*
	all crate mission generation
	args :
		_center
		_radius
*/


private _center = _this select 0;
private _radius = _this select 1;


[_center, _radius, {15 + (count (allPlayers - entities "HeadlessClient_F"))/3;}] execVM "eni.sqf";
[_center, _radius, {2 + (count (allPlayers - entities "HeadlessClient_F"))/5;}, heavy_vls] execVM "spawnVh.sqf";
[_center, _radius, {5 + (count (allPlayers - entities "HeadlessClient_F"))/2;}, light_vls] execVM "spawnVh.sqf";
[_center, _radius] execVM "crates.sqf";

{
	[locationPosition _x, 1000, {2 + (count (allPlayers - entities "HeadlessClient_F"))/5;}, heavy_vls] execVM "spawnVh.sqf";
	[locationPosition _x, 1000, {3 + (count (allPlayers - entities "HeadlessClient_F"))/5;}, light_vls] execVM "spawnVh.sqf";
	[locationPosition _x, 1000, {15 + (count (allPlayers - entities "HeadlessClient_F"))/3;}, true] execVM "eni.sqf";
}
forEach nearestLocations [_center, ["NameCityCapital"], _radius];

{
	[locationPosition _x, 500, {(count (allPlayers - entities "HeadlessClient_F"))/6;}, heavy_vls] execVM "spawnVh.sqf";
	[locationPosition _x, 500, {2 + (count (allPlayers - entities "HeadlessClient_F"))/5;}, light_vls] execVM "spawnVh.sqf";
	[locationPosition _x, 400, {10 + (count (allPlayers - entities "HeadlessClient_F"))/2;}, true] execVM "eni.sqf";
}
forEach nearestLocations [_center, ["Name", "NameCity"], _radius];

{
	[locationPosition _x, 300, {1 + (count (allPlayers - entities "HeadlessClient_F"))/6;}, light_vls] execVM "spawnVh.sqf";
	[locationPosition _x, 200, {8 + (count (allPlayers - entities "HeadlessClient_F"))/2;}, true] execVM "eni.sqf";
}
forEach nearestLocations [_center, ["NameVillage"], _radius];

{
	[locationPosition _x, 100, {8 + (count (allPlayers - entities "HeadlessClient_F"))/4;}, true] execVM "eni.sqf";
}
forEach nearestLocations [_center, ["NameLocal"], _radius]; 
