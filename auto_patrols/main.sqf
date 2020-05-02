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

patrols_end = false; // variable to start and stop patrols
patrols_groups = [];
dificulty = 0.5;

private _delay = 30; // s (time between each loops)

while {!patrols_end}
do
{
	"auto_patrols\creation.sqf" call run;
	"auto_patrols\check_alive.sqf" call run;
	"auto_patrols\patrols.sqf" call run;
	sleep _delay;
};
