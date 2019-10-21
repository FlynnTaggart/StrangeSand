///@description resume_game

instance_activate_all();
if(audio_is_playing(snd_1)) audio_stop_sound(snd_1);
global.pause = !global.pause;