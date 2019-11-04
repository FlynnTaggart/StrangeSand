if (file_exists("Save.sav")){
	ini_open("Save.sav");
	global.loadded_room = ini_read_real("Room", "room", rm_start);
	var ds_enemies_killed_str = ini_read_string("Enemies_killed", "ds_enemies_killed_str", 0);
	var ds_inventory_str = ini_read_string("Inventory", "ds_inventory_str", 0);
	var ds_player_info_str = ini_read_string("Player_info", "ds_player_info_str", 0);
	var ds_quests_str = ini_read_string("Quests", "ds_quests_str", 0);
	var ds_weapons_slots_str = ini_read_string("Weapon_slots", "ds_weapons_slots_str", 0);
	ds_grid_read(global.ds_enemies_killed, ds_enemies_killed_str);
	ds_grid_read(global.ds_inventory, ds_inventory_str);
	ds_grid_read(global.ds_player_info, ds_player_info_str);
	ds_grid_read(global.ds_quests, ds_quests_str);
	ds_grid_read(global.ds_weapons_slots, ds_weapons_slots_str);
	ini_close();
}