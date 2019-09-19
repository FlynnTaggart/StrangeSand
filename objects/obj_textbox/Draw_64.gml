draw_sprite(box, 0, box_x, box_y);

draw_sprite(frame, 0, port_x, port_y);

draw_sprite(portrait, portrait_index, port_x, port_y);

draw_sprite(frame, 1, port_x, port_y);

draw_sprite(namebox, 0, namebox_x, namebox_y);

draw_set_font(font);

draw_set_halign(fa_center); 
draw_set_valign(fa_middle);
draw_text_color(name_x, name_y, name, name_col, name_col, name_col, name_col, 1);
draw_set_halign(fa_left); 
draw_set_valign(fa_top);

var c = text_col;

if(!choice_dialogue){
	if(!pause && counter < str_len){
		counter++;
		if(counter mod 5 == 0)
			audio_play_sound(voice, 10, false);
		switch(string_char_at(text_wrapped, counter)){
			case ",": pause = true; alarm[1] = 10; break;
			case ".": 
			case "!": 
			case "?": pause = true;	alarm[1] = 20; break;
		}
	}
	c = text_col;
	var substr = string_copy(text_wrapped, 1, counter);
	draw_text_color(text_x, text_y, substr, c, c, c, c, 1);
} else{
	c = text_col;
	for(var i = 0, y_add = 0; i < text_array_len; ++i){
		if(choice == i){ 
			c = choice_col;
			draw_text_color(box_x + 4, text_y + y_add, ">", c, c, c, c, 1);
		}
		else c = text_col;
		
		draw_text_ext_color(text_x, text_y + y_add, text_array[i], text_height, text_max_width, c, c, c, c, 1);
		y_add += string_height_ext(text_array[i], text_height, text_max_width);
	}
}