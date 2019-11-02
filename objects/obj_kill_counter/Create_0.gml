enum enemies{
	beetle,
	bandit,
	height,	
}

enemies_count = enemies.height;
global.ds_enemies_killed = ds_grid_create(2, enemies_count);
for(var i = 0; i < enemies_count; ++i){
	global.ds_enemies_killed[# 0, i] = i;
}