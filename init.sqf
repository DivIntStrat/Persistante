light_vls = ["rhsgref_ins_uaz_spg9", "rhsgref_ins_uaz_dshkm", "rhsgref_ins_uaz_dshkm", "rhsgref_ins_btr70", "rhsgref_ins_btr70", "rhsgref_ins_gaz66_repair",
			"rhsgref_ins_ural_Zu23", "rhsgref_BRDM2_HQ_ins"];
heavy_vls = ["rhsgref_ins_BM21", "rhsgref_BRDM2_ins", "rhsgref_BRDM2_ins", "rhsgref_ins_btr60", "rhsgref_ins_btr60", "rhsgref_ins_bmd1", "rhsgref_ins_bmp1k",
			"rhsgref_ins_bmp1k", "rhsgref_ins_t72ba"];
inf_groups = [
	["rhsgref_ins_spotter", "rhsgref_ins_sniper"],
	["rhsgref_ins_squadleader", "rhsgref_ins_machinegunner", "rhsgref_ins_grenadier_rpg"],
	["rhsgref_ins_squadleader", "rhsgref_ins_machinegunner", "rhsgref_ins_specialist_aa"],
	["rhsgref_ins_rifleman_akm", "rhsgref_ins_militiaman_mosin", "rhsgref_ins_rifleman_aks74", "rhsgref_ins_militiaman_mosin"],
	["rhsgref_ins_squadleader", "rhsgref_ins_medic", "rhsgref_ins_grenadier", "rhsgref_ins_machinegunner", "rhsgref_ins_rifleman"],
	["rhsgref_ins_squadleader", "rhsgref_ins_machinegunner", "rhsgref_ins_grenadier_rpg", "rhsgref_ins_grenadier", "rhsgref_ins_rifleman_RPG26"],
	["rhsgref_ins_grenadier", "rhsgref_ins_rifleman", "rhsgref_ins_rifleman", "rhsgref_ins_rifleman_RPG26", "rhsgref_ins_specialist_aa", "rhsgref_ins_machinegunner"],
	["rhsgref_ins_rifleman_akm", "rhsgref_ins_rifleman", "rhsgref_ins_rifleman_aks74", "rhsgref_ins_grenadier", "rhsgref_ins_rifleman_RPG26", "rhsgref_ins_rifleman_RPG26", "rhsgref_ins_machinegunner"]
];

execVM "infos.sqf";
execVM "lights\generators.sqf";
execVM "show_fps.sqf";
