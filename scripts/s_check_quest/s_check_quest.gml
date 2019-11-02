///@description check_quest
///@arg quest_title(enum_number)

var quest_title = argument0;
var ds_grid = global.ds_quests;
var inv_grid = global.ds_inventory;
var q_type = ds_grid[# 1, quest_title];3
switch(q_type){
	case quest_type.GATHER:
		var cnt = 0;
		for(var i = 0; i < global.inv_slots; ++i){
			if(inv_grid[# 0, i] == ds_grid[# 3, quest_title])
				cnt += inv_grid[# 1, i];
			if(cnt >= ds_grid[# 4, quest_title]){
				s_complete_quest(quest_title);
				break;
			}
		}
	break;
	case quest_type.KILL:
		
	break;
}