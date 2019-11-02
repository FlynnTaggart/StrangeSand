/// @description 
event_inherited();

spr_shadow = spr_character_shadow;
spr_base = spr_base_male_5;
spr_feet = spr_feet_male_boots_brown;
spr_legs = spr_legs_male_pants_green;
spr_torso = spr_torso_male_shirt_white;
spr_hair = spr_hair_male_messy_raven;

portrait_index = 3;
name = "Silvio";
voice = snd_voice2;
start_page = 0;
text = [
	"Hi! My name is Silvio Some test text more more.Some testtext more more.Some testtext more more.Some test text more more.Some test text more more.",
	[
		"Take a quest with beetles", 
		"Check quest with beetles",
	], 
	"Thanks", 
	"Nice u have killed them",
	"U didn't killed them",
	"Do u have quest for me",
	[
		"Take a quest with key", 
		"Check quest with key",
	], 
	"Thanks", 
	"Nice u have a key",
	"U didn't get a key",
];
speakers = [id, obj_player.id, id, id, id, id, obj_player.id, id, id, id];
next_line = [0, [2, 3], -1, -1, -1, 0, [7, 8], -1, -1, -1,];

scripts = [
	-1,
	[
		[s_start_quest, quests.Kill_beetles],
		[s_check_quest, quests.Kill_beetles, 3, 4],
	],
	-1,
	[s_complete_quest, quests.Kill_beetles, 5],
	-1,
	
	-1,
	[
		[s_start_quest, quests.Get_the_key],
		[s_check_quest, quests.Get_the_key, 8, 9],
	],
	-1,
	[s_complete_quest, quests.Get_the_key, 5],
	-1,
];
