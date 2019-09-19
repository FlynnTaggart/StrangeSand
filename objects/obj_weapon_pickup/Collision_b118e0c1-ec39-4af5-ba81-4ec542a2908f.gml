with (obj_weapon) 
{
	s_change_weapon(other.weapon);
	ammo[weapon] += 20;
}
instance_destroy()