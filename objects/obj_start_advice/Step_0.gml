if(!global.show_advice) exit;
if(!show) exit;

var ad_grid = ds_advice;
var advice_type = ad_grid[# 1, page];
show_debug_message("advice_type: " + string(advice_type));
switch(advice_type){
	case 1:
		if(alarm[1] != 60 && keyboard_check_pressed(ad_grid[# 2, page]) || keyboard_check_pressed(ad_grid[# 3, page]) || keyboard_check_pressed(ad_grid[# 4, page]) || keyboard_check_pressed(ad_grid[# 5, page])) alarm[1] = 60;
	break;
	case 2:
		if(alarm[1] != 60 && keyboard_check_pressed(vk_anykey)) alarm[1] = 60;
	break;
}

if(page > advice_count - 1){
	show = false;
	global.advice_complete = true;
}