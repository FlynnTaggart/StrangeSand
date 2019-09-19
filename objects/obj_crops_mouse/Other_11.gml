if(room == rm_1){
	if(instance_exists(obj_crop)){
		with(obj_crop){
			if(groth_stage < max_groth_stage){
				days_old += 1;
				var first_growh = 0;
				if(days_old > 0)
					first_growh = 1;
				groth_stage = first_growh + days_old div groth_stage_duration;
			}
			else{
				groth_stage = max_groth_stage;
				fully_grown = true;
				alarm[1] = 1;
			}
		}
	}
}
else if(ds_crops_data[# 0, 0] != -1){
	var h = ds_grid_height(ds_crops_data);
	for(var i = 0; i < h; ++i)
		ds_crops_data[# 3, i]++;	
}