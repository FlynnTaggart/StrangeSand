if(!show_inventory) exit;
if(!mouse_in_inventory) selected_slot = -1;
draw_sprite_part_ext(spr_inv_UI, 0, cell_size, 0, 
				inv_UI_width + 45, inv_UI_height, inv_UI_x, 
				inv_UI_y, scale, scale, c_white, 1);

var info_grid = ds_player_info;
draw_set_font(fnt_text_24);
var c = c_black/*$0D41A0*/;
draw_text_ext_transformed_color(info_x, info_y, info_grid[# 0, 1] + ": " + info_grid[# 1, 1], string_height("M"), 256, t_scale, t_scale, 0, c, c, c, c, 1);
draw_set_font(fnt_smalldigits);

draw_text_ext_transformed_color(info_x + 194 * scale + 33 * scale * 2, info_y, string(info_grid[# 1, 0]), string_height("M"), 256, t_scale, t_scale, 0, c, c, c, c, 1);

var ix = 0, iy = 0, xx, yy, i_item, inv_grid = ds_inventory, sx, sy;

for(var i = 0; i < inv_slots; ++i){
	ix = i mod inv_slots_width;
	iy = i div inv_slots_width;
	xx = slots_x + (cell_size + x_buffer) * ix * scale;
	yy = slots_y + (cell_size + y_buffer) * iy * scale;
	
	i_item = inv_grid[# 0, i];
	sx = (i_item mod spr_inv_items_columns) * cell_size;
	sy = (i_item div spr_inv_items_columns) * cell_size;
	
	draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
	switch(i){
		case selected_slot:
			if(i == pickup_slot && !mouse_in_inventory){
				if(i_item > 0)
					draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 0.3);
			}
			else if(i_item > 0)
				draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
			if(mouse_in_inventory){
				gpu_set_blendmode(bm_add);
				draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, 0.4);
				gpu_set_blendmode(bm_normal);
			}
		break;
		
		case pickup_slot:
			if(i_item > 0)
				draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 0.3);
		break;
		
		default:
			if(i_item > 0)
				draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
		break;
	}
	
	if(i_item > 0){
		if(inv_grid[# 0, i] != item.arifle && inv_grid[# 0, i] != item.revolver && inv_grid[# 0, i] != item.pipe){
			var number = inv_grid[# 1, i];
			draw_text_ext_transformed_color(xx, yy, string(number), string_height("M"), 256, t_scale, t_scale, 0, c, c, c, c, 1);
		}
	}
}
var wp_grid = ds_weapons_slots;
if(!mouse_in_weapon_slots){
	var iinfo_grid = ds_items_info, description = "";
	i_item = inv_grid[# 0, selected_slot];
	if(i_item > -1){
		description	= iinfo_grid[# 0, i_item] + ", " + iinfo_grid[# 1, i_item];
		draw_set_font(fnt_text_12);
		draw_text_ext_transformed_color(desc_x, desc_y, description, string_height("M"), 170 * scale * 2, t_scale, t_scale, 0, c, c, c, c, 1);
	}
}
else if(mouse_in_armor_slot){
	gpu_set_blendmode(bm_add);
	draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, inv_UI_x + 293, inv_UI_y + 40, scale, scale, c_white, 0.4);
	gpu_set_blendmode(bm_normal);
}
else{
	for(var i = 0; i < 3; ++i){
		var i_item = wp_grid[# 0, i];
		sx = (i_item mod spr_inv_items_columns) * cell_size;
		sy = (i_item div spr_inv_items_columns) * cell_size;
		if(i_item > 0)
			draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, inv_UI_x + 179 + 34 * i, inv_UI_y + 158, scale, scale, c_white, 1);
		if(i == selected_weapon_slot){
			gpu_set_blendmode(bm_add);
			draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, inv_UI_x + 179 + 34 * selected_weapon_slot, inv_UI_y + 158, scale, scale, c_white, 0.4);
			gpu_set_blendmode(bm_normal);
		}
	}
}
for(var i = 0; i < 3; ++i){
		var i_item = wp_grid[# 0, i];
		sx = (i_item mod spr_inv_items_columns) * cell_size;
		sy = (i_item div spr_inv_items_columns) * cell_size;
		if(i_item > 0)
			draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, inv_UI_x + 179 + 34 * i, inv_UI_y + 158, scale, scale, c_white, 1);
	}
if(pickup_slot != -1){
	i_item = inv_grid[# 0, pickup_slot];
	sx = (i_item mod spr_inv_items_columns) * cell_size;
	sy = (i_item div spr_inv_items_columns) * cell_size;
	draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, mousex - 16 * scale, mousey - 16 * scale, scale, scale, c_white, 1);
	draw_set_font(fnt_smalldigits);
	var i_num = inv_grid[# 1, pickup_slot];
	draw_text_ext_transformed_color(mousex - 16 * scale, mousey - 16 * scale, string(i_num), string_height("M"), 256, t_scale, t_scale, 0, c, c, c, c, 1);
}
if(weapon_pickup_slot != -1){
	i_item = wp_grid[# 0, weapon_pickup_slot];
	sx = (i_item mod spr_inv_items_columns) * cell_size;
	sy = (i_item div spr_inv_items_columns) * cell_size;
	draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, mousex - 16 * scale, mousey - 16 * scale, scale, scale, c_white, 1);
}