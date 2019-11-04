/// @description 
event_inherited();

spr_shadow = spr_character_shadow;
spr_base = spr_oldman;
spr_feet = -1;
spr_legs = -1;
spr_torso = -1;
spr_hair = -1;

portrait_index = 3;
name = "Elder";
voice = snd_voice2;
start_page = 0;
text = [
	"What do you want? You are still doing nothing! This has been going on for several years. Go to farmer and talk to him. He needs your help",
	"Ok.", 
];
speakers = [id, obj_player.id,];
next_line = [0, -1,];

scripts = [
	[s_start_quest, quests.Go_to_farm],
	-1,
];
y_frame = 1;