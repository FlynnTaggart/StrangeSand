///@description exit_game
///@arg yes/no

if(!argument0)
	global.show_advice = true;
else{
	global.show_advice = false;
	global.advice_complete = true;
}
s_save_game();
s_start_game();