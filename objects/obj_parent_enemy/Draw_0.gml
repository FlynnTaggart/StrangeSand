if(flash > 0){
	flash--;
	shader_set(sh_white);
}

var anim_len = 9;
var frame_size = 64;
var anim_spd = 13;

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

var xx = x - x_offset;
var yy = y - y_offset;

if(x_frame + anim_spd / 60 < anim_len){
	x_frame += anim_spd / 60;
}
else{
	x_frame = 1;	
}

//shadow
if(spr_shadow != -1) draw_sprite(spr_shadow, 0, x, y);

//base
if(spr_base != -1) draw_sprite_part(spr_base, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);
shader_reset();	