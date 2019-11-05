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
	"Hi! My name is Silvio. I need a key, it is on the West of the village. Can you please get it?",
	[
		"Accept", 
		"Refuse",
	], 
	"Thanks", 
	"Ok, goodbye.",
	"Hi! Do you have a key?",
	[
		"Yes", 
		"No",
	],
	"Oh, nice!",
	"No! You dont have it.",
	"Ok, goodbye.",
	"Hi!"
];
speakers = [id, obj_player.id, id, id, id, id, obj_player.id, id, id, id];
next_line = [0, [2, 3], -1, -1, 0, [6, 8], -1, -1, -1, -1,];

scripts = [
	-1,
	[
		[s_start_quest, quests.Get_the_key, 4],
		-1,
	],
	-1,
	-1,
	-1,
	[
		[s_check_quest, quests.Get_the_key, 6, 7],
		-1,
	],
	[s_complete_quest, quests.Get_the_key, 9],
	-1,
	-1,
	-1,
];
