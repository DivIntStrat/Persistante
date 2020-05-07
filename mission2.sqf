/*
	Mission 2 Recherche NE
*/

if (currMiss != 0) exitWith {execVM "nope.sqf"};
currMiss = 2;
briefMiss2 = player createDiaryRecord ["briefing", ["Recherche", "L’ennemi a été ravitaillé par un avion-cargo qui a largué un nombre inconnu de caisses d’armes, de munitions, et d’équipement. C’était sans compter sur les forts vents qui balayent Altis : les caisses sont éparpillées sur toute la zone entre le Cap Strigla et Ioannina et les ennemis les recherchent déjà activement. <br/> Votre mission est d’empêcher que ces caisses tombent aux mains de l’ennemi. Pour cela plusieurs options s’offrent à vous. Vous pouvez les détruire sur place, ou les récupérer et les ramener à la fob si vous ne voulez pas vous encombrer de matériel de démolition. Vous pouvez aussi les ramener au P-A comme trophée, elles seront ensuite détruites ou redistribuées selon les besoins. <br/> En plus des patrouilles envoyées à la recherche du matériel, la zone est hostile et complètement aux mains de l’ennemi. Avancez prudemment et attention aux civils. "]];

//systemChat format ["This is mission %1", currMiss];
[markerPos "mission2", 4000] execVM "recherche.sqf";
