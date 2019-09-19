if(!can_move) exit;

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