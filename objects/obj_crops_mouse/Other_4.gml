if(room == rm_1){
	ds_crops_instances = ds_grid_create(room_width div cell_size, room_height div cell_size);
	ds_grid_clear(ds_crops_instances, 0);
	if(ds_crops_data[# 0, 0] != -1){
		var inst_num = ds_grid_height(ds_crops_data);
		for(var i = 0; i < inst_num; ++i){
			//respawn that instance
			s_respawn_crop(
				ds_crops_data[# 0, i],
				ds_crops_data[# 1, i],
				ds_crops_data[# 2, i],
				ds_crops_data[# 3, i]
			);
		}
		with(obj_crop){
			var first_growh = 0;
			if(days_old > 0)
				first_growh = 1;
			groth_stage = first_growh + days_old div groth_stage_duration;
			if(groth_stage >= max_groth_stage){
				groth_stage = max_groth_stage;
				fully_grown = true;
				alarm[1] = 1;
			}
		}
	}
}