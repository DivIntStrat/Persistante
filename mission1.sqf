// \mission1\
currMiss = 1;
player createDiaryRecord ["Diary", ["Titre", "texte"]];
systemChat "This is mission 1";

[markerPos "mission1", 5000, 15] execVM "eni.sqf";
[markerPos "mission1", 5000] execVM "crates.sqf";

{
	[locationPosition _x, 400, 4, true] execVM "eni.sqf";
}
forEach nearestLocations [markerPos "mission1", ["Name", "NameCity", "NameCityCapital"], 5000];

{
	[locationPosition _x, 200, 2, true] execVM "eni.sqf";
}
forEach nearestLocations [markerPos "mission1", ["NameVillage"], 5000];  

{
	[locationPosition _x, 100, 1, true] execVM "eni.sqf";
}
forEach nearestLocations [markerPos "mission1", ["NameLocal"], 5000]; 
