lVls = [
	["rhsgref_ins_uaz_spg9"], ["rhsgref_ins_uaz_dshkm"], ["rhsgref_ins_uaz_dshkm"], ["rhsgref_ins_btr70"],
	["rhsgref_ins_btr70"], ["rhsgref_ins_gaz66_repair"], ["rhsgref_ins_ural_Zu23"], ["rhsgref_BRDM2_HQ_ins"]
];
hVls = [
	["rhsgref_ins_BM21"], ["rhsgref_BRDM2_ins"], ["rhsgref_BRDM2_ins"], ["rhsgref_ins_btr60"], ["rhsgref_ins_btr60"],
	["rhsgref_ins_bmd1"], ["rhsgref_ins_bmp1k"], ["rhsgref_ins_bmp1k"], ["rhsgref_ins_t72ba"]
];
aVls = [ ["RHS_Mi8mt_vvsc"], ["RHS_Mi8mt_vvsc"], ["RHS_Mi8mt_vvsc"], ["RHS_Mi8mtv3_Cargo_vvs"], ["RHS_Su25SM_vvsc"] ];
inf = [
	["rhsgref_ins_spotter", "rhsgref_ins_sniper"],
	["rhsgref_ins_squadleader", "rhsgref_ins_machinegunner", "rhsgref_ins_grenadier_rpg"],
	["rhsgref_ins_squadleader", "rhsgref_ins_machinegunner", "rhsgref_ins_specialist_aa"],
	["rhsgref_ins_rifleman_akm", "rhsgref_ins_militiaman_mosin", "rhsgref_ins_rifleman_aks74", "rhsgref_ins_militiaman_mosin"],
	["rhsgref_ins_squadleader", "rhsgref_ins_medic", "rhsgref_ins_grenadier", "rhsgref_ins_machinegunner", "rhsgref_ins_rifleman"],
	["rhsgref_ins_squadleader", "rhsgref_ins_machinegunner", "rhsgref_ins_grenadier_rpg", "rhsgref_ins_grenadier", "rhsgref_ins_rifleman_RPG26"],
	["rhsgref_ins_grenadier", "rhsgref_ins_rifleman", "rhsgref_ins_rifleman", "rhsgref_ins_rifleman_RPG26", "rhsgref_ins_specialist_aa", "rhsgref_ins_machinegunner"],
	["rhsgref_ins_rifleman_akm", "rhsgref_ins_rifleman", "rhsgref_ins_rifleman_aks74", "rhsgref_ins_grenadier", "rhsgref_ins_rifleman_RPG26", "rhsgref_ins_rifleman_RPG26", "rhsgref_ins_machinegunner"]
];
civ = [
	["C_man_polo_1_F"],	["C_man_polo_2_F"], ["C_man_polo_3_F"], ["C_man_polo_4_F"], ["C_man_polo_5_F"], ["C_man_polo_6_F"], ["C_man_p_beggar_F"], ["C_man_shorts_1_F"],
	["C_Man_Fisherman_01_F"], ["C_man_hunter_1_F"], ["C_journalist_F"], ["C_man_shorts_3_F"], ["C_man_polo_1_F_afro"], ["C_man_polo_2_F_afro"], ["C_man_polo_3_F_afro"],
	["C_man_polo_4_F_afro"], ["C_man_polo_5_F_afro"], ["C_man_shorts_2_F_afro"], ["C_man_p_fugitive_F_afro"], ["C_man_polo_1_F_asia"], ["C_man_polo_2_F_asia"],
	["C_man_polo_3_F_asia"], ["C_man_polo_4_F_asia"], ["C_man_polo_5_F_asia"], ["C_man_polo_5_F_asia"]
];
car = [
	["C_Van_01_fuel_F"], ["C_Hatchback_01_F"], ["C_Offroad_01_covered_F"], ["C_Van_01_transport_F"], ["C_Van_01_box_F"],
	["C_IDAP_Offroad_02_unarmed_F"], ["C_IDAP_Van_02_medevac_F"], ["C_IDAP_Truck_02_F"]
];


hvt = [  ["O_officer_F"], ["rhs_vdv_officer_armored"], ["rhssaf_army_o_m10_digital_officer"], ["O_GEN_Commander_F"], ["O_G_officer_F"]  ];
hvt_nationalities = [  "CSAT", "Russe", "Serbe", "Gendarme", "Mafieu"  ];

rocks = [
	"Land_Small_Stone_01_F", "Land_Small_Stone_02_F", "Land_Stone_big_F", "Land_Stone_medium_F", "Land_Stone_small_F", "Land_StoneSharp_big", "Land_StoneSharp_medium",
	"Land_StoneSharp_small", "Land_StoneSharp_wall", "Land_BluntRock_apart", "Land_BluntRock_monolith", "Land_BluntRock_spike", "Land_BluntRock_wallH", "Land_BluntRock_wallV",
	"Land_BluntStone_01", "Land_BluntStone_02", "Land_BluntStone_03", "Land_BluntStones_erosion", "Land_SharpRock_apart", "Land_SharpRock_monolith", "Land_SharpRock_spike",
	"Land_SharpRock_wallH", "Land_SharpRock_wallV", "Land_SharpStone_01", "Land_SharpStone_02", "Land_SharpStone_03", "Land_SharpStones_erosion", "Land_Stone_big_W",
	"Land_Stone_medium_W", "Land_Stone_small_W", "Land_StoneSharp_big_W", "Land_StoneSharp_medium_W", "Land_StoneSharp_small_W", "Land_StoneSharp_Wall_W", "Land_W_sharpRock_apart",
	"Land_W_sharpRock_monolith", "Land_W_sharpRock_spike", "Land_W_sharpRock_wallH", "Land_W_sharpRock_wallV", "Land_W_sharpStone_01", "Land_W_sharpStone_02", "Land_W_sharpStone_03",
	"Land_W_sharpStones_erosion"
];

inf_can_spawn = true;
// SPAWN PARAMS
//                PATROLS           LVL             HVL             CIV             CAR
aera_param = [  [ 15 ,  3 ],    [  5 ,  2 ],    [  5 ,  2 ],    [  0 ,  0 ],    [  5 ,  0 ]  ];
capi_param = [  [ 25 ,  3 ],    [  4 ,  2 ],    [  3 ,  1 ],    [ 11 ,  0 ],    [  4 ,  0 ]  ];
citi_param = [  [ 20 ,  4 ],    [  3 ,  1 ],    [  1 ,  1 ],    [  7 ,  0 ],    [  2 ,  0 ]  ];
vill_param = [  [ 10 ,  4 ],    [  3 ,  2 ],    [  0 ,  1 ],    [  5 ,  0 ],    [  0 ,  0 ]  ];
loca_param = [  [  5 ,  2 ],    [  0 ,  1 ],    [  0 ,  0 ],    [  3 ,  0 ],    [  0 ,  0 ]  ];
hvt_params = [  [  5 ,  2 ],    [  0 ,  1 ],    [  0 ,  0 ],    [  0 ,  0 ],    [  0 ,  0 ]  ];



private _refresh_time = 10; // s (sleep time)
private _max_inf = 50; // max number of units

private _count_inf = {east countSide (allUnits select {vehicle _x == _x})};


while {true}
do
{
	private _current_inf = call _count_inf;

	// systemChat format ["Inf : %1", _current_inf];

	if (_current_inf > _max_inf )
	then
	{
		inf_can_spawn = false;
	}
	else
	{
		inf_can_spawn = true;
	};
	sleep _refresh_time;
};
