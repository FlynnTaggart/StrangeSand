///@description check_quest
///@arg quest_title(enum number)
///@arg res_1(next page)
///@arg res_2(next page)

var quest_title = argument0;
var res_1 = argument1;
var res_2 = argument2;
var ds_grid = global.ds_quests;
var inv_grid = global.ds_inventory;
var enemy_grid = global.ds_enemies_killed;
var q_type = ds_grid[# 1, quest_title];
var is_complete = false;
switch(q_type){
	case quest_type.GATHER:
		var cnt = 0;
		for(var i = 0; i < global.inv_slots; ++i){
			if(inv_grid[# 0, i] == ds_grid[# 3, quest_title])
				cnt += inv_grid[# 1, i];
			if(cnt >= ds_grid[# 4, quest_title]){
				var next_l_arr = obj_textbox.next_line[obj_textbox.page];
				next_l_arr[obj_textbox.choice] = res_1;
				obj_textbox.next_line[obj_textbox.page] = next_l_arr;
				is_complete = true;
				break;
			}
		}
		if(!is_complete){
			var next_l_arr = obj_textbox.next_line[obj_textbox.page];
			next_l_arr[obj_textbox.choice] = res_2;
			obj_textbox.next_line[obj_textbox.page] = next_l_arr;
		}
	break;
	case quest_type.KILL:
		var enemy_type = ds_grid[# 3, quest_title];
		if(enemy_grid[# 1, enemy_type] >= ds_grid[# 4, quest_title]){
			var next_l_arr = obj_textbox.next_line[obj_textbox.page];
			next_l_arr[obj_textbox.choice] = res_1;
			obj_textbox.next_line[obj_textbox.page] = next_l_arr;
		}
		else{
			var next_l_arr = obj_textbox.next_line[obj_textbox.page];
			next_l_arr[obj_textbox.choice] = res_2;
			obj_textbox.next_line[obj_textbox.page] = next_l_arr;	
		}
	break;
}