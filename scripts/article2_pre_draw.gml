//postDraw

var height = 1.13 * (snow_column_bottom - snow_column_top);
var alpha = max(0.2, 0.55 - 0.005*(snow_column_top - y));
alpha *= 0.5 * (1 + 0.2 * dsin(get_gameplay_time()*3));
draw_sprite_stretched_ext(aura_spr, (get_gameplay_time()/8)%6, x - snow_column_width, snow_column_top - 3, 
                                                               2*snow_column_width, height, c_white, alpha);

if !get_match_setting(SET_HITBOX_VIS) exit;
//bonus debug information

draw_rectangle_color(x + snow_column_width, snow_column_top, 
                     x - snow_column_width, snow_column_bottom, c_teal, c_teal, c_teal, c_teal, true);

draw_sprite_ext(mask_index, 0, x, y, 1, 1, 0, c_white, 0.75);

draw_line_color(x, snow_column_top, x, snow_column_bottom, c_blue, c_white);

draw_line_color(x-1, y, x-1, y + snow_column_plat_distance, c_red, c_red);
draw_line_color(x+1, y, x+1, y + snow_column_solid_distance, c_fuchsia, c_fuchsia);