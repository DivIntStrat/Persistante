/*
	all ia generation
	args :
		_center
		_radius
*/


private _center = _this select 0;
private _radius = _this select 1;


[_center, _radius, aera_param] execVM "spawn\spawn.sqf";


{
	[locationPosition _x, 1000, capi_param] execVM "spawn\spawn.sqf";
}
forEach nearestLocations [_center, ["NameCityCapital"], _radius];

{
	[locationPosition _x, 400, citi_param] execVM "spawn\spawn.sqf";
}
forEach nearestLocations [_center, ["Name", "NameCity"], _radius];

{
	[locationPosition _x, 200, vill_param] execVM "spawn\spawn.sqf";
}
forEach nearestLocations [_center, ["NameVillage"], _radius];

{
	[locationPosition _x, 100, loca_param] execVM "spawn\spawn.sqf";
}
forEach nearestLocations [_center, ["NameLocal"], _radius]; 
