if(!global.show_advice) exit;
if(!show) exit;

var ad_grid = ds_advice;
var advice_type = ad_grid[# 1, page];

var c = c_white;


draw_set_halign(fa_center);
draw_set_font(fnt_text_12);
draw_text_ext_color(gui_width / 2, y_buffer, ad_grid[# 0, page], string_height("W"), gui_width - 2 * x_buffer, c, c, c, c, 1);
draw_set_halign(fa_left);