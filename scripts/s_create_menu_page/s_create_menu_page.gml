///@description crate_menu_page
///@arg ["Name1", type1, entries1...]
///@arg ["Name2", type2, entries2...]

var arg;

for(var i = 0; i < argument_count; ++i){
	arg[i] = argument[i];
}

var ds_grid_id = ds_grid_create(5, argument_count);

for(var i = 0; i < argument_count; ++i){
	var arr = arg[i];
	for(var j = 0; j < array_length_1d(arr); ++j){
		ds_grid_id[# j, i] = arr[j];	
	}
}

return ds_grid_id;