depth = -1000;
scale = 1;
t_scale = 0.5
cell_size = 32;
show_inventory = false;

global.inv_slots = 24;
global.inv_slots_width = 8;
global.inv_slots_height = 3;

nx_end = 0;
ny_end = 0;

selected_slot = -1;
selected_weapon_slot = -1;
mouse_in_weapon_slots = false;
mouse_in_inventory = false;
pickup_slot = -1;
weapon_pickup_slot = -1;
m_slot_x = 0;
m_slot_y = 0;

x_buffer = 2;
y_buffer = 4;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

inv_UI_width = 288;
inv_UI_height = 198;

spr_inv_UI = spr_inventory_UI;
spr_inv_items = spr_inventory_items;

spr_inv_items_columns = sprite_get_width(spr_inv_items) / cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items) / cell_size;

inv_UI_x = (gui_width * 0.5) - (inv_UI_width * 0.5 * scale);
inv_UI_y = (gui_height * 0.5) - (inv_UI_height * 0.5 * scale);

info_x = inv_UI_x + 9 * scale;
info_y = inv_UI_y + 9 * scale;

slots_x = info_x;
slots_y = inv_UI_y + (40 * scale);

desc_x = info_x;
desc_y = inv_UI_y + (156 * scale);

global.ds_player_info = ds_grid_create(2, 2);
global.ds_player_info[# 0, 0] = "Gold";
global.ds_player_info[# 0, 1] = "Name";

global.ds_player_info[# 1, 0] = 13;
global.ds_player_info[# 1, 1] = "Player";
global.gold = global.ds_player_info[# 1, 0];

global.ds_inventory = ds_grid_create(2, global.inv_slots);
global.ds_weapons_slots = ds_grid_create(1, 4);

enum item{
	none      = 0,
	tomato    = 1,
	potato    = 2,
	carrot    = 3,
	artichoke = 4,
	chilli    = 5,
	gourd     = 6,
	corn      = 7,
	wood      = 8,
	stone     = 9,
	bucket    = 10,
	chair     = 11,
	painting  = 12,
	axe       = 13,
	potion    = 14,
	starfish  = 15,
	mushroom  = 16,
	arifle    = 17,
	revolver  = 18,
	pipe      = 19,
	key       = 20,
	armor     = 21,
	height    = 22,
}

ds_items_info = ds_grid_create(2, item.height);

var z = 0, i = 0; 
ds_items_info[# z, i++] = "Nothing";
ds_items_info[# z, i++] = "Tomato";
ds_items_info[# z, i++] = "Potato";
ds_items_info[# z, i++] = "Carrot";
ds_items_info[# z, i++] = "Artichoke";
ds_items_info[# z, i++] = "Chilli";
ds_items_info[# z, i++] = "Gourd";
ds_items_info[# z, i++] = "Corn";
ds_items_info[# z, i++] = "Wood";
ds_items_info[# z, i++] = "Stone";
ds_items_info[# z, i++] = "Bucket";
ds_items_info[# z, i++] = "Chair";
ds_items_info[# z, i++] = "Painting";
ds_items_info[# z, i++] = "Axe";
ds_items_info[# z, i++] = "Potion";
ds_items_info[# z, i++] = "Starfish";
ds_items_info[# z, i++] = "Mushroom";
ds_items_info[# z, i++] = "ARifle";
ds_items_info[# z, i++] = "Revolver";
ds_items_info[# z, i++] = "Pipe";
ds_items_info[# z, i++] = "Key";
ds_items_info[# z, i++] = "Armor";

var z = 1, i = 0; 
ds_items_info[# z, i++] = "Nothing is equal to absolute 0";
ds_items_info[# z, i++] = "Red and round";
ds_items_info[# z, i++] = "Is this what fries are made of?";
ds_items_info[# z, i++] = "I heard that rabbits like it";
ds_items_info[# z, i++] = "Pretty interesting one";
ds_items_info[# z, i++] = "It is not spicy";
ds_items_info[# z, i++] = "I'm not sure but this could be a zcchini";
ds_items_info[# z, i++] = "Oh we left Pop-";
ds_items_info[# z, i++] = "Knock on it";
ds_items_info[# z, i++] = "Just a piece of a rock";
ds_items_info[# z, i++] = "You can put it on your head";
ds_items_info[# z, i++] = "This will surely endure you";
ds_items_info[# z, i++] = "Hmm.. I don't even know who is on this picture. Yeah very strange one. Maybe it is me? Or maybe you?";
ds_items_info[# z, i++] = "Smells like a viking's one";
ds_items_info[# z, i++] = "Something strange and liquid";
ds_items_info[# z, i++] = "Unforunately it doesn't emit light";
ds_items_info[# z, i++] = "I don't recommend eatin it";
ds_items_info[# z, i++] = "Shooting fast";
ds_items_info[# z, i++] = "Shooting slow";
ds_items_info[# z, i++] = "Easy to use";
ds_items_info[# z, i++] = "For cases when sesame didn't help";
ds_items_info[# z, i++] = "Protects you";


/*for(var i = 0; i < global.inv_slots; ++i){
	global.ds_inventory[# 0, i] = irandom_range(1, item.height - 2);
	if(global.ds_inventory[# 0, i] != item.arifle && global.ds_inventory[# 0, i] != item.revolver && global.ds_inventory[# 0, i] != item.pipe)
		global.ds_inventory[# 1, i] = irandom_range(1, 20);
	else
		global.ds_inventory[# 1, i] = 1;
}*/