depth = -100;
seconds = 0;
minutes = 0;
hours = 0;

day = 1;
season = 1;
year = 1;


time_increment = 500;
time_pause = true;

max_darkness = 0.7;
darkness = 0;
light_color = c_black;
draw_daylight = false;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

enum phase {
	sunrise = 4,
	daytime = 8.5,
	sunset = 18,
	night = 22
}