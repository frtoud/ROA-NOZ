
// Lingering projectile hitboxes 
if ( is_a_cloud )
{
    // Air friction needs to apply vertically (in case of bashing or other shenans)
    vsp = (vsp < 0) ? min( 0.001, vsp + frict)
                    : max(-0.001, vsp - frict);

    if (attack == AT_DATTACK && dattack_speedcheck_timer > 0)
    {
        if (abs(player_id.hsp) > abs(hsp)) { hsp = player_id.hsp; }
        dattack_speedcheck_timer--;
    }

    // Kicking clouds
    if (is_kickable)
    {
        if (kick_cooldown > 0)
        {
            kick_cooldown--;
        }
        else
        {
            try_getting_kicked();

            if (kick_boosted > 0)
            {
                kick_boosted--;
                frict = boosted_friction;
                air_friction = frict;
            }
            else
            {
                frict = saved_friction;
                air_friction = frict;
            }
        }
        //try restoring can_hit if nothing is close for long enough
        if (has_hit && !place_meeting(x, y, oPlayer))
        {
            restore_hit_timer++;
            if (restore_hit_timer >= player_id.noz_cloud_hit_restore_time)
            {
                has_hit = false;
                for (var p = 0; p < array_length(can_hit); p++)
                {
                    can_hit[p] = true;
                }
                restore_hit_timer = 0;
            }
        }
        else
        {
            restore_hit_timer = 0;
        }
    }

    // Animating cloud
    // sprites: 0-1 2-3-4 5-6
    if (hitbox_timer > length - anim_fade_frames) //end
    {
        image_index = max(5, image_index);
    }
    else if (hitbox_timer > anim_fade_frames) && (image_index >= 5) //loop
    {
        image_index = 2;
    }

    // spawn flickering snow effects
    spawn_twinkle();
}
//still needs snow flickers
else if (attack == AT_FAIR && hbox_num == 3)
     || (attack == AT_BAIR && hbox_num == 3)
{
    spawn_twinkle();
}
//==================================================================
//Decorative skid effect (needs depth)
else if (attack == AT_DATTACK && hbox_num == 5)
{
    depth = player_id.depth - 3;
    x = player_id.x + spr_dir * 28;
    if (player_id.state_cat == SC_HITSTUN) destroyed = true;
}
//==================================================================
//Spreading-Dstrong rune
else if (attack == AT_DSTRONG && hbox_num == 5)
{
    if (hitbox_timer == 3)
    {
        var depth_check = 10;
        var next_posx = round(x) + (spr_dir*16)
        var ground_test = (noone != collision_line(next_posx, y, next_posx, y+depth_check, 
                                    asset_get("par_block"), true, true))
                       || (noone != collision_line(next_posx, y, next_posx, y+depth_check, 
                                    asset_get("par_jumpthrough"), true, true));
        
        if (ground_test)
        {
            var hb = create_hitbox(AT_DSTRONG, 5, next_posx, floor(y));
            hb.spr_dir = spr_dir;
            hb.draw_xscale = spr_dir;
        }
    }
}
else if (attack == AT_DSTRONG && hbox_num == 6)
{
    draw_xscale = spr_dir;
    if (free) destroyed = true;
}
//==================================================================
//Thunder 
else if (attack == AT_DSPECIAL_2)
{
    if (hbox_num == 1) //upwards feeler
    {
        visible = get_match_setting(SET_HITBOX_VIS);
        if (get_gameplay_time() > dspecial_timing_limiter)
        {
            instance_destroy(self); exit;
        }

        x = player_id.x;
        hsp = player_id.hsp;
        player_id.at_dspecial_thunder_feeler_pos.x = x;
        player_id.at_dspecial_thunder_feeler_pos.y = y;

        //speed corresponds to remaining distance towards target
        vsp = lerp(0, player_id.y - player_id.noz_dspecial_target_spawn_height - y, 0.25 + (hitbox_timer/length)*0.75);

        if (abs(player_id.y - y) > player_id.noz_dspecial_minimum_spawn_height)
        {
            //switch to slide-behavior
            grounds = 55;
            walls = 55; 
        }
    }
    else if (hbox_num == 4) //downwards feeler
    {
        vsp = abs(vsp);
        hsp = 0;
        if !instance_exists(article_nuage)
        {
            //become consistent with thundershock (hitbox 6)
            if (damage < 1)
            {
                hitbox_timer = 0;
                hit_priority = 6;
                damage = 12;
                kb_angle = 90;
                kb_value = 8;
                kb_scale = 1;
                hitpause = 8;
                hitpause_growth = 3;
                hit_flipper = 0;
                no_other_hit = 3;
                hit_effect = HFX_ABS_SWEET_BIG;
                sound_effect = asset_get("sfx_absa_uair");
                stop_effect = false;
            }
            if (!free) || (y > get_stage_data(SD_BOTTOM_BLASTZONE_Y))
            {
                destroyed = true;
            }
        }
        else if (point_distance(x, y, orig_player_id.x, orig_player_id.y - 20) < 30)
        && (article_nuage.foudre_appartenance == orig_player_id) && (!was_parried)
        && (orig_player_id.state == PS_ATTACK_AIR || orig_player_id.state == PS_ATTACK_GROUND)
        {
            with (orig_player_id)
            {
                x = lerp(x, other.x, 0.5);
                attack = AT_DSPECIAL_2;
                window = 3; //shockwave 
                window_timer = 0;
                vsp = get_window_value(AT_DSPECIAL_2, 3, AG_WINDOW_VSPEED);
            }
            article_nuage.foudre_destination_y = orig_player_id.y - (orig_player_id.free ? 20 : 0);
            article_nuage.nouvel_etat = 9; //POW
            destroyed = true;
        }
        else if (!free) || (y > get_stage_data(SD_BOTTOM_BLASTZONE_Y))
        {
            article_nuage.foudre_destination_y = y + 18;
            article_nuage.nouvel_etat = 9; //POW
            destroyed = true;
        }
    }
}

//====================================================================
#define spawn_twinkle()
if ( player_id.anim_do_draw_twinkle)
{
    var radius = image_xscale*200; // Assume circular: WIDTH == HEIGHT
    var kx = x - (radius / 2) + player_id.anim_rand_x * radius;
    var ky = y - (radius / 2) + player_id.anim_rand_y * radius;

    var k = spawn_hit_fx(kx, ky, player_id.vfx_snow_twinkle);
    k.depth = depth - 1;
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
        vsp += lengthdir_y(force, angle);
        //recalculated additive force clamped to a maximum
        force = clamp(point_distance(0, 0, hsp, vsp), 0, player_id.noz_cloudkick_speed);
        angle = point_direction(0, 0, hsp, vsp);
        hsp = lengthdir_x(force, angle);
        vsp = lengthdir_y(force, angle);

        //reset cloud's timer to start of loop
        hitbox_timer = anim_fade_frames;

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