_Display = call BIS_fnc_displayMission;

private _positionMission = [];
for "_i" from 0 to 1 {
    _positionMission pushBack (markerPos str("mission" +_i));
};

[
	_Display,
	[0,0,0],
	[
		[
			_positionMission select 0,
			{systemChat format ["%1 a choisi la mission ####",name ((_this # 9) # 0)]},
			"Recherche",
			"This is mission one",
			"Joueurs D. I. S.",
			"",
			2,
			[ player ]
		],
		[
			[1000,1000,0],
			{systemChat format ["%1 a choisi la mission ####",name ((_this # 9) # 0)]},
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