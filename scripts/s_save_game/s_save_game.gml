if(file_exists("Save.sav")) file_delete("Save.sav");

var ds_enemies_killed_str = ds_grid_write(global.ds_enemies_killed);
var ds_inventory_str = ds_grid_write(global.ds_inventory);
var ds_player_info_str = ds_grid_write(global.ds_player_info);
var ds_quests_str = ds_grid_write(global.ds_quests);
var ds_weapons_slots_str = ds_grid_write(global.ds_weapons_slots);

ini_open("Save.sav");
var saved_room = room;
ini_write_real("Room", "room", saved_room);
ini_write_string("Enemies_killed", "ds_enemies_killed_str", ds_enemies_killed_str);
ini_write_string("Inventory", "ds_inventory_str", ds_inventory_str);
ini_write_string("Player_info", "ds_player_info_str", ds_player_info_str);
ini_write_string("Quests", "ds_quests_str", ds_quests_str);
ini_write_string("Weapon_slots", "ds_weapons_slots_str", ds_weapons_slots_str);
ini_close();