/*
	create crates for players to find
	some randomly in the zone
	some already found by the ennemi and store in a town
	args :
		_position
		_radius
*/

private _position = _this select 0;
private _radius = _this select 1;

//private _markerArray = ["marker_0","marker_1","marker_2","marker_3","marker_4","marker_5"];
//private _randnumb = floor random 5;


//for "_i" from 1 to 10 do {
//	private _loc = [[[MarkerPos "marker_2", 5000]],["water"]] call BIS_fnc_randomPos;
//	createVehicle ["rhs_weapons_crate_ak", _loc];
//};

private _loc = nearestLocations [markerPos "marker_2", ["NameCity", "NameCityCapital", "NameVillage"], 5000];
private _pos = _loc call BIS_fnc_arrayShuffle;
private _poz = [[[_pos select 0, 100]],["water"]] call BIS_fnc_randomPos;
private _rdm = floor random 6;

for "_i" from 1 to _rdm do {
createVehicle ["IG_supplyCrate_F", _poz];
};
//"rhs_weapons_crate_ak" createVehicle _loc; 
//[_loc, west, 5] call BIS_fnc_spawnGroup;


//private _positions = [0, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13] apply {getMarkerPos ("marker_" + str(_x))};

//_positions = _positions call BIS_fnc_arrayShuffle;
//_positions resize 6;
//{"rhs_weapons_crate_ak" createVehicle _x} forEach _positions;
