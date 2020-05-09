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

// systemChat format ["This is RECHERCHE mission %1", _mission_number];

private _briefing = format ["
L’ennemi comptait se ravitailler via un avion-cargo qui a largué un nombre inconnu de caisses d’armes, de munitions, et d’équipement.
C’était sans compter sur les forts vents qui balayent Altis :
les caisses sont éparpillées sur %1 km et les ennemis les recherchent déjà activement.
Votre mission est d’empêcher que ces caisses tombent aux mains de l’ennemi. Pour cela plusieurs options s’offrent à vous.
Vous pouvez les détruire sur place, ou les récupérer et les ramener à la fob si vous ne voulez pas vous encombrer de matériel de démolition.
Vous pouvez aussi les ramener au P-A comme trophée, elles seront ensuite détruites ou redistribuées selon les besoins.
En plus des patrouilles envoyées à la recherche du matériel, la zone est hostile et complètement aux mains de l’ennemi.
Avancez prudemment et attention aux civils.
", _radius/1000];


[_center, _radius] execVM "spawn\all.sqf";
[_center, _radius] execVM "spawn\crates.sqf";


private _rec = player createDiaryRecord ["briefing", ["Recherche", _briefing]];


waitUntil {currMiss == 0};


player removeDiaryRecord ["diary", _rec];
