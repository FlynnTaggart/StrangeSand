if(draw_daylight){
	var c = light_color;
	draw_set_alpha(darkness);
	draw_rectangle_color(0, 0, gui_width, gui_height, c, c, c, c, false);
	draw_set_alpha(1);
}
/*var c = c_yellow;
draw_set_font(fnt_smalldigits);
draw_text_color(10, 10, string(seconds), c, c, c, c, 1);
draw_text_color(10, 30, string(minutes), c, c, c, c, 1);
draw_text_color(10, 50, string(hours), c, c, c, c, 1);
draw_text_color(10, 70, string(day), c, c, c, c, 1);
draw_text_color(10, 90, string(season), c, c, c, c, 1);
draw_text_color(10, 110, string(year), c, c, c, c, 1);*/