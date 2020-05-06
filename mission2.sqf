/*
	Mission 1
*/


if (currMiss != 0) exitWith {execVM "nope.sqf"};
currMiss = 2;


player createDiaryRecord ["Diary", ["Titre", "texte"]];
systemChat format ["This is mission %1", currMiss];


