if(keyboard_check_pressed(ord("T")))
	time_pause = !time_pause;
if(time_pause) exit;
seconds += time_increment;
minutes = seconds / 60;
hours = minutes / 60;

if(draw_daylight){
	var darks, colors, p_start, p_end;
	if(hours > phase.sunrise && hours <= phase.daytime){
		darks = [max_darkness, 0.3, 0.2];
		colors = [merge_color(c_black, c_navy, 0.3), c_purple, c_orange];
		p_start = phase.sunrise;
		p_end = phase.daytime;
	}
	else if(hours > phase.daytime && hours <= phase.sunset){
		darks = [0.2, 0.1, 0, 0.1, 0.2];
		colors = [c_orange, c_yellow, c_white, c_yellow, c_orange];
		p_start = phase.daytime;
		p_end = phase.sunset;
	}
	else if(hours > phase.sunset && hours <= phase.night){
		darks = [0.2, 0.3, max_darkness];
		colors = [c_orange, c_purple, c_navy, merge_color(c_black, c_navy, 0.3)];
		p_start = phase.sunset;
		p_end = phase.night;
	}
	else{
		darks = [max_darkness];
		colors = [merge_color(c_black, c_navy, 0.3)];
		p_start = phase.night;
		p_end = phase.sunrise;
	}
	
	if(p_start == phase.night) light_color = colors[0];
	else{
		var cc = ((hours - p_start) / (p_end - p_start)) * (array_length_1d(colors) - 1);
		var c1 = colors[floor(cc)];
		var c2 = colors[ceil(cc)];
		light_color = merge_color(c1, c2, cc - floor(cc));
	}
	if(p_start == phase.night) darkness = darks[0];
	else{
		var dd = ((hours - p_start) / (p_end - p_start)) * (array_length_1d(darks) - 1);
		var d1 = darks[floor(dd)];
		var d2 = darks[ceil(dd)];
	
		darkness = s_merge_number(d1, d2, dd - floor(dd));
	}
}

if(hours >= 24){
	seconds = 0;
	day++;
	with(obj_crops_mouse)
		event_perform(ev_other, ev_user1);
	if(day > 30){
		day = 1;
		season++;
		if(season > 4){
			season = 1;
			year++;
		}
	}
}