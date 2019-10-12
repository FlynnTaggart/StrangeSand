draw_sprite_ext(sprite_index, image_index, x, y + 7, 1, 0.6, image_angle, c_black, 0.6);
var hover = ystart + sin(get_timer()/200000) * 3;
draw_sprite(sprite_index, image_index, x, hover);