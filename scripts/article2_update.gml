//article2_update

if (should_die)
{
    cloud_is_explosive = false;
    //animate disparition
    image_index = clamp(image_index + 0.2, 8, 12);
    if (image_index > 11)
    {
        sprite_index = asset_get("empty_sprite");
    }

    //Slowly fade away, reduce frost zone downwards to nothing
    snow_column_top += 1.6 * snow_column_step;

    if (snow_column_top > snow_column_bottom)
    {
        instance_destroy(self); exit;
    }
}
else
{
    //animate apparition & looping
    image_index += 0.15;
    if (image_index > 8) image_index = 4;

    //expand sideways
    snow_column_width = min(snow_column_width + snow_column_step, snow_column_width_max);


    snow_column_top = y; 
    //Try expanding frost zone down 
    if (snow_column_bottom < max(y + 500, get_stage_data(SD_BOTTOM_BLASTZONE_Y)))
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

if (lifetime_timer > 10) && cloud_is_explosive
{
    try_getting_kicked();
    if instance_exists(explosion_hitbox)
    {
        explosion_hitbox.hitbox_timer = 0;
        explosion_hitbox.hsp = hsp;
        explosion_hitbox.vsp = vsp;
        explosion_hitbox.x = x;
        explosion_hitbox.y = y - 20;
    }
    else
    {
        explosion_hitbox = create_hitbox(AT_DSPECIAL, 1, x, y - 20);
        explosion_hitbox.cloud_article = self;
        explosion_hitbox.is_the_cloud = true;
    }

}


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
        noz_is_in_frost_zone = true;
    }
}

//Sparkling
var height = (snow_column_bottom - snow_column_top);
if (get_gameplay_time() % max(1, floor(4 - height/160)) == 0)
{
    var kx = x - (snow_column_width) + player_id.anim_rand_x * 2 * snow_column_width - 5;
    var ky = snow_column_top + player_id.anim_rand_y * height;
    var k = spawn_hit_fx(kx, ky, vfx_snow_twinkle);
    k.vsp = 2;
    k.hsp = 1;
}

//====================================================================
#define try_getting_kicked()
{
    var top_priority = 0;
    var top_damage = 0;
    var top_hitbox = noone;
    with (pHitBox)
    {
        if (self != other && (top_priority < hit_priority || 
            top_priority == hit_priority && top_damage < damage)
            && (("is_a_cloud" not in self) || (!is_a_cloud))
            && ((kb_value > 0.1) || (kb_scale > 0))
            && place_meeting(x, y, other) )
        {
            top_priority = hit_priority;
            top_damage = damage;
            top_hitbox = self;
        }
    }

    //best hitbox for being kicked
    if instance_exists(top_hitbox)
    {
        var angle = get_muno_angle(top_hitbox);
        //simulating kb calculations with cloud
        var force = player_id.noz_cloudkick_mult * 
         (top_hitbox.kb_value + player_id.noz_cloudkick_scale * top_hitbox.kb_scale * 0.12)

        hsp += lengthdir_x(force, angle);
        vsp += lengthdir_y(force/3, angle);
        //recalculated additive force clamped to a maximum
        force = clamp(point_distance(0, 0, hsp, vsp), 0, player_id.noz_cloudkick_speed/2);
        angle = point_direction(0, 0, hsp, vsp);
        hsp = lengthdir_x(force, angle);
        vsp = lengthdir_y(force, angle);

        //boosts friction!
        kick_boosted = 8;
    }
}

//==============================================================================
// returns the angle of an hitbox while considering HG_MUNO_OBJECT_LAUNCH_ANGLE
#define get_muno_angle(hitbox)
{
    var angle = 0;
    //MUNO compat
    if ("HG_MUNO_OBJECT_LAUNCH_ANGLE" in hitbox.player_id) with (hitbox.player_id) 
    {
        angle = get_hitbox_value(hitbox.attack, hitbox.hbox_num, HG_MUNO_OBJECT_LAUNCH_ANGLE); 
    }
    switch(angle)
    {
        // Special values:
        //  0: use normal angles
        // -1: Horizontal Away (simulates Angle 0 flipper 3)
        // -2: Radial Away (resembles flipper 8)
        case 0:
            angle = get_hitbox_angle(hitbox);
            break;
        case -1:
            angle = (x > hitbox.x) ? 0 : 180;
            break;
        case -2:
            angle = point_direction(hitbox.x, hitbox.y, x, y);
            break;
        default:
            // flips angle horizontally based on spr_dir
            // ±90° rotates the angle and cancel themselves
            // negative spr_dir flips it vertically (but rotated back)
            // modulo 360 to stay in usual ranges
            angle = ((hitbox.spr_dir * (angle - 90)) + 90 + 360) % 360;
            break;
    }
    return angle;
}