set_attack_value(AT_DSTRONG, AG_SPRITE, sprite_get("dstrong"));
set_attack_value(AT_DSTRONG, AG_NUM_WINDOWS, 3);
set_attack_value(AT_DSTRONG, AG_STRONG_CHARGE_WINDOW, 1);
set_attack_value(AT_DSTRONG, AG_HURTBOX_SPRITE, sprite_get("dstrong_hurt"));

set_window_value(AT_DSTRONG, 1, AG_WINDOW_LENGTH, 12);
set_window_value(AT_DSTRONG, 1, AG_WINDOW_ANIM_FRAMES, 3);

set_window_value(AT_DSTRONG, 2, AG_WINDOW_LENGTH, 6);
set_window_value(AT_DSTRONG, 2, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DSTRONG, 2, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_DSTRONG, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DSTRONG, 2, AG_WINDOW_SFX, asset_get("sfx_ice_shatter_big"));
set_window_value(AT_DSTRONG, 2, AG_WINDOW_SFX_FRAME, 2);

set_window_value(AT_DSTRONG, 3, AG_WINDOW_LENGTH, 20);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(AT_DSTRONG, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

//JEX-only anim-assist
set_window_value(AT_DSTRONG, 4, AG_WINDOW_LENGTH, 8);
set_window_value(AT_DSTRONG, 4, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DSTRONG, 4, AG_WINDOW_ANIM_FRAME_START, 8);
set_window_value(AT_DSTRONG, 4, AG_WINDOW_HAS_WHIFFLAG, 1);


set_num_hitboxes(AT_DSTRONG, 4);

//hitbox to catch opponents above
set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 1, HG_WINDOW, 2);
set_hitbox_value(AT_DSTRONG, 1, HG_LIFETIME, 2);
set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_X, -5);
set_hitbox_value(AT_DSTRONG, 1, HG_HITBOX_Y, -25);
set_hitbox_value(AT_DSTRONG, 1, HG_WIDTH, 25);
set_hitbox_value(AT_DSTRONG, 1, HG_HEIGHT, 50);
set_hitbox_value(AT_DSTRONG, 1, HG_SHAPE, 0);
set_hitbox_value(AT_DSTRONG, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_DSTRONG, 1, HG_DAMAGE, 0);
set_hitbox_value(AT_DSTRONG, 1, HG_ANGLE, 280);
set_hitbox_value(AT_DSTRONG, 1, HG_TECHABLE, 3);
set_hitbox_value(AT_DSTRONG, 1, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_DSTRONG, 1, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_DSTRONG, 1, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_DSTRONG, 1, HG_BASE_HITPAUSE, 0);
set_hitbox_value(AT_DSTRONG, 1, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(AT_DSTRONG, 1, HG_GROUNDEDNESS, 2);
set_hitbox_value(AT_DSTRONG, 1, HG_EXTRA_CAMERA_SHAKE, -1); //none
set_hitbox_value(AT_DSTRONG, 1, HG_VISUAL_EFFECT, 1); //none
set_hitbox_value(AT_DSTRONG, 1, HG_FORCE_FLINCH, 2); //none
set_hitbox_value(AT_DSTRONG, 1, HG_THROWS_ROCK, 2); //ignore

set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 2, HG_WINDOW, 2);
set_hitbox_value(AT_DSTRONG, 2, HG_WINDOW_CREATION_FRAME, 3);
set_hitbox_value(AT_DSTRONG, 2, HG_LIFETIME, 3);
set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_X, 5);
set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_Y, -14);
set_hitbox_value(AT_DSTRONG, 2, HG_WIDTH, 60);
set_hitbox_value(AT_DSTRONG, 2, HG_HEIGHT, 32);
set_hitbox_value(AT_DSTRONG, 2, HG_SHAPE, 2);
set_hitbox_value(AT_DSTRONG, 2, HG_PRIORITY, 1);
set_hitbox_value(AT_DSTRONG, 2, HG_DAMAGE, 15);
set_hitbox_value(AT_DSTRONG, 2, HG_ANGLE, 85);
set_hitbox_value(AT_DSTRONG, 2, HG_ANGLE_FLIPPER, 3);
set_hitbox_value(AT_DSTRONG, 2, HG_BASE_KNOCKBACK, 7.5);
set_hitbox_value(AT_DSTRONG, 2, HG_KNOCKBACK_SCALING, 1.25);
set_hitbox_value(AT_DSTRONG, 2, HG_BASE_HITPAUSE, 10);
set_hitbox_value(AT_DSTRONG, 2, HG_HITPAUSE_SCALING, .9);
set_hitbox_value(AT_DSTRONG, 2, HG_VISUAL_EFFECT, 199);
set_hitbox_value(AT_DSTRONG, 2, HG_VISUAL_EFFECT_X_OFFSET, 10);
set_hitbox_value(AT_DSTRONG, 2, HG_HIT_SFX, asset_get("sfx_icehit_heavy1"));
set_hitbox_value(AT_DSTRONG, 2, HG_HITBOX_GROUP, 1);

set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSTRONG, 3, HG_WINDOW, 2);
set_hitbox_value(AT_DSTRONG, 3, HG_WINDOW_CREATION_FRAME, 4);
set_hitbox_value(AT_DSTRONG, 3, HG_LIFETIME, 8);
set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_X, 5);
set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_Y, -10);
set_hitbox_value(AT_DSTRONG, 3, HG_WIDTH, 100);
set_hitbox_value(AT_DSTRONG, 3, HG_HEIGHT, 20);
set_hitbox_value(AT_DSTRONG, 3, HG_SHAPE, 1);
set_hitbox_value(AT_DSTRONG, 3, HG_PRIORITY, 3);
set_hitbox_value(AT_DSTRONG, 3, HG_DAMAGE, 8);
set_hitbox_value(AT_DSTRONG, 3, HG_ANGLE, 70);
set_hitbox_value(AT_DSTRONG, 3, HG_ANGLE_FLIPPER, 3);
set_hitbox_value(AT_DSTRONG, 3, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_DSTRONG, 3, HG_KNOCKBACK_SCALING, 1.0);
set_hitbox_value(AT_DSTRONG, 3, HG_BASE_HITPAUSE, 8);
set_hitbox_value(AT_DSTRONG, 3, HG_HITPAUSE_SCALING, .9);
set_hitbox_value(AT_DSTRONG, 3, HG_VISUAL_EFFECT, 199);
set_hitbox_value(AT_DSTRONG, 3, HG_VISUAL_EFFECT_X_OFFSET, 10);
set_hitbox_value(AT_DSTRONG, 3, HG_HIT_SFX, asset_get("sfx_icehit_medium2"));
set_hitbox_value(AT_DSTRONG, 3, HG_HITBOX_GROUP, 1);
set_hitbox_value(AT_DSTRONG, 3, HG_MUNO_OBJECT_LAUNCH_ANGLE, -1);

//not actually a hitbox just a vfx
set_hitbox_value(AT_DSTRONG, 4, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DSTRONG, 4, HG_WINDOW, 2);
set_hitbox_value(AT_DSTRONG, 4, HG_WINDOW_CREATION_FRAME, 3);
set_hitbox_value(AT_DSTRONG, 4, HG_LIFETIME, 66);
set_hitbox_value(AT_DSTRONG, 4, HG_HITBOX_X, 6);
set_hitbox_value(AT_DSTRONG, 4, HG_HITBOX_Y, 0);
set_hitbox_value(AT_DSTRONG, 4, HG_WIDTH, 1);
set_hitbox_value(AT_DSTRONG, 4, HG_HEIGHT, 1);
set_hitbox_value(AT_DSTRONG, 4, HG_SHAPE, 1);
set_hitbox_value(AT_DSTRONG, 4, HG_PRIORITY, 0);
set_hitbox_value(AT_DSTRONG, 4, HG_DAMAGE, 0);
set_hitbox_value(AT_DSTRONG, 4, HG_ANGLE, 0);
set_hitbox_value(AT_DSTRONG, 4, HG_GROUNDEDNESS, 2);
set_hitbox_value(AT_DSTRONG, 4, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_DSTRONG, 4, HG_EXTRA_CAMERA_SHAKE, -1); //none
set_hitbox_value(AT_DSTRONG, 4, HG_VISUAL_EFFECT, 1); //none
set_hitbox_value(AT_DSTRONG, 4, HG_FORCE_FLINCH, 2); //none
set_hitbox_value(AT_DSTRONG, 4, HG_THROWS_ROCK, 2); //ignore

set_hitbox_value(AT_DSTRONG, 4, HG_PROJECTILE_SPRITE, sprite_get("vfx_ice_dstrong"));
set_hitbox_value(AT_DSTRONG, 4, HG_PROJECTILE_ANIM_SPEED, (22.0 / get_hitbox_value(AT_DSTRONG, 4, HG_LIFETIME)));
set_hitbox_value(AT_DSTRONG, 4, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DSTRONG, 4, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(AT_DSTRONG, 4, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_DSTRONG, 4, HG_PROJECTILE_PARRY_STUN, 0);
set_hitbox_value(AT_DSTRONG, 4, HG_PROJECTILE_UNBASHABLE, 1);
set_hitbox_value(AT_DSTRONG, 4, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_DSTRONG, 4, HG_PROJECTILE_IS_TRANSCENDENT, 1);

//DSTRONG spikes spread
set_hitbox_value(AT_DSTRONG, 5, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DSTRONG, 5, HG_LIFETIME, 24);
set_hitbox_value(AT_DSTRONG, 5, HG_WIDTH, 8);
set_hitbox_value(AT_DSTRONG, 5, HG_HEIGHT, 20);
set_hitbox_value(AT_DSTRONG, 5, HG_SHAPE, 2);
set_hitbox_value(AT_DSTRONG, 5, HG_PRIORITY, 1);
set_hitbox_value(AT_DSTRONG, 5, HG_DAMAGE, 6);
set_hitbox_value(AT_DSTRONG, 5, HG_ANGLE, 90);
set_hitbox_value(AT_DSTRONG, 5, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_DSTRONG, 5, HG_KNOCKBACK_SCALING, 0.8);
set_hitbox_value(AT_DSTRONG, 5, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_DSTRONG, 5, HG_HITPAUSE_SCALING, .4);
set_hitbox_value(AT_DSTRONG, 5, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_DSTRONG, 5, HG_HIT_SFX, asset_get("sfx_icehit_medium2"));
set_hitbox_value(AT_DSTRONG, 5, HG_HIT_LOCKOUT, 9);

set_hitbox_value(AT_DSTRONG, 5, HG_PROJECTILE_SPRITE, sprite_get("proj_spike"));
set_hitbox_value(AT_DSTRONG, 5, HG_PROJECTILE_MASK, sprite_get("proj_spike_hurt"));
set_hitbox_value(AT_DSTRONG, 5, HG_PROJECTILE_ANIM_SPEED, (8 / get_hitbox_value(AT_DSTRONG, 5, HG_LIFETIME)));
set_hitbox_value(AT_DSTRONG, 5, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(AT_DSTRONG, 5, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_DSTRONG, 5, HG_PROJECTILE_UNBASHABLE, 1);
set_hitbox_value(AT_DSTRONG, 5, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_DSTRONG, 5, HG_PROJECTILE_IS_TRANSCENDENT, 1);


//DSTRONG plasma proj
set_hitbox_value(AT_DSTRONG, 6, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DSTRONG, 6, HG_LIFETIME, 600);
set_hitbox_value(AT_DSTRONG, 6, HG_WIDTH, 16);
set_hitbox_value(AT_DSTRONG, 6, HG_HEIGHT, 16);
set_hitbox_value(AT_DSTRONG, 6, HG_SHAPE, 1);
set_hitbox_value(AT_DSTRONG, 6, HG_PRIORITY, 1);
set_hitbox_value(AT_DSTRONG, 6, HG_DAMAGE, 6);
set_hitbox_value(AT_DSTRONG, 6, HG_ANGLE, 135);
set_hitbox_value(AT_DSTRONG, 6, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_DSTRONG, 6, HG_KNOCKBACK_SCALING, 0.2);
set_hitbox_value(AT_DSTRONG, 6, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_DSTRONG, 6, HG_HITPAUSE_SCALING, .4);
set_hitbox_value(AT_DSTRONG, 6, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_DSTRONG, 6, HG_HIT_SFX, asset_get("sfx_clairen_tip_med"));

set_hitbox_value(AT_DSTRONG, 6, HG_PROJECTILE_SPRITE, sprite_get("vfx_scraping"));
set_hitbox_value(AT_DSTRONG, 6, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DSTRONG, 6, HG_PROJECTILE_HSPEED, 6);
set_hitbox_value(AT_DSTRONG, 6, HG_PROJECTILE_VSPEED, 0);
set_hitbox_value(AT_DSTRONG, 6, HG_PROJECTILE_ANIM_SPEED, .25);
set_hitbox_value(AT_DSTRONG, 6, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(AT_DSTRONG, 6, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_DSTRONG, 6, HG_PROJECTILE_UNBASHABLE, 1);
set_hitbox_value(AT_DSTRONG, 6, HG_PROJECTILE_IS_TRANSCENDENT, 1);
set_hitbox_value(AT_DSTRONG, 6, HG_PROJECTILE_DESTROY_EFFECT, 1);
