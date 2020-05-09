/*
	Mission selecton script :
	Open strategic map with all avalaible missions.
*/

_Display = call BIS_fnc_displayMission;


private _recherche_mission = {
	/*
	args :
		_mission_number
		_center
		_radius
	*/
	[ 
		_this select 1, 
		compile format ["%1 execVM 'mission\recherche.sqf';", _this],
		"Recherche de caisses", 
		format ["Recherche de caisses numéro %1", _this select 0], 
		"D. I. S.", 
		"", 
		2, 
		[ player ] 
	];
};


private _hvt_mission = {
	/*
	args :
		_mission_number
		_center
		_radius
	*/
	[ 
		_this select 1, 
		compile format ["%1 execVM 'mission\hvt.sqf';", _this],
		"HVT", 
		format ["Mission HVT numéro %1", _this select 0], 
		"D. I. S.", 
		"", 
		2, 
		[ player ] 
	];
};

private _start_with = {
	_start = "@";
	while {count ((_this select 0) select {_start in _x}) != 0}
	do
	{
		_start = _start + "@";
	};
	(_this select 0) select {(_start + (_this select 1)) in (_start + _x)}
};


private _missions = [];


if (currMiss == 0)
then
{
	private _m_num = 100;
	{
		// systemChat format ["caisses : %1", _x];
		_m_num = _m_num + 1;
		private _rad = parseNumber ((_x splitString " ") select 1);
		_missions pushBack ([_m_num, markerPos _x, _rad] call _recherche_mission);
	} forEach ([allMapMarkers, "recherche "] call _start_with);
	private _m_num = 200;
	{
		// systemChat format ["hvt : %1", _x];
		_m_num = _m_num + 1;
		private _rad = parseNumber ((_x splitString " ") select 1);
		_missions pushBack ([_m_num, markerPos _x, _rad] call _hvt_mission);
	} forEach ([allMapMarkers, "hvt "] call _start_with);
}
else
{
	_missions = [
		[
			[15000,15000,0],
			{execVM "mission\end.sqf"},
			"Fin de mission",
			"Confirmation de fin de mission",
			"D. I. S.",
			"",
			2,
			[ player ]
		]
	];
};


private _map_params = [
	_Display,
	[15000,15000,10000],
	_missions,
	[
		[
			[0,0,0],
			missionConfigFile >> "CfgORBAT" >> "DIS",
			missionConfigFile >> "CfgORBAT" >> "DIS",
			[],
			10
		]
	],
	[],
	[],
	0.5,
	false,
	0,
	true,
	"Choisissez une mission",
	true,
	"\A3\Ui_f\data\Map\GroupIcons\badge_rotate_%1_gs.paa"
];


_map_params call BIS_fnc_StrategicMapOpen;
