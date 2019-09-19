x = obj_player.x;
y = obj_player.y - 23;
direction = point_direction(x,y,mouse_x,mouse_y); //изменить на попворот игрока

if (direction > 90) && (direction < 270) image_yscale = -1; else image_yscale = 1;

image_angle = direction;

var mouseb;
if (automatic) mouseb = mouse_check_button(mb_left); else mouseb = mouse_check_button_pressed(mb_left);

if (mouseb)
{
	if (current_cd == 0)
	{
		current_cd = cooldown;
		current_delay = startup;
	}	
}

if (current_delay == 0) && (projectile != -1)
{
	if (ammo[weapon] != 0)
	{
		with (instance_create_layer(x + lengthdir_x(length, direction), y + lengthdir_y(length, direction) + 5, "Projectiles", projectile))
		{
			image_angle = other.direction;
			direction = other.direction;
			speed = other.bulletspeed;
			image_speed = 12;
			show_debug_message("gun pos: x: " + string(other.x) + "  y: " + string(other.y));
			show_debug_message("bullet pos: x: " + string(x) + "  y: " + string(y));
		}
		ammo[weapon] -= 1;
	}
	
	with (obj_player)
	{
		move_x += lengthdir_x(other.recoil_push,other.direction);
		move_y += lengthdir_y(other.recoil_push,other.direction); 
	}
	current_recoil = recoil;
	
}

current_delay = max(-1,current_delay-1);
if (current_delay == -1) current_cd = max(0,current_cd-1);
current_recoil = max(0,floor(current_recoil*0.8));

depth = obj_player.depth-1;


if (keyboard_check_pressed(ord("1")) && ammo[1] > 0) s_change_weapon(1);
if (keyboard_check_pressed(ord("2")) && ammo[2] > 0) s_change_weapon(2);
if (keyboard_check_pressed(ord("0"))) s_change_weapon(0);
