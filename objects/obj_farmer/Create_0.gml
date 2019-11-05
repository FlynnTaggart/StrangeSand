/// @description 
event_inherited();

spr_shadow = spr_character_shadow;
spr_base = spr_farmer;
spr_feet = -1;
spr_legs = -1;
spr_torso = -1;
spr_hair = -1;

portrait_index = 7;
name = "Farmer";
voice = snd_voice2;
start_page = 0;
text = [
	"Hello! I need your help! Take this gun and kill the those beetles.",
	"But why can not kill them by yourself?",
	"The Elder said that YOU must kill them!",
	"Well, ok.",
	"Thank you. You shoot very good. As a reward you can take this gun!",
	"Thanks for the gun. Now I should go and speak to the Elder",
];
speakers = [id, obj_player.id, id, obj_player.id, id, obj_player.id];
next_line = [0, 0, 0, -1, 0, -1];

scripts = [
	-1,
	-1,
	[s_start_quest, quests.Kill_beetles, 4],
	-1,
	[s_complete_quest, quests.Kill_beetles, -1],
	-1,
];
y_frame = 1;