//article1_update.gml: platform version

if (article_timer > player_id.noz_fspecial_airtime) || should_die
//also test for collision with any platforms overlapping yourself (after a grace period)
//prevents being "picked up" by stationary ice platform while moving with something else
|| ((article_timer > 15) && (place_meeting(x, y, asset_get("par_jumpthrough"))
                          || place_meeting(x, y, asset_get("par_block")) ))
{
    //delete self
    //take time to unhook the neighbors tho, to be nice
    if instance_exists(left_segment) 
        left_segment.right_segment = noone;
    if instance_exists(right_segment) 
        right_segment.left_segment = noone;
    
    //!? DAN WHY ARE ARTICLE PLATFORMS FAILING AT THIS
    with (player_id)
    {
        var k = spawn_hit_fx(other.x, other.y, other.despawn_vfx);
        k.spr_dir = other.spr_dir;
    }
    instance_destroy(self); exit;
}

//test existence of neighbors
var neighborflags = 3; //1 front, 2 back. depends on spr_dir

if !instance_exists(right_segment)
{
    neighborflags -= (spr_dir ? 1 : 2);
    right_segment = noone;
}

if !instance_exists(left_segment)
{
    neighborflags -= (spr_dir ? 2 : 1);
    left_segment = noone;
}

if !instance_exists(left_segment)
{
    //go down the chain all the way to the right to perform player check
    var rightmost_plat = self;
    while instance_exists(rightmost_plat.right_segment)
    { rightmost_plat = rightmost_plat.right_segment; }

    with (oPlayer) 
    if collision_line(other.x - 8, other.y - 2, 
       rightmost_plat.x + 8, rightmost_plat.y - 2, self, false, false)
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
}

//adjust image_index based on lifetime & neighbors. see sheet.
image_index = clamp(article_timer/3, 0, 3) + 4*neighborflags;
article_timer++;

//sparkles randomly
if (player_id.anim_do_draw_twinkle &&
    player_id.anim_rand_twinkle == random_twinkle)
{
    spawn_twinkle(player_id.vfx_snow_twinkle, x, y-8, 12);
}

//======================================================================
#define spawn_twinkle(vfx, pos_x, pos_y, radius)
with (player_id)
{
    var kx = pos_x - (radius / 2) + anim_rand_x * radius;
    var ky = pos_y - (radius / 2) + anim_rand_y * radius;
    
    var k = spawn_hit_fx(kx, ky, vfx);
}
