/// @description 
event_inherited();

spr_shadow = spr_character_shadow;
spr_base = spr_base_female_2;
spr_feet = spr_feet_female_longboots_brown;
spr_legs = spr_legs_female_pants_magneta;
spr_torso = spr_torso_female_sleeveless_red;
spr_hair = spr_hair_female_ponytail_raven;

portrait_index = 6;
name = "Olena";
voice = snd_voice1;

text = ["Hey! I am Olena, what's ypur name?", "Hi, I'm Player", "Hmm... Player, what does it mean?", "It means what it means.", "U should not ask questions"];
speakers = [id, obj_player.id, id, obj_player.id, obj_player.id];
next_line = [0, 0, 0, 0, 0]

scripts = [
	-1,
	-1,
	-1,
	-1,
	-1
];