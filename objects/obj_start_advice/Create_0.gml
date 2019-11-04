gui_width = global.game_width;
gui_height = global.game_height;


x_buffer = 32;
y_buffer = floor((5 / 6) * gui_height);

advice_count = 4;

ds_advice = ds_grid_create(2, advice_count);

page = 0;

show = false;
				
ds_advice = s_create_advice_grid(
	["Press W to move up, S to move down,\n A to move left, D to move right", 2, ord("W"), ord("S"), ord("A"), ord("D")],
	["Press I to open inventory", 2],
	["Press E to interract with npc's", 2],
	["You can change controls in settings", 2],
);
alarm[0] = 60;

global.advice_complete = false;