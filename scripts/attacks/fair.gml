set_attack_value(AT_FAIR, AG_CATEGORY, 1);
set_attack_value(AT_FAIR, AG_STRONG_CHARGE_WINDOW, 153); //enables strong_charge boost
set_attack_value(AT_FAIR, AG_SPRITE, sprite_get("fair"));
set_attack_value(AT_FAIR, AG_HURTBOX_SPRITE, sprite_get("fair_hurt"));
set_attack_value(AT_FAIR, AG_NUM_WINDOWS, 5);
set_attack_value(AT_FAIR, AG_HAS_LANDING_LAG, 1);
set_attack_value(AT_FAIR, AG_LANDING_LAG, 4);

//Used for hovermode sprites in animation.gml
set_attack_value(AT_FAIR, AG_NOZ_HOVER_SPRITE, sprite_get("fair_hover"));

//secretly the strong charge window (see aerial strong rune)
set_window_value(AT_FAIR, 1, AG_WINDOW_LENGTH, 4);
set_window_value(AT_FAIR, 1, AG_WINDOW_ANIM_FRAMES, 1);

set_window_value(AT_FAIR, 2, AG_WINDOW_LENGTH, 4);
set_window_value(AT_FAIR, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FAIR, 2, AG_WINDOW_ANIM_FRAME_START, 1);
set_window_value(AT_FAIR, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FAIR, 2, AG_WINDOW_SFX_FRAME, 3);
set_window_value(AT_FAIR, 2, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));

set_window_value(AT_FAIR, 3, AG_WINDOW_LENGTH, 5);
set_window_value(AT_FAIR, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_FAIR, 3, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_FAIR, 3, AG_WINDOW_HAS_SFX, 0); //JEX only
set_window_value(AT_FAIR, 3, AG_WINDOW_SFX_FRAME, 1);
set_window_value(AT_FAIR, 3, AG_WINDOW_SFX, asset_get("sfx_absa_new_whip2"));

set_window_value(AT_FAIR, 4, AG_WINDOW_LENGTH, 9);
set_window_value(AT_FAIR, 4, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FAIR, 4, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(AT_FAIR, 4, AG_WINDOW_HAS_WHIFFLAG, 1);

set_window_value(AT_FAIR, 5, AG_WINDOW_LENGTH, 16);
set_window_value(AT_FAIR, 5, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_FAIR, 5, AG_WINDOW_ANIM_FRAME_START, 7);
set_window_value(AT_FAIR, 5, AG_WINDOW_CANCEL_FRAME, 4); //used for IASA if not parried

set_num_hitboxes(AT_FAIR, 5);

set_hitbox_value(AT_FAIR, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FAIR, 1, HG_WINDOW, 3);
set_hitbox_value(AT_FAIR, 1, HG_LIFETIME, 5);
set_hitbox_value(AT_FAIR, 1, HG_HITBOX_X, 20);
set_hitbox_value(AT_FAIR, 1, HG_HITBOX_Y, -25);
set_hitbox_value(AT_FAIR, 1, HG_WIDTH, 44);
set_hitbox_value(AT_FAIR, 1, HG_HEIGHT, 55);
set_hitbox_value(AT_FAIR, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_FAIR, 1, HG_DAMAGE, 9);
set_hitbox_value(AT_FAIR, 1, HG_ANGLE, 45);
set_hitbox_value(AT_FAIR, 1, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_FAIR, 1, HG_KNOCKBACK_SCALING, .9);
set_hitbox_value(AT_FAIR, 1, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_FAIR, 1, HG_HITPAUSE_SCALING, .7);
set_hitbox_value(AT_FAIR, 1, HG_HIT_SFX, asset_get("sfx_blow_medium2"));
set_hitbox_value(AT_FAIR, 1, HG_HIT_LOCKOUT, 12);
set_hitbox_value(AT_FAIR, 1, HG_MUNO_OBJECT_LAUNCH_ANGLE, 1);

//Lingering hitbox
set_hitbox_value(AT_FAIR, 2, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_FAIR, 2, HG_WINDOW, 3);
set_hitbox_value(AT_FAIR, 2, HG_WINDOW_CREATION_FRAME, 3);
set_hitbox_value(AT_FAIR, 2, HG_LIFETIME, 36);
set_hitbox_value(AT_FAIR, 2, HG_HITBOX_X, 35);
set_hitbox_value(AT_FAIR, 2, HG_HITBOX_Y, -15);
set_hitbox_value(AT_FAIR, 2, HG_WIDTH, 40);
set_hitbox_value(AT_FAIR, 2, HG_HEIGHT, 40);
set_hitbox_value(AT_FAIR, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_FAIR, 2, HG_DAMAGE, 1);
set_hitbox_value(AT_FAIR, 2, HG_ANGLE, 90);
set_hitbox_value(AT_FAIR, 2, HG_BASE_KNOCKBACK, 1.5);
set_hitbox_value(AT_FAIR, 2, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_FAIR, 2, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_FAIR, 2, HG_HITPAUSE_SCALING, .1);
set_hitbox_value(AT_FAIR, 2, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_FAIR, 2, HG_HIT_SFX, asset_get("sfx_icehit_weak1"));
set_hitbox_value(AT_FAIR, 2, HG_VISUAL_EFFECT, 6);

set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_SPRITE, sprite_get("cloud_proj_big"));
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_ANIM_SPEED, (8.0 / get_hitbox_value(AT_FAIR, 2, HG_LIFETIME)));
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_HSPEED, 1.5);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_WALL_BEHAVIOR, 2);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_AIR_FRICTION, 0.3);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_GROUND_FRICTION, 0.3);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_PARRY_STUN, 1);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_UNBASHABLE, 0);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_IS_TRANSCENDENT, 1);

//Strong-FAIR hitbox (replaces hitbox #2)
set_hitbox_value(AT_FAIR, 3, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_FAIR, 3, HG_WINDOW, noone); //see user_event7
set_hitbox_value(AT_FAIR, 3, HG_WINDOW_CREATION_FRAME, 3);
set_hitbox_value(AT_FAIR, 3, HG_LIFETIME, 9);
set_hitbox_value(AT_FAIR, 3, HG_HITBOX_X, 35);
set_hitbox_value(AT_FAIR, 3, HG_HITBOX_Y, -15);
set_hitbox_value(AT_FAIR, 3, HG_WIDTH, 60);
set_hitbox_value(AT_FAIR, 3, HG_HEIGHT, 60);
set_hitbox_value(AT_FAIR, 3, HG_PRIORITY, 2);
set_hitbox_value(AT_FAIR, 3, HG_DAMAGE, 6);
set_hitbox_value(AT_FAIR, 3, HG_ANGLE, 55);
set_hitbox_value(AT_FAIR, 3, HG_HIT_LOCKOUT, 8);
set_hitbox_value(AT_FAIR, 3, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_FAIR, 3, HG_KNOCKBACK_SCALING, .8);
set_hitbox_value(AT_FAIR, 3, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_FAIR, 3, HG_HITPAUSE_SCALING, .5);
set_hitbox_value(AT_FAIR, 3, HG_IGNORES_PROJECTILES, 0);
set_hitbox_value(AT_FAIR, 3, HG_HIT_SFX, asset_get("sfx_icehit_medium2"));
set_hitbox_value(AT_FAIR, 3, HG_VISUAL_EFFECT, 28);
set_hitbox_value(AT_FAIR, 3, HG_MUNO_OBJECT_LAUNCH_ANGLE, 1);

set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_SPRITE, sprite_get("vfx_ice_big"));
set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_ANIM_SPEED, (3.0 / get_hitbox_value(AT_FAIR, 3, HG_LIFETIME)) );
set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_HSPEED, 1.5);
set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_AIR_FRICTION, 0.3);
set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_GROUND_FRICTION, 0.3);
set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_PARRY_STUN, 1);
set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_UNBASHABLE, 1);
set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_IS_TRANSCENDENT, 1);

//JEX-Fair (Clap)
set_hitbox_value(AT_FAIR, 4, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FAIR, 4, HG_WINDOW, noone); //3
set_hitbox_value(AT_FAIR, 4, HG_LIFETIME, 2);
set_hitbox_value(AT_FAIR, 4, HG_HITBOX_X, 12);
set_hitbox_value(AT_FAIR, 4, HG_HITBOX_Y, -15);
set_hitbox_value(AT_FAIR, 4, HG_WIDTH, 32);
set_hitbox_value(AT_FAIR, 4, HG_HEIGHT, 28);
set_hitbox_value(AT_FAIR, 4, HG_PRIORITY, 6);
set_hitbox_value(AT_FAIR, 4, HG_DAMAGE, 10);
set_hitbox_value(AT_FAIR, 4, HG_ANGLE, 45);
set_hitbox_value(AT_FAIR, 4, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_FAIR, 4, HG_KNOCKBACK_SCALING, .8);
set_hitbox_value(AT_FAIR, 4, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_FAIR, 4, HG_HITPAUSE_SCALING, .7);
set_hitbox_value(AT_FAIR, 4, HG_HIT_SFX, asset_get("sfx_absa_kickhit"));
set_hitbox_value(AT_FAIR, 4, HG_VISUAL_EFFECT, HFX_ABS_ZAP_BIG);
set_hitbox_value(AT_FAIR, 4, HG_HITBOX_GROUP, 2);
set_hitbox_value(AT_FAIR, 4, HG_HIT_LOCKOUT, 4);
set_hitbox_value(AT_FAIR, 4, HG_MUNO_OBJECT_LAUNCH_ANGLE, 1);

//JEX-Fair (Shock)
set_hitbox_value(AT_FAIR, 5, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FAIR, 5, HG_WINDOW, noone); //3
set_hitbox_value(AT_FAIR, 5, HG_WINDOW_CREATION_FRAME, 2);
set_hitbox_value(AT_FAIR, 5, HG_LIFETIME, 3);
set_hitbox_value(AT_FAIR, 5, HG_HITBOX_X, 24);
set_hitbox_value(AT_FAIR, 5, HG_HITBOX_Y, -10);
set_hitbox_value(AT_FAIR, 5, HG_WIDTH, 55);
set_hitbox_value(AT_FAIR, 5, HG_HEIGHT, 55);
set_hitbox_value(AT_FAIR, 5, HG_PRIORITY, 4);
set_hitbox_value(AT_FAIR, 5, HG_DAMAGE, 9);
set_hitbox_value(AT_FAIR, 5, HG_ANGLE, 45);
set_hitbox_value(AT_FAIR, 5, HG_BASE_KNOCKBACK, 5);
set_hitbox_value(AT_FAIR, 5, HG_KNOCKBACK_SCALING, .5);
set_hitbox_value(AT_FAIR, 5, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_FAIR, 5, HG_HITPAUSE_SCALING, .7);
set_hitbox_value(AT_FAIR, 5, HG_HIT_SFX, asset_get("sfx_absa_dattack"));
set_hitbox_value(AT_FAIR, 5, HG_VISUAL_EFFECT, HFX_ABS_ZAP_BIG);
set_hitbox_value(AT_FAIR, 5, HG_HITBOX_GROUP, 2);
set_hitbox_value(AT_FAIR, 5, HG_MUNO_OBJECT_LAUNCH_ANGLE, 1);


//Only for exploding cloud rune
set_hitbox_value(AT_FAIR, 9, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_FAIR, 9, HG_LIFETIME, 8);
set_hitbox_value(AT_FAIR, 9, HG_WIDTH, 90);
set_hitbox_value(AT_FAIR, 9, HG_HEIGHT, 90);
set_hitbox_value(AT_FAIR, 9, HG_PRIORITY, 5);
set_hitbox_value(AT_FAIR, 9, HG_DAMAGE, 12);
set_hitbox_value(AT_FAIR, 9, HG_ANGLE, 55);
set_hitbox_value(AT_FAIR, 9, HG_ANGLE_FLIPPER, 3);
set_hitbox_value(AT_FAIR, 9, HG_BASE_KNOCKBACK, 8);
set_hitbox_value(AT_FAIR, 9, HG_KNOCKBACK_SCALING, 1);
set_hitbox_value(AT_FAIR, 9, HG_BASE_HITPAUSE, 10);
set_hitbox_value(AT_FAIR, 9, HG_HITPAUSE_SCALING, .5);
set_hitbox_value(AT_FAIR, 9, HG_HIT_SFX, sound_get("sfx_noz_ice_medium"));
set_hitbox_value(AT_FAIR, 9, HG_VISUAL_EFFECT, 1);

set_hitbox_value(AT_FAIR, 9, HG_PROJECTILE_SPRITE, sprite_get("vfx_ice_big"));
set_hitbox_value(AT_FAIR, 9, HG_PROJECTILE_ANIM_SPEED, 0.5);
set_hitbox_value(AT_FAIR, 9, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_FAIR, 9, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(AT_FAIR, 9, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_FAIR, 9, HG_PROJECTILE_PARRY_STUN, 0);
set_hitbox_value(AT_FAIR, 9, HG_PROJECTILE_UNBASHABLE, 1);
set_hitbox_value(AT_FAIR, 9, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_FAIR, 9, HG_PROJECTILE_IS_TRANSCENDENT, 1);
set_hitbox_value(AT_FAIR, 9, HG_MUNO_OBJECT_LAUNCH_ANGLE, -2);

