///@description complete_quest
///@arg quest_title(enum number)
///@arg start of next

var quest_title = argument0;
var next_page = argument1;
var ds_grid = global.ds_quests;
var inv_grid = global.ds_inventory;
var r_type = ds_grid[# 6, quest_title];
switch(r_type){
	case reward.Gold:
		global.ds_player_info[# 1, 0] += ds_grid[# 8, quest_title];
		ds_grid[# 0, quest_title] = 100;
		obj_textbox.owner_npc.start_page = next_page;
	break;
	case reward.Item:
		for(var i = 0; i < global.inv_slots; ++i){
			if(inv_grid[# 0, i] == item.none){
				inv_grid[# 0, i] = ds_grid[# 7, quest_title];
				inv_grid[# 1, i] = ds_grid[# 8, quest_title];
				ds_grid[# 0, quest_title] = 100;
				obj_textbox.owner_npc.start_page = next_page;
				break;
			}
			else if(inv_grid[# 0, i] == ds_grid[# 7, quest_title]){
				inv_grid[# 1, i] += ds_grid[# 8, quest_title];
				ds_grid[# 0, quest_title] = 100;
				obj_textbox.owner_npc.start_page = next_page;
				break;
			}
		}
	break;
}
//global.ds_quests = ds_grid;
show_debug_message("asdasdasd");