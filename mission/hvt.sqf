/*
	crate mission generation
	args :
		_mission_number
		_center
		_radius
*/

if (currMiss != 0) exitWith {execVM "mission\error.sqf"};


private _mission_number = _this select 0;
private _center = _this select 1;
private _radius = _this select 2;


currMiss = _mission_number;

// systemChat format ["This is HVT mission %1", _mission_number];

private _briefing = format ["Trouvez le chef enemi dans la zone de %1 km et tuez le !", _radius/1000];


[_center, _radius] execVM "spawn\all.sqf";
[_center, _radius] execVM "spawn\hvt.sqf";


private _rec = player createDiaryRecord ["briefing", ["HVT", _briefing]];


waitUntil {currMiss == 0};


player removeDiaryRecord ["diary", _rec];
