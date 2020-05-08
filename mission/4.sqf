/*
	Mission 3 recherche S
*/

if (currMiss != 0) exitWith {execVM "mission\error.sqf"};
currMiss = 4;
briefMiss3 = player createDiaryRecord ["briefing", ["HVT", "Trouvez le chef enemi et tuez le !"]];

//[markerPos "mission4", 5000] execVM "spawn\all.sqf";
[markerPos "mission4", 3000] execVM "spawn\hvt.sqf";
