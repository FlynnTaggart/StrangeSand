if(is_dead){
	move_x = 0;
	move_y = 0;
	exit;
}

input_left = keyboard_check(global.key_left);
input_right = keyboard_check(global.key_right);
input_up = keyboard_check(global.key_up);
input_down = keyboard_check(global.key_down);
input_interact = keyboard_check_pressed(global.interact_key);

move_x = 0;
move_y = 0;

h_input = input_right - input_left;
v_input = input_down - input_up;

if(can_move)
	if(h_input != 0 || v_input != 0){
		dirr = point_direction(0, 0, h_input, v_input);
		move_x = lengthdir_x(spd, dirr);
		move_y = lengthdir_y(spd, dirr);
		is_moving = true;
	}

/*else
	facing = -1;*/
	

if(move_x != 0){
	var coll_h = instance_place(x + move_x, y, obj_collision);
	if(coll_h != noone && coll_h.collideable){
		repeat(abs(move_x)){
			if(!place_meeting(x + sign(move_x), y, obj_collision)){
				x += sign(move_x);
			}
			else
				break;			
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
			else
				break;
		}
		move_y = 0;
	}
}


var inst = instance_place(x, y, obj_transition);
if(inst != noone && facing == inst.player_facing_before){
	with(obj_game){
		if(!do_transition){
			if(inst.target_room == global.ds_quests[# 4, quests.Go_out_the_house]){
				s_complete_quest(quests.Go_out_the_house, -1);
				s_start_quest(quests.Talk_with_Elder, -1);
			}
			spawn_room = inst.target_room;
			spawn_x = inst.target_x;
			spawn_y = inst.target_y;
			spawn_player_facing = inst.player_facing_after;
			do_transition = true;
		}
	}
}

var inst = instance_place(x, y, obj_enter_to_loc);
if(inst != noone){
	if(inst.location == global.ds_quests[# 3, quests.Go_to_farm] && global.ds_quests[# 0, quests.Go_to_farm] == 0)
		s_complete_quest(quests.Go_to_farm, -1);
}


if(input_interact){
	if(active_textbox == noone){
		var inst = collision_rectangle(x - radius, y - radius, x + radius, y + radius, obj_parent_npc, false, false);
		if(inst != noone){
			with(inst){
				if(global.ds_quests[# 0, quests.Talk_with_Elder] == 0)
					s_complete_quest(quests.Talk_with_Elder, -1);
				other.can_move = false;
				other.active_textbox = s_crate_text_box(text, speakers, next_line, scripts, start_page, id);
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
if(has_gun){
	if(mouse_dir >= dir.right_up && mouse_dir < dir.left_up)
		facing = dir.up;
	if((mouse_dir >= dir.left_up && mouse_dir < 360) || (mouse_dir >= dir.right && mouse_dir < dir.right_up))
		facing = dir.down;
}
else{
	if(move_x != 0 && move_y == 0)
		switch(sign(move_x)){
			case 1: facing = dir.right; break; 
			case -1: facing = dir.left; break;
		}	
	else if(move_y != 0 && move_x == 0)
		switch(sign(move_y)){
			case 1: facing = dir.down; break; 
			case -1: facing = dir.up; break;
		}	
	else if((move_x > 0 && move_y > 0) || (move_x > 0 && move_y  < 0))
		facing = dir.right;
	else if((move_x < 0 && move_y > 0) || (move_x < 0 && move_y < 0))
		facing = dir.left;
	else
		facing = -1;
}
/*
if(mouse_dir >= dir.right_up && mouse_dir < dir.left_up)
	facing = dir.up;
else
	facing = dir.down;*/