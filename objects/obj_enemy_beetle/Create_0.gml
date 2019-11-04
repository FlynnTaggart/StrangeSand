event_inherited();

show_debug_message("x_offset: " + string(x_offset) + "    y_offset: " + string(y_offset))

x_offset = 32;
y_offset = 41;


walk_spd = 1;
norm_spd = 2;
run_spd = 3;
spd = walk_spd;
anim_leng = 4;
anim_spdd = 13;

spr_shadow = spr_character_shadow;
spr_base = spr_beetle;

portrait_index = 0;
name = "Beetle";
voice = snd_voice1;

text = ["#@%*!"];
speakers = [id];
next_line = [0];

scripts = [
	-1,
];

trigger_rad = 200;
attack_type = 0;
weapon_type = -1;
attacking_rate = 30;
cooldown = 120;
facing = 0;
y_frame = 2;
hp = 2;
chekk = 0;
can_attack = false;