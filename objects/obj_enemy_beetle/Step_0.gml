if(!can_move) exit;

if(triggered && can_attack && instance_exists(obj_player)){	
	if(chekk <= 0){
		move_x = round(sign(round(obj_player.x - x)) * spd);
		move_y = round(sign(round(obj_player.y - y)) * spd);
		show_debug_message("Change dirr" + string(timeline_index))
		chekk = 30;
	}
	else{
		chekk--;	
	}
}

if(move_x != 0){
	var coll_h = instance_place(x + move_x, y, obj_collision);
	if(coll_h != noone && coll_h.collideable){
		repeat(abs(move_x)){
			if(!place_meeting(x + sign(move_x), y, obj_collision)){
				x += sign(move_x);
			}
			else{
				break;			
			}
		}
		move_x = 0;
	}
}

if(move_y != 0){
	var coll_v = instance_place(x, y + move_y, obj_collision);
	if(coll_v != noone && coll_v.collideable){
		repeat(abs(move_y)){
			if(!place_meeting(x, y + sign(move_y), obj_collision)){
				y += sign(move_y);
			}
			else{
				break;			
			}
		}
		move_y = 0;
	}
}

x += move_x;
y += move_y;
triggered = false;

var player_dead = obj_player.is_dead;
if(player_dead) exit;
if(!triggered) exit;
spd = run_spd;

/*else if(can_attack && instance_exists(obj_player)){
	move_x = sign(obj_player.x - x) * spd;
	move_y = sign(obj_player.y - y) * spd;
}*/

if(can_attack && point_distance(obj_player.x, obj_player.y, x, y) < 20 && (abs(obj_player.y - y))){
	move_x = 0;
	move_y = 0;
	show_debug_message("!!!");
	attacking = true;
	if((obj_player.x - x < 16 && obj_player.x - x > -16) && obj_player.y < y){
		instance_create_layer(x, y - 9, "Projectiles", obj_beetle_attack);
	}
	else if((obj_player.x - x < 16 && obj_player.x - x > -16) && obj_player.y > y){
		instance_create_layer(x, y - 9, "Projectiles", obj_beetle_attack);
	}
	else if(obj_player.x < x && obj_player.y < y){
		instance_create_layer(x, y - 9, "Projectiles", obj_beetle_attack);
	}
	else if(obj_player.x >= x && obj_player.y <= y){
		instance_create_layer(x, y - 9, "Projectiles", obj_beetle_attack);
	}
	else if(obj_player.x <= x && obj_player.y > y){
		instance_create_layer(x, y - 9, "Projectiles", obj_beetle_attack);
	}
	else if(obj_player.x > x && obj_player.y >= y){
		instance_create_layer(x, y - 9, "Projectiles", obj_beetle_attack);
	}
	alarm[2] = attacking_rate;
	alarm[3] = cooldown;
	can_attack = false;
	can_move = false;
	/*chosen_x = choose(x + 32 / 60, x - 32 / 60);
	chosen_y = choose(y + 32 / 60, y - 32 / 60);*/
}
