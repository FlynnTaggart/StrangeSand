/// @description 
event_inherited();


hp = 10;
walk_spd = 1;
norm_spd = 2;
run_spd = 3;
spd = run_spd;
anim_leng = 1;
anim_spdd = 13;

x_frame = 1;
y_frame = 0;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

spr_shadow = -1;
spr_base = -1;

move_x = 0;
move_y = 0;
can_move = true;

alarm[1] = 1;

portrait_index = 0;
name = "Enemy";
voice = snd_voice1;

text = ["..."];
speakers = [id];
next_line = [0];
scripts = -1;

/* attack_type:
	0 - melee
	1 - shooting
   weapon_type:
   -1 - тело
	0 - в порядке как в папке weapons	
	1 - 
	...
*/

attack_type = 0;
weapon_type = -1;
attacking = false;
triggered = false;
trigger_rad = 600;
attacking_rate = 10;
cooldown = 1;
can_attack = true;

flash = 0;

