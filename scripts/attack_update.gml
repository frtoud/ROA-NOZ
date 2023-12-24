//B - Reversals
if ( attack == AT_NSPECIAL || attack == AT_FSPECIAL 
  || attack == AT_DSPECIAL || attack == AT_USPECIAL)
{
    trigger_b_reverse();
}

//Being in snow empowers certain attacks
if (window == 1) && (window_timer <= 1)
{
    noz_frostzone_empowered = false;
}
noz_frostzone_empowered |= (noz_frostzone_timer > 0) && !joke_explainer_mode;

var can_have_clouds = (noz_frostzone_empowered || noz_rune_flags.cloud_explode) && !joke_explainer_mode;

switch (attack) {
//==============================================================
case AT_JAB:
{
    switch (window)
    {
        case 4: 
        {
            has_hit = false; //reset for this to be accurate about the infinite
            at_jab_timesthrough = 0;
            at_jab_true_total_timesthrough = 0; //not reset; max jabloop for Je7k
        } break;
        //INFINITES
        case 5: case 6: case 7:
        case 8: case 9: case 10:
        {
            move_cooldown[AT_JAB] = 8;
            can_attack = has_hit && (at_jab_timesthrough >= 2);

            if (window_timer == get_window_value(AT_JAB, window, AG_WINDOW_LENGTH))
            {
                at_jab_timesthrough++;
                at_jab_true_total_timesthrough++;

                if (joke_explainer_mode)
                {
                    hsp = clamp(hsp + (right_down - left_down), -dash_speed, dash_speed)
                }
                
                if (attack_down || attack_pressed) && !was_parried
                {
                    //Force loop back
                    at_jab_timesthrough = min(at_jab_timesthrough, 2);
                }
                
                if (at_jab_timesthrough >= 4)
                || (joke_explainer_mode && at_jab_true_total_timesthrough >= 9)
                {
                    window = 11; window_timer = 0;
                }
                else if (window == 10) 
                {
                    window = 5; window_timer = 0;
                }
            }
        } break;
        case 11: 
        {
            can_attack = true;
            move_cooldown[AT_JAB] = 2;

            if (window_timer > get_window_value(AT_JAB, window, AG_WINDOW_CANCEL_FRAME))
            && (has_hit || was_parried || joke_explainer_mode)
            {
                window++;
                window_timer = 1;
                //Window not switched by Rivals: manually applying HSP from move data
                hsp += spr_dir * get_window_value(AT_JAB, window, AG_WINDOW_HSPEED);
            }
        } break;
        default: break;
    }
} break;
//==============================================================
case AT_DTILT: 
{
    if (window == 1)
    {
        set_num_hitboxes(AT_DTILT, can_have_clouds ? 2 : 1);
    }
    else if (has_hit && window == 3) && !was_parried
    {
        move_cooldown[AT_DTILT] = 2;
        can_attack = true;
    }
} break;
//==============================================================
case AT_DATTACK: 
{
    if (window == 1)
    {
        set_num_hitboxes(AT_DATTACK, can_have_clouds ? 2 : 1);
    }
} break;
//==============================================================
case AT_FSTRONG:
{
    if (window == 2)
    {
        //first windbox does not count as a "hit"
        has_hit = false;
        has_hit_player = false;

        if (window_timer == 1) 
        {
            if (noz_rune_flags.wide_strongs && strong_charge >= 30)
            {
                set_hitbox_value(AT_FSTRONG, 4, HG_HITBOX_X, 52);
                set_hitbox_value(AT_FSTRONG, 4, HG_HITBOX_Y, -22);
                set_hitbox_value(AT_FSTRONG, 4, HG_WIDTH, 130);
                set_hitbox_value(AT_FSTRONG, 4, HG_HEIGHT, 130);
            }
            else //restore stats
            {
                set_hitbox_value(AT_FSTRONG, 4, HG_HITBOX_X, 44);
                set_hitbox_value(AT_FSTRONG, 4, HG_HITBOX_Y, -20);
                set_hitbox_value(AT_FSTRONG, 4, HG_WIDTH, 68);
                set_hitbox_value(AT_FSTRONG, 4, HG_HEIGHT, 64);
            }
        }
    }
    else if (window >= 4 && has_hit_player) && !was_parried
    {
        can_jump = true;
    }
} break;
//==============================================================
case AT_DSTRONG:
{
    if (window == 2 && window_timer < 3)
    {
        //first windbox does not count as a "hit"
        has_hit = false;
        has_hit_player = false;
    }

    if (has_hit_player && !was_parried) { can_jump = true; }
    
    //dstrong spreads through ice
    if (noz_rune_flags.dstrong_spread && !hitpause
    && window ==  get_hitbox_value(AT_DSTRONG, 3, HG_WINDOW)
    && window_timer == get_hitbox_value(AT_DSTRONG, 3, HG_WINDOW_CREATION_FRAME))
    {
        var half_width = floor(get_hitbox_value(AT_DSTRONG, 3, HG_WIDTH) / 2);
        var depth_check = 8;
        var rounded_x = round(x) &~7;
        //send out projectiles if it has ground

        //left side?
        var left_test = (noone != collision_line(rounded_x-half_width, y, rounded_x-half_width, y+depth_check, 
                                  asset_get("par_block"), true, true))
                     || (noone != collision_line(rounded_x-half_width, y, rounded_x-half_width, y+depth_check, 
                                  asset_get("par_jumpthrough"), true, true));
                                    
        //right side?
        var right_test = (noone != collision_line(rounded_x+half_width, y, rounded_x+half_width, y+depth_check, 
                                   asset_get("par_block"), true, true))
                      || (noone != collision_line(rounded_x+half_width, y, rounded_x+half_width, y+depth_check, 
                                   asset_get("par_jumpthrough"), true, true));

        var hitbox_number = joke_explainer_mode ? 6 : 5;
        var orientation = joke_explainer_mode ? 1 : -1;

        if (left_test)
        {
            var hb = create_hitbox(AT_DSTRONG, hitbox_number, rounded_x-half_width, floor(y));
            hb.spr_dir = orientation;
            hb.draw_xscale = orientation;
        }
        if (right_test)
        {
            var hb = create_hitbox(AT_DSTRONG, hitbox_number, rounded_x+half_width, floor(y));
            hb.spr_dir = -orientation;
            hb.draw_xscale = -orientation;
        }
    }
} break;
//==============================================================
case AT_USTRONG:
{
    if (window == 2) && (window_timer == 1) 
    {
        if (noz_rune_flags.wide_strongs && strong_charge >= 30)
        {
            set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_Y, -68);
            set_hitbox_value(AT_USTRONG, 2, HG_WIDTH, 130);
            set_hitbox_value(AT_USTRONG, 2, HG_HEIGHT, 130);
        }
        else //restore stats
        {
            set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_Y, -60);
            set_hitbox_value(AT_USTRONG, 2, HG_WIDTH, 80);
            set_hitbox_value(AT_USTRONG, 2, HG_HEIGHT, 75);
        }
    }
    else if (has_hit_player && !was_parried) { can_jump = true; }
} break;
//==============================================================
case AT_NAIR: 
{
    if (at_nair_hover_need_grid_adjust)
    {
        //Adjust NAIR's data values to make the "hover" variants
        if (at_uspecial_hovering && !at_uspecial_exhausted)
        && !joke_explainer_mode
        {
            set_hitbox_value(AT_NAIR, 1, HG_HITBOX_Y, -46);
            set_hitbox_value(AT_NAIR, 2, HG_HITBOX_Y, -46);
            set_hitbox_value(AT_NAIR, 3, HG_HITBOX_Y, -46);
        }
        else
        {
            reset_hitbox_value(AT_NAIR, 1, HG_HITBOX_Y);
            reset_hitbox_value(AT_NAIR, 2, HG_HITBOX_Y);
            reset_hitbox_value(AT_NAIR, 3, HG_HITBOX_Y);
        }
        at_nair_hover_need_grid_adjust = false;
        destroy_hitboxes();
        attack_end();
    }
    
    //Slightly slows fall
    if (free && window == 2 && attack_down)
    { 
        vsp *= (vsp > 2) ? 0.8 : 1; 
        
        if (noz_rune_flags.nair_boost
            && !hitpause && vsp > -5)
        {
            vsp -= 1.5;
        }
    }
    else if (window == 4 && (has_hit || !free) && !was_parried)
    {
    	iasa_script();
    }
} break;
//==============================================================
case AT_DAIR: 
{
    if (window == 1)
    {
        //Cancels hover!
        at_uspecial_hovering = false;
        at_dair_early_cancel = false;
    }
    
    //see update.gml for the extra hitbox when landing.
    at_dair_need_landing_lag_hitbox = (window == 2 || window == 3);
    can_wall_jump = (window > 2);
    can_move = (window > 3);
    
    //Can cancel early if any hitbox hit
    if (has_hit && (window == 4) && !was_parried)
    { 
        iasa_script();
    }
    //Can jump-cancel if the strong hitbox hit something
    else if ((has_hit && window == 2) || at_dair_early_cancel) && !was_parried
    {
        at_dair_early_cancel = true;
        can_jump = true;
    }
    
    if (window <= 2 && !has_hit)
    {
        fall_through = attack_down;
    }
} break;
//==============================================================
case AT_FAIR:
{
    if (noz_rune_flags.aerial_strongs) && (window <= 3)
    {
        attack_down |= (down_stick_down || right_stick_down || left_stick_down || up_stick_down);
        if (strong_charge > 5) && !(at_uspecial_hovering)
        {
            can_move = false;
            hsp *= 0.7;
            vsp = min(vsp*0.7, 0);
        }
    }
    else if (window == 1)
    {
        set_hitbox_value(AT_FAIR, 2, HG_WINDOW, can_have_clouds ? 3 : noone);
    }

    //recovery animation can be skipped (unless parried)
    if (!was_parried && window == 5)
    && (window_timer >= get_window_value(AT_FAIR, 5, AG_WINDOW_CANCEL_FRAME))
    {
        iasa_script();
    }
} break;
//==============================================================
case AT_BAIR:
{
    if (noz_rune_flags.aerial_strongs) && (window <= 3)
    {
        attack_down |= (down_stick_down || right_stick_down || left_stick_down || up_stick_down);
        if (strong_charge > 5) && !(at_uspecial_hovering)
        {
            can_move = false;
            hsp *= 0.7;
            vsp = min(vsp*0.7, 0);
        }
    }
    else if (window == 1)
    {
        set_hitbox_value(AT_BAIR, 2, HG_WINDOW, can_have_clouds ? 3 : noone);
    }
} break;
//==============================================================
case AT_NSPECIAL: 
{
    can_move = false;
    suppress_stage_music(0.5, 0.01);
    //Dampen fallspeeds
    vsp *= (vsp > 3) ? 0.25 : 1;
    
    if (window == 2 || window == 4)
    {
        var sleep_zone_x = x;
        var sleep_zone_y = y - (char_height/2);

        // use a collision test because singing somehow hurts RockWall's pillars
        with (oPlayer)
        {
            if (self != other && (get_player_team(self.player) != get_player_team(other.player))
                && (!free || other.noz_rune_flags.enhanced_sleep) && noz_sleepimmune_timer == 0 && 
                hurtboxID == collision_circle(sleep_zone_x, sleep_zone_y,
                             other.noz_nspecial_radius, hurtboxID, true, false))
            {
                noz_handler_id = other;
                noz_sleep_anim_timer = 0;
                noz_sleepimmune_timer = other.noz_nspecial_sleepimmune_max;

                // base + early hit bonus + (damage * mult) & capped
                noz_sleep_timer = floor( min( (other.noz_nspecial_sleep_base
                   + (other.window == 2 ? other.noz_nspecial_sleep_early : 0)
                   + get_player_damage(player) * other.noz_nspecial_sleep_mult)
                   , other.noz_nspecial_sleep_max) );
            }
        }
    }
} break;
//==============================================================
case AT_FSPECIAL: 
{
    can_jump = (window > 2 && !was_parried);
    off_edge = (window < 4);
    at_fspecial_cooldown_override = true;
    
    if (window == 1)
    {
        if (window_timer == 1)
        {
            if (free)
            {
                at_fspecial_ylock = max(noz_fspecial_ylock_max, (y - (y % 16)));
                if (!noz_rune_flags.ice_longer)
                { set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HSPEED, 6); }
            }
            else
            {
                at_fspecial_ylock = y;
                reset_window_value(AT_FSPECIAL, 2, AG_WINDOW_HSPEED);
            }
            //remove previous ice
            if (noz_rune_flags.ice_longer)
            {
                with (obj_article1) if (player_id == other)
                {
                    should_die = true;
                }
                with (obj_article_platform) if (player_id == other)
                {
                    should_die = true;
                }
            }
        }
        else if (free)
        {
            //lengthen easing
            if (abs(y - at_fspecial_ylock) > 48)
            {
                y += 16 * sign(at_fspecial_ylock - y);
                window_timer--;
            }
            else
            {
                y = ease_linear(y, at_fspecial_ylock, window_timer, 
                get_window_value(AT_FSPECIAL, 1, AG_WINDOW_LENGTH));
            }
        }
    }
    else if (window == 2 || window == 3)
    {
        if (window_timer == 1 && window == 2)
        {
            move_cooldown[AT_FSPECIAL] = noz_fspecial_cooldown;
            at_fspecial_on_soft_cooldown = at_fspecial_soft_cooldown_timer > 0;
            at_fspecial_started_free = free;
            
            set_window_value(AT_FSPECIAL, 3, AG_WINDOW_LENGTH, 
                            (free && !noz_rune_flags.ice_longer) ? 24 : 32);
            if (!at_fspecial_on_soft_cooldown)
            {
                at_fspecial_soft_cooldown_timer = noz_fspecial_soft_cooldown_max;
            }
        }
        
        y = at_fspecial_ylock;
        
        if (!joy_pad_idle)
        {
            var hsp_mult = lengthdir_x(1, joy_dir);
            if (hsp_mult * spr_dir >= 0)
            {
                //dampen friction
                hsp += hsp_mult * 0.1;
            }
            else
            {
                //reverse direction
                hsp += hsp_mult * 0.6;
            }
        }
        
        //Create new ice as you go
        // try find existing ice if possible
        var existingplat = find_ice_platform("obj_article1", x)
                        || find_ice_platform("obj_article_platform", x);

        if (!existingplat)
        {
            //check if grounded or not (free stops being accurate once platforms spawn)
            var col = collision_line(x, y-1, x, y+1, asset_get("par_block"), false, true);
            if (col == noone)
            {
                col = collision_line(x, y-1, x, y+1, asset_get("par_jumpthrough"), false, true);
                if instance_exists(col) && (y != get_instance_y(col)) 
                    col = noone; //underside-of-platform false-positive
            }

            var x_pos = x + 8 - (x % 16); //centered on a 16x16 grid
            if (col == noone)
            {
                if (at_fspecial_started_free && at_fspecial_on_soft_cooldown)
                    spawn_hit_fx(x_pos, floor(y), vfx_article_despawn);
                else
                    instance_create(x_pos, floor(y), "obj_article_platform");
            }
            else
            {
                x_pos = x + 8 - ((1600 + x - get_instance_x(col)) % 16);
                instance_create(x_pos, floor(y), "obj_article1");
            }
        }
        
        if (window == 3 && was_parried)
        {
            window = 4;
            window_timer = 0;
        }
    }
    else if (!was_parried) //window 4
    {
        if (window_timer == 5) && (free && hsp * spr_dir >= 0) ||
           (hsp == 0 && !joy_pad_idle && (spr_dir * lengthdir_x(1, joy_dir)) > 0)
        {
            set_state(PS_IDLE_AIR); //set hurtbox
            state = PS_DOUBLE_JUMP;
            state_timer = 1; //avoid doublejump SFX
            vsp = -3;
            hsp = spr_dir * 3;
            off_edge = true;
        }
        else if (window_timer >= 5)
        {
            iasa_script();
        }
    }

} break;
//==============================================================
case AT_FSPECIAL_2: 
{
    can_move = (window == 7);
    can_fastfall = false;
    can_wall_jump = (window > 3) && !was_parried;

    if (window == 1)
    {
        at_fspecial_missile_charge = 0;
        if (vsp > 0) vsp *= noz_rune_flags.ice_longer ? 0.3 : 0.5;
    }
    else if (window == 2)
    {
        //hold to charge
        if (window_timer == get_window_value(AT_FSPECIAL_2, 2, AG_WINDOW_LENGTH) - 1)
         && special_down && ( (at_fspecial_missile_charge < noz_fspecial_chargetime)
                            || noz_rune_flags.ice_longer ) //can go beyond normal charge times
        {
            window_timer--;
            at_fspecial_missile_charge++;
        }
    }
    else if (window == 3)
    {
        if (at_fspecial_missile_charge == noz_fspecial_misfire_frame) 
        && (window_timer == 1)
        {
            //"misfire"!
            at_fspecial_missile_charge += noz_fspecial_misfire_bonus;

            white_flash_timer = 12;
            hitpause = true;
            hitstop = 15;
            hitstop_full = 15;
            old_vsp = 0;
            old_hsp = 0;
            sound_play(asset_get("sfx_ell_dspecial_explosion_1"), false, noone, 1.6);
            sound_play(asset_get("sfx_panda_taunt_vote"), false, noone, 1, 1.5);
            spawn_hit_fx(x - spr_dir*20, y-16, HFX_ELL_NSPEC_BREAK);
        }

        if (window_timer == 4)
        {
            var effective_charge = clamp(1.0 * at_fspecial_missile_charge/noz_fspecial_chargetime, 0, 1)
            if (noz_rune_flags.ice_longer)
            {
                var excess_charge = at_fspecial_missile_charge - noz_fspecial_chargetime;
                effective_charge += clamp(0.01 * ease_cubeOut(0, 100, excess_charge, noz_fspecial_chargetime), 0, 1);
            }
            //Setup distance boost
            var hspeed_granted = 8 + effective_charge * 12;
            set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_HSPEED, hspeed_granted);
            set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_VSPEED, free ? -0.5 : -2.2 );

            var friction_required = (hspeed_granted - get_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_CUSTOM_AIR_FRICTION)
                                                    * get_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_LENGTH) )
                                                    / get_window_value(AT_FSPECIAL_2, 5, AG_WINDOW_LENGTH);
            set_window_value(AT_FSPECIAL_2, 5, AG_WINDOW_CUSTOM_AIR_FRICTION, friction_required);
            
            var bonus_anim = (at_fspecial_missile_charge > noz_fspecial_chargetime/2);
            set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_ANIM_FRAMES,      bonus_anim ?  3 :  1 );
            set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_ANIM_FRAME_START, bonus_anim ?  8 : 14 );
            set_window_value(AT_FSPECIAL_2, 5, AG_WINDOW_ANIM_FRAMES,      bonus_anim ?  4 :  1 );
            set_window_value(AT_FSPECIAL_2, 5, AG_WINDOW_ANIM_FRAME_START, bonus_anim ? 11 : 14 );
            set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_SFX, bonus_anim ? asset_get("sfx_ell_arc_small_missile_ground") 
                                                                         : asset_get("sfx_ori_spirit_flame_hit_1"));

            //Setup damage boost
            set_hitbox_value(AT_FSPECIAL_2, 1, HG_DAMAGE, 6 + effective_charge*14);
            set_hitbox_value(AT_FSPECIAL_2, 1, HG_KNOCKBACK_SCALING, 0.6 + effective_charge*0.5);
        }
    }
    else if (window == 4)
    {
        vsp *= 0.95;
    }
    
    //mishap prevention: bounce off blastzones if supercharged
    if (window == 4 || window == 5)
    && (at_fspecial_missile_charge > noz_fspecial_chargetime/2)
    {
        var predicted_pos = round(x + hsp);
        if (predicted_pos != clamp(predicted_pos, get_stage_data(SD_LEFT_BLASTZONE_X) + 20, 
                                                  get_stage_data(SD_RIGHT_BLASTZONE_X) - 20) )
        && (get_stage_data(SD_LEFT_BLASTZONE_X) != get_stage_data(SD_RIGHT_BLASTZONE_X))
        {
            hsp *= -1; vsp = -4;
            hsp = clamp(hsp, -8, 8);

            //some hitpause for good measure
            old_hsp = hsp; old_vsp = vsp;
            hitpause = true; hitstop = 8;
            hitstop_full = hitstop;

            window = 6; window_timer = 0;
            sound_stop(get_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_SFX));
            sound_play(asset_get("sfx_clairen_arc_bounce"), false, noone, 3);
            destroy_hitboxes();
        }

    }

    if !free && (window > 4)
    {
        if (window == 7)
        {
            set_state(PS_LAND);
        }
        else 
        {
            set_state(PS_LANDING_LAG);
            landing_lag_time = get_attack_value(AT_FSPECIAL_2, AG_LANDING_LAG);
        }
    }
} break;
//==============================================================
case AT_USPECIAL: 
{
    switch (window)
    {
        case 1:
        {
            anim_hover_hair_frame = 0;
            set_window_value(AT_USPECIAL, 2, AG_WINDOW_GOTO, 0);
            if (!special_down || at_uspecial_was_hovering)
            {
                if (window_timer < 8) && 
                (!at_uspecial_was_hovering || noz_rune_flags.enhanced_hover)
                {
                    //Tap: Smaller attack, activates hover directly
                    window = 6;
                    window_timer = 0;
                    //Manually applying VSP from move data
                    vsp += get_window_value(AT_USPECIAL, window, AG_WINDOW_VSPEED);
                    
                    if (at_uspecial_was_hovering) 
                    {
                        at_uspecial_hover_meter -= noz_uspecial_short_cost; 
                        at_uspecial_exhausted = false;
                    }
                }
                else
                {
                    window = 2;
                    window_timer = 0;
                    //Shorter version: Skip middle window
                    set_window_value(AT_USPECIAL, 2, AG_WINDOW_GOTO, 4);
                    if (free) { at_uspecial_hover_meter -= noz_uspecial_short_cost; }
                }
            }
            //special was held; transitions normally to the longest attack
            else if (free && window_timer == get_window_value(AT_USPECIAL, window, AG_WINDOW_LENGTH))
            {
                at_uspecial_hover_meter -= noz_uspecial_long_cost;
            }
        } break;
        case 2:
        {
            if (window_timer == 1)
            {
                if (at_uspecial_was_hovering || at_uspecial_hover_meter <= 0)
                && (!noz_rune_flags.enhanced_hover)
                { 
                    at_uspecial_hover_meter = -1;
                    set_window_value(AT_USPECIAL, 5, AG_WINDOW_TYPE, 7);
                }
                else
                {
                    reset_window_value(AT_USPECIAL, 5, AG_WINDOW_TYPE);
                }
            }
        } break;
        case 4:
        {
            can_move = false;
            sound_stop(asset_get("sfx_ori_stomp_spin"));
            vsp = min(vsp, 0);
        }break;
        case 5:
        {
            can_move = false;
            vsp = min(vsp, 0);
            
            //initiate HoverMode!
            //See update.gml for the rest of this logic
            if (window_timer <= 1)
            {
                at_uspecial_hovering = true;
                at_uspecial_was_hovering = true;
                at_uspecial_cooldown_override = true;
                at_nair_hover_need_grid_adjust = true;
            }
        }break;
        case 6:
        {
            if (window_timer > 6)
            {
            	iasa_script();
            }
            //initiate HoverMode!
            //See update.gml for the rest of this logic
            else if (window_timer <= 1)
            {
                at_uspecial_hovering = true;
                at_uspecial_was_hovering = true;
                at_uspecial_cooldown_override = true;
                at_nair_hover_need_grid_adjust = true;
                clear_button_buffer(PC_SPECIAL_PRESSED);
            }
            
        }break;
        default: break;
    }
} break;
//==============================================================
case AT_USPECIAL_2: 
{
    if (window == 1)
    {
        if (vsp > 0) vsp *= 0.7;
    }
    if (window == 2)
    {
        //initiate HoverMode!
        //See update.gml for the rest of this logic
        if (window_timer <= 1)
        {
            if (at_uspecial_was_hovering)
            {
                at_uspecial_hover_meter -= noz_uspecial_medium_cost; 
            }

            at_uspecial_hovering = true;
            at_uspecial_was_hovering = true;
            at_uspecial_cooldown_override = true;
            clear_button_buffer(PC_SPECIAL_PRESSED);
        }

        //prevents update.gml from removing the hover status too early.
        //this can be important when landing DURING window 2; resetting hover prematurely. 
        free = true;
    }
} break;
//==============================================================
case AT_DSPECIAL: 
{
    if (window == 1)
    {
        can_move = false;
        //Dampen fallspeeds
        vsp *= (vsp > 3) ? 0.25 : 1;
        set_window_value(AT_DSPECIAL, 2, AG_WINDOW_VSPEED, -(free ? 3 : 4.5));
    }
    else if (window == 2) && (window_timer == 1) && (!hitpause)
    {
        sound_play(asset_get("sfx_orca_snow_mouth"), false, noone, 0.5, 1.2);
        //spawn cloud
        var cloud = instance_create(x, floor(y) - 20, "obj_article2");
        cloud.vsp = clamp(vsp - 4, -9, -4);
        cloud.hsp = hsp;
        
        move_cooldown[attack] = noz_dspecial_cooldown;
    }
} break;
//==============================================================
case AT_DSPECIAL_2: 
{
    if (window == 2) 
    {
        if (vsp > 0) vsp *= 0.95;
        can_move = false;

         if (window_timer == 1) && !hitpause
         && !noz_rune_flags.cloud_explode
         {
            var article_pos = { x:x, y:(y - noz_dspecial_target_spawn_height) };
            if (at_dspecial_thunder_feeler_pos.y < (y - noz_dspecial_minimum_spawn_height) )
            {
                article_pos = at_dspecial_thunder_feeler_pos;
            }
            var cloud = instance_create(floor(article_pos.x), floor(article_pos.y), "obj_article3");

            move_cooldown[attack] = jex_dspecial_cooldown;
         }
         else if (window_timer == get_window_value(AT_DSPECIAL_2, 2, AG_WINDOW_LENGTH))
         {
            window = 4;
            window_timer = 0;
         }
    }
} break;
//==============================================================
case AT_NSPECIAL_2: //Reflector
{
    can_jump = (window <= 2);
    switch (window)
    {
        case 1: //Reflector
        {
            can_move = false;
            can_fast_fall = false;

            user_event(1); //reflection logic here
            if (!shield_down)
            {
                window = 2;
                window_timer = 0; 
            }
            else if (window_timer == get_window_value(AT_NSPECIAL_2, 1, AG_WINDOW_LENGTH))
            {
                window_timer = 0; 
            }
        } break;
        case 3: //Instaparry window
        {
            window = 1;
            window_timer = 0;
            init_shader();
        }
        case 4: //Vulnerable window
        {
            window = 1;
            window_timer = 0;
        } break;
        case 2: //Counter Endlag window
        default:
        break;
    }
} break;
//==============================================================
case AT_TAUNT:
{
    can_move = false;
    if (window == 4 && window_timer == get_window_value(AT_TAUNT, 4, AG_WINDOW_LENGTH)
    && !respawn_taunt)
    {
        //This taunt preserves momentum or could be performed on a moving platform.
        //Nozomi should usually reach the ground before the end of this window.
        set_state(PS_IDLE_AIR);
    }
} break;
//==============================================================
case AT_TAUNT_2:
{
    can_move = false;
    if (window == 3 && window_timer == get_window_value(AT_TAUNT_2, 3, AG_WINDOW_LENGTH)
    && !respawn_taunt)
    {
        //This taunt preserves momentum or could be performed on a moving platform.
        //Joke Explainer should usually reach the ground before the end of this window.
        set_state(PS_IDLE_AIR);
    }
    else if (0 != get_window_value(AT_TAUNT_2, window, AG_WINDOW_CANCEL_FRAME))
     && (window_timer >= get_window_value(AT_TAUNT_2, window, AG_WINDOW_CANCEL_FRAME))
    {
        iasa_script();
    }
} break;
//==============================================================
default: break;
}

//universal jumpcancelling
var is_aerial = (attack == AT_NAIR || attack == AT_DAIR || attack == AT_UAIR
              || attack == AT_FAIR || attack == AT_BAIR)
if (noz_rune_flags.jumpcancels && is_aerial && has_hit_player && !was_parried)
{
    can_jump = true;
    if (jump_pressed && djumps >= max_djumps)
    {
        //free simulated jump
        set_state(PS_DOUBLE_JUMP);
        move_cooldown[attack] = 5;
        if (hitpause) old_vsp = -djump_speed;
        else vsp = -djump_speed;
    }
}

//==============================================================
#define find_ice_platform(asset_name, xpos)
{
    //same function used in both contexts, simplified here
    var existingplat = false;

    with (asset_get(asset_name)) if (player_id.url == other.url)
    //x check: formalize width? also relevant for modulo operation...
    && (abs(y - other.y) < 2) && (x-8 <= xpos) && (x+8 >= xpos)
    {
        if (player_id == other)
        {
            article_timer = 0;
            spr_dir = other.spr_dir;
            existingplat = true;
            break;
        }
        else
        {
            should_die = true;
            mask_index = asset_get("empty_sprite");//needed to turn this collider off
            break;
        }
    }

    return existingplat;
}

