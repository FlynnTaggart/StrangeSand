draw_sprite_part(spr_crops, 0, groth_stage * frame_width, crop_type * frame_height, frame_width, frame_height, xx, yy);
if(sparkle >= 0){
	draw_sprite(spr_sparkle, sparkle, x + 2, y - 10);
	sparkle += .1;
	if(sparkle >= sprite_get_number(spr_sparkle)){
		sparkle = -1;
		alarm[1] = random_range(4, 5) * room_speed;
	}
}