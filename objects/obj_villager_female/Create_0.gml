/// @description 
event_inherited();

spr_shadow = spr_character_shadow;
spr_base = spr_base_female_2;
spr_feet = -1;
spr_legs = -1;
spr_torso = spr_torso_female_robe_tunic;
spr_hair = -1;

portrait_index = 6;
name = "Villager";
voice = snd_voice1;

text = ["Hi! You are still doing nothing?", "..."];
speakers = [id, obj_player.id];
next_line = [0, 0];

scripts = [
	-1,
	-1,
];
has_quest = false;