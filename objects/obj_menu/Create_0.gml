global.pause = false;
global.view_width = global.game_width;
global.view_height = global.game_height;

global.key_revrt = ord("X");
global.key_enter = vk_enter;
global.key_up = ord("W");
global.key_down = ord("S");
global.key_left = ord("A");
global.key_right = ord("D");

enum menu_page{
	main,
	settings,
	audio,
	controls,
	graphics,
	height
}

enum menu_element_type{
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

ds_menu_main = s_create_menu_page(
	["RESUME", menu_element_type.script_runner, s_resume_game],
	["SETTINGS", menu_element_type.page_transfer, menu_page.settings],
	["EXIT", menu_element_type.script_runner, s_exit_game],
);

ds_menu_settings = s_create_menu_page(
	["AUDIO", menu_element_type.page_transfer, menu_page.audio],
	["CONTROLS", menu_element_type.page_transfer, menu_page.controls],
	["GRAPHICS", menu_element_type.page_transfer, menu_page.graphics],
	["BACK", menu_element_type.page_transfer, menu_page.main],
);

ds_menu_audio = s_create_menu_page(
	["MASTER", menu_element_type.slider, s_change_volume, 1, [0, 1]],
	["BACK", menu_element_type.page_transfer, menu_page.settings],
);

ds_menu_controls = s_create_menu_page(
	["UP", menu_element_type.input, "key_up", ord("W")],
	["DOWN", menu_element_type.input, "key_down", ord("S")],
	["LEFT", menu_element_type.input, "key_left", ord("A")],
	["RIGHT", menu_element_type.input, "key_right", ord("D")],
	["BACK", menu_element_type.page_transfer, menu_page.settings],
);

ds_menu_graphics = s_create_menu_page(
	["FULLSCREEN", menu_element_type.toggle, s_change_window_mode, 1, ["FULLSCREEN", "WINDOWED"]],
	["BACK", menu_element_type.page_transfer, menu_page.settings],
);

page = 0;
menu_pages = [ds_menu_main, ds_menu_settings, ds_menu_audio, ds_menu_controls, ds_menu_graphics];
for(var i = 0; i < array_length_1d(menu_pages); ++i)
	menu_option[i] = 0;
	
inputting = false;
