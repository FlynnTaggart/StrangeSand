if(room == rm_start){
	instance_deactivate_all(true);
	page = menu_page.start;
	prev_page = menu_page.start;
	global.pause = true;
	ds_menu_settings[# 2, 3] = prev_page;
	ds_menu_ask_to_exit[# 2, 1] = prev_page;
}
else if(room == rm_village){
	instance_activate_all();
	page = menu_page.main;
	prev_page = menu_page.main;
	global.pause = false;
	ds_menu_settings[# 2, 3] = prev_page;
	ds_menu_ask_to_exit[# 2, 1] = prev_page;
}