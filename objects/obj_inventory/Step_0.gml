depth = -1000;
if(keyboard_check_pressed(ord("I"))) show_inventory = !show_inventory;

if(!show_inventory) exit;

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (cell_size + x_buffer) * scale;
var cell_ybuff = (cell_size + y_buffer) * scale;

var i_mousex = mousex - slots_x;
var i_mousey = mousey - slots_y;

var nx = i_mousex div cell_xbuff;
var ny = i_mousey div cell_ybuff;

show_debug_message("mousex: " + string(mousex) + "      mousey: " + string(mousey) + "     i_mousex: " + string(i_mousex) + "     i_mousex: " + string(i_mousey));
show_debug_message("nx: " + string(nx) + "    ny: " + string(ny));

mouse_in_inventory = true;
if(nx >= 0 && nx < inv_slots_width && ny >= 0 && ny < inv_slots_height){
	var sx = i_mousex - nx * cell_xbuff;
	var sy = i_mousey - ny * cell_ybuff;
	if(sx < cell_size * scale && sy < cell_size * scale){
		m_slot_x = nx;
		m_slot_y = ny;
	}
}
else{
	mouse_in_inventory = false;
}
mouse_in_weapon_slots = true;

if(nx >= 5 && nx < inv_slots_width && ny == 3){
	var sx = i_mousex - nx * cell_xbuff;
	var sy = i_mousey - ny * cell_ybuff;
	if(sx < cell_size * scale && sy < cell_size * scale){
		m_slot_x = nx;
		m_slot_y = ny;
	}
}
else
	mouse_in_weapon_slots = false;

mouse_in_armor_slot = true;

if(nx == 8 && ny == 0){
	var sx = i_mousex - nx * cell_xbuff;
	var sy = i_mousey - ny * cell_ybuff;
	if(sx < cell_size * scale && sy < cell_size * scale){
		m_slot_x = nx;
		m_slot_y = ny;
	}
}
else{
	mouse_in_armor_slot = false;
}
if(mouse_in_weapon_slots)
	selected_weapon_slot = -5 + nx;
if(mouse_in_armor_slot)
	mouse_in_armor_slot = true;
else
	selected_slot = min(m_slot_x + m_slot_y * inv_slots_width, inv_slots - 1);
/*if(selected_slot > inv_slots - 1){
	m_slot_x = nx_end;	
	m_slot_y = ny_end;
	selected_slot = m_slot_x + m_slot_y * inv_slots_width;
}
else{
	nx_end = nx;
	ny_end = ny;
}*/

var inv_grid = ds_inventory;
var ss_item = inv_grid[# 0, selected_slot];
var create_notification = false;

if(pickup_slot != -1){
	if(mouse_check_button_pressed(mb_left)){
		if(!mouse_in_inventory){
			if(!mouse_in_weapon_slots){
				create_notification = true;
				var p_item = inv_grid[# 0, pickup_slot];
				var inn = p_item;
				inv_grid[# 1, pickup_slot] -= 1;
				if(inv_grid[# 1, pickup_slot] <= 0){
					inv_grid[# 0, pickup_slot] = item.none;
					pickup_slot = -1;
				}
				if(p_item != item.arifle && p_item != item.revolver && p_item != item.pipe){
					var inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_item);
					with(inst){
						item_num = p_item;
						x_frame = item_num mod (spr_width / cell_size);
						y_frame = item_num div (spr_width / cell_size);
					}
				}
				else{
					switch(p_item){
						case item.arifle:
							var inst = instance_create_layer(obj_player.x + 32 * choose(1, -1), obj_player.y  + 32 * choose(1, -1), "Instances", obj_wp_arifle);
						break;
						case item.revolver:
							var inst = instance_create_layer(obj_player.x + 32 * choose(1, -1), obj_player.y  + 32 * choose(1, -1), "Instances", obj_wp_revolver);
						break;
						case item.pipe:
							var inst = instance_create_layer(obj_player.x + 32 * choose(1, -1), obj_player.y  + 32 * choose(1, -1), "Instances", obj_wp_pipe);
						break;
					}
				}
				show_debug_message("Dropped  " + string(p_item))
			}
			else{
				var p_item = inv_grid[# 0, pickup_slot];
				if(p_item != item.arifle && p_item != item.revolver && p_item != item.pipe)
					pickup_slot = -1;	
				else{
					if(nx == 5){
						if(p_item != item.pipe)
							pickup_slot = -1;
						else{
							ds_weapons_slots[# 0, nx - 5] = p_item;
							inv_grid[# 0, pickup_slot] = item.none;
							inv_grid[# 1, pickup_slot] = 0;
							pickup_slot = -1;
						}
					}
					else{
						if(p_item != item.revolver && p_item != item.arifle)
							pickup_slot = -1;
						else{
							ds_weapons_slots[# 0, nx - 5] = p_item;
							inv_grid[# 0, pickup_slot] = item.none;
							inv_grid[# 1, pickup_slot] = 0;
							pickup_slot = -1;
						}
					}
				}
			}
		}
		else if(ss_item == item.none){
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
			
			inv_grid[# 0, pickup_slot] = item.none;
			inv_grid[# 1, pickup_slot] = 0;
			
			pickup_slot = -1;
		}
		else if(ss_item == inv_grid[# 0, pickup_slot]){
			if(selected_slot != pickup_slot){
				inv_grid[# 1, selected_slot] += inv_grid[# 1, pickup_slot];
			
				inv_grid[# 0, pickup_slot] = item.none;
				inv_grid[# 1, pickup_slot] = 0;	
			}
			
			pickup_slot = -1;
		}
		else{
			var ss_number = inv_grid[# 1, selected_slot];
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
			
			inv_grid[# 0, pickup_slot] = ss_item;
			inv_grid[# 1, pickup_slot] = ss_number;
			
			//pickup_slot = -1;
		}
	}	
}

if(weapon_pickup_slot != -1){
	if(mouse_check_button_pressed(mb_left)){
		if(!mouse_in_inventory){
			if(!mouse_in_weapon_slots){
				create_notification = true;
				var p_item = inv_grid[# 0, pickup_slot];
				var inn = p_item;
				inv_grid[# 1, pickup_slot] -= 1;
				if(inv_grid[# 1, pickup_slot] <= 0){
					inv_grid[# 0, pickup_slot] = item.none;
					pickup_slot = -1;
				}
				if(p_item != item.arifle && p_item != item.revolver && p_item != item.pipe){
					var inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_item);
					with(inst){
						item_num = p_item;
						x_frame = item_num mod (spr_width / cell_size);
						y_frame = item_num div (spr_width / cell_size);
					}
				}
				else{
					switch(p_item){
						case item.arifle:
							var inst = instance_create_layer(obj_player.x + 32 * choose(1, -1), obj_player.y  + 32 * choose(1, -1), "Instances", obj_wp_arifle);
						break;
						case item.revolver:
							var inst = instance_create_layer(obj_player.x + 32 * choose(1, -1), obj_player.y  + 32 * choose(1, -1), "Instances", obj_wp_revolver);
						break;
						case item.pipe:
							var inst = instance_create_layer(obj_player.x + 32 * choose(1, -1), obj_player.y  + 32 * choose(1, -1), "Instances", obj_wp_pipe);
						break;
					}
				}
				show_debug_message("Dropped  " + string(p_item))
			}
			else{
				var p_item = inv_grid[# 0, pickup_slot];
				if(p_item != item.arifle && p_item != item.revolver && p_item != item.pipe)
					pickup_slot = -1;	
				else{
					if(nx == 5){
						if(p_item != item.pipe)
							pickup_slot = -1;
						else{
							ds_weapons_slots[# 0, nx - 5] = p_item;
							inv_grid[# 0, pickup_slot] = item.none;
							inv_grid[# 1, pickup_slot] = 0;
							pickup_slot = -1;
						}
					}
					else{
						if(p_item != item.revolver && p_item != item.arifle)
							pickup_slot = -1;
						else{
							ds_weapons_slots[# 0, nx - 5] = p_item;
							inv_grid[# 0, pickup_slot] = item.none;
							inv_grid[# 1, pickup_slot] = 0;
							pickup_slot = -1;
						}
					}
				}
			}
		}
		else if(ss_item == item.none){
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
			
			inv_grid[# 0, pickup_slot] = item.none;
			inv_grid[# 1, pickup_slot] = 0;
			
			pickup_slot = -1;
		}
		else if(ss_item == inv_grid[# 0, pickup_slot]){
			if(selected_slot != pickup_slot){
				inv_grid[# 1, selected_slot] += inv_grid[# 1, pickup_slot];
			
				inv_grid[# 0, pickup_slot] = item.none;
				inv_grid[# 1, pickup_slot] = 0;	
			}
			
			pickup_slot = -1;
		}
		else{
			var ss_number = inv_grid[# 1, selected_slot];
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
			
			inv_grid[# 0, pickup_slot] = ss_item;
			inv_grid[# 1, pickup_slot] = ss_number;
			
			//pickup_slot = -1;
		}
	}	
}

else if(ss_item != item.none){
	if(mouse_check_button_pressed(mb_middle)){
		create_notification = true;
		var inn = inv_grid[# 0, selected_slot];
		inv_grid[# 1, selected_slot] -= 1;
		if(inv_grid[# 1, selected_slot] <= 0)
			inv_grid[# 0, selected_slot] = item.none;
		show_debug_message("Dropped  " + string(ss_item))
		if(ss_item != item.arifle && ss_item != item.revolver && ss_item != item.pipe){
				var inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_item);
				with(inst){
					item_num = ss_item;
					x_frame = item_num mod (spr_width / cell_size);
					y_frame = item_num div (spr_width / cell_size);
				}
			}
			else{
				switch(ss_item){
					case item.arifle:
						var inst = instance_create_layer(obj_player.x + 32 * choose(1, -1), obj_player.y  + 32 * choose(1, -1), "Instances", obj_wp_arifle);
					break;
					case item.revolver:
						var inst = instance_create_layer(obj_player.x + 32 * choose(1, -1), obj_player.y  + 32 * choose(1, -1), "Instances", obj_wp_revolver);
					break;
					case item.pipe:
						var inst = instance_create_layer(obj_player.x + 32 * choose(1, -1), obj_player.y  + 32 * choose(1, -1), "Instances", obj_wp_pipe);
					break;
				}
			}
			show_debug_message("Dropped  " + string(ss_item))
	}
	if(mouse_check_button_pressed(mb_right)){
		if(mouse_in_weapon_slots && pickup_slot == -1)
			weapon_pickup_slot = selected_weapon_slot;
		else if(weapon_pickup_slot = -1)
			pickup_slot = selected_slot;
	}
}

if(create_notification){
	#region Create notification
	if(!instance_exists(obj_notification))
		instance_create_layer(0, 0, "Instances", obj_notification);
	with(obj_notification){
		if(!ds_exists(ds_notification, ds_type_grid)){
			ds_notification	= ds_grid_create(2, 1);
			var not_grid = ds_notification;
			not_grid[# 0, 0] = -1;
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
					not_grid[# 0, i]--;
					in_grid = true;
					break;
				}
			}
			if(!in_grid){
				ds_grid_resize(not_grid, 2, grid_height + 1);
				not_grid[# 0, grid_height] = -1;
				not_grid[# 1, grid_height] = obj_inventory.ds_items_info[# 0, inn];
			}
		}
	}
	#endregion
}
if(!mouse_in_inventory) selected_slot = -1;
show_debug_message("mouse_in_armor_slot: " + string(mouse_in_armor_slot));
show_debug_message("selected_slot: " + string(selected_slot));
show_debug_message("pickup_slot: " + string(pickup_slot));