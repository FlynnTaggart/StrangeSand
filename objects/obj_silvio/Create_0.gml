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

text = [
	"Hi! My name is Silvio Some test text more more.Some test text more more.Some test text more more.Some test text more more.Some test text more more.",
	[
		"Oh, nice, have a nice day! Some test text more more. Some test text more more.Some test text more more.", 
		"Hmm... Such insteresting name. Are u italian? Some test text more more. Some test text more more."
	], 
	"Thanks", 
	"No I'm from Spain"
];
speakers = [id, obj_player.id, id, id];
next_line = [0, [2, 3], -1, -1];

scripts = [
	[s_change_variable, id, "spr_torso", spr_torso_male_top_brown],
	[
		[s_change_variable, id, "spr_torso", spr_torso_male_shirt_maroon],
		[s_change_variable, id, "spr_torso", spr_torso_male_shirt_white],
	],
	-1,
	-1,
];
