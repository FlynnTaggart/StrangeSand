alarm[0] = 1;
with(obj_player){
	maskk = mask_index;
	mask_index = spr_character_mask;
	show_debug_message("hp1 = " + string(hp));
	attacked = true;
	flash = 3;
}