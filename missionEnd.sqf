/*
	stops any mission active and delete any stuff left on site
*/

if (currMiss == 1) 
then 
{
	player removeDiaryRecord ["briefing", "briefMiss1"];
}
else
{
	if (currMiss == 2) 
	then 
	{
		player removeDiaryRecord ["briefing", "briefMiss2"];
	}
	else
	{
		if (currMiss == 3) 
		then 
		{
			player removeDiaryRecord ["briefing", "briefMiss3"];
		}
		else 
		{
			if (currMiss == 0)
			exitWith {};
		};
	};
};

currMiss = 0;
