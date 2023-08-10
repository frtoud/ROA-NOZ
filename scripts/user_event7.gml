//USER EVENT 7 - Stat Update
if (request_bot_update)
{
    if (joke_explainer_mode) //Enable JokeExplainer Echo
    {
        jump_sound = sound_get("bot_jumpground");
        land_sound = asset_get("sfx_land_heavy");
        landing_lag_sound = asset_get("sfx_land_heavy");
        
        //set_attack_value(AT_UTILT, AG_SPRITE, sprite_get("utilt_bot"));
        set_window_value(AT_UTILT, 1, AG_WINDOW_SFX, asset_get("sfx_clairen_swing_med"));
        set_hitbox_value(AT_UTILT, 1, HG_VISUAL_EFFECT, 125);
        set_hitbox_value(AT_UTILT, 1, HG_HIT_SFX, asset_get("sfx_absa_harderhit"));

        //set_attack_value(AT_NSPECIAL, AG_SPRITE, sprite_get("nspecial_bot"))
        //set_attack_value(AT_NSPECIAL, AG_AIR_SPRITE, sprite_get("nspecial_bot"));
        set_window_value(AT_NSPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 2);
        set_window_value(AT_NSPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 1);
        set_window_value(AT_NSPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 2);
        set_window_value(AT_NSPECIAL, 3, AG_WINDOW_ANIM_FRAMES, 1);
        set_window_value(AT_NSPECIAL, 3, AG_WINDOW_ANIM_FRAME_START, 2);
        set_window_value(AT_NSPECIAL, 4, AG_WINDOW_ANIM_FRAMES, 1);
        set_window_value(AT_NSPECIAL, 4, AG_WINDOW_ANIM_FRAME_START, 2);
        set_window_value(AT_NSPECIAL, 5, AG_WINDOW_ANIM_FRAMES, -2);
        set_window_value(AT_NSPECIAL, 5, AG_WINDOW_ANIM_FRAME_START, 2);
        set_window_value(AT_NSPECIAL, 2, AG_WINDOW_SFX, sound_get("sfx_noz_bot_todo"));
        set_window_value(AT_NSPECIAL, 4, AG_WINDOW_SFX, sound_get("sfx_noz_bot_kete"));

        //=================================
        //Pokémon Stadium
        pkmn_stadium_name_override = "JK-EX-7000";
        //Mt. Dedede Stadium
        arena_title = "Mechanical Assistant";
        arena_short_name = "JK-EX-7000";
        //Hikaru
        Hikaru_Title = "Joke Explainer";
        //Agent N
        nname = "Joke-Explainer 7000"
        ncode1 = "Compelled to explain 'The Joke' to the nearest person.";
        ncode2 = "Highly mobile, never seems to turn off.";
        ncode3 = "Capture and return to Dr. Andonuts immediately. ";
    }
    else //Restore Nozomi Data
    {
        jump_sound = asset_get("sfx_jumpground");
        land_sound = asset_get("sfx_land_light");
        landing_lag_sound = asset_get("sfx_land");

        set_attack_value(AT_UTILT, AG_SPRITE, sprite_get("utilt"));
        set_window_value(AT_UTILT, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_weak1"));
        set_hitbox_value(AT_UTILT, 1, HG_VISUAL_EFFECT, 0);
        set_hitbox_value(AT_UTILT, 1, HG_HIT_SFX, asset_get("sfx_blow_weak2"));

        set_attack_value(AT_NSPECIAL, AG_SPRITE, sprite_get("nspecial"));
        set_attack_value(AT_NSPECIAL, AG_AIR_SPRITE, sprite_get("nspecial_air"));
        set_window_value(AT_NSPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 2);
        set_window_value(AT_NSPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 1);
        set_window_value(AT_NSPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 2);
        set_window_value(AT_NSPECIAL, 3, AG_WINDOW_ANIM_FRAMES, 3);
        set_window_value(AT_NSPECIAL, 3, AG_WINDOW_ANIM_FRAME_START, 3);
        set_window_value(AT_NSPECIAL, 4, AG_WINDOW_ANIM_FRAMES, 1);
        set_window_value(AT_NSPECIAL, 4, AG_WINDOW_ANIM_FRAME_START, 6);
        set_window_value(AT_NSPECIAL, 5, AG_WINDOW_ANIM_FRAMES, 3);
        set_window_value(AT_NSPECIAL, 5, AG_WINDOW_ANIM_FRAME_START, 7);
        set_window_value(AT_NSPECIAL, 2, AG_WINDOW_SFX, sound_get("sfx_noz_true_todo"));
        set_window_value(AT_NSPECIAL, 4, AG_WINDOW_SFX, sound_get("sfx_noz_true_kete"));

        //=================================
        //Pokémon Stadium
        pkmn_stadium_name_override = "Nozomi";
        //Mt. Dedede Stadium
        arena_title = "Idol Figment";
        arena_short_name = "Smol Nozomi";
        //Hikaru
        Hikaru_Title = "Idol Figment";
        //Agent N
        nname = "Smol Nozomi"
        ncode1 = "Class: Figment     Reward: $1000";
        ncode2 = "Can fly with her twintails. Exhibits cryokinetic powers.";
        ncode3 = "Wanted by 'Haltmann Works' for 'being weaboo trash'...?";

    }

    request_bot_update = false;
}

if (request_rune_update)
{
    //=================================
    // RUNE: Bonus Air Speed
    if (noz_rune_flags.air_control)
    {
        air_accel = 0.5;
        jump_change = 5;
        max_jump_hsp = 7;
        air_max_speed = 7;
    }
    else
    {
        air_accel = .3;
        jump_change = 3;
        max_jump_hsp = 5.5;
        air_max_speed = 5.5;
    }
    noz_uspecial_hover_vspeed = 2 + air_max_speed;
    noz_uspecial_hover_hspeed = 1.5 + air_max_speed;
    noz_uspecial_hover_hstrength = 1.5 * air_accel;

    //=================================
    // RUNE: Enhanced Hover
    if (noz_rune_flags.enhanced_hover)
    {
        noz_uspecial_hover_max = 480 * 2;
    }
    else
    {
        noz_uspecial_hover_max = 480;
    }
    //=================================

    request_rune_update = false;
}
