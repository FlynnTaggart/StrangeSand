var ds_grid = global.ds_quests;
var c = c_white;

for(var i = 0; i < quest_count; ++i){
	var status = ds_grid[# 0, i];
	if(status != -1 && status != 100){
		var arr = ds_grid[# 9, i];
		var str = arr[status];
		show_debug_message(str);
		draw_text_ext_color(x_buffer, y_buffer * (i + 1), str, string_height("W"), gui_width - 2 * x_buffer, c, c, c, c, 1);
		draw_text(x_buffer, y_buffer * (i + 1), str);
	}
}