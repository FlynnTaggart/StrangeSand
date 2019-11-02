var wp_typee = wp_type;
var pickup_flag = false;
with (obj_weapon){
	var wp_grid = global.ds_weapons_slots;
	var wp_slot_is_free = false;
	switch(wp_typee){
		case item.pipe: 
			if(wp_grid[# 0, 1] == 0){
				wp_grid[# 0, 1] = wp_typee;
			}
		break;
		default: 
			for(var i = 2; i < 4; ++i){
				if(wp_grid[# 0, i] == 0){
					wp_grid[# 0, i] = wp_typee;
					wp_slot_is_free = true;
					break;
				}
			}
	}
	if(wp_slot_is_free){
		s_change_weapon(other.weapon);
		ammo[weapon] += 20;
		pickup_flag = true;
	}
	else{
		var found_free_inv_slot = false;
		var inv_grid = global.ds_inventory;
		for(var i = 0; i < global.inv_slots; ++i){
			if(inv_grid[# 0, i] == item.none){
				inv_grid[# 0, i] = wp_typee;
				found_free_inv_slot = true;
				pickup_flag = true;
				break;
			}
		}
	}
}
/*obj_player.spr_shadow = spr_character_shadow;
obj_player.spr_base = spr_base_male_2_test;
obj_player.spr_feet = spr_feet_male_boots_brown;
obj_player.spr_legs = spr_legs_male_robe_skirt_test;
obj_player.spr_torso = spr_torso_male_chest_test;
obj_player.spr_hair = spr_hair_male_mohawk_blonde;*/
if(pickup_flag)
	instance_destroy();