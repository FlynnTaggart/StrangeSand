var not_grid = ds_notification;
var grid_height = ds_grid_height(not_grid);
var c = c_white;

for(var i = 0; i < grid_height; ++i){
	var not_sign = "";
	if(not_grid[# 0, i] > 0){
		not_sign = "+";
	}
	draw_set_font(font);
	draw_text_ext_transformed_color(
		100, gui_height / 2 + i * str_height - grid_height * str_height, 
		not_sign + string(not_grid[# 0, i]) + " " + string(not_grid[# 1, i]), string_height("M"), 256, 
		t_scale, t_scale, 0, c, c, c, c, 1
	);
}

if(fade_away) not_alpha -= 0.1;
if(not_alpha <= 0) instance_destroy();