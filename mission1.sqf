/*
	Mission 1
*/


if (currMiss != 0) exitWith {execVM "nope.sqf"};
currMiss = 1;


player createDiaryRecord ["Diary", ["Recherche", "texte"]];

systemChat format ["This is mission %1", currMiss];

[markerPos "mission1", 5000] execVM "recherche.sqf";
