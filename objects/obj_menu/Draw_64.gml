if(!global.pause) exit;

var gwidth = global.view_width, gheight = global.view_height;

var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);
var x_buffer = 16, y_buffer = 32; 
var start_y = gheight / 2 - ((ds_height - 1) / 2) * y_buffer, start_x = gwidth / 2;

//Draw Background
var c = c_black;
draw_set_alpha(1);
draw_rectangle_color(0, 0, gwidth, gheight, c, c, c, c, false);
draw_set_alpha(1);

//Draw Left Side
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ltx = start_x - x_buffer, lty, xo;

for(var yy = 0; yy < ds_height; ++yy){
	lty = start_y + yy * y_buffer;
	c = c_white;
	xo = 0;
	if(yy == menu_option[page]){
		c = c_orange;
		xo = -(x_buffer) / 2;
	}
	draw_text_color(ltx + xo, lty, ds_grid[# 0, yy], c, c, c, c, 1);
}

//Draw Dividing Line
draw_line(start_x, start_y, start_x, lty);

//Draw Right Side
draw_set_halign(fa_left);

var rtx = start_x + x_buffer, rty;
for(var yy = 0; yy < ds_height; ++yy){
	rty = start_y + yy * y_buffer;
	switch(ds_grid[# 1, yy]){
		case menu_element_type.shift:
			var current_val = ds_grid[# 3, yy];
			var current_val_words = ds_grid[# 4, yy];
			var left_shift = "<< ";
			var right_shift = " >>";
			var c = c_white;
			
			if(current_val == 0) left_shift = "";
			if(current_val == array_length_1d(ds_grid[# 4, yy])-1) right_shift = "";
			
			if(inputting and yy == menu_option[page]) c = c_yellow;
			draw_text_color(rtx, rty, left_shift + current_val_words[current_val] + right_shift, c, c, c, c, 1); 

		break;
		
		case menu_element_type.slider:
			c = c_white;
			var len = 64;
			var current_val = ds_grid[# 3, yy];
			draw_line_width(rtx, rty, rtx + len, rty, 2);
			
			if(inputting and yy == menu_option[page]) c = c_yellow;
			draw_circle_color(rtx + (current_val * len), rty, 4, c,c, false);
			draw_text_color(rtx + (len * 1.2), rty, string(floor(current_val*100)) + "%", c, c, c, c, 1);

		break;
		
		case menu_element_type.toggle:
			c = c_white;
			var current_val = ds_grid[# 3, yy];
			var c1, c2;
			if(inputting and yy == menu_option[page]) c = c_yellow;
			
			if(current_val == 0){ c1 = c; c2 = c_dkgray; }
			else				{ c1 = c_dkgray; c2 = c; }
			
			draw_text_color(rtx, rty, "ON", c1, c1, c1, c1, 1);
			draw_text_color(rtx + 32, rty, "OFF", c2, c2, c2, c2, 1);

		break;
		
		case menu_element_type.input:
			var current_val = ds_grid[# 3, yy];
			switch(current_val){
				case vk_up:		current_val = "UP KEY"; break;
				case vk_left:	current_val = "LEFT KEY"; break;
				case vk_right:	current_val = "RIGHT KEY"; break;
				case vk_down:	current_val = "DOWN KEY"; break;
				default:		current_val = chr(current_val); 
			}
			c = c_white;
			if(inputting and yy == menu_option[page]) c = c_yellow;
			draw_text_color(rtx, rty, current_val, c, c, c, c, 1);

		break;
	}
}

draw_set_valign(fa_top);