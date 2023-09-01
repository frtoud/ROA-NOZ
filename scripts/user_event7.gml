//USER EVENT 7 - Stat Update

if (joke_explainer_mode) //Enable JokeExplainer Echo
{
    jump_sound = sound_get("bot_jumpground");
    djump_sound = asset_get("sfx_ell_small_missile_ground");
    land_sound = asset_get("sfx_land_heavy");
    landing_lag_sound = asset_get("sfx_land_heavy");
    waveland_sound = asset_get("sfx_waveland_gus");
    
    //set_attack_value(AT_UTILT, AG_SPRITE, sprite_get("jex_utilt"));
    set_window_value(AT_UTILT, 1, AG_WINDOW_SFX, asset_get("sfx_clairen_swing_med"));
    set_hitbox_value(AT_UTILT, 1, HG_VISUAL_EFFECT, 125);
    set_hitbox_value(AT_UTILT, 1, HG_HIT_SFX, asset_get("sfx_absa_harderhit"));

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
// RUNE: Air-Strongs
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

    set_hitbox_value(AT_FAIR, 2, HG_LIFETIME, 9);
    set_hitbox_value(AT_FAIR, 2, HG_WIDTH, 60);
    set_hitbox_value(AT_FAIR, 2, HG_HEIGHT, 60);
    set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_SPRITE, sprite_get("vfx_ice_big"));
    set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_ANIM_SPEED, (3.0 / get_hitbox_value(AT_FAIR, 2, HG_LIFETIME)) );
    set_hitbox_value(AT_FAIR, 2, HG_DAMAGE, 6);
    set_hitbox_value(AT_FAIR, 2, HG_ANGLE, 55);
    set_hitbox_value(AT_FAIR, 2, HG_BASE_KNOCKBACK, 6);
    set_hitbox_value(AT_FAIR, 2, HG_KNOCKBACK_SCALING, .8);
    set_hitbox_value(AT_FAIR, 2, HG_HITPAUSE_SCALING, .5);
    set_hitbox_value(AT_FAIR, 2, HG_HIT_SFX, asset_get("sfx_icehit_medium2"));
    set_hitbox_value(AT_FAIR, 2, HG_VISUAL_EFFECT, 28);
    set_hitbox_value(AT_FAIR, 2, HG_HITBOX_GROUP, 1);
    set_hitbox_value(AT_FAIR, 2, HG_IGNORES_PROJECTILES, 0);
    set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_PARRY_STUN, 1);
    set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_UNBASHABLE, 1);
    set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);

    //BAIR
    set_attack_value(AT_BAIR, AG_STRONG_CHARGE_WINDOW, 1);
    set_window_value(AT_BAIR, 2, AG_WINDOW_SFX, sound_get("sfx_noz_ice_medium"));

    set_hitbox_value(AT_BAIR, 1, HG_ANGLE, 145);
    set_hitbox_value(AT_BAIR, 1, HG_BASE_KNOCKBACK, 8);
    set_hitbox_value(AT_BAIR, 1, HG_KNOCKBACK_SCALING, 1);
    set_hitbox_value(AT_BAIR, 1, HG_HIT_SFX, asset_get("sfx_ice_shatter"));
    set_hitbox_value(AT_BAIR, 1, HG_VISUAL_EFFECT, 199);

    set_hitbox_value(AT_BAIR, 2, HG_LIFETIME, 9);
    set_hitbox_value(AT_BAIR, 2, HG_WIDTH, 60);
    set_hitbox_value(AT_BAIR, 2, HG_HEIGHT, 60);
    set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_SPRITE, sprite_get("vfx_ice_big"));
    set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_ANIM_SPEED, (3.0 / get_hitbox_value(AT_BAIR, 2, HG_LIFETIME)) );
    set_hitbox_value(AT_BAIR, 2, HG_DAMAGE, 6);
    set_hitbox_value(AT_BAIR, 2, HG_ANGLE, 55);
    set_hitbox_value(AT_BAIR, 2, HG_BASE_KNOCKBACK, 6);
    set_hitbox_value(AT_BAIR, 2, HG_KNOCKBACK_SCALING, .8);
    set_hitbox_value(AT_BAIR, 2, HG_HITPAUSE_SCALING, .5);
    set_hitbox_value(AT_BAIR, 2, HG_HIT_SFX, asset_get("sfx_icehit_medium2"));
    set_hitbox_value(AT_BAIR, 2, HG_VISUAL_EFFECT, 28);
    set_hitbox_value(AT_BAIR, 2, HG_HITBOX_GROUP, 1);
    set_hitbox_value(AT_BAIR, 2, HG_IGNORES_PROJECTILES, 0);
    set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_PARRY_STUN, 1);
    set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_UNBASHABLE, 1);
    set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
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

    set_hitbox_value(AT_FAIR, 2, HG_LIFETIME, 36);
    set_hitbox_value(AT_FAIR, 2, HG_WIDTH, 40);
    set_hitbox_value(AT_FAIR, 2, HG_HEIGHT, 40);
    set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_SPRITE, sprite_get("cloud_proj_big"));
    set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_ANIM_SPEED, (8.0 / get_hitbox_value(AT_BAIR, 2, HG_LIFETIME)) );
    set_hitbox_value(AT_FAIR, 2, HG_DAMAGE, 3);
    set_hitbox_value(AT_FAIR, 2, HG_ANGLE, 90);
    set_hitbox_value(AT_FAIR, 2, HG_BASE_KNOCKBACK, 1.5);
    set_hitbox_value(AT_FAIR, 2, HG_KNOCKBACK_SCALING, 0);
    set_hitbox_value(AT_FAIR, 2, HG_HITPAUSE_SCALING, .1);
    set_hitbox_value(AT_FAIR, 2, HG_HIT_SFX, asset_get("sfx_icehit_weak1"));
    set_hitbox_value(AT_FAIR, 2, HG_VISUAL_EFFECT, 6);
    set_hitbox_value(AT_FAIR, 2, HG_HITBOX_GROUP, -1);
    set_hitbox_value(AT_FAIR, 2, HG_IGNORES_PROJECTILES, 0);
    set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_PARRY_STUN, 0);
    set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_UNBASHABLE, 0);
    set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);

    //BAIR
    set_attack_value(AT_BAIR, AG_STRONG_CHARGE_WINDOW, 0);
    set_window_value(AT_BAIR, 2, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));

    set_hitbox_value(AT_BAIR, 1, HG_ANGLE, 105);
    set_hitbox_value(AT_BAIR, 1, HG_BASE_KNOCKBACK, 6);
    set_hitbox_value(AT_BAIR, 1, HG_KNOCKBACK_SCALING, .5);
    set_hitbox_value(AT_BAIR, 1, HG_HIT_SFX, asset_get("sfx_blow_medium1"));
    set_hitbox_value(AT_BAIR, 1, HG_VISUAL_EFFECT, 0);

    set_hitbox_value(AT_BAIR, 2, HG_LIFETIME, 36);
    set_hitbox_value(AT_BAIR, 2, HG_WIDTH, 40);
    set_hitbox_value(AT_BAIR, 2, HG_HEIGHT, 40);
    set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_SPRITE, sprite_get("cloud_proj_big"));
    set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_ANIM_SPEED, (8.0 / get_hitbox_value(AT_BAIR, 2, HG_LIFETIME)) );
    set_hitbox_value(AT_BAIR, 2, HG_DAMAGE, 3);
    set_hitbox_value(AT_BAIR, 2, HG_ANGLE, 90);
    set_hitbox_value(AT_BAIR, 2, HG_BASE_KNOCKBACK, 1.5);
    set_hitbox_value(AT_BAIR, 2, HG_KNOCKBACK_SCALING, 0);
    set_hitbox_value(AT_BAIR, 2, HG_HITPAUSE_SCALING, .1);
    set_hitbox_value(AT_BAIR, 2, HG_HIT_SFX, asset_get("sfx_icehit_weak1"));
    set_hitbox_value(AT_BAIR, 2, HG_VISUAL_EFFECT, 6);
    set_hitbox_value(AT_BAIR, 2, HG_HITBOX_GROUP, -1);
    set_hitbox_value(AT_BAIR, 2, HG_IGNORES_PROJECTILES, 0);
    set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_PARRY_STUN, 0);
    set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_UNBASHABLE, 0);
    set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
}
//===========================================================================
// RUNE: Exploding Clouds
if (noz_rune_flags.cloud_explode)
{
    if !(noz_rune_flags.aerial_strongs)
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
    }
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
    if !(noz_rune_flags.aerial_strongs)
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
    }
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
//===========================================================================

