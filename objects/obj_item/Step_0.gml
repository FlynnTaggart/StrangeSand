if(drop_move){
	x = lerp(x, goal_x, 0.1);	
	y = lerp(y, goal_y, 0.1);
	if(abs(x - goal_x) < 1 && abs(y - goal_y) < 1){
		drop_move = false;
	}
}
else{
	if(!keyboard_check(ord("O"))) exit;
	var px = obj_player.x;
	var py = obj_player.y;
	var r = 32;
//-----point_in_rectangle(px, py, x - r, y - r, x + r, y + r)-------------
	if(point_in_circle(px, py, x, y, r)/*-----------------*/){
		if(!point_in_circle(px, py, x, y, r / 16)/*-----------------*/){
			x = lerp(x, px, 0.1);	
			y = lerp(y, py, 0.1);
		}
		else{
			var in = item_num;
			with(obj_inventory){
				var inv_grid = ds_inventory;
				var picked_up = false;
				for(var i = 0; i < inv_slots; ++i){
					if(inv_grid[# 0, i] == in){
						inv_grid[# 1, i]++;
						picked_up = true;
						break;
					}
				}
				if(!picked_up){
					for(var i = 0; i < inv_slots; ++i){
						if(inv_grid[# 0, i] == item.none){
							inv_grid[# 0, i] = in;
							inv_grid[# 1, i]++;
							picked_up = true;
							break;
						}
					}
				}
				if(picked_up){
					#region Create notification
					if(!instance_exists(obj_notification))
						instance_create_layer(0, 0, "Instances", obj_notification);
					var inn = other.item_num;
					with(obj_notification){
						if(!ds_exists(ds_notification, ds_type_grid)){
							ds_notification	= ds_grid_create(2, 1);
							var not_grid = ds_notification;
							not_grid[# 0, 0] = 1;
							not_grid[# 1, 0] = obj_inventory.ds_items_info[# 0, inn];
						}
						else{
							event_perform(ev_other, ev_user0);
							var not_grid = ds_notification;
							var grid_height = ds_grid_height(not_grid);
							var name = obj_inventory.ds_items_info[# 0, inn];
							var in_grid = false;
							for(var i = 0; i < grid_height; ++i){
								if(name == not_grid[# 1, i]){
									not_grid[# 0, i]++;
									in_grid = true;
									break;
								}
							}
							if(!in_grid){
								ds_grid_resize(not_grid, 2, grid_height + 1);
								not_grid[# 0, grid_height] = 1;
								not_grid[# 1, grid_height] = obj_inventory.ds_items_info[# 0, inn];
							}
						}
					}
					#endregion
					instance_destroy(other);
					show_debug_message("Picked  " + string(in));
				}
			}
		}
	}
}