/*
	spawn a HVT in the aera and some more patrols
	args :
		_center
		_radius
*/


private _center = _this select 0;
private _radius = _this select 1;

private _locations = (
	[
		["NameCityCapital", "NameCity"],
		["NameCityCapital", "NameCity", "NameVillage"],
		["NameCityCapital", "NameCity", "NameVillage", "NameLocal"]
	] call BIS_fnc_arrayShuffle) select 0;

private _loc = ((nearestLocations [_center, _locations, _radius]) call BIS_fnc_arrayShuffle) select 0;

systemChat str(_loc);

private _pos = getPos nearestBuilding ([[[locationPosition _loc, 500]],["water"]] call BIS_fnc_randomPos);
private _rad = 250;


private _index = floor random (count hvt);
private _groups_parameters = [_pos, EAST, hvt select _index];
private _hvt_grp = _groups_parameters call BIS_fnc_spawnGroup;

systemChat format ["HVT nationality : %1", hvt_nationalities select _index];

[_pos, _rad, hvt_params] execVM "spawn\spawn.sqf";
[_hvt_grp, getPos nearestBuilding (units _hvt_grp select 0)] execVM "\x\cba\addons\ai\fnc_waypointGarrison.sqf";


waitUntil {currMiss == 0};


{
	deleteVehicle _x;
} forEach units _hvt_grp;
deleteGroup _hvt_grp;
