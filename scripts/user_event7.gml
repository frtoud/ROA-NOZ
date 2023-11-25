//USER EVENT 7 - Stat Update

if (!custom_clone)
   set_UI(joke_explainer_mode)

if (joke_explainer_mode) //Enable JokeExplainer Echo
{
    jump_sound = sound_get("bot_jumpground");
    djump_sound = asset_get("sfx_ell_small_missile_ground");
    land_sound = asset_get("sfx_land_heavy");
    landing_lag_sound = asset_get("sfx_land_heavy");
    waveland_sound = asset_get("sfx_waveland_gus");
    
    set_attack_value(AT_JAB, AG_SPRITE, sprite_get("jex_jab"));
    set_window_value(AT_JAB, 4, AG_WINDOW_HSPEED, 3.4);
    set_hitbox_value(AT_JAB, 2, HG_EXTRA_HITPAUSE, 0);
    //Defines WINDOWS 5-10
    for (var i = 0; i < 6; i++)
    {
        var w = 5+i;
        var h = 2+i;
        set_window_value(AT_JAB, w, AG_WINDOW_LENGTH, 6);
        set_window_value(AT_JAB, w, AG_WINDOW_ANIM_FRAMES, 4);
        set_window_value(AT_JAB, w, AG_WINDOW_ANIM_FRAME_START, 6+4*(i % 2) );
        set_window_value(AT_JAB, w, AG_WINDOW_SFX, asset_get("sfx_swipe_weak" + string(1 + (i % 2))));
        set_window_value(AT_JAB, w, AG_WINDOW_HAS_CUSTOM_FRICTION, true);
        set_window_value(AT_JAB, w, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.08);
        set_hitbox_value(AT_JAB, h, HG_EXTRA_HITPAUSE, 2);
    }

    set_attack_value(AT_DTILT, AG_SPRITE, sprite_get("jex_dtilt"));
    set_attack_value(AT_DTILT, AG_HURTBOX_SPRITE, sprite_get("jex_dtilt_hurt"));
    set_window_value(AT_DTILT, 1, AG_WINDOW_SFX, asset_get("sfx_absa_new_whip1"));
    set_hitbox_value(AT_DTILT, 1, HG_VISUAL_EFFECT, HFX_ABS_ZAP_SMALL);
    set_hitbox_value(AT_DTILT, 1, HG_HIT_SFX, asset_get("sfx_absa_harderhit"));

    set_attack_value(AT_UTILT, AG_SPRITE, sprite_get("jex_utilt"));
    set_window_value(AT_UTILT, 1, AG_WINDOW_SFX, asset_get("sfx_clairen_swing_med"));
    set_hitbox_value(AT_UTILT, 1, HG_VISUAL_EFFECT, HFX_ABS_ZAP_BIG);
    set_hitbox_value(AT_UTILT, 1, HG_HIT_SFX, asset_get("sfx_absa_harderhit"));
    set_window_value(AT_UTILT, 1, AG_WINDOW_SFX_FRAME, 0);

    set_attack_value(AT_DATTACK, AG_SPRITE, sprite_get("jex_dattack"));
    set_attack_value(AT_DATTACK, AG_HURTBOX_SPRITE, sprite_get("jex_dattack_hurt"));
    set_window_value(AT_DATTACK, 1, AG_WINDOW_ANIM_FRAMES, 3);
    set_window_value(AT_DATTACK, 1, AG_WINDOW_LENGTH, 12);
    set_window_value(AT_DATTACK, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_heavy2"));
    set_window_value(AT_DATTACK, 1, AG_WINDOW_SFX_FRAME, 11);
    set_window_value(AT_DATTACK, 2, AG_WINDOW_ANIM_FRAMES, 2);
    set_window_value(AT_DATTACK, 2, AG_WINDOW_ANIM_FRAME_START, 3);
    set_hitbox_value(AT_DATTACK, 1, HG_HIT_SFX, asset_get("sfx_blow_medium2"));
    set_hitbox_value(AT_DATTACK, 1, HG_HITBOX_Y, -14);
    set_hitbox_value(AT_DATTACK, 1, HG_WIDTH, 36);
    set_hitbox_value(AT_DATTACK, 1, HG_HEIGHT, 36);
    set_hitbox_value(AT_DATTACK, 1, HG_DAMAGE, 7);
    set_hitbox_value(AT_DATTACK, 1, HG_KNOCKBACK_SCALING, .6);
    set_hitbox_value(AT_DATTACK, 1, HG_BASE_HITPAUSE, 8);
    set_hitbox_value(AT_DATTACK, 1, HG_HITPAUSE_SCALING, 0.6);

    set_attack_value(AT_USTRONG, AG_SPRITE, sprite_get("jex_ustrong"));
    set_window_value(AT_USTRONG, 1, AG_WINDOW_ANIM_FRAMES, -1); //yes this is silly
    set_window_value(AT_USTRONG, 1, AG_WINDOW_ANIM_FRAME_START, 4);
    set_window_value(AT_USTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 5);
    set_window_value(AT_USTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 6);
    set_window_value(AT_USTRONG, 4, AG_WINDOW_ANIM_FRAME_START, 0);
    set_window_value(AT_USTRONG, 2, AG_WINDOW_SFX, asset_get("sfx_clairen_hit_strong"));
    set_hitbox_value(AT_USTRONG, 1, HG_HIT_SFX, asset_get("sfx_absa_uair"));
    set_hitbox_value(AT_USTRONG, 2, HG_HIT_SFX, asset_get("sfx_absa_harderhit"));
    set_hitbox_value(AT_USTRONG, 1, HG_VISUAL_EFFECT, HFX_ABS_SWEET_BIG);
    set_hitbox_value(AT_USTRONG, 2, HG_VISUAL_EFFECT, HFX_ABS_ZAP_BIG);
    set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_GROUP, 2);
    set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_GROUP, 2);

    set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_GROUP, 2);
    set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_GROUP, 2);

    set_attack_value(AT_NAIR, AG_SPRITE, sprite_get("jex_nair"));
    set_attack_value(AT_NAIR, AG_NOZ_HOVER_SPRITE, sprite_get("jex_nair_hover"));
    set_window_value(AT_NAIR, 2, AG_WINDOW_SFX, asset_get("sfx_clairen_spin"));
    set_hitbox_value(AT_NAIR, 1, HG_HIT_SFX, asset_get("sfx_clairen_hit_weak"));
    set_hitbox_value(AT_NAIR, 5, HG_HIT_SFX, asset_get("sfx_clairen_hit_weak"));
    set_hitbox_value(AT_NAIR, 4, HG_HIT_SFX, asset_get("sfx_clairen_tip_med"));
    set_hitbox_value(AT_NAIR, 1, HG_HITBOX_GROUP, 4);
    set_hitbox_value(AT_NAIR, 5, HG_HITBOX_GROUP, 4);
    set_hitbox_value(AT_NAIR, 2, HG_HITBOX_GROUP, 5);
    set_hitbox_value(AT_NAIR, 6, HG_HITBOX_GROUP, 5);
    set_hitbox_value(AT_NAIR, 3, HG_HITBOX_GROUP, 6);
    set_hitbox_value(AT_NAIR, 7, HG_HITBOX_GROUP, 6);

    //FAIR and BAIR are tangled in a rune-variant problem; handled below.
    set_attack_value(AT_FAIR, AG_SPRITE, sprite_get("jex_fair"));
    set_attack_value(AT_FAIR, AG_NOZ_HOVER_SPRITE, sprite_get("jex_fair_hover"));
    set_window_value(AT_FAIR, 2, AG_WINDOW_LENGTH, 7);
    set_window_value(AT_FAIR, 2, AG_WINDOW_SFX_FRAME, 6);
    set_window_value(AT_FAIR, 3, AG_WINDOW_HAS_SFX, 1);

    set_attack_value(AT_BAIR, AG_SPRITE, sprite_get("jex_bair"));
    set_attack_value(AT_BAIR, AG_NOZ_HOVER_SPRITE, sprite_get("jex_bair_hover"));
    set_window_value(AT_BAIR, 2, AG_WINDOW_SFX, asset_get("sfx_absa_new_whip2"));
    set_window_value(AT_BAIR, 3, AG_WINDOW_LENGTH, 6);

    set_attack_value(AT_UAIR, AG_SPRITE, sprite_get("jex_uair"));
    set_attack_value(AT_UAIR, AG_NOZ_HOVER_SPRITE, sprite_get("jex_uair_hover"));
    set_window_value(AT_UAIR, 1, AG_WINDOW_SFX, asset_get("sfx_waveland_abs"));
    set_window_value(AT_UAIR, 2, AG_WINDOW_SFX, asset_get("sfx_waveland_abs"));
    set_window_value(AT_UAIR, 3, AG_WINDOW_SFX, asset_get("sfx_waveland_abs"));
    set_hitbox_value(AT_UAIR, 1, HG_HIT_SFX, asset_get("sfx_clairen_hit_weak"));
    set_hitbox_value(AT_UAIR, 3, HG_HIT_SFX, asset_get("sfx_absa_harderhit"));
    set_hitbox_value(AT_UAIR, 1, HG_VISUAL_EFFECT, HFX_ABS_ZAP_SMALL);
    set_hitbox_value(AT_UAIR, 3, HG_VISUAL_EFFECT, HFX_ABS_ZAP_BIG);

    set_attack_value(AT_DAIR, AG_SPRITE, sprite_get("jex_dair"));
    set_hitbox_value(AT_DAIR, 1, HG_HITBOX_GROUP, 3);
    set_hitbox_value(AT_DAIR, 2, HG_HITBOX_GROUP, 3);
    set_hitbox_value(AT_DAIR, 3, HG_HITBOX_GROUP, 3);

    set_attack_value(AT_NSPECIAL, AG_SPRITE, sprite_get("jex_nspecial"))
    set_attack_value(AT_NSPECIAL, AG_AIR_SPRITE, sprite_get("jex_nspecial"));
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

    set_attack_value(AT_NSPECIAL_2, AG_SPRITE, sprite_get("jex_reflect"));
    //==========================================
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
    djump_sound = asset_get("sfx_jumpair");
    land_sound = asset_get("sfx_land_light");
    landing_lag_sound = asset_get("sfx_land");
    waveland_sound = asset_get("sfx_waveland_zet");

    set_attack_value(AT_JAB, AG_SPRITE, sprite_get("jab"));
    set_window_value(AT_JAB, 4, AG_WINDOW_HSPEED, 4.4);
    set_hitbox_value(AT_JAB, 2, HG_EXTRA_HITPAUSE, 2);
    //Defines WINDOWS 5-10
    for (var i = 0; i < 6; i++)
    {
        var w = 5+i;
        set_window_value(AT_JAB, w, AG_WINDOW_LENGTH, 5);
        set_window_value(AT_JAB, w, AG_WINDOW_ANIM_FRAMES, 2);
        set_window_value(AT_JAB, w, AG_WINDOW_ANIM_FRAME_START, 6+2*i);
        set_window_value(AT_JAB, w, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));
        set_window_value(AT_JAB, w, AG_WINDOW_HAS_CUSTOM_FRICTION, false);
    }

    set_attack_value(AT_DTILT, AG_SPRITE, sprite_get("dtilt"));
    set_attack_value(AT_DTILT, AG_HURTBOX_SPRITE, sprite_get("dtilt_hurt"));
    set_window_value(AT_DTILT, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));
    set_hitbox_value(AT_DTILT, 1, HG_VISUAL_EFFECT, 0);
    set_hitbox_value(AT_DTILT, 1, HG_HIT_SFX, asset_get("sfx_blow_weak1"));

    set_attack_value(AT_UTILT, AG_SPRITE, sprite_get("utilt"));
    set_window_value(AT_UTILT, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_weak1"));
    set_hitbox_value(AT_UTILT, 1, HG_VISUAL_EFFECT, 0);
    set_hitbox_value(AT_UTILT, 1, HG_HIT_SFX, asset_get("sfx_blow_weak2"));
    set_window_value(AT_UTILT, 1, AG_WINDOW_SFX_FRAME, 4);

    set_attack_value(AT_DATTACK, AG_SPRITE, sprite_get("dattack"));
    set_attack_value(AT_DATTACK, AG_HURTBOX_SPRITE, sprite_get("dattack_hurt"));
    set_window_value(AT_DATTACK, 1, AG_WINDOW_ANIM_FRAMES, 2);
    set_window_value(AT_DATTACK, 1, AG_WINDOW_LENGTH, 9);
    set_window_value(AT_DATTACK, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_medium2"));
    set_window_value(AT_DATTACK, 1, AG_WINDOW_SFX_FRAME, 8);
    set_window_value(AT_DATTACK, 2, AG_WINDOW_ANIM_FRAMES, 3);
    set_window_value(AT_DATTACK, 2, AG_WINDOW_ANIM_FRAME_START, 2);
    set_hitbox_value(AT_DATTACK, 1, HG_HIT_SFX, asset_get("sfx_blow_weak2"));
    set_hitbox_value(AT_DATTACK, 1, HG_HITBOX_Y, -8);
    set_hitbox_value(AT_DATTACK, 1, HG_WIDTH, 50);
    set_hitbox_value(AT_DATTACK, 1, HG_HEIGHT, 24);
    set_hitbox_value(AT_DATTACK, 1, HG_DAMAGE, 5);
    set_hitbox_value(AT_DATTACK, 1, HG_KNOCKBACK_SCALING, .3);
    set_hitbox_value(AT_DATTACK, 1, HG_BASE_HITPAUSE, 6);
    set_hitbox_value(AT_DATTACK, 1, HG_HITPAUSE_SCALING, 0.3);

    set_attack_value(AT_USTRONG, AG_SPRITE, sprite_get("ustrong"));
    set_window_value(AT_USTRONG, 1, AG_WINDOW_ANIM_FRAMES, 2);
    set_window_value(AT_USTRONG, 1, AG_WINDOW_ANIM_FRAME_START, 0);
    set_window_value(AT_USTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 2);
    set_window_value(AT_USTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 3);
    set_window_value(AT_USTRONG, 4, AG_WINDOW_ANIM_FRAME_START, 6);
    set_window_value(AT_USTRONG, 2, AG_WINDOW_SFX, sound_get("sfx_noz_ice_medium"));
    set_hitbox_value(AT_USTRONG, 1, HG_HIT_SFX, asset_get("sfx_ice_shatter"));
    set_hitbox_value(AT_USTRONG, 2, HG_HIT_SFX, asset_get("sfx_icehit_medium2"));
    set_hitbox_value(AT_USTRONG, 1, HG_VISUAL_EFFECT, 199);
    set_hitbox_value(AT_USTRONG, 2, HG_VISUAL_EFFECT, 28);
    set_hitbox_value(AT_USTRONG, 1, HG_HITBOX_GROUP, 1);
    set_hitbox_value(AT_USTRONG, 2, HG_HITBOX_GROUP, 1);

    set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_GROUP, 1);
    set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_GROUP, 1);

    set_attack_value(AT_NAIR, AG_SPRITE, sprite_get("nair"));
    set_attack_value(AT_NAIR, AG_NOZ_HOVER_SPRITE, sprite_get("nair_hover"));
    set_window_value(AT_NAIR, 2, AG_WINDOW_SFX, asset_get("sfx_spin"));
    set_hitbox_value(AT_NAIR, 1, HG_HIT_SFX, asset_get("sfx_blow_weak2"));
    set_hitbox_value(AT_NAIR, 5, HG_HIT_SFX, asset_get("sfx_blow_weak2"));
    set_hitbox_value(AT_NAIR, 4, HG_HIT_SFX, asset_get("sfx_blow_medium2"));
    set_hitbox_value(AT_NAIR, 1, HG_HITBOX_GROUP, 1);
    set_hitbox_value(AT_NAIR, 5, HG_HITBOX_GROUP, 1);
    set_hitbox_value(AT_NAIR, 2, HG_HITBOX_GROUP, 2);
    set_hitbox_value(AT_NAIR, 6, HG_HITBOX_GROUP, 2);
    set_hitbox_value(AT_NAIR, 3, HG_HITBOX_GROUP, 3);
    set_hitbox_value(AT_NAIR, 7, HG_HITBOX_GROUP, 3);

    //FAIR and BAIR are also tangled in a rune-variant problem; handled below.
    set_attack_value(AT_FAIR, AG_SPRITE, sprite_get("fair"));
    set_attack_value(AT_FAIR, AG_NOZ_HOVER_SPRITE, sprite_get("fair_hover"));
    set_window_value(AT_FAIR, 2, AG_WINDOW_LENGTH, 4);
    set_window_value(AT_FAIR, 2, AG_WINDOW_SFX_FRAME, 3);
    set_window_value(AT_FAIR, 3, AG_WINDOW_HAS_SFX, 0);

    set_attack_value(AT_BAIR, AG_SPRITE, sprite_get("bair"));
    set_attack_value(AT_BAIR, AG_NOZ_HOVER_SPRITE, sprite_get("bair_hover"));
    set_window_value(AT_BAIR, 2, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));
    set_window_value(AT_BAIR, 3, AG_WINDOW_LENGTH, 5);

    set_attack_value(AT_UAIR, AG_SPRITE, sprite_get("uair"));
    set_attack_value(AT_UAIR, AG_NOZ_HOVER_SPRITE, sprite_get("uair_hover"));
    set_window_value(AT_UAIR, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_weak1"));
    set_window_value(AT_UAIR, 2, AG_WINDOW_SFX, asset_get("sfx_swipe_weak1"));
    set_window_value(AT_UAIR, 3, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));
    set_hitbox_value(AT_UAIR, 1, HG_HIT_SFX, asset_get("sfx_blow_weak2"));
    set_hitbox_value(AT_UAIR, 3, HG_HIT_SFX, asset_get("sfx_blow_medium2"));
    set_hitbox_value(AT_UAIR, 3, HG_VISUAL_EFFECT, 0);

    set_attack_value(AT_DAIR, AG_SPRITE, sprite_get("dair"));
    set_hitbox_value(AT_DAIR, 1, HG_HITBOX_GROUP, 1);
    set_hitbox_value(AT_DAIR, 2, HG_HITBOX_GROUP, 1);
    set_hitbox_value(AT_DAIR, 3, HG_HITBOX_GROUP, 1);

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

    set_attack_value(AT_NSPECIAL_2, AG_SPRITE, sprite_get("reflect"));
    //==========================================
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

//===========================================================================
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

//===========================================================================
// RUNE: Bonus Friction
if (noz_rune_flags.low_friction)
{
    walk_speed = 5;
    walk_accel = 0.1;
    dash_turn_time = 16;
    dash_turn_accel = 0.5;
    dash_stop_percent = 0.9;
    ground_friction = .15;
    wave_land_adj = 1.35;
    wave_friction = -.15;
}
else
{
    walk_speed = 3.25;
    walk_accel = 0.2;
    dash_turn_time = 10;
    dash_turn_accel = 1.5;
    dash_stop_percent = 0.55;
    ground_friction = .45;
    wave_friction = .04;
}

//===========================================================================
// RUNE: Enhanced Hover
if (noz_rune_flags.enhanced_hover)
{
    noz_uspecial_hover_max = 480 * 2;
}
else
{
    noz_uspecial_hover_max = 480;
}

//===========================================================================
// RUNE: Enhanced Sleep
if (noz_rune_flags.enhanced_sleep)
{
    noz_nspecial_radius = floor(50 * 1.6);
}
else
{
    noz_nspecial_radius = 50;
}

//===========================================================================
// RUNE: Enhanced Dodge
if (noz_rune_flags.enhanced_dodge)
{
    air_dodge_speed = 9;
}
else
{
    air_dodge_speed = 7.5;
}

//===========================================================================
// RUNE: Enhanced FSPECIAL (Ice)
if (noz_rune_flags.ice_longer)
{
    noz_fspecial_soft_cooldown_max = 1; //so indicator still works

    set_window_value(AT_FSPECIAL_2, 2, AG_WINDOW_CUSTOM_GRAVITY, 0.02);
}
else
{
    noz_fspecial_soft_cooldown_max = 240;

    set_window_value(AT_FSPECIAL_2, 2, AG_WINDOW_CUSTOM_GRAVITY, 0.08);
}

//===========================================================================
// RUNE: Air-Strongs
if (joke_explainer_mode) //gets complicated otherwise
{
    set_hitbox_value(AT_FAIR, 1, HG_WINDOW, noone);
    set_hitbox_value(AT_FAIR, 2, HG_WINDOW, noone);
    set_hitbox_value(AT_FAIR, 3, HG_WINDOW, noone);
    set_hitbox_value(AT_FAIR, 4, HG_WINDOW, 3);
    set_hitbox_value(AT_FAIR, 5, HG_WINDOW, 3);
    set_window_value(AT_FAIR, 2, AG_WINDOW_SFX, asset_get("sfx_birdclap"));

    set_hitbox_value(AT_BAIR, 1, HG_WINDOW, noone);
    set_hitbox_value(AT_BAIR, 2, HG_WINDOW, noone);
    set_hitbox_value(AT_BAIR, 3, HG_WINDOW, noone);
    set_hitbox_value(AT_BAIR, 4, HG_WINDOW, 3);
    set_hitbox_value(AT_BAIR, 5, HG_WINDOW, 3);

    if (noz_rune_flags.aerial_strongs)
    {
        //FAIR
        set_attack_value(AT_FAIR, AG_STRONG_CHARGE_WINDOW, 1);
        set_hitbox_value(AT_FAIR, 4, HG_BASE_KNOCKBACK, 8);
        set_hitbox_value(AT_FAIR, 4, HG_KNOCKBACK_SCALING, 1);
        set_hitbox_value(AT_FAIR, 4, HG_HIT_SFX, asset_get("sfx_absa_uair"));
        set_hitbox_value(AT_FAIR, 5, HG_BASE_KNOCKBACK, 7);
        set_hitbox_value(AT_FAIR, 5, HG_KNOCKBACK_SCALING, .9);
        set_hitbox_value(AT_FAIR, 5, HG_HIT_SFX, asset_get("sfx_absa_kickhit"));
        //BAIR
        set_attack_value(AT_BAIR, AG_STRONG_CHARGE_WINDOW, 1);
        set_hitbox_value(AT_BAIR, 4, HG_BASE_KNOCKBACK, 8);
        set_hitbox_value(AT_BAIR, 4, HG_KNOCKBACK_SCALING, 1);
        set_hitbox_value(AT_BAIR, 4, HG_HIT_SFX, asset_get("sfx_absa_uair"));
        set_hitbox_value(AT_BAIR, 5, HG_BASE_KNOCKBACK, 7);
        set_hitbox_value(AT_BAIR, 5, HG_KNOCKBACK_SCALING, .9);
        set_hitbox_value(AT_BAIR, 5, HG_HIT_SFX, asset_get("sfx_absa_kickhit"));
    }
    else
    {
        //FAIR
        set_attack_value(AT_FAIR, AG_STRONG_CHARGE_WINDOW, 0);
        set_hitbox_value(AT_FAIR, 4, HG_BASE_KNOCKBACK, 7);
        set_hitbox_value(AT_FAIR, 4, HG_KNOCKBACK_SCALING, .8);
        set_hitbox_value(AT_FAIR, 4, HG_HIT_SFX, asset_get("sfx_absa_kickhit"));
        set_hitbox_value(AT_FAIR, 5, HG_BASE_KNOCKBACK, 5);
        set_hitbox_value(AT_FAIR, 5, HG_KNOCKBACK_SCALING, .5);
        set_hitbox_value(AT_FAIR, 5, HG_HIT_SFX, asset_get("sfx_absa_dattack"));
        //BAIR
        set_attack_value(AT_BAIR, AG_STRONG_CHARGE_WINDOW, 0);
        set_hitbox_value(AT_BAIR, 4, HG_BASE_KNOCKBACK, 6);
        set_hitbox_value(AT_BAIR, 4, HG_KNOCKBACK_SCALING, .6);
        set_hitbox_value(AT_BAIR, 4, HG_HIT_SFX, asset_get("sfx_absa_dattack"));
        set_hitbox_value(AT_BAIR, 5, HG_BASE_KNOCKBACK, 5);
        set_hitbox_value(AT_BAIR, 5, HG_KNOCKBACK_SCALING, .5);
        set_hitbox_value(AT_BAIR, 5, HG_HIT_SFX, asset_get("sfx_absa_harderhit"));

    }
}
else
{
    set_hitbox_value(AT_FAIR, 1, HG_WINDOW, 3);
    set_hitbox_value(AT_FAIR, 4, HG_WINDOW, noone);
    set_hitbox_value(AT_FAIR, 5, HG_WINDOW, noone);
    set_hitbox_value(AT_BAIR, 1, HG_WINDOW, 3);
    set_hitbox_value(AT_BAIR, 4, HG_WINDOW, noone);
    set_hitbox_value(AT_BAIR, 5, HG_WINDOW, noone);

    if (noz_rune_flags.aerial_strongs)
    {
        //FAIR
        set_attack_value(AT_FAIR, AG_STRONG_CHARGE_WINDOW, 1);
        set_window_value(AT_FAIR, 2, AG_WINDOW_SFX, sound_get("sfx_noz_ice_medium"));

        set_hitbox_value(AT_FAIR, 1, HG_ANGLE, 45);
        set_hitbox_value(AT_FAIR, 1, HG_BASE_KNOCKBACK, 8);
        set_hitbox_value(AT_FAIR, 1, HG_KNOCKBACK_SCALING, 1);
        set_hitbox_value(AT_FAIR, 1, HG_HIT_SFX, asset_get("sfx_ice_shatter"));
        set_hitbox_value(AT_FAIR, 1, HG_VISUAL_EFFECT, 199);

        set_hitbox_value(AT_FAIR, 2, HG_WINDOW, noone);
        set_hitbox_value(AT_FAIR, 3, HG_WINDOW, 3);

        //BAIR
        set_attack_value(AT_BAIR, AG_STRONG_CHARGE_WINDOW, 1);
        set_window_value(AT_BAIR, 2, AG_WINDOW_SFX, sound_get("sfx_noz_ice_medium"));

        set_hitbox_value(AT_BAIR, 1, HG_ANGLE, 145);
        set_hitbox_value(AT_BAIR, 1, HG_BASE_KNOCKBACK, 8);
        set_hitbox_value(AT_BAIR, 1, HG_KNOCKBACK_SCALING, 1);
        set_hitbox_value(AT_BAIR, 1, HG_HIT_SFX, asset_get("sfx_ice_shatter"));
        set_hitbox_value(AT_BAIR, 1, HG_VISUAL_EFFECT, 199);

        set_hitbox_value(AT_BAIR, 2, HG_WINDOW, noone);
        set_hitbox_value(AT_BAIR, 3, HG_WINDOW, 3);
    }
    else
    {
        //FAIR
        set_attack_value(AT_FAIR, AG_STRONG_CHARGE_WINDOW, 0);
        set_window_value(AT_FAIR, 2, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));

        set_hitbox_value(AT_FAIR, 1, HG_ANGLE, 45);
        set_hitbox_value(AT_FAIR, 1, HG_BASE_KNOCKBACK, 7);
        set_hitbox_value(AT_FAIR, 1, HG_KNOCKBACK_SCALING, .8);
        set_hitbox_value(AT_FAIR, 1, HG_HIT_SFX, asset_get("sfx_blow_medium2"));
        set_hitbox_value(AT_FAIR, 1, HG_VISUAL_EFFECT, 0);

        set_hitbox_value(AT_FAIR, 2, HG_WINDOW, 3);
        set_hitbox_value(AT_FAIR, 3, HG_WINDOW, noone);

        //BAIR
        set_attack_value(AT_BAIR, AG_STRONG_CHARGE_WINDOW, 0);
        set_window_value(AT_BAIR, 2, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));

        set_hitbox_value(AT_BAIR, 1, HG_ANGLE, 105);
        set_hitbox_value(AT_BAIR, 1, HG_BASE_KNOCKBACK, 6);
        set_hitbox_value(AT_BAIR, 1, HG_KNOCKBACK_SCALING, .5);
        set_hitbox_value(AT_BAIR, 1, HG_HIT_SFX, asset_get("sfx_blow_medium1"));
        set_hitbox_value(AT_BAIR, 1, HG_VISUAL_EFFECT, 0);

        set_hitbox_value(AT_BAIR, 2, HG_WINDOW, 3);
        set_hitbox_value(AT_BAIR, 3, HG_WINDOW, noone);
    }
}
//===========================================================================
// RUNE: Exploding Clouds
if (noz_rune_flags.cloud_explode)
{
    //FAIR
    set_hitbox_value(AT_FAIR, 2, HG_DAMAGE, 0);
    set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 0);
    set_hitbox_value(AT_FAIR, 2, HG_HIT_SFX, asset_get("sfx_icehit_heavy1"));
    set_hitbox_value(AT_FAIR, 2, HG_LIFETIME, 36 + noz_long_cloud_big);
    //BAIR
    set_hitbox_value(AT_BAIR, 2, HG_DAMAGE, 0);
    set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 0);
    set_hitbox_value(AT_BAIR, 2, HG_HIT_SFX, asset_get("sfx_icehit_heavy1"));
    set_hitbox_value(AT_BAIR, 2, HG_LIFETIME, 36 + noz_long_cloud_big);

    //DTILT
    set_hitbox_value(AT_DTILT, 2, HG_DAMAGE, 0);
    set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 0);
    set_hitbox_value(AT_DTILT, 2, HG_HIT_SFX, asset_get("sfx_icehit_heavy1"));
    set_hitbox_value(AT_DTILT, 2, HG_LIFETIME, 32 + noz_long_cloud_small);
    //DATTACK
    set_hitbox_value(AT_DATTACK, 2, HG_DAMAGE, 0);
    set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 0);
    set_hitbox_value(AT_DATTACK, 2, HG_HIT_SFX, asset_get("sfx_icehit_heavy1"));
    set_hitbox_value(AT_DATTACK, 2, HG_LIFETIME, 32 + noz_long_cloud_small);
}
else
{
    //FAIR
    set_hitbox_value(AT_FAIR, 2, HG_DAMAGE, 3);
    set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
    set_hitbox_value(AT_FAIR, 2, HG_HIT_SFX, asset_get("sfx_icehit_weak1"));
    set_hitbox_value(AT_FAIR, 2, HG_LIFETIME, 36);
    //BAIR
    set_hitbox_value(AT_BAIR, 2, HG_DAMAGE, 3);
    set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
    set_hitbox_value(AT_BAIR, 2, HG_HIT_SFX, asset_get("sfx_icehit_weak1"));
    set_hitbox_value(AT_BAIR, 2, HG_LIFETIME, 36);

    //DTILT
    set_hitbox_value(AT_DTILT, 2, HG_DAMAGE, 2);
    set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
    set_hitbox_value(AT_DTILT, 2, HG_HIT_SFX, asset_get("sfx_icehit_weak1"));
    set_hitbox_value(AT_DTILT, 2, HG_LIFETIME, 32);
    //DATTACK
    set_hitbox_value(AT_DATTACK, 2, HG_DAMAGE, 2);
    set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
    set_hitbox_value(AT_DATTACK, 2, HG_HIT_SFX, asset_get("sfx_icehit_weak1"));
    set_hitbox_value(AT_DATTACK, 2, HG_LIFETIME, 32);
}

//debug
if (shield_down) noz_rune_flags.climber_mode = true;

if (noz_rune_flags.climber_mode && (noz_climber_twin == noone))
{
    noz_climber_twin = instance_create(x, y, "oPlayer");
    noz_climber_twin.joke_explainer_mode = !joke_explainer_mode;
    noz_climber_twin.noz_climber_twin = self;
    noz_climber_twin.noz_climber_is_master = false;
    noz_climber_twin.clone = false; //experimental. seems to not cause too much side effects.

    noz_climber_twin.state = state;
    noz_climber_twin.state_timer = state_timer;
}

//===========================================================================
//Keep in sync across CSS and userevent 7
#define set_UI(jex)
{
    if (jex)
    {
        set_ui_element(UI_HUD_ICON,     sprite_get("jex_hud"));
        set_ui_element(UI_HUDHURT_ICON, sprite_get("jex_hudhurt"));
        set_ui_element(UI_CHARSELECT,   sprite_get("jex_charselect"));
        set_ui_element(UI_WIN_PORTRAIT, sprite_get("jex_portrait"));
        set_ui_element(UI_WIN_SIDEBAR,  sprite_get("jex_result_small"));
        set_ui_element(UI_WIN_THEME,    sound_get("jex_victory"));
    }
    else
    {
        //This manages to grab data from the main folder. neat.
        set_ui_element(UI_HUD_ICON,     get_char_info(player, INFO_HUD));
        set_ui_element(UI_HUDHURT_ICON, get_char_info(player, INFO_HUDHURT));
        set_ui_element(UI_CHARSELECT,   get_char_info(player, INFO_CHARSELECT));
        set_ui_element(UI_WIN_PORTRAIT, get_char_info(player, INFO_PORTRAIT));
        set_ui_element(UI_WIN_SIDEBAR,  get_char_info(player, INFO_SIDEBAR));
        set_ui_element(UI_WIN_THEME,    sound_get("victory"));
        //Offscreen handled separately.
    }
}