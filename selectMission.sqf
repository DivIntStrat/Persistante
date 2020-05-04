_Display = call BIS_fnc_displayMission;

private _positionMission = [];
for "_i" from 1 to 2 do {
    _positionMission pushBack (markerPos format ["mission%1",_i]);
};

[
	_Display,
	[14100,900,2000],
	[
		[
			_positionMission select 0,
			{execVM "mission1.sqf"},
			"Recherche", // name
			"This is mission one", // short description
			"Joueurs D. I. S.",
			"",
			2,
			[ player ]
		],
		[
			_positionMission select 1,
			{execVM "mission2.sqf"},
			"2nd Mission",
			"This is mission two",
			"Joueurs D. I. S.",
			"",
			2,
			[ player ]
		]
	],
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
] call BIS_fnc_StrategicMapOpen;