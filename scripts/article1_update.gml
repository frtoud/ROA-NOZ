//article1_update

if (free)
{
    if (article_timer < player_id.noz_fspecial_airtime)
    {
        with (player_id) 
        {
           var new = instance_create(other.x, floor(other.y), "obj_article_platform");
           new.article_timer = other.article_timer;
           new.spr_dir = other.spr_dir;
        }
        instance_destroy(self); exit;
    }
    else should_die = true;
}

if (article_timer > player_id.noz_fspecial_lifetime) || should_die
{
    //delete self
    //take time to unhook the neighbors tho, to be nice
    if instance_exists(left_segment) 
        left_segment.right_segment = noone;
    if instance_exists(right_segment) 
        right_segment.left_segment = noone;
    
    var k = spawn_hit_fx(x, y, despawn_vfx);
    k.spr_dir = spr_dir;
    instance_destroy(self); exit;
}

//test existence of neighbors
var neighborflags = 3; //1 front, 2 back. depends on spr_dir

//if moved, doublecheck surrounding articles
var has_moved = (prev_x != x);
prev_x = x;

if !instance_exists(right_segment)
{
    neighborflags -= (spr_dir ? 1 : 2);
    right_segment = noone;
    if (has_moved)
    {
        right_segment = find_neighbor_platform(x+16, y);
        if instance_exists(right_segment)
            right_segment.left_segment = self;
    }
}
else if (has_moved) 
     && ((abs(right_segment.x - (x+16)) > 2) || (right_segment.y - y) > 2)
{
    //lose neighbor if too distant
    neighborflags -= (spr_dir ? 1 : 2);
    right_segment.left_segment = noone;
    right_segment = noone;
}

if !instance_exists(left_segment)
{
    neighborflags -= (spr_dir ? 2 : 1);
    left_segment = noone;
    if (has_moved)
    {
        left_segment = find_neighbor_platform(x-16, y);
        if instance_exists(left_segment)
            left_segment.right_segment = self;
    }
}
else if (has_moved) 
     && ((abs(left_segment.x - (x-16)) > 2) || (left_segment.y - y) > 2)
{
    //lose neighbor if too distant
    neighborflags -= (spr_dir ? 2 : 1);
    left_segment.right_segment = noone;
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
                noz_is_in_snow_zone = true;
                noz_handler_id = other.player_id;

                if (other.player_id.noz_rune_flags.frostbite) // Frostbite debuff
                {
                    if !noz_snow_frostbite
                        noz_snow_frostbite_dot_tick = (get_gameplay_time() % 30 + 1);
                    noz_snow_frostbite = true; 
                }
            }
        }
        else if (url == other.player_id.url)
        {
            //ice plats count as temporary buff only
            noz_frostzone_timer = max(noz_frostzone_timer, 6);
        }
    }
}

//adjust image_index based on lifetime & neighbors. see sheet.
image_index = clamp(article_timer/3, 0, 3) + 4*neighborflags;
article_timer++;

//infinite duration
if (player_id.noz_rune_flags.ice_longer)
    article_timer = min(article_timer, 16);

//sparkles randomly
if (player_id.anim_do_draw_twinkle &&
    player_id.anim_rand_twinkle == random_twinkle)
{
    spawn_twinkle(player_id.vfx_snow_twinkle, x, y-8, 12);
}

//======================================================================
#define find_neighbor_platform(xpos, ypos)
{
    var found = noone;

    with (asset_get("obj_article1"))
    if (self != other) && (player_id == other.player_id)
    && (abs(x - xpos) < 2) && (abs(y - ypos) < 2)
    {
        found = self; break;
    }
    if (found == noone) with (asset_get("obj_article_platform"))
                        if (self != other) && (player_id == other.player_id)
                        && (abs(x - xpos) < 2) && (abs(y - ypos) < 2)
    {
        found = self; break;
    }

    return found;
}
//======================================================================
#define spawn_twinkle(vfx, pos_x, pos_y, radius)
with (player_id)
{
    var kx = pos_x - (radius / 2) + anim_rand_x * radius;
    var ky = pos_y - (radius / 2) + anim_rand_y * radius;

    var k = spawn_hit_fx(kx, ky, vfx);
}