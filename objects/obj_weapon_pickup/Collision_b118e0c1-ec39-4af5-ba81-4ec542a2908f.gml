audio_play_sound(snd_take_gun, 1, false);
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
if(pickup_flag)
	instance_destroy();