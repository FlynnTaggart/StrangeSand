/// @description
if(global.pause) exit;
if(!debug) exit;
with(obj_collision){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);
}
with(obj_player){
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);
}
draw_set_alpha(0.3);
var yy = -1;
var xx = -1;
var cellsize = obj_crops_mouse.cell_size;
var r = room_w div cellsize;
var i;
for(i = 0; i < r; ++i){
	draw_line_color(xx, 0, xx, room_h, c_white, c_white);
	xx += cellsize;
}

r = room_h div cellsize;
for(i = 0; i < r; ++i){
	draw_line_color(0, yy, room_w, yy, c_white, c_white);
	yy += cellsize;
}
draw_set_alpha(1);