if(is_dead){
	move_x = 0;
	move_y = 0;
	exit;
}


input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_up = keyboard_check(vk_up);
input_down = keyboard_check(vk_down);
input_walk = keyboard_check(vk_control);
input_run = keyboard_check(vk_shift);
input_interact = keyboard_check_pressed(ord("E"));

if(input_walk or input_run){
	spd = abs(input_walk * walk_spd - input_run * run_spd);
}
else{
	spd = norm_spd;	
}

move_x = 0;
move_y = 0;

h_input = input_right - input_left;
v_input = input_down - input_up;


if(h_input != 0 || v_input != 0){
	dirr = point_direction(0, 0, h_input, v_input);
	move_x = lengthdir_x(spd, dirr);
	move_y = lengthdir_y(spd, dirr);
	facing = dirr;
}
else
	facing = -1;
	
	
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
				other.active_textbox = s_crate_text_box(text, speakers, next_line, scripts);
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

x += move_x;
y += move_y;