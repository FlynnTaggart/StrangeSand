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