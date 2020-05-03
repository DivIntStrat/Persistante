/*
	opfor spawn and patrol main script
	create some groups
	check for each if alive
	define new patrols
*/

run = {
    _handle = player execVM _this;
    waitUntil { scriptDone _handle };
};

patrolsEnd = false; // variable to start and stop patrols
patrolsGroups = [];
dificulty = 0.5;

private _delay = 30; // s (time between each loops)

while {!patrolsEnd}
do
{
	"eni\spawn.sqf" call run;
	"eni\checkup.sqf" call run;
	"eni\patrols.sqf" call run;
	sleep _delay;
};
