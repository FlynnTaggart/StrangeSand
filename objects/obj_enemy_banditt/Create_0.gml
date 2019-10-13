event_inherited();

is_dead = false;

walk_spd = 1;
norm_spd = 2;
run_spd = 3;
spd = norm_spd;
hp = 5;
is_moving = false;

x_frame = 1;
y_frame = 8;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

spr_shadow = spr_character_shadow;
spr_base = spr_base_male_2;
spr_feet = spr_feet_male_boots_brown;
spr_legs = spr_legs_male_pants_teal;
spr_torso = spr_torso_male_shirt_maroon;
spr_hair = spr_hair_male_bedhead_brown;

facing = 0;

portrait_index = 7;
name = "Player";
voice = snd_voice3;

radius = 16;

active_textbox = noone;

var layer_id = layer_get_id("Instances");

show_debug_message("Layer_id = " + string(layer_id));