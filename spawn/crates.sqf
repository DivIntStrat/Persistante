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

private _all_crates = [];


for "_i" from 1 to 10 do {
	private _pos = [[[_position, _radius]],["water"]] call BIS_fnc_randomPos;
	_all_crates pushBack (createVehicle ["rhs_weapons_crate_ak", _pos]);
};


private _cities = (nearestLocations [_position, ["NameCity", "NameCityCapital", "NameVillage"], _radius]) call BIS_fnc_arrayShuffle;
private _numbers_selected = 1 + floor random 6;
_cities resize _numbers_selected;

{
	private _center = locationPosition _x;
	private _rdm = floor random 6;
	private _pos_list = [];
	for "_i" from 1 to _rdm do
	{
		private _pos = getPos nearestBuilding ([[[_center, 200]],["water"]] call BIS_fnc_randomPos);
		while {_pos in _pos_list}
		do 
		{
			_pos = getPos nearestBuilding ([[[_center, 200]],["water"]] call BIS_fnc_randomPos);
		};
		_all_crates pushBack (createVehicle ["IG_supplyCrate_F", _pos]);
		_pos_list pushBack _pos;
	};
} forEach _cities;


waitUntil { currMiss == 0 };


{
	deleteVehicle _x;
} forEach _all_crates;
