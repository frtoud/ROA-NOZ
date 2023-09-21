//Precalculate this for all projectile snow effects
//==============================================================================
anim_do_draw_twinkle = (get_gameplay_time() % 3 == 0);
anim_rand_x = random_func(0, 100, true) / 100.0;
anim_rand_y = random_func(1, 100, true) / 100.0;
anim_rand_twinkle = random_func(2, 32, true);

//Hud meter animation
//==============================================================================
if (anim_hud_fadeout > 0)
{
    anim_hud_fadeout--;
}
if ((at_uspecial_hover_meter < noz_uspecial_hover_max || anim_hud_rollin > 0)
     && anim_hud_rollin < anim_hud_timers_max)
{
     anim_hud_rollin++;
}
if (at_uspecial_hover_meter >= noz_uspecial_hover_max
    && anim_hud_rollin >= anim_hud_timers_max)
{
    anim_hud_rollin = 0;
    anim_hud_fadeout = anim_hud_timers_max;
}

if (anim_indicatorflash_timer > 0)
{
    anim_indicatorflash_timer--;
}

//Hair hoverframe calculation + sound effect
//==============================================================================
var thruster_sfx_strength = 0; //set to zero or below to remove sfx
if (at_uspecial_hovering)
{
    if (joke_explainer_mode)
    {
        if (!at_uspecial_exhausted && up_down) || (vsp < -2)
             jex_hover_frame_counter -= 2;
        else jex_hover_frame_counter += 1;
        jex_hover_frame_counter = clamp(jex_hover_frame_counter, 0, 20);

        if (at_uspecial_exhausted)
        {   //empty
            if (get_gameplay_time() % 3 == 0)
                spawn_twinkle(vfx_thrusters_empty, x, y - 14, 40, false);
            
            anim_hover_hair_frame = 7;
        }
        else if (up_down || up_pressed)
        {   //active
            thruster_sfx_strength = 2;
            anim_hover_hair_frame = floor(get_gameplay_time() / 3) % 4;
        }
        else
        {   //idle
            thruster_sfx_strength = 1;
            anim_hover_hair_frame = 4 + floor(get_gameplay_time() / 2) % 3;
        }

    }
    else
    {
        var hair_animspeed_index = 0;

        if (at_uspecial_exhausted)
        { hair_animspeed_index = 0; }
        else if (0.33 > at_uspecial_hover_meter/noz_uspecial_hover_max)
        { hair_animspeed_index = 1; }
        else if (0.66 > at_uspecial_hover_meter/noz_uspecial_hover_max) 
        { hair_animspeed_index = 2; }
        else 
        { hair_animspeed_index = 3; }

        if (!at_uspecial_exhausted && !joy_pad_idle
        && !(state == PS_ATTACK_AIR && attack == AT_USPECIAL))
        {
            if ( (joy_dir >  40 && joy_dir < 140)
            || (state == PS_ATTACK_AIR && attack == AT_NAIR))
            { hair_animspeed_index++; }
            else if (joy_dir > 220 && joy_dir < 310)
            { hair_animspeed_index--; }
        }

        anim_hover_hair_frame += anim_hover_hair_rates[hair_animspeed_index];

        if (anim_hover_hair_frame >= 4)
        {
            anim_hover_hair_frame %= 4;
            //Sound effect tied to animation
            sound_play(asset_get("sfx_birdflap"), false, noone, 1, 
            0.75 + anim_hover_hair_rates[hair_animspeed_index]);
        }
    }
}

//piggybacking on this system for Dash thrusters
if (joke_explainer_mode)
{
    if (state == PS_DASH || state == PS_DASH_TURN)
        thruster_sfx_strength = 0.9;
    else if (state == PS_DASH_STOP)
        thruster_sfx_strength = 0.3;
}

if (thruster_sfx_strength > 0)
{
    if (noone == thrusters_sfx)
        thrusters_sfx = sound_play(asset_get("sfx_ell_hover"), true, noone);
    
    var exhaust_pitch = 1 - 0.01 * ease_expoOut(0, 100, floor(at_uspecial_hover_meter), noz_uspecial_hover_max);
    sound_pitch(thrusters_sfx, 0.3 + 0.4 * thruster_sfx_strength  + exhaust_pitch);
    sound_volume(thrusters_sfx, 0.25 + 0.25 * thruster_sfx_strength, 250);
}
else if (noone != thrusters_sfx)
{
    sound_stop(thrusters_sfx);
    thrusters_sfx = noone;
}

//Bonus
if (anim_hairblink_timer < anim_hairblink_max &&
   (!at_uspecial_hovering && at_uspecial_was_hovering || at_uspecial_exhausted ))
{
    anim_hairblink_timer++;
}
else if (anim_hairblink_timer > 0 && !at_uspecial_was_hovering)
{
    anim_hairblink_timer--;
}
//==============================================================================
switch (state)
{
    case PS_DASH_START:
    {
        if (joke_explainer_mode) && (state_timer == initial_dash_time - 3)
        {
            sound_play(get_window_value(AT_USPECIAL_2, 2, AG_WINDOW_SFX),
                       false, noone, 0.3, 3.7);
        }
    } break;
    case PS_PRATLAND:
    {
        if (!was_parried)
        {
            sprite_index = pratland_spr;
            image_index = floor(image_number * (state_timer/prat_land_time));
        }
    } break;
    case PS_HITSTUN:
    case PS_HITSTUN_LAND:
    {
        image_index = hitpause ? 0 : 1;
    } break;
    case PS_IDLE_AIR:
    {
        if (at_uspecial_hovering)
        {
            if (joke_explainer_mode)
            {
                sprite_index = jex_hover_spr;
                image_index = floor(jex_hover_frame_counter/5);
            }
            else
            {
                sprite_index = idle_hover_spr;
                
                //Exhausted -> Uses DOWNWARD
                if (at_uspecial_exhausted)
                        { image_index = 4; }
                //NEUTRAL
                else if (joy_pad_idle)
                        { image_index = 0; }
                //BACKWARD
                else if ( (spr_dir > 0 && (joy_dir >= 130 && joy_dir <= 230))
                    || (spr_dir < 0 && (joy_dir <=  50 || joy_dir >= 310)) )
                        { image_index = 1; }
                //UPWARD
                else if (joy_dir >  50 && joy_dir < 130)
                        { image_index = 2; }
                //FORWARD
                else if ( (spr_dir > 0 && (joy_dir <=  50 || joy_dir >= 310))
                    || (spr_dir < 0 && (joy_dir >= 130 && joy_dir <= 230)) )
                        { image_index = 3; }
                //DOWNWARD
                else    { image_index = 4; }
            }
        }
        else if (prev_state == PS_ATTACK_AIR)
        { 
            image_index = 5;
        }
    } break;
    case PS_DOUBLE_JUMP:
    {
        if (state_timer <= 1) 
        { noz_anim_back_flipping = (hsp * spr_dir) < 0; }

        if (noz_anim_back_flipping)
        { sprite_index = noz_anim_backflip_spr; }
    } break;
    case PS_LANDING_LAG:
    {
        sprite_index = sprite_get("land");
    } break;
    case PS_WALL_JUMP:
    {
        if (state_timer < 4)
        { 
            image_index = 0;
        }
    } break;
    case PS_ATTACK_GROUND:
    case PS_ATTACK_AIR:
    {
        //Moved this logic in parallel to not clog up attack_update
        switch (attack)
        {
//==================================================================
            case AT_DTILT:
            case AT_DATTACK:
            {
                if !hitpause && (window == 2) && (window_timer == 0)
                && noz_frostzone_empowered
                {
                    create_hitbox(AT_DATTACK, 5, x, y); //see hitbox_update for position
                    sound_play(asset_get("sfx_waveland_eta"), false, noone, 1, 1.6);
                }
                
            }break;
//==================================================================
            case AT_FSTRONG:
            {
                if (window == 1 && strong_charge > 0)
                {
                    image_index = 1 + (strong_charge / 6) % 4;
                    
                    if (get_gameplay_time() % 4 == 0)
                    {
                        spawn_twinkle(vfx_snow_twinkle, x - (20 * spr_dir),
                                      y - 20, 10, true);
                    }
                }
                else if !hitstop && (window == 3) && (window_timer == 0)
                {
                    var xpos = x + get_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_X) * spr_dir;
                    var ypos = y + get_hitbox_value(AT_FSTRONG, 2, HG_HITBOX_Y);
                    spawn_hit_fx(xpos, ypos, vfx_ice_big);
                }
                else if (get_gameplay_time() % 2 == 0) && (window == 3)
                {
                    spawn_twinkle(vfx_snow_twinkle, x + (32 * spr_dir), y - 20, 
                                  get_hitbox_value(AT_FSTRONG, 2, HG_WIDTH), false);
                }
                
            }break;
//==================================================================
            case AT_USTRONG:
            {
                if (window == 1 && strong_charge > 0
                     && (get_gameplay_time() % 4 == 0) )
                {
                    spawn_twinkle(vfx_snow_twinkle, x, y - 6, 10, true);
                }
                if (!hitstop && window == 2 && window_timer == 
                (get_hitbox_value(AT_USTRONG, 1, HG_WINDOW_CREATION_FRAME)) )
                { 
                    spawn_hit_fx(x, y + get_hitbox_value(AT_USTRONG, 2, HG_HITBOX_Y), vfx_ice_big);
                }
                else if ((get_gameplay_time() % 2 == 0)
                 && window == 2 && window_timer > 
                get_hitbox_value(AT_USTRONG, 1, HG_WINDOW_CREATION_FRAME))
                {
                    spawn_twinkle(vfx_snow_twinkle, x,
                                  y + get_hitbox_value(AT_USTRONG, 2, HG_HITBOX_Y), 
                                  get_hitbox_value(AT_USTRONG, 2, HG_WIDTH), false);
                }
            }break;
//==================================================================
            case AT_DSTRONG:
            {
                if (window == 1 && strong_charge > 0
                    && (get_gameplay_time() % 4 == 0) )
                {
                    spawn_twinkle(vfx_snow_twinkle, x - (spr_dir * 20),
                                                    y - 48, 10, true);
                }
            }break;
//==================================================================
            case AT_NSPECIAL:
            {
                if (window_timer == 0) && (window == 2 || window == 4)
                {
                    var which_fx = spr_dir * (window == 2 ? 1 : -1);
                    var k = spawn_hit_fx(x, y-24, (which_fx < 0 ? vfx_rnotes 
                                                                : vfx_lnotes) );
                    k.spr_dir = 1;
                    k.depth = depth - 1;
                }
            }break;
//==================================================================
            case AT_FSPECIAL:
            {
                if ((window == 2 || window == 3) && get_gameplay_time() % 2 == 0)
                {
                    spawn_twinkle(vfx_snow_twinkle, x - (spr_dir * 8), y - 16,
                                  get_hitbox_value(AT_FSPECIAL, 2, HG_WIDTH), false);
                }
            }break;
//==================================================================
            case AT_USPECIAL:
            {
                if (window == 1) 
                {
                    if (free) { image_index = 1; }
                    if (window_timer % 8 >= 4)
                    {
                        strong_flashing = true;
                    }
                }
                else if (image_index == 15)
                && (get_window_value(AT_USPECIAL, 5, AG_WINDOW_TYPE) == 7) 
                { image_index = 22; } //Exhausted frame; going to pratfall
            }break;
//==================================================================
            case AT_USPECIAL_2: //JEX
            {
                jex_hover_frame_counter = 0;

                if (window == 2) && (window_timer == 0) && !hitpause 
                {
                    sound_play(get_window_value(AT_USPECIAL_2, 2, AG_WINDOW_SFX),
                        false, noone, 0.7, 2.5);
                }
            }break;
//==================================================================
            case AT_NAIR:
            {
                //Landed NAIR case: don't use hover sprites
                if (at_uspecial_hovering && !at_uspecial_exhausted) 
                { use_hover_sprite(); } 
            }break;
            case AT_FAIR:
            {
                use_hover_sprite();
                if (get_num_hitboxes(AT_FAIR) == 1)
                && (window == get_hitbox_value(AT_FAIR, 2, HG_WINDOW))
                && (window_timer <= get_hitbox_value(AT_FAIR, 2, HG_WINDOW_CREATION_FRAME))
                {
                    spawn_twinkle(vfx_snow_twinkle, x + (spr_dir * 32), y - 24, 24, false)
                }

                if (window == 1 && strong_charge > 0)
                {
                    image_index = get_window_value(AT_FAIR, 2, AG_WINDOW_ANIM_FRAME_START);
                }
            }break;
            case AT_BAIR:
            {
                use_hover_sprite();
                if (get_num_hitboxes(AT_BAIR) == 1)
                && (window == get_hitbox_value(AT_BAIR, 2, HG_WINDOW))
                && (window_timer <= get_hitbox_value(AT_BAIR, 2, HG_WINDOW_CREATION_FRAME))
                {
                    spawn_twinkle(vfx_snow_twinkle, x + (spr_dir * -32), y - 24, 24, false)
                }

                if (window == 1 && strong_charge > 0)
                {
                    image_index = get_window_value(AT_BAIR, 2, AG_WINDOW_ANIM_FRAME_START);
                }
            }break;
            case AT_UAIR:
            {
                use_hover_sprite();
            }break;
//==================================================================
            case AT_NTHROW: //Reflector Rune
            {
                if free && ((image_index == 5) || (image_index == 6))
                {
                    //Aerial sprites
                    image_index += 2;
                }
            }break;
            default:
            break;
        }
    }break;
    default:
    break;
};

//===========================================================
//Ice-empowered visuals
if (noz_frostzone_timer > 0)
|| (noz_frostzone_empowered && (state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR))
{
    if (strong_flashing) manual_flash = 8;
    if (get_gameplay_time() % 2 == 0)
    {
        spawn_twinkle(vfx_snow_twinkle, x, y - 24, 48, false)
    }
}

//===========================================================    
// Reflector effects
if (anim_reflector_shockwave_frame > 0) 
    { anim_reflector_shockwave_frame -= 1; }
if (anim_fakeparry_timer > 0) 
    { anim_fakeparry_timer -= 1; }

//===========================================================
// JE7k alt switch -- thx Muno
if (joke_explainer_mode)
{
    //See structure in init.gml
    for (var i = 0; i < array_length(noz_joke_explainer_sprites); i++)
    {
        if (sprite_index == noz_joke_explainer_sprites[i].noz)
        {
            sprite_index = noz_joke_explainer_sprites[i].jex;

            //Manually looping animations
            switch (noz_joke_explainer_sprites[i].loops)
            {
                case PS_IDLE:
                    image_index = floor(state_timer * idle_anim_speed) % image_number; 
                break;
                case PS_WALK:
                    image_index = floor(state_timer * walk_anim_speed) % image_number; 
                break;
                case PS_DASH:
                    image_index = floor(state_timer * dash_anim_speed) % image_number; 
                break;
                case PS_PRATFALL:
                    image_index = floor(state_timer * pratfall_anim_speed) % image_number; 
                break;
                default: break;
            } break;
        }
    }
}

//===========================================================     
#define spawn_twinkle(vfx, pos_x, pos_y, width, front)
{
    var kx = pos_x - (width / 2) + anim_rand_x * width;
    var ky = pos_y - (width / 2) + anim_rand_y * width;
    
    var k = spawn_hit_fx(kx, ky, vfx);
    if (front)
    {
        k.depth = depth - 1;
    }
}
//===========================================================
#define use_hover_sprite()
{
    //Hover-Aerial sprite variants!
    //Uses an attack index to generalize logic
    var alt_sprite = get_attack_value(attack, AG_NOZ_HOVER_SPRITE);
    if (at_uspecial_hovering && alt_sprite != 0) 
    { sprite_index = alt_sprite; }
}