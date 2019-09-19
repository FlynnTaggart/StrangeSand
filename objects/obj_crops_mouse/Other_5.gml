if(room == rm_1){
	var inst_num = instance_number(obj_crop);
	if(inst_num == 0)
		ds_grid_clear(ds_crops_data, -1);
	else{
		//there is crops, so save their data
		ds_grid_resize(ds_crops_data, ds_grid_width(ds_crops_data), inst_num);
		
		//loop through the instance grid
		var gw = ds_grid_width(ds_crops_instances);
		var gh = ds_grid_height(ds_crops_instances);
		var slot = 0;
		for(var i = 0; i < gw; ++i){
			for(var j = 0; j < gh; ++j){
				var inst = ds_crops_instances[# i, j]
				
				//If there is an instance in the cell, save its data
				if(inst != 0){
					ds_crops_data[# 0, slot] = i;
					ds_crops_data[# 1, slot] = j;
					ds_crops_data[# 2, slot] = inst.crop_type;
					ds_crops_data[# 3, slot] = inst.days_old;
					slot++;
				}
			}
		}
	}
	ds_grid_destroy(ds_crops_instances);
}
