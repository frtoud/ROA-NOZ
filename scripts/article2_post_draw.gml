//postDraw

draw_rectangle_color(x + snow_column_width, snow_column_top, x - snow_column_width, snow_column_bottom, c_teal, c_teal, c_teal, c_teal, true);

if !get_match_setting(SET_HITBOX_VIS) exit;
//bonus debug information

draw_sprite_ext(mask_index, 0, x, y, 1, 1, 0, c_white, 0.75);

draw_line_color(x, snow_column_top, x, snow_column_bottom, c_blue, c_white);

draw_line_color(x-1, y, x-1, y + snow_column_plat_distance, c_red, c_red);
draw_line_color(x+1, y, x+1, y + snow_column_solid_distance, c_fuchsia, c_fuchsia);