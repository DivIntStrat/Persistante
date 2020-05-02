/*
	groups alive test
	curent test :
		(count units _patrol) != 0
*/

patrols_groups = patrols_groups select {(count units _x) > 0};
