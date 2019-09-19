event_inherited();

cell_size = 32;
item_spr = spr_inventory_items;
spr_width = sprite_get_width(item_spr);
spr_height = sprite_get_height(item_spr);

item_num = 0;
x_frame = 0;
y_frame = 0;

x_offset = cell_size / 2;
y_offset = cell_size * (2 / 3);

drop_move = true;
var item_dir = irandom_range(0, 359);
var len = 32;
goal_x = x + lengthdir_x(len, item_dir);
goal_y = y + lengthdir_y(len, item_dir);