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

inf_can_spawn = true;


private _refresh_time = 10; // s (sleep time)
private _max_inf = 150; // max number of units

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
