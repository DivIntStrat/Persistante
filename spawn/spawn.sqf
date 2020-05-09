/*
	spawn all type of units, including civilians
	args :
		_center
		_radius
		_spawn_params
*/

private _center = _this select 0;
private _radius = _this select 1;
private _spawn_params = _this select 2;
private _create_function = {
	compile format ["%1 + %2 * (count (allPlayers - entities 'HeadlessClient_F'))/6;", _this select 0,  _this select 1];
};


// INFANTRY
[
	_center,
	_radius,
	(_spawn_params select 0) call _create_function,
	true
] execVM "spawn\inf.sqf";

// VEHICLE
[
	_center,
	_radius,
	(_spawn_params select 1) call _create_function,
	lVls,
	true
] execVM "spawn\vh.sqf";
[
	_center,
	_radius,
	(_spawn_params select 2) call _create_function,
	hVls,
	true
] execVM "spawn\vh.sqf";

// CIVILIAN
[
	_center,
	_radius,
	(_spawn_params select 3) call _create_function
] execVM "spawn\civ.sqf";
[
	_center,
	_radius,
	(_spawn_params select 4) call _create_function
] execVM "spawn\car.sqf";

// AIR
[
	_center,
	_radius,
	(_spawn_params select 5) call _create_function
] execVM "spawn\air.sqf";
