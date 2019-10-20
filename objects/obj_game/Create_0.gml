/// @description
randomise();
room_goto_next();
debug  = false;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

black_alpha = 0;

spawn_room = -1;
spawn_x = 0;
spawn_y = 0;
spawn_player_facing = -1;

do_transition = false;

enum dir {
	right = 0,
	right_up = 45,
	up = 90,
	left_up = 135,
	left = 180,
	left_down = 225,
	down = 270,
	right_down = 315,
}

global.game_width = 720;
global.game_height = 360;
display_set_gui_size(global.game_width, global.game_height);

pausee = false;
