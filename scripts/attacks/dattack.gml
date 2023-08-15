set_attack_value(AT_DATTACK, AG_SPRITE, sprite_get("dattack"));
set_attack_value(AT_DATTACK, AG_NUM_WINDOWS, 3);
set_attack_value(AT_DATTACK, AG_HURTBOX_SPRITE, sprite_get("dattack_hurt"));

set_window_value(AT_DATTACK, 1, AG_WINDOW_TYPE, 0);
set_window_value(AT_DATTACK, 1, AG_WINDOW_LENGTH, 9);
set_window_value(AT_DATTACK, 1, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DATTACK, 1, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_DATTACK, 1, AG_WINDOW_CUSTOM_GROUND_FRICTION, .06);
set_window_value(AT_DATTACK, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DATTACK, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_medium2"));
set_window_value(AT_DATTACK, 1, AG_WINDOW_SFX_FRAME, 8);

set_window_value(AT_DATTACK, 2, AG_WINDOW_TYPE, 0);
set_window_value(AT_DATTACK, 2, AG_WINDOW_LENGTH, 12);
set_window_value(AT_DATTACK, 2, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_DATTACK, 2, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_DATTACK, 2, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_DATTACK, 2, AG_WINDOW_CUSTOM_GROUND_FRICTION, .12);

set_window_value(AT_DATTACK, 3, AG_WINDOW_TYPE, 0);
set_window_value(AT_DATTACK, 3, AG_WINDOW_LENGTH, 20);
set_window_value(AT_DATTACK, 3, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_DATTACK, 3, AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(AT_DATTACK, 3, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_DATTACK, 3, AG_WINDOW_CUSTOM_GROUND_FRICTION, .36);


set_num_hitboxes(AT_DATTACK, 2);

set_hitbox_value(AT_DATTACK, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DATTACK, 1, HG_WINDOW, 2);
set_hitbox_value(AT_DATTACK, 1, HG_LIFETIME, 12);
set_hitbox_value(AT_DATTACK, 1, HG_HITBOX_Y, -8);
set_hitbox_value(AT_DATTACK, 1, HG_HITBOX_X, 12);
set_hitbox_value(AT_DATTACK, 1, HG_WIDTH, 50);
set_hitbox_value(AT_DATTACK, 1, HG_HEIGHT, 24);
set_hitbox_value(AT_DATTACK, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_DATTACK, 1, HG_DAMAGE, 5);
set_hitbox_value(AT_DATTACK, 1, HG_ANGLE, 361);
set_hitbox_value(AT_DATTACK, 1, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_DATTACK, 1, HG_KNOCKBACK_SCALING, .3);
set_hitbox_value(AT_DATTACK, 1, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_DATTACK, 1, HG_HIT_SFX, asset_get("sfx_blow_weak2"));
set_hitbox_value(AT_DATTACK, 1, HG_HIT_LOCKOUT, 12);
set_hitbox_value(AT_DATTACK, 1, HG_MUNO_OBJECT_LAUNCH_ANGLE, 1);

//Lingering hitbox
set_hitbox_value(AT_DATTACK, 2, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DATTACK, 2, HG_WINDOW, 2);
set_hitbox_value(AT_DATTACK, 2, HG_WINDOW_CREATION_FRAME, 5);
set_hitbox_value(AT_DATTACK, 2, HG_LIFETIME, 32);
set_hitbox_value(AT_DATTACK, 2, HG_HITBOX_X, 44);
set_hitbox_value(AT_DATTACK, 2, HG_HITBOX_Y, -18);
set_hitbox_value(AT_DATTACK, 2, HG_WIDTH, 30);
set_hitbox_value(AT_DATTACK, 2, HG_HEIGHT, 30);
set_hitbox_value(AT_DATTACK, 2, HG_PRIORITY, 4);
set_hitbox_value(AT_DATTACK, 2, HG_DAMAGE, 2);
set_hitbox_value(AT_DATTACK, 2, HG_ANGLE, 90);
set_hitbox_value(AT_DATTACK, 2, HG_BASE_KNOCKBACK, 1.3);
set_hitbox_value(AT_DATTACK, 2, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_DATTACK, 2, HG_BASE_HITPAUSE, 2);
set_hitbox_value(AT_DATTACK, 2, HG_HITPAUSE_SCALING, .1);
set_hitbox_value(AT_DATTACK, 2, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_DATTACK, 2, HG_HIT_SFX, asset_get("sfx_icehit_weak1"));
set_hitbox_value(AT_DATTACK, 2, HG_VISUAL_EFFECT, 6);

set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_SPRITE, sprite_get("cloud_proj_small"));
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_ANIM_SPEED, 1.0/6);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_HSPEED, 3);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_AIR_FRICTION, 3);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_GROUND_FRICTION, 0.3);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_PARRY_STUN, 1);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_UNBASHABLE, 1);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_IS_TRANSCENDENT, 1);

// Exploding clouds
if (noz_rune_flags.cloud_explode)
{
    set_hitbox_value(AT_DATTACK, 2, HG_DAMAGE, 0);
    set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 0);
    set_hitbox_value(AT_DATTACK, 2, HG_HIT_SFX, asset_get("sfx_icehit_heavy1"));
    
    set_hitbox_value(AT_DATTACK, 3, HG_HITBOX_TYPE, 2);
    set_hitbox_value(AT_DATTACK, 3, HG_LIFETIME, 8);
    set_hitbox_value(AT_DATTACK, 3, HG_WIDTH, 70);
    set_hitbox_value(AT_DATTACK, 3, HG_HEIGHT, 70);
    set_hitbox_value(AT_DATTACK, 3, HG_PRIORITY, 5);
    set_hitbox_value(AT_DATTACK, 3, HG_DAMAGE, 10);
    set_hitbox_value(AT_DATTACK, 3, HG_ANGLE, 55);
    set_hitbox_value(AT_DATTACK, 3, HG_BASE_KNOCKBACK, 6);
    set_hitbox_value(AT_DATTACK, 3, HG_KNOCKBACK_SCALING, 0.8);
    set_hitbox_value(AT_DATTACK, 3, HG_BASE_HITPAUSE, 10);
    set_hitbox_value(AT_DATTACK, 3, HG_HITPAUSE_SCALING, .5);
    set_hitbox_value(AT_DATTACK, 3, HG_HIT_SFX, sound_get("sfx_noz_ice_medium"));
    set_hitbox_value(AT_DATTACK, 3, HG_VISUAL_EFFECT, 1);
    
    set_hitbox_value(AT_DATTACK, 3, HG_PROJECTILE_SPRITE, sprite_get("vfx_ice_big"));
    set_hitbox_value(AT_DATTACK, 3, HG_PROJECTILE_ANIM_SPEED, 0.7);
    set_hitbox_value(AT_DATTACK, 3, HG_PROJECTILE_MASK, -1);
    set_hitbox_value(AT_DATTACK, 3, HG_PROJECTILE_WALL_BEHAVIOR, 1);
    set_hitbox_value(AT_DATTACK, 3, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
    set_hitbox_value(AT_DATTACK, 3, HG_PROJECTILE_PARRY_STUN, 0);
    set_hitbox_value(AT_DATTACK, 3, HG_PROJECTILE_UNBASHABLE, 1);
    set_hitbox_value(AT_DATTACK, 3, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
    set_hitbox_value(AT_DATTACK, 3, HG_PROJECTILE_IS_TRANSCENDENT, 1);
    set_hitbox_value(AT_DATTACK, 3, HG_MUNO_OBJECT_LAUNCH_ANGLE, -2);

    // Cloud extension
    var duration = get_hitbox_value(AT_DATTACK, 2, HG_LIFETIME);
    duration += noz_long_cloud_small;
    set_hitbox_value(AT_DATTACK, 2, HG_LIFETIME, duration);
}


//Decorative snow-skid effect
set_hitbox_value(AT_DATTACK, 5, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DATTACK, 5, HG_LIFETIME, 12);
set_hitbox_value(AT_DATTACK, 5, HG_HITBOX_X, 6);
set_hitbox_value(AT_DATTACK, 5, HG_HITBOX_Y, 0);
set_hitbox_value(AT_DATTACK, 5, HG_WIDTH, 1);
set_hitbox_value(AT_DATTACK, 5, HG_HEIGHT, 1);
set_hitbox_value(AT_DATTACK, 5, HG_SHAPE, 1);
set_hitbox_value(AT_DATTACK, 5, HG_PRIORITY, 0);
set_hitbox_value(AT_DATTACK, 5, HG_DAMAGE, 0);
set_hitbox_value(AT_DATTACK, 5, HG_ANGLE, 0);
set_hitbox_value(AT_DATTACK, 5, HG_GROUNDEDNESS, 2);
set_hitbox_value(AT_DATTACK, 5, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_DATTACK, 5, HG_EXTRA_CAMERA_SHAKE, -1); //none
set_hitbox_value(AT_DATTACK, 5, HG_VISUAL_EFFECT, 1); //none
set_hitbox_value(AT_DATTACK, 5, HG_FORCE_FLINCH, 2); //none
set_hitbox_value(AT_DATTACK, 5, HG_THROWS_ROCK, 2); //ignore

set_hitbox_value(AT_DATTACK, 5, HG_PROJECTILE_SPRITE, sprite_get("vfx_scraping"));
set_hitbox_value(AT_DATTACK, 5, HG_PROJECTILE_ANIM_SPEED, (4.0 / get_hitbox_value(AT_DATTACK, 5, HG_LIFETIME)));
set_hitbox_value(AT_DATTACK, 5, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DATTACK, 5, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(AT_DATTACK, 5, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_DATTACK, 5, HG_PROJECTILE_PARRY_STUN, 0);
set_hitbox_value(AT_DATTACK, 5, HG_PROJECTILE_UNBASHABLE, 1);
set_hitbox_value(AT_DATTACK, 5, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_DATTACK, 5, HG_PROJECTILE_IS_TRANSCENDENT, 1);