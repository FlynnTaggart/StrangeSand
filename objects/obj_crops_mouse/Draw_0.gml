if(!planting) exit;

var cs = cell_size;
var gx = mx div cs;
var gy = my div cs;

var xx = gx * cs;
var yy = gy * cs;

var c = c_red;
var cell = ds_crops_instances[# gx, gy];
if(cell == 0){
	var layer_id = layer_get_id("T_Soil");
	var map_id = layer_tilemap_get_id(layer_id);
	var data = tilemap_get_at_pixel(map_id, mx, my);

	if(data)
		c = c_lime;
}
draw_rectangle_color(xx, yy, xx + cs, yy + cs, c, c, c, c, true);

draw_sprite(spr_crops_picked, select_crop, xx + cs / 2, yy + cs / 2);