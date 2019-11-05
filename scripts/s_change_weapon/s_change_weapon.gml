///@description Change_Weapon
///@arg weapon_num

weapon = argument0;
var wp_map = weapons[weapon];
sprite = ds_map_find_value(wp_map,"sprite");
recoil = wp_map[? "recoil"];
recoil_push = wp_map[? "recoil_push"];
damage = wp_map[? "damage"]; 
projectile = wp_map[? "projectile"]; 
startup = wp_map[? "startup"]; 
bulletspeed = wp_map[? "bulletspeed"]; 
length = wp_map[? "length"]; 
cooldown = wp_map[? "cooldown"]; 
automatic = wp_map[? "automatic"]; 
if(weapon != 0)
	with(obj_player){
		has_gun = true;
		spr_shadow = spr_character_shadow;
		spr_base = spr_base_male_2_test;
		spr_feet = spr_feet_male_boots_brown;
		spr_legs = spr_legs_male_robe_skirt_test;
		spr_torso = spr_torso_male_chest_test;
		spr_hair = spr_hair_male_mohawk_blonde;
	}