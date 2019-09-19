x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

if(place_meeting(x, y, obj_parent_enemy)){
	with(instance_place(x, y, obj_parent_enemy)){
		hp--;
		flash = 3;
	}
	instance_destroy();
}

/*if(place_meeting(x, y, obj_wall) && image_index != 0){
	while(place_meeting(x, y, obj_wall)){
		x -= lengthdir_x(1, direction);
		y -= lengthdir_y(1, direction);
	}
	spd = 0;
	instance_change(obj_bullet_hit, true);
	layer_add_instance("Tiles", id);
	depth += 1;
}*/