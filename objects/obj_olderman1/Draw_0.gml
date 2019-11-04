var anim_len = 9;
var frame_size = 64;
var anim_spd = 13;

if(move_x < 0) y_frame = 1;
else if(move_x > 0) y_frame = 3;
else if(move_y < 0) y_frame = 0;
else if(move_y > 0) y_frame = 2;
else x_frame = 0;

var xx = x - x_offset;
var yy = y - y_offset;

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

if(x_frame < anim_len - 1){
	x_frame += anim_spd / 60;
}
else{
	x_frame = 1;	
}