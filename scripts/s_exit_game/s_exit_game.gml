///@description exit_game
///@arg yes/no

if(!argument0){
	s_save_settings();
	s_save_game();
	game_end();
}
else
	page = prev_page;