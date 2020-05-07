class CfgORBAT
{
	class DIS
	{
		id = 0;		// Unit ID
		idType = 0;	// Unit ID type
		side = "West"; // Unit side from CfgChainOfCommand >> Sides
		type = "HQ"; // Unit type from CfgChainOfCommand >> Types
		insignia = __EVAL(getMissionPath "dis2.paa"); // Unit insignia, displayed in ORBAT background and in tooltip
		colorInsignia[] = {1,1,1,1}; // Insignia image color (white default), can be either RGBA array, or class from CfgMarkerColors
		commander = ""; // Name of unit commander. Can be either direct name, or class from CfgWorlds >> GenericNames (random name from the list is then selected)
		commanderRank = ""; // Rank of unit commander (by default selected based on unit size)
		tags[] = {DIS}; // Group tags. When opening ORBAT viewer, user can define what tags will be accepted.
		text = "Division d'Intervention Stratégique"; // Custom text and short text, can still use some arguments when defined:
		// %1 - ID (e.g. "7th")
		// %2 - Type (e.g. "Infantry")
		// %3 - Size (e.g. "Division")
		textShort = "D. I. S.";
		texture = __EVAL(getMissionPath "dis2.paa"); // Custom texture, will replace icon set by 'type' param.
		color[] = {1,1,1,1}; // Custom color, will replace color set by 'side' param. Can be either RGBA array, or class from CfgMarkerColors (e.g. color = "ColorWEST";)
		description= ""; // A brief description of the group or unit.
		assets[] = {}; // Will display pictures of all available assets to the unit commander:
	 	// Can be an array with format {classname, [int active icons], [int greyed out icons]}, or simply a classname
		subordinates[] = {}; // Subordinates, searched on the same level as this class.
		// When 'subordinates' are missing, child classes will be used. They can have their own subs - number of tiers is not limited.
		
		class Inf
		{
			id = 0;		// Unit ID
			side = "West"; // Unit side from CfgChainOfCommand >> Sides
			type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
			text = "Section Infanterie"; // Custom text and short text, can still use some arguments when defined:
  		
			class Sang
			{
				id = 0;		// Unit ID
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Sanglier"; // Custom text and short text, can still use some arguments when defined:
  			};

			class Griz
			{
				id = 0;		// Unit ID
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
				text = "Grizzly"; // Custom text and short text, can still use some arguments when defined:
  			};
		};

		class Cav
		{
			id = 0;		// Unit ID
			side = "West"; // Unit side from CfgChainOfCommand >> Sides
			type = "Armored"; // Unit type from CfgChainOfCommand >> Types
			text = "Section Cavalerie"; // Custom text and short text, can still use some arguments when defined:

			class Croc
			{
				id = 0;		// Unit ID
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				type = "Armored"; // Unit type from CfgChainOfCommand >> Types
				text = "Crocodile"; // Custom text and short text, can still use some arguments when defined:
  			};

			class Alig
			{
				id = 0;		// Unit ID
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				type = "Armored"; // Unit type from CfgChainOfCommand >> Types
				text = "Aligator"; // Custom text and short text, can still use some arguments when defined:
  			};
  		};

		class Air
		{
			id = 0;		// Unit ID
			side = "West"; // Unit side from CfgChainOfCommand >> Sides
			type = "Unknown"; // Unit type from CfgChainOfCommand >> Types
			text = "Section Aérienne"; // Custom text and short text, can still use some arguments when defined:

			class Harf
			{
				id = 0;		// Unit ID
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				type = "Helicopter"; // Unit type from CfgChainOfCommand >> Types
				text = "Harfang"; // Custom text and short text, can still use some arguments when defined:
  			};

			class Alba
			{
				id = 0;		// Unit ID
				side = "West"; // Unit side from CfgChainOfCommand >> Sides
				type = "Fighter"; // Unit type from CfgChainOfCommand >> Types
				text = "Albatros"; // Custom text and short text, can still use some arguments when defined:
  			};
  		};
	};
};
