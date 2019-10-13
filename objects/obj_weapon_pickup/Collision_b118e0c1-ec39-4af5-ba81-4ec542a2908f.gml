with (obj_weapon) 
{
	s_change_weapon(other.weapon);
	ammo[weapon] += 20;
}
obj_player.spr_shadow = spr_character_shadow;
obj_player.spr_base = spr_base_male_2_test;
obj_player.spr_feet = spr_feet_male_boots_brown;
obj_player.spr_legs = spr_legs_male_robe_skirt_test;
obj_player.spr_torso = spr_torso_male_chest_test;
obj_player.spr_hair = spr_hair_male_mohawk_blonde;
instance_destroy()