/// @description 
event_inherited();

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

show_debug_message("npc x_offset: " + string(x_offset) + "   npc y_offset: " + string(y_offset))

spr_shadow = spr_character_shadow;
spr_base = spr_base_male_2;
spr_feet = -1;
spr_legs = spr_legs_male_robe_skirt;
spr_torso = spr_torso_male_chest;
spr_hair = -1;

portrait_index = 6;
name = "Villager";
voice = snd_voice3;

text = ["Hi! You are still doing nothing?", "..."];
speakers = [id, obj_player.id];
next_line = [0, 0];

scripts = [
	-1,
	-1,
];
has_quest = false;