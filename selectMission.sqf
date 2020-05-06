_Display = call BIS_fnc_displayMission;
currMiss = 0;

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
			{if (currMiss = 0) then {execVM "mission1.sqf"} else {execVM "nope.sqf"}},
			"Recherche", // name
			"This is mission one", // short description
			"Joueurs D. I. S.",
			"",
			2,
			[ player ]
		],
		[
			_positionMission select 1,
			{if (currMiss = 0) then {execVM "mission2.sqf"} else {execVM "nope.sqf"}},
			"2nd Mission",
			"This is mission two",
			"Joueurs D. I. S.",
			"",
			2,
			[ player ]
		],
		[
			[14100,1000,2000],
			{execVM "missionEnd.sqf"},
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