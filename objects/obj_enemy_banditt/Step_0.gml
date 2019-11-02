if(is_dead){
	move_x = 0;
	move_y = 0;
	exit;
}

move_x = 0;
move_y = 0;
	
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
/*	var coll_h = instance_place(x + move_x, y, obj_beetle_attack);
	if(coll_h != noone && coll_h.collideable){
		if(!place_meeting(x + sign(move_x), y, obj_beetle_attack)){
			hp--;
			show_debug_message("hp2 = " + string(hp));
			mask_index = maskk;	
		}
	}*/
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
/*	var coll_h = instance_place(x, y + move_y, obj_beetle_attack);
	if(coll_h != noone && coll_h.collideable){
		if(!place_meeting(x, y + sign(move_y), obj_beetle_attack)){
			hp--;
			show_debug_message("hp2 = " + string(hp));
			mask_index = maskk;	
		}
	}*/
}

var inst = instance_place(x, y, obj_transition);
if(inst != noone && facing == inst.player_facing_before){
	with(obj_game){
		if(!do_transition){
			spawn_room = inst.target_room;
			spawn_x = inst.target_x;
			spawn_y = inst.target_y;
			spawn_player_facing = inst.player_facing_after;
			do_transition = true;
		}
	}
}

if(input_interact){
	if(active_textbox == noone){
		var inst = collision_rectangle(x - radius, y - radius, x + radius, y + radius, obj_parent_npc, false, false);
		if(inst != noone){
			with(inst){
				//other.active_textbox = s_crate_text_box(text, speakers, next_line, scripts);
				can_move = false;
				move_x = 0;
				move_y = 0;
			}
		}
	}
	else{
		if(!instance_exists(active_textbox))
			active_textbox = noone;
	}
}

if(h_input == 0 && v_input == 0)
	is_moving = false;

x += move_x;
y += move_y;

mouse_dir = point_direction(x, y, mouse_x, mouse_y);
//show_debug_message("mouse_dir: " + string(mouse_dir));

if((mouse_dir >= dir.right && mouse_dir < dir.right_up) || (mouse_dir >= dir.right_down && mouse_dir < 360))
	facing = dir.right;
if(mouse_dir >= dir.right_up && mouse_dir < dir.left_up)
	facing = dir.up;
if(mouse_dir >= dir.left_up && mouse_dir < dir.left_down)
	facing = dir.left;
if(mouse_dir >= dir.left_down && mouse_dir < dir.right_down)
	facing = dir.down;