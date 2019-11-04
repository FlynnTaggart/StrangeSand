///@description start_quest
///@arg quest_title(enum number)
///@arg start of next

var quest_title = argument0;
var next_page = argument1;
var ds_grid = global.ds_quests;
var q_owner = ds_grid[# 5, quest_title];

if(quest_title == quests.Kill_beetles)
	with(obj_enemy_beetle){
		can_attack = true;
	}
global.ds_quests[# 0, quest_title] = 0;

if(q_owner != noone){
	if(next_page == -1) q_owner.has_quest = false;
	else q_owner.start_page = next_page;
}
