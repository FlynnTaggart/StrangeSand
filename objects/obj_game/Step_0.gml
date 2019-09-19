/// @description 
if(keyboard_check_pressed(ord("F"))) debug = !debug;
if(keyboard_check_pressed(ord("R"))) game_restart();
if(keyboard_check_pressed(vk_escape)) game_end();