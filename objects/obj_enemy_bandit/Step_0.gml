if(!can_move) exit;

if(triggered && instance_exists(obj_player)){
	var hh_input = sign(obj_player.x - x);
	var vv_input = sign(obj_player.y - y);
	if(hh_input != 0 || vv_input != 0){
		var dirr = point_direction(0, 0, h_input, v_input);
		move_x = lengthdir_x(spd, dirr);
		move_y = lengthdir_y(spd, dirr);
		facing = dirr;
	}
	else
		facing = -1;
}

if(move_x != 0){
	var coll_h = instance_place(x + move_x, y, obj_collision);
	if(coll_h != noone && coll_h.collideable){
		repeat(abs(move_x)){
			if(!place_meeting(x + sign(move_x), y, obj_collision)){
				x += sign(move_x);
			}
			else{
				break;			
			}
		}
		move_x = 0;
	}
}

if(move_y != 0){
	var coll_v = instance_place(x, y + move_y, obj_collision);
	if(coll_v != noone && coll_v.collideable){
		repeat(abs(move_y)){
			if(!place_meeting(x, y + sign(move_y), obj_collision)){
				y += sign(move_y);
			}
			else{
				break;			
			}
		}
		move_y = 0;
	}
}

x += move_x;
y += move_y;

if(obj_player.is_dead) exit;
if(!triggered) exit;

if(can_attack && point_distance(obj_player.x, obj_player.y, x, y) < 300){
	show_debug_message("!!!");
	attacking = true;
	alarm[2] = attacking_rate;
	alarm[3] = cooldown;
	can_attack = false;
	can_move = false;
}