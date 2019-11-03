if(ds_exists(ds_depthgrid, ds_type_grid)){
	var inst_num = instance_number(obj_parent_depth);
	var dgrid = ds_depthgrid;
	ds_grid_resize(dgrid, 2, inst_num);
	var yy = 0;
	with(obj_parent_depth){
		dgrid[# 0, yy] = id;
		dgrid[# 1, yy] = y;
		yy++;
	}
	ds_grid_sort(ds_depthgrid, 1, true);
	for(var i = 0; i < inst_num; ++i){
		var inst = dgrid[# 0, i];
		with(inst){
			event_perform(ev_draw, 0);
		}
	}
	ds_grid_clear(ds_depthgrid, 0);
}