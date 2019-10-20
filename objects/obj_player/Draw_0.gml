var anim_len = 9;
var frame_size = 64;
var anim_spd = 13;

if(is_dead){
	var anim_len = 6;
	var anim_spd = 4;
	y_frame = 20;
}
if(!is_dead){
	if(is_moving)
		switch(facing){
			case dir.right: y_frame = 11; break;
			case dir.right_up: y_frame = 11; break;
			case dir.right_down: y_frame = 11; break;
			case dir.up: y_frame = 8; break;
			case dir.left: y_frame = 9; break;
			case dir.left_up: y_frame = 9; break;
			case dir.left_down: y_frame = 9; break;
			case dir.down: y_frame = 10; break;
			case -1: x_frame = 0; break;
		}
	else{
		x_frame = 0;
		//show_debug_message(string(y_frame));
		switch(facing){
			case dir.right: y_frame = 11; break;
			case dir.right_up: y_frame = 11; break;
			case dir.right_down: y_frame = 11; break;
			case dir.up: y_frame = 8; break;
			case dir.left: y_frame = 9; break;
			case dir.left_up: y_frame = 9; break;
			case dir.left_down: y_frame = 9; break;
			case dir.down: y_frame = 10; break;
			//case -1: x_frame = 0; break;
		}
	}
}
var xx = x - x_offset;
var yy = y - y_offset;

if(!is_dead){
	if(x_frame + anim_spd / 60 < anim_len){
		x_frame += anim_spd / 60;
	}
	else{
		x_frame = 1;	
	}
}
else{
	if(x_frame + anim_spd / 60 < anim_len){
		x_frame += anim_spd / 60;
		//show_debug_message(string(x_frame));
	}
}

//shadow
if(spr_shadow != -1) draw_sprite(spr_shadow, 0, x, y);

//base
if(spr_base != -1) draw_sprite_part(spr_base, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

//feet
if(spr_feet != -1) draw_sprite_part(spr_feet, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

//legs
if(spr_legs != -1) draw_sprite_part(spr_legs, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

//shirt
if(spr_torso != -1) draw_sprite_part(spr_torso, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

//hair
if(spr_hair != -1)  draw_sprite_part(spr_hair, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);