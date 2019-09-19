/// @description 
event_inherited();

spr_shadow = spr_character_shadow;
spr_base = spr_base_female_4;
spr_feet = spr_feet_female_boots_black;
spr_legs = spr_legs_female_pants_teal;
spr_torso = spr_torso_female_sleeveless_white;
spr_hair = spr_hair_female_pixie_blonde;

portrait_index = 4;
name = "Elen";
voice = snd_voice1;

text = ["Hello, what's your name?", "Elen, I don't wanna talk with u. U have aful haircut."];
speakers = [obj_player.id, id];
next_line = [0, 0]

scripts = [
	-1,
	-1,
];
