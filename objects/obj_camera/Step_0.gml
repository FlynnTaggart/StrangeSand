move_cam = keyboard_check(ord("C"));

if(move_cam){
	var input_left = keyboard_check(ord("A"));
	var input_right = keyboard_check(ord("D"));
	var input_up = keyboard_check(ord("W"));
	var input_down = keyboard_check(ord("S"));
	x += (input_right - input_left) * 6;
	y += (input_down - input_up) * 6;
} 
else{
	if(instance_exists(following)){
		x_to = following.x;
		y_to = following.y;
	}
	x += (x_to - x) / 25;
	y += (y_to - y) / 25;
	x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
	y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);
}