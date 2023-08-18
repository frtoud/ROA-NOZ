//article2_update

if (should_die)
{
    //Slowly fade away, reduce frost zone downwards to nothing
    snow_column_top += 1.6 * snow_column_step;

    if (snow_column_top > snow_column_bottom)
    {
        instance_destroy(self); exit;
    }

}
else
{
    snow_column_top = y; 
    //Try expanding frost zone down 
    if (snow_column_bottom < get_stage_data(SD_BOTTOM_BLASTZONE_Y))
    {
        snow_column_bottom += snow_column_step;
    }

    //try keeping a minimum distance above ground
    if collision_line(x, y, x, y + snow_column_plat_distance, asset_get("par_jumpthrough"), false, false)
    || collision_line(x, y, x, y + snow_column_solid_distance, asset_get("par_block"), false, false)
    {
        vsp = min(vsp, -0.85);
    }

    lifetime_timer++;
    if (lifetime_timer > lifetime_max)
    {
        should_die = true;
    }
}

//basic motion dampening
hsp *= 0.94;
vsp *= 0.94;

//frost zone checks
//distance check
if collision_line(x, snow_column_top, x, snow_column_bottom, asset_get("par_block"), false, false)
{
    snow_column_bottom -= 2 * snow_column_step;
}
//player checks
with (oPlayer) if collision_rectangle(other.x - other.snow_column_width, other.snow_column_top, 
                                      other.x + other.snow_column_width, other.snow_column_bottom, 
                                      self.hurtboxID, true, false)
{
    if (get_player_team(player) != get_player_team(other.player_id.player))
    {
        if (noz_snowimmune_timer < 1)
        {
            noz_snowstack_timer = max(noz_snowstack_timer, 5)
            noz_handler_id = other.player_id;
        }
    }
    else if (url == other.player_id.url)
    {
        noz_frostzone_timer = 15;
    }
}

//Sparkling
var height = (snow_column_bottom - snow_column_top);
if (get_gameplay_time() % max(1, floor(4 - height/160)) == 0)
{
    var kx = x - (snow_column_width) + player_id.anim_rand_x * 2 * snow_column_width;
    var ky = snow_column_top + player_id.anim_rand_y * height;
    spawn_hit_fx(kx, ky, vfx_snow_falling);
}
