/// @description 

room_w = room_width;
room_h = room_height;

if(spawn_room == -1) exit;
obj_player.x = spawn_x;
obj_player.y = spawn_y;
obj_player.facing = spawn_player_facing;

with(obj_player){
	switch(facing){
		case dir.left: y_frame = 9; break;
		case dir.right: y_frame = 11; break;
		case dir.up: y_frame = 8; break;
		case dir.down: y_frame = 10; break;
		case -1: x_frame = 0; break;
	}	
}