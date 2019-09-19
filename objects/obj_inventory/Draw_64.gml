if(!show_inventory) exit;

draw_sprite_part_ext(spr_inv_UI, 0, cell_size, 0, 
				inv_UI_width, inv_UI_height, inv_UI_x, 
				inv_UI_y, scale, scale, c_white, 1);

var info_grid = ds_player_info;
draw_set_font(fnt_text_24);
var c = c_black/*$0D41A0*/;
draw_text_ext_transformed_color(info_x, info_y, info_grid[# 0, 3] + ": " + info_grid[# 1, 3], string_height("M"), 256, t_scale, t_scale, 0, c, c, c, c, 1);
draw_set_font(fnt_smalldigits);

for(var i =  0; i < 3; ++i){
	draw_text_ext_transformed_color(info_x + 194 * scale + 33 * scale * i, info_y, string(info_grid[# 1, i]), string_height("M"), 256, t_scale, t_scale, 0, c, c, c, c, 1);
}

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
			if(i_item > 0)
				draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
			gpu_set_blendmode(bm_add);
			draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, 0.4);
			gpu_set_blendmode(bm_normal);
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
		var number = inv_grid[# 1, i];
		draw_text_ext_transformed_color(xx, yy, string(number), string_height("M"), 256, t_scale, t_scale, 0, c, c, c, c, 1);
	}
}

var iinfo_grid = ds_items_info, description = "";
i_item = inv_grid[# 0, selected_slot];

if(i_item > -1){
	description	= iinfo_grid[# 0, i_item] + ", " + iinfo_grid[# 1, i_item];
	draw_set_font(fnt_text_12);
	draw_text_ext_transformed_color(desc_x, desc_y, description, string_height("M"), (inv_UI_width - x_buffer) * scale * 2, t_scale, t_scale, 0, c, c, c, c, 1);
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