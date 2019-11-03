if(flash > 0){
	flash--;
	shader_set(sh_white);
}

var anim_len = anim_leng;
var frame_size = 64;
var anim_spd = anim_spdd;


/*switch(facing){
	case dir.right: y_frame = 2; break;
	case dir.right_up: y_frame = 2; break;
	case dir.right_down: y_frame = 2; break;
	case dir.up: y_frame = 1; break;
	case dir.left: y_frame = 3; break;
	case dir.left_up: y_frame = 3; break;
	case dir.left_down: y_frame = 3; break;
	case dir.down: y_frame = 0; break;
	case -1: x_frame = 0; break;
}
*/

/*show_debug_message("move_x = " + string(move_x));
show_debug_message("move_y = " + string(move_y));*/

if(!attacking){
	if(triggered){
		if((move_y != 0 || move_x < 0) && !(sign(obj_player.x - x) + 1)) y_frame = 3;	
		else if((move_y != 0 || move_x > 0) && (sign(obj_player.x - x) + 1)) y_frame = 2;
		else x_frame = 0;
	}
	else{
		if(move_x < 0) y_frame = 3;	
		else if(move_x > 0) y_frame = 2;
		else if(move_y != 0) y_frame = 3;
		else x_frame = 0;
	}
}
else{
	if(obj_player.x <= x && obj_player.y < y){
		y_frame = 3;
	}
	else if(obj_player.x > x && obj_player.y <= y){
		y_frame = 2;
	}
	else if(obj_player.x <= x && obj_player.y > y){
		y_frame = 3;
	}
	else if(obj_player.x > x && obj_player.y >= y){
		y_frame = 2;
	}	
}

var xx = x - x_offset;
var yy = y - y_offset;

//shadow
if(spr_shadow != -1){
	if(y_frame == 1)
		draw_sprite(spr_shadow, 0, x, y - 2);
	else if(y_frame == 2 || y_frame == 3)
		draw_sprite(spr_shadow, 0, x, y - 2);
	else
		draw_sprite(spr_shadow, 0, x, y);
}

//base
if(spr_base != -1) draw_sprite_part(spr_base, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

if(attacking){
	x_frame = 4;
	exit;
}

if(x_frame < anim_len - 1){
	x_frame += anim_spd / 60;
}
else{
	x_frame = 1;	
}
shader_reset();