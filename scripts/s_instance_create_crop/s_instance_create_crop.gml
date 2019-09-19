///@description s_instance_create_crop
///@arg x
///@arg y
///@arg crop_type

var cs = obj_crops_mouse.cell_size;
var gx = argument0 div cs;
var gy = argument1 div cs;
var i_drid = obj_crops_mouse.ds_crops_instances;
var cell = i_drid[# gx, gy];

if(cell = 0){
	var xx = gx * cs;
	var yy = gy * cs;

	var layer_id = layer_get_id("T_Soil");
	var map_id = layer_tilemap_get_id(layer_id);
	var data = tilemap_get_at_pixel(map_id, argument0, argument1);

	if(!data){
		show_debug_message("there is no soil here");	
		return false;
	}
	else{
		show_debug_message("there is soil here");
	}

	var inst = instance_create_layer(xx + cs / 2, yy + cs / 2, "Instances", obj_crop);
	i_drid[# gx, gy] = inst;

	with(inst){
		crop_type = argument2;
		groth_stage_duration =  obj_crops_mouse.ds_crops_types[# 0, crop_type];
	}

	return inst;
}
else {
	show_debug_message("There is already something there");
	return false;
}