// \mission1\
player createDiaryRecord ["Diary", ["Titre", "texte"]];
systemChat "This is mission 1";

[markerPos "mission1", 5000, 15] execVM "eni.sqf";

{
	[locationPosition _x, 400, 4] execVM "eni.sqf";
}
forEach nearestLocations [markerPos "mission1", ["Name", "NameCity", "NameCityCapital"], 5000];

{
	[locationPosition _x, 200, 2] execVM "eni.sqf";
}
forEach nearestLocations [markerPos "mission1", ["NameVillage"], 5000];  

{
	[locationPosition _x, 100, 1] execVM "eni.sqf";
}
forEach nearestLocations [markerPos "mission1", ["NameLocal"], 5000]; 
