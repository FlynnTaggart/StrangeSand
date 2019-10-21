/// @description 
if(keyboard_check_pressed(ord("F"))) debug = !debug;
if(keyboard_check_pressed(ord("R"))) game_restart();
if(keyboard_check_pressed(vk_escape)){
	if(!global.pause){
		instance_deactivate_all(true);
		instance_activate_object(obj_menu);
	}
	else
		instance_activate_all();
	if(audio_is_playing(snd_1)) audio_stop_sound(snd_1);
	global.pause = !global.pause;
}
