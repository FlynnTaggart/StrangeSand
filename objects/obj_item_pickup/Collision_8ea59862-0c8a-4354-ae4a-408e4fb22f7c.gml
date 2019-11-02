var pickup_flag = false;
var found_free_inv_slot = false;
var inv_grid = global.ds_inventory;
for(var i = 0; i < global.inv_slots; ++i){
	if(inv_grid[# 0, i] == item.none){
		inv_grid[# 0, i] = item_type;
		inv_grid[# 1, i]++;
		found_free_inv_slot = true;
		pickup_flag = true;
		break;
	}
	else if(inv_grid[# 0, i] == item_type){
		inv_grid[# 1, i]++;
		found_free_inv_slot = true;
		pickup_flag = true;
		break;
	}
}
if(pickup_flag)
	instance_destroy();