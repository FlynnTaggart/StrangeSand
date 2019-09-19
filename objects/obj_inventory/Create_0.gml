depth = -1000;
scale = 1;
t_scale = 0.5
cell_size = 32;
show_inventory = false;

inv_slots = 17;
inv_slots_width = 8;
inv_slots_height = 3;

nx_end = 0;
ny_end = 0;

selected_slot = -1;
pickup_slot = -1;
m_slot_x = 0;
m_slot_y = 0;

x_buffer = 2;
y_buffer = 4;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

inv_UI_width = 288;
inv_UI_height = 192;

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

ds_player_info = ds_grid_create(2, 4);
ds_player_info[# 0, 0] = "Gold";
ds_player_info[# 0, 1] = "Silver";
ds_player_info[# 0, 2] = "Copper";
ds_player_info[# 0, 3] = "Name";

ds_player_info[# 1, 0] = irandom_range(0, 99);
ds_player_info[# 1, 1] = irandom_range(0, 99);
ds_player_info[# 1, 2] = irandom_range(0, 99);
ds_player_info[# 1, 3] = "Player";

ds_inventory = ds_grid_create(2, inv_slots);

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
	height    = 17,
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

var z = 1, i = 0; 
ds_items_info[# z, i++] = "Nothing is equal to absolute 0";
ds_items_info[# z, i++] = "Red and round";
ds_items_info[# z, i++] = "Is this what fries are made of?";
ds_items_info[# z, i++] = "I heard that rabbits like it";
ds_items_info[# z, i++] = "Pretty interesting one";
ds_items_info[# z, i++] = "It is not spicy";
ds_items_info[# z, i++] = "I'm not sure but this could be a zucchini";
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

for(var i = 0; i < inv_slots; ++i){
	ds_inventory[# 0, i] = irandom_range(1, item.height - 1);
	ds_inventory[# 1, i] = irandom_range(1, 20);
}