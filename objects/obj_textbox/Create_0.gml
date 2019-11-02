box = spr_textbox;
frame = spr_portrait_frame;
portrait = spr_portraits;
namebox = spr_namebox;

box_width = sprite_get_width(box);
box_height = sprite_get_height(box);
port_width = sprite_get_width(portrait);
port_height = sprite_get_height(portrait);
namebox_width = sprite_get_width(namebox);
namebox_height = sprite_get_height(namebox);
/*
show_debug_message(string(box_width));
show_debug_message(string(box_height));
show_debug_message(string(port_width));
show_debug_message(string(port_height));
show_debug_message(string(namebox_width));
show_debug_message(string(namebox_height));
*/
port_x = (global.game_width - box_width - port_width) * 0.5;
port_y = global.game_height * 0.98 - port_height;
box_x = port_x + port_width;
box_y = port_y;

namebox_x = port_x;
namebox_y = box_y - namebox_height;

x_buffer = 12;
y_buffer = 8;
text_x = box_x + x_buffer;
text_y = box_y + y_buffer;
name_x = namebox_x + (namebox_width * 0.5);
name_y = namebox_y + (namebox_height * 0.5);
text_max_width = box_width - x_buffer * 2;
show_debug_message("text_max_width = " + string(text_max_width));
text_height = string_height("W") * 2/3;

counter = 0;
pause = false;

portrait_index = 0;
text[0] = "";
name = "";
voice = snd_voice1;

text_col = c_black;
name_col = c_black;
font = fnt_text_12;

choice = 0;
choice_col = c_white;