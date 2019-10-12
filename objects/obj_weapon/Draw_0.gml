if (sprite != -1)
{
	draw_sprite_ext(
		sprite,
		image_index,
		x - lengthdir_x(current_recoil,direction),
		y - lengthdir_y(current_recoil,direction),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	);
}