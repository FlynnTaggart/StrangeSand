/// @description
if(do_transition){
	if(room != spawn_room){
		black_alpha += 0.1;
		if(black_alpha >= 1){
			room_goto(spawn_room);
		}
	}
	else{
		black_alpha -= 0.1;
		if(black_alpha <= 0)
			do_transition = false;
	}
	draw_set_alpha(black_alpha)
	draw_rectangle_color(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}

if(obj_player.is_dead){
	depth = -99;
	with(obj_player){
		depth = -100;	
	}
	black_alpha += obj_player.x_frame / 500;
	if(black_alpha >= 1){
		game_restart();
	}
	draw_set_alpha(black_alpha);
	draw_rectangle_color(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}