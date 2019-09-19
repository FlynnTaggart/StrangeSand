/// @description 
move_x = 0;
move_y = 0;

if(can_move && !triggered){
	var idle = choose(0, 1);
	h_input = choose(-1, 1);
	v_input = choose(-1, 0, 1);
	if(!idle){

		if(h_input != 0 || v_input != 0){
			dirr = point_direction(0, 0, h_input, v_input);
			move_x = lengthdir_x(spd, dirr);
			move_y = lengthdir_y(spd, dirr);
			facing = dirr;
		}
		else
			facing = -1;
	}
}
var player_dead = obj_player.is_dead;
if(player_dead) { triggered = false exit;}
if(point_distance(obj_player.x, obj_player.y, x, y) < trigger_rad){
	triggered = true;
}
else{
	triggered = false;	
}

show_debug_message("move_x = " + string(move_x));
show_debug_message("move_y = " + string(move_y));

alarm[1] = random_range(2.5, 4) * room_speed;