///@description	s_load_settings

var ds_menu_audioo = s_create_menu_page(
	["MASTER", menu_element_type.slider, s_change_volume, 1, [0, 1]],
	["BACK", menu_element_type.page_transfer, menu_page.settings],
);

var ds_menu_controlss = s_create_menu_page(
	["UP", menu_element_type.input, "key_up", ord("W")],
	["DOWN", menu_element_type.input, "key_down", ord("S")],
	["LEFT", menu_element_type.input, "key_left", ord("A")],
	["RIGHT", menu_element_type.input, "key_right", ord("D")],
	["BACK", menu_element_type.page_transfer, menu_page.settings],
);

var ds_menu_graphicss = s_create_menu_page(
	["FULLSCREEN", menu_element_type.toggle, s_change_window_mode, 1, ["ON", "OFF"]],
	["BACK", menu_element_type.page_transfer, menu_page.settings],
);

var ds_audioo_str = ds_grid_write(ds_menu_audioo);
var ds_controlss_str = ds_grid_write(ds_menu_controlss);
var ds_graphicss_str = ds_grid_write(ds_menu_graphicss);

if (file_exists("Settings.sav")){
	ini_open("Settings.sav");
	var ds_audio_str = ini_read_string("Audio", "ds_audio_str", ds_audioo_str);
	var ds_controls_str = ini_read_string("Controls", "ds_controls_str", ds_controlss_str);
	var ds_graphics_str = ini_read_string("Graphics", "ds_graphics_str", ds_graphicss_str);
	global.show_advice = ini_read_real("Advice", "show_advice", false);
	global.advice_complete = ini_read_real("Advice", "advice_complete", false);
	ini_close();
	ds_grid_read(global.ds_menu_audio, ds_audio_str);
	ds_grid_read(global.ds_menu_controls, ds_controls_str);
	ds_grid_read(global.ds_menu_graphics, ds_graphics_str);
	s_change_volume(global.ds_menu_audio[# 3, 0]);
	s_change_window_mode(global.ds_menu_graphics[# 3, 0]);
	for(var i = 0; i < 6; ++i){
		variable_global_set(global.ds_menu_controls[# 2, i], global.ds_menu_controls[# 3, i]);
	}
}
