// \mission1\
currMiss = 1;
player createDiaryRecord ["Diary", ["Titre", "texte"]];
systemChat "This is mission 1";

[markerPos "mission1", 5000, {15 + (count (allPlayers - entities "HeadlessClient_F"))/3;}] execVM "eni.sqf";
[markerPos "mission1", 5000, {2 + (count (allPlayers - entities "HeadlessClient_F"))/5;}, heavy_vls] execVM "spawnVh.sqf";
[markerPos "mission1", 5000, {5 + (count (allPlayers - entities "HeadlessClient_F"))/2;}, light_vls] execVM "spawnVh.sqf";
[markerPos "mission1", 5000] execVM "crates.sqf";

{
	[locationPosition _x, 1000, {2 + (count (allPlayers - entities "HeadlessClient_F"))/5;}, heavy_vls] execVM "spawnVh.sqf";
	[locationPosition _x, 1000, {3 + (count (allPlayers - entities "HeadlessClient_F"))/5;}, light_vls] execVM "spawnVh.sqf";
	[locationPosition _x, 1000, {15 + (count (allPlayers - entities "HeadlessClient_F"))/3;}, true] execVM "eni.sqf";
}
forEach nearestLocations [markerPos "mission1", ["NameCityCapital"], 5000];

{
	[locationPosition _x, 500, {(count (allPlayers - entities "HeadlessClient_F"))/6;}, heavy_vls] execVM "spawnVh.sqf";
	[locationPosition _x, 500, {2 + (count (allPlayers - entities "HeadlessClient_F"))/5;}, light_vls] execVM "spawnVh.sqf";
	[locationPosition _x, 400, {10 + (count (allPlayers - entities "HeadlessClient_F"))/2;}, true] execVM "eni.sqf";
}
forEach nearestLocations [markerPos "mission1", ["Name", "NameCity"], 5000];

{
	[locationPosition _x, 300, {1 + (count (allPlayers - entities "HeadlessClient_F"))/6;}, light_vls] execVM "spawnVh.sqf";
	[locationPosition _x, 200, {8 + (count (allPlayers - entities "HeadlessClient_F"))/2;}, true] execVM "eni.sqf";
}
forEach nearestLocations [markerPos "mission1", ["NameVillage"], 5000];

{
	[locationPosition _x, 200, {1;}, light_vls] execVM "spawnVh.sqf";
	[locationPosition _x, 100, {8 + (count (allPlayers - entities "HeadlessClient_F"))/4;}, true] execVM "eni.sqf";
}
forEach nearestLocations [markerPos "mission1", ["NameLocal"], 5000]; 
