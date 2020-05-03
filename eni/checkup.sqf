/*
	groups alive test
	curent test :
		(count units _patrol) != 0
*/

patrolsGroups = patrolsGroups select {(count units _x) > 0};
