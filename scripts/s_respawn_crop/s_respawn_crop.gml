///@description respawn_crop
///@arg grid_x
///@arg grid_y
///@arg crop_type
///@arg days_old

var xx = argument0 * cell_size;
var yy = argument1 * cell_size;

var inst = instance_create_layer(xx + cell_size / 2, yy + cell_size / 2, "Instances", obj_crop);
ds_crops_instances[# argument0, argument1] = inst;
show_debug_message("Respawned a " + ds_crops_types[# 2, argument2]);

with(inst){
	crop_type = argument2;
	days_old = argument3;
	groth_stage_duration = obj_crops_mouse.ds_crops_types[# 0, crop_type];
}

return inst;