/// @description 
event_inherited();

walk_spd = 1;
norm_spd = 2;
run_spd = 3;
spd = walk_spd;

x_frame = 1;
y_frame = 8;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

spr_shadow = -1;
spr_base = -1;
spr_feet = -1;
spr_legs = -1;
spr_torso = -1;
spr_hair = -1;

move_x = 0;
move_y = 0;
can_move = true;

alarm[1] = 1;

portrait_index = 0;
name = "Anonym";
voice = snd_voice1;

text = ["This person has nothing to say"];
speakers = [id];
next_line = [0];
scripts = -1;