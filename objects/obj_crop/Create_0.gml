collideable = false;

frame_width = 32;
frame_height = 64;

crop_type = 0;
days_old = 0;
groth_stage = 0;
groth_stage_duration = 0;
max_groth_stage = (sprite_get_width(spr_crops) / frame_width) - 1;

fully_grown = false;
sparkle = -1;

xx = x - frame_width / 2 + 2;
yy = y - frame_height + 6