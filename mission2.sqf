// \mission2\
currMiss = 2;
player createDiaryRecord ["Diary", ["Titre", "texte"]];
systemChat "This is mission 2";

[markerPos "mission1", 4000, 15] execVM "eni.sqf";
[markerPos "mission1", 4000] execVM "spawn.sqf";
