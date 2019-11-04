///@description	s_save_settings

if(file_exists("Settings.sav")) file_delete("Settings.sav");
var ds_audio_str = ds_grid_write(global.ds_menu_audio);
var ds_controls_str = ds_grid_write(global.ds_menu_controls);
var ds_graphics_str = ds_grid_write(global.ds_menu_graphics);
ini_open("Settings.sav");

ini_write_string("Audio", "ds_audio_str", ds_audio_str);
ini_write_string("Controls", "ds_controls_str", ds_controls_str);
ini_write_string("Graphics", "ds_graphics_str", ds_graphics_str);
ini_write_real("Advice", "show_advice", global.show_advice);
ini_write_real("Advice", "advice_complete", global.advice_complete);

ini_close();