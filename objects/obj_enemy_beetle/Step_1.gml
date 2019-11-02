if(hp <= 0){
	instance_change(obj_beetle_dead, true);
	global.ds_enemies_killed[# 1, enemies.beetle]++;
}