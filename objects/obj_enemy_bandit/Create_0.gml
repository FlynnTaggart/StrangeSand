event_inherited();

x_offset = 32;
y_offset = 59;

show_debug_message("x_offset: " + string(x_offset) + "    y_offset: " + string(y_offset))

walk_spd = 1;
norm_spd = 2;
run_spd = 3;
spd = walk_spd;
anim_leng = 9;
anim_spdd = 13;

spr_shadow = spr_character_shadow;
spr_base = spr_base_male_2;
spr_feet = spr_feet_male_boots_brown;
spr_legs = spr_legs_male_pants_teal;
spr_torso = spr_torso_male_shirt_maroon;
spr_hair = spr_hair_male_bedhead_brown;

portrait_index = 0;
name = "Beetle";
voice = snd_voice1;

text = ["#@%*!"];
speakers = [id];
next_line = [0];

scripts = [
	-1,
];

attack_type = 1;
weapon_type = 1;
attacking_rate = 30;
cooldown = 120;
facing = 0;
hp = 1;
attacking = false;
triggered = false;
trigger_rad = 600;
can_attack = true;

alarm[0] = 1;
facing = 0;

/*var inst = instance_create_layer(x, y - 32, "Instances", obj_weapon_enemy);
with(inst){
	owner = other.id;
	s_change_weapon(1);
}*/
is_dead = false;

var inst = instance_create_layer(x, y, "Instances", obj_weapon_enemy);
with(inst){
	owner = other.id;
}