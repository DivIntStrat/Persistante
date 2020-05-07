/*
	Mission selecton script :
	Open strategic map with all avalaible missions.
*/
_Display = call BIS_fnc_displayMission;

private _positionMission = [];
for "_i" from 1 to 3 do {
    _positionMission pushBack (markerPos format ["mission%1",_i]);
};


private _missions = [
	[
		_positionMission select 0,
		{execVM "mission1.sqf"},
		"Recherche NW", // name
		"Recherche de caisses dans la région Nord Ouest", // short description
		"D. I. S.",
		"",
		2,
		[ player ]
	],
	[
		_positionMission select 1,
		{execVM "mission2.sqf"},
		"Recherche de caisses dans la région Nord Est",
		"This is mission two",
		"D. I. S.",
		"",
		2,
		[ player ]
	],
		[
		_positionMission select 2,
		{execVM "mission2.sqf"},
		"Recherche S",
		"Recherche de caisses dans la région de Zaros",
		"D. I. S.",
		"",
		2,
		[ player ]
	],
	[
		[14100,1000,0],
		{execVM "missionEnd.sqf"},
		"Fin de mission",
		"Confirmation de fin de mission",
		"D. I. S.",
		"",
		2,
		[ player ]
	]
];


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
