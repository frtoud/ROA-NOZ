
// Lingering projectile for DTILT has a cooldown; avoids spamming too many at once
if (at_dtilt_proj_cooldown > 0)
{
    at_dtilt_proj_cooldown--;
    if (at_dtilt_proj_cooldown == 0)
    {
        set_num_hitboxes(AT_DTILT, 2); 
    }
}

// Runes & Robots
//==============================================================================
if (request_stats_update)
{
    user_event(7);
    request_stats_update = false;
}

// Climbing Zone
//==============================================================================
if instance_exists(noz_climber_twin) && (noz_climber_is_dead)
{
    if (noz_climber_is_master && noz_climber_twin.noz_climber_is_dead)
    {
        //both are dead, prep respawn
        noz_climber_twin.custom_clone = true;

        death_unstall();
        with (noz_climber_twin) death_unstall();

        noz_climber_twin.noz_climber_is_dead = false;
        noz_climber_is_dead = false;
    }
    else
    {
        //can't stall in respawn state; it confuses CPUs
        death_stall();
    }
}
//should only be relevant for this rune
if (noz_climber_damage_restore > 0)
{
    set_player_damage(player, noz_climber_damage_restore);
    noz_climber_damage_restore = 0;
}

//bonus physics
if instance_exists(noz_climber_twin) && (!noz_climber_twin.noz_climber_is_dead)
{
    var clone_distance = point_distance(x, y, noz_climber_twin.x, noz_climber_twin.y);

    //no jostling if close enough
    go_through = clone_distance < 40;
    //manual jostle when TOO close, tho
    if (clone_distance < 12) && !free && !noz_climber_twin.free
    && (state != PS_ATTACK_GROUND)
    {
        x += (!custom_clone - 0.5) * 2 * spr_dir;
    }

    //always draw partner behind master
    if (custom_clone)
    {
        force_depth = true;
        depth = noz_climber_twin.depth + 1;
    }
}

//Frostzone (Ice, Cloud) bonus
//==============================================================================
if (noz_is_in_frost_zone && !joke_explainer_mode)
{
    noz_frostzone_timer = min(noz_frostzone_timer + noz_frostzone_increment, 
                              noz_frostzone_timer_max)
}
else if (noz_frostzone_timer > 0)
{
    noz_frostzone_timer--;
}
noz_is_in_frost_zone = false;

//FSPECIAL soft cooldown
//==============================================================================
if (move_cooldown[AT_FSPECIAL] < 1 && 
    at_fspecial_soft_cooldown_timer > 0)
{
    at_fspecial_soft_cooldown_timer -= (trueground() ? 2 : 1);

    if (at_fspecial_soft_cooldown_timer <= 0)
    { anim_indicatorflash_timer = anim_indicatorflash_max; }
}

//Extra landing hitbox for DAIR
//==============================================================================
if (state == PS_LANDING_LAG)
{
    off_edge = false;
    //Extra landing hitbox for DAIR when landing (if needed)
    if (attack == AT_DAIR && at_dair_need_landing_lag_hitbox)
    {
        create_hitbox(AT_DAIR, 4, 0, 0); 
        at_dair_need_landing_lag_hitbox = false;
    }
}

//Pratfall gravity dampening
//==============================================================================
if (state == PS_PRATFALL && vsp > noz_pratfall_max_vsp)
{ 
    vsp = noz_pratfall_max_vsp;
}

//USPECIAL hover logic
//==============================================================================
if (at_uspecial_hovering)
{
    fall_through = false;

    //Those states pull you out of Hover
    if (!free || state == PS_HITSTUN   || state == PS_WALL_JUMP
              || state == PS_AIR_DODGE || state == PS_DOUBLE_JUMP)
    {
        at_uspecial_hovering = false;
        at_nair_hover_need_grid_adjust = true;
    }
    else if ( !at_uspecial_exhausted &&
        //exception: no control during USPECIAL window 5 and 6
        !( state == PS_ATTACK_AIR && attack == AT_USPECIAL && 
          (window == 5 || (window == 6 && window_timer < 6))) )
    {
        if (joke_explainer_mode)
        {
            //Hovermode movement logic! now ROB-FLAVORED!

            var hover_cost_mult = 0.5;

            if (up_down)
            {
                hover_cost_mult += 2;
                vsp -= noz_uspecial_hover_vstrength * 1.2;
            }

            if (y < 0) //penalty if above camera view
            { hover_cost_mult -= (y / 16.0); }

            at_uspecial_hover_meter -= hover_cost_mult * 2;
            vsp = clamp(vsp, -noz_uspecial_hover_vspeed * 0.95, (fast_falling ? fast_fall : 0.75*max_fall));
        }
        else if (special_pressed)
        {
            at_uspecial_exhausted = true;
            at_nair_hover_need_grid_adjust = true;
            clear_button_buffer(PC_SPECIAL_PRESSED);
        }
        else
        {
            do_a_fast_fall = false; //prevents weird hover-fastfall

            //Hovermode movement logic!
            var target_hsp = 0;
            var target_vsp = 0;
            var hover_cost_mult = 1.1;
            if (!joy_pad_idle)
            {
                target_hsp = lengthdir_x(noz_uspecial_hover_hspeed, joy_dir);
                target_vsp = lengthdir_y(noz_uspecial_hover_vspeed, joy_dir);
                hover_cost_mult -= lengthdir_y(0.8, joy_dir);
            }

            if (y < 0) //penalty if above camera view
            { hover_cost_mult -= (y / 16.0); }

            at_uspecial_hover_meter -= hover_cost_mult * 2;

            //dampen vertical control depending on meter level
            var exhaustion_factor = 
               0.01 * ease_cubeOut(noz_uspecial_hover_exhaustion_base, 100,
                                   floor(at_uspecial_hover_meter), noz_uspecial_hover_max);

            target_vsp = (target_vsp * exhaustion_factor) 
                       + noz_uspecial_hover_vspeed * (1 - exhaustion_factor);

            if (hsp > target_hsp)
            {
                hsp = (hsp - noz_uspecial_hover_hstrength > target_hsp) ? 
                       hsp - noz_uspecial_hover_hstrength : target_hsp;
            }
            else
            {
                hsp = (hsp + noz_uspecial_hover_hstrength < target_hsp) ? 
                       hsp + noz_uspecial_hover_hstrength : target_hsp;
            }

            if (vsp > target_vsp)
            {
                vsp = (vsp - noz_uspecial_hover_vstrength > target_vsp) ? 
                       vsp - noz_uspecial_hover_vstrength : target_vsp;
            }
            //else: gravity handles it
        }
    }
}
else if (!at_uspecial_was_hovering 
      && !(state == PS_ATTACK_AIR && attack == AT_USPECIAL))
{
    //recharges meter
    at_uspecial_exhausted = false;
    var recharge = (trueground() ? noz_uspecial_hover_recharge 
                                 : noz_uspecial_hover_recharge_air);
    at_uspecial_hover_meter = 
       (at_uspecial_hover_meter >= noz_uspecial_hover_max) ? 
        noz_uspecial_hover_max : at_uspecial_hover_meter + recharge;
}

if (!free || state == PS_HITSTUN || state == PS_WALL_JUMP)
{
    //reallows specials in those circumstances
    at_uspecial_cooldown_override = false;
}

if (!free)
{
    at_uspecial_cooldown_override = false;
    if (trueground())
    {
        at_uspecial_was_hovering = false;
        at_fspecial_cooldown_override = false;
    }
}

if (at_uspecial_hover_meter < 0) 
{
    at_uspecial_hover_meter = 0;
    at_uspecial_exhausted = true;
    at_nair_hover_need_grid_adjust = true;
 
    if (joke_explainer_mode)   //exhausted fuel sfx
    {
        sound_play(asset_get("sfx_abyss_despawn"), false, noone, 0.5, 1.2);
        sound_play(asset_get("sfx_ell_dspecial_explosion_2"), false, noone, 1, 0.8);
    }
}

//Hover ran out
if (at_uspecial_exhausted && at_uspecial_hover_meter == 0)
    && !noz_rune_flags.enhanced_hover
    && !joke_explainer_mode
    && at_uspecial_hovering && (state != PS_PRATFALL)
    && !(state == PS_ATTACK_AIR && attack == AT_USPECIAL)
{
    set_state(PS_PRATFALL);
    at_uspecial_hovering = false;
}

//==============================================================================
//Reflector recharging
if ( (at_reflector_damage_block <= noz_reflector_damage_max) &&
    !((attack == AT_NSPECIAL_2) && (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND)))
{
    at_reflector_damage_block += noz_reflector_recharge_rate;
}
//Reflector-out-of-parry
if (noz_rune_flags.reflector) && shield_down 
&& (state == PS_PARRY) && (window == 2) && (window_timer == 0)
{
    set_attack(AT_NSPECIAL_2);
    hurtboxID.sprite_index = get_attack_value(attack, AG_HURTBOX_SPRITE);

    window = 1; window_timer = 1;
    at_reflector_damage_block = max(noz_reflector_damage_min, 
                                    floor(at_reflector_damage_block));
    user_event(1);
}

//==============================================================================
//Super-Airdodge Rune 
if (state == PS_AIR_DODGE) && (noz_rune_flags.enhanced_dodge)
{
    if (window == 2)
    {
        if (at_airdash_prev_vsp < 0)
            at_airdash_prev_vsp += gravity_speed;
        hsp = at_airdash_prev_hsp;
        vsp = at_airdash_prev_vsp;

        window_timer += 1;
        if (window_timer > 8)
        {
            state = PS_IDLE_AIR;
            state_timer = 2;
        }
    }
    else if (window == 1)
    {
        at_airdash_prev_hsp = hsp;
        at_airdash_prev_vsp = vsp;
    }
}

//Cooldown overrides
//==============================================================================
if (at_uspecial_cooldown_override)
{ 
    //Prevents SPECIALS while hovering
    if !(noz_rune_flags.enhanced_hover)
    {
        move_cooldown[AT_NSPECIAL] += (move_cooldown[AT_NSPECIAL] > 2) ? 0 : 2;
        move_cooldown[AT_FSPECIAL] += (move_cooldown[AT_FSPECIAL] > 2) ? 0 : 2;
        move_cooldown[AT_DSPECIAL] += (move_cooldown[AT_DSPECIAL] > 2) ? 0 : 2;
        move_cooldown[AT_FSPECIAL_2] += (move_cooldown[AT_FSPECIAL_2] > 2) ? 0 : 2;
        move_cooldown[AT_DSPECIAL_2] += (move_cooldown[AT_DSPECIAL_2] > 2) ? 0 : 2;
    }
    
    //Enhanced hover: can reactivate USPECIAL if not hovering/has hover
    if !(noz_rune_flags.enhanced_hover && (at_uspecial_hover_meter > 0)
         && (!at_uspecial_hovering || at_uspecial_exhausted) )
    {
        move_cooldown[AT_USPECIAL] += (move_cooldown[AT_USPECIAL] > 2) ? 0 : 2;
    }
    if (joke_explainer_mode && at_uspecial_hovering)
    {
        move_cooldown[AT_USPECIAL_2] += (move_cooldown[AT_USPECIAL_2] > 2) ? 0 : 2;
    }
}
if (at_fspecial_cooldown_override)
{
    move_cooldown[AT_FSPECIAL] += (move_cooldown[AT_FSPECIAL] > 2) ? 0 : 2;
}

//other_update.gml
//==============================================================================
user_event(0);

//Compat specific
//==============================================================================
//Wall-e
if (walle_taunt_playing)
{
    walle_taunt_buffer = 60 * 12;
}
if (walle_taunt_buffer > 0)
{
    walle_taunt_buffer--;
    suppress_stage_music(0.1, 0.2);
}

//Kirby
if (swallowed && instance_exists(enemykirby))
{
    var ability_spr = sprite_get("cmp_kirby");
    var ability_hurt = sprite_get("cmp_kirby_hurt")
    var ability_icon = sprite_get("cmp_kirby_icon")
    var kirby_sleep_sfx = sound_get("cmp_kirby_sleep")
    with (enemykirby) 
    {
        //Define AT_EXTRA_3 for Kirby
        set_attack_value(AT_EXTRA_3, AG_CATEGORY, 2);
        set_attack_value(AT_EXTRA_3, AG_SPRITE, ability_spr);
        set_attack_value(AT_EXTRA_3, AG_AIR_SPRITE, ability_spr);
        set_attack_value(AT_EXTRA_3, AG_NUM_WINDOWS, 3);
        set_attack_value(AT_EXTRA_3, AG_OFF_LEDGE, 1);
        set_attack_value(AT_EXTRA_3, AG_HURTBOX_SPRITE, ability_hurt);
        
        set_window_value(AT_EXTRA_3, 1, AG_WINDOW_TYPE, 0);
        set_window_value(AT_EXTRA_3, 1, AG_WINDOW_LENGTH, 20);
        set_window_value(AT_EXTRA_3, 1, AG_WINDOW_ANIM_FRAMES, 3);
        
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_TYPE, 0);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_LENGTH, 36);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAMES, 3);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAME_START, 3);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_HAS_SFX, 1);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_SFX_FRAME, 2);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_SFX, kirby_sleep_sfx);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.5);

        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_TYPE, 0);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_LENGTH, 40);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAMES, 8);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAME_START, 6);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.5);

        //absurd values, but prevents movement during the move
        //can_move cannot be set to false for kirby... I suspect update order is at fault
        set_window_value(AT_EXTRA_3, 2, AG_WINDOW_CUSTOM_AIR_FRICTION, 999);
        set_window_value(AT_EXTRA_3, 3, AG_WINDOW_CUSTOM_AIR_FRICTION, 999);

        set_num_hitboxes(AT_EXTRA_3, 0);

        newicon = ability_icon;
        //Nozomi will track this Kirby to handle sleep debuff shenanigans
        noz_handler_id = other;
        noz_has_kirby_ability = true;
    }
    swallowed = false;
}

//DEFINES
//==============================================================================
#define trueground()
return !free && 
   (noone != collision_rectangle( bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, asset_get("solid_32_obj"), false, true) ||
    noone != collision_rectangle( bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, asset_get("obj_stage_article_solid"), false, true) ||
    noone != collision_rectangle( bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, asset_get("obj_stage_article_platform"), false, true) ||
    noone != collision_rectangle( bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, asset_get("jumpthrough_32_obj"), false, true) );

//==============================================================================
#define death_stall()
{
    visible = false;
    state = PS_ATTACK_AIR;
    state_timer = 0;
    attack = AT_EXTRA_4;
    window = 1;
    window_timer = 0;
    hitstop = 2;

    //to have the CPUs focus on the same location
    //note: condition to avoid both climbers teleporting to the death location after respawn
    if (!noz_climber_twin.noz_climber_is_dead)
    {
        x = clamp(noz_climber_twin.x, get_stage_data(SD_LEFT_BLASTZONE_X) + 50, 
                                    get_stage_data(SD_RIGHT_BLASTZONE_X) - 50);
        y = clamp(noz_climber_twin.y, get_stage_data(SD_TOP_BLASTZONE_Y) + 50, 
                                    get_stage_data(SD_BOTTOM_BLASTZONE_Y) - 50);
    }
    can_fast_fall = false;
}
#define death_unstall()
{
    if (attack == AT_EXTRA_4) && (state == PS_ATTACK_AIR)
    {
        spr_dir = noz_climber_twin.spr_dir;
        x = noz_climber_twin.x + spr_dir * (custom_clone ? -20 : 20);
        y = noz_climber_twin.y;
        set_state(PS_RESPAWN);
        state_timer = -1;
        attack = AT_JAB;
    }
}
