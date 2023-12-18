set_attack_value(AT_DSPECIAL, AG_CATEGORY, 2);
set_attack_value(AT_DSPECIAL, AG_SPRITE, sprite_get("dspecial"));
set_attack_value(AT_DSPECIAL, AG_NUM_WINDOWS, 3);
set_attack_value(AT_DSPECIAL, AG_HURTBOX_SPRITE, sprite_get("dspecial_hurt"));
set_attack_value(AT_DSPECIAL, AG_USES_CUSTOM_GRAVITY, 1);

set_window_value(AT_DSPECIAL, 1, AG_WINDOW_LENGTH, 7);
set_window_value(AT_DSPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DSPECIAL, 1, AG_WINDOW_CUSTOM_GRAVITY, gravity_speed);

set_window_value(AT_DSPECIAL, 2, AG_WINDOW_LENGTH, 9);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 1);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_SFX_FRAME, 0);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_SFX, asset_get("sfx_absa_cloud_place"));
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_VSPEED_TYPE, 1);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_VSPEED, -3);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_CUSTOM_GRAVITY, gravity_speed / 2);

set_window_value(AT_DSPECIAL, 3, AG_WINDOW_LENGTH, 25);
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_CUSTOM_GRAVITY, gravity_speed );

set_num_hitboxes(AT_DSPECIAL, 0);

//==============================================================
//Joke Explainer mode
set_attack_value(AT_DSPECIAL_2, AG_CATEGORY, 2);
set_attack_value(AT_DSPECIAL_2, AG_SPRITE, sprite_get("jex_dspecial"));
set_attack_value(AT_DSPECIAL_2, AG_NUM_WINDOWS, 3);
set_attack_value(AT_DSPECIAL_2, AG_HURTBOX_SPRITE, sprite_get("idle_hurt"));
set_attack_value(AT_DSPECIAL_2, AG_USES_CUSTOM_GRAVITY, 1);

set_window_value(AT_DSPECIAL_2, 1, AG_WINDOW_LENGTH, 15);
set_window_value(AT_DSPECIAL_2, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_DSPECIAL_2, 1, AG_WINDOW_CUSTOM_GRAVITY, 0.8);

set_window_value(AT_DSPECIAL_2, 2, AG_WINDOW_LENGTH, 32);
set_window_value(AT_DSPECIAL_2, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DSPECIAL_2, 2, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_DSPECIAL_2, 2, AG_WINDOW_CUSTOM_GRAVITY, 0.6);

//Shock
set_window_value(AT_DSPECIAL_2, 3, AG_WINDOW_LENGTH, 35);
set_window_value(AT_DSPECIAL_2, 3, AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(AT_DSPECIAL_2, 3, AG_WINDOW_VSPEED_TYPE, 2);
set_window_value(AT_DSPECIAL_2, 3, AG_WINDOW_VSPEED, -2);
set_window_value(AT_DSPECIAL_2, 3, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DSPECIAL_2, 3, AG_WINDOW_SFX_FRAME, 0);
set_window_value(AT_DSPECIAL_2, 3, AG_WINDOW_SFX, sound_get("sfx_thunderstruck"));
set_window_value(AT_DSPECIAL_2, 3, AG_WINDOW_ANIM_FRAMES, 7);
set_window_value(AT_DSPECIAL_2, 3, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(AT_DSPECIAL_2, 3, AG_WINDOW_CUSTOM_GRAVITY, 0.2);

//Whiffed
set_window_value(AT_DSPECIAL_2, 4, AG_WINDOW_LENGTH, 16);
set_window_value(AT_DSPECIAL_2, 4, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DSPECIAL_2, 4, AG_WINDOW_ANIM_FRAME_START, 11);
set_window_value(AT_DSPECIAL_2, 4, AG_WINDOW_CUSTOM_GRAVITY, 1);

set_num_hitboxes(AT_DSPECIAL_2, 3);


//Technical hitbox for the article positioning
set_hitbox_value(AT_DSPECIAL_2, 1, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_WINDOW, 1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_WINDOW_CREATION_FRAME, 1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_LIFETIME, 1 + get_window_value(AT_DSPECIAL_2, 1, AG_WINDOW_LENGTH));
set_hitbox_value(AT_DSPECIAL_2, 1, HG_HITBOX_X, 0);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_HITBOX_Y, -40);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_WIDTH, 0);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_HEIGHT, 1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_SHAPE, 1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PRIORITY, 0);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_DAMAGE, 0);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_ANGLE, 0);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_ANGLE_FLIPPER, 0);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_GROUNDEDNESS, 1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_EXTRA_CAMERA_SHAKE, -1); //none
set_hitbox_value(AT_DSPECIAL_2, 1, HG_VISUAL_EFFECT, 1); //none
set_hitbox_value(AT_DSPECIAL_2, 1, HG_FORCE_FLINCH, 2); //none
set_hitbox_value(AT_DSPECIAL_2, 1, HG_THROWS_ROCK, 2); //ignore

set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_SPRITE, sprite_get("thunder_cloud"));
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_COLLISION_SPRITE, sprite_get("smol_mask"));
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_ANIM_SPEED, 0);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_VSPEED, -50);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_GRAVITY, -get_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_VSPEED)
                                                          /(0 + get_hitbox_value(AT_DSPECIAL_2, 1, HG_LIFETIME)) );
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_GRAVITY, 0)
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_HSPEED, 0);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 1); //use 55 for Sliding later
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_WALL_BEHAVIOR, 1);   //use 55 for Sliding later
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_UNBASHABLE, 1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_DSPECIAL_2, 1, HG_PROJECTILE_IS_TRANSCENDENT, 1);

//Rune-only projectile for explosive clouds
set_hitbox_value(AT_DSPECIAL_2, 2, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DSPECIAL_2, 2, HG_WINDOW, noone);

//Shockwave
set_hitbox_value(AT_DSPECIAL_2, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_WINDOW, 3);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_WINDOW_CREATION_FRAME, 1);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_LIFETIME, 4);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_HITBOX_X, 0);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_HITBOX_Y, -20);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_WIDTH, 100);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_HEIGHT, 100);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_SHAPE, 0);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_PRIORITY, 9);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_DAMAGE, 15);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_ANGLE, 70);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_ANGLE_FLIPPER, 3);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_KNOCKBACK_SCALING, 1.0);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_BASE_HITPAUSE, 7);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_HITPAUSE_SCALING, .9);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_HIT_LOCKOUT, 3);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_VISUAL_EFFECT, HFX_ABS_SWEET_BIG);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_VISUAL_EFFECT_X_OFFSET, 10);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_HIT_SFX, asset_get("sfx_icehit_medium2"));
set_hitbox_value(AT_DSPECIAL_2, 3, HG_HITBOX_GROUP, 1);
set_hitbox_value(AT_DSPECIAL_2, 3, HG_MUNO_OBJECT_LAUNCH_ANGLE, -1);

//Downward initial projectile (see hitbox_update + article3)
set_hitbox_value(AT_DSPECIAL_2, 4, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_WINDOW, noone);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_LIFETIME, 180);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_WIDTH, 16);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_HEIGHT, 20);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_SHAPE, 1);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_PRIORITY, 6);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_DAMAGE, 0.01); //for pocket to think it deals damage
set_hitbox_value(AT_DSPECIAL_2, 4, HG_ANGLE, 75);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_BASE_HITPAUSE, 2);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_HIT_LOCKOUT, 1);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_ANGLE_FLIPPER, 4);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_VISUAL_EFFECT, HFX_ABS_ZAP_SMALL);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_HIT_SFX, asset_get("sfx_absa_orb_hit"));

set_hitbox_value(AT_DSPECIAL_2, 4, HG_PROJECTILE_SPRITE, sprite_get("thunder_proj"));
set_hitbox_value(AT_DSPECIAL_2, 4, HG_PROJECTILE_ANIM_SPEED, 0.25);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_PROJECTILE_DESTROY_EFFECT, 1); //none
set_hitbox_value(AT_DSPECIAL_2, 4, HG_PROJECTILE_VSPEED, 16);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_PROJECTILE_GROUND_BEHAVIOR, 0);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_PROJECTILE_WALL_BEHAVIOR, 5);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_PROJECTILE_PARRY_STUN, 1);
set_hitbox_value(AT_DSPECIAL_2, 4, HG_PROJECTILE_IS_TRANSCENDENT, 1);

//mild pulse trail
set_hitbox_value(AT_DSPECIAL_2, 5, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_WINDOW, noone);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_LIFETIME, 2);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_WIDTH, 16);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_HEIGHT, 20);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_SHAPE, 1);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_PRIORITY, 6);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_DAMAGE, 0);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_ANGLE, 75);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_BASE_HITPAUSE, 1);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_HITPAUSE_SCALING, 0);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_ANGLE_FLIPPER, 4);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_VISUAL_EFFECT, HFX_ABS_ZAP_SMALL);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_HIT_LOCKOUT, 1);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_FORCE_FLINCH, 2);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_HIT_SFX, asset_get("sfx_absa_orb_hit"));

set_hitbox_value(AT_DSPECIAL_2, 5, HG_PROJECTILE_SPRITE, asset_get("empty_sprite"));
set_hitbox_value(AT_DSPECIAL_2, 5, HG_PROJECTILE_ANIM_SPEED, 0);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_PROJECTILE_PARRY_STUN, 1);
set_hitbox_value(AT_DSPECIAL_2, 5, HG_PROJECTILE_IS_TRANSCENDENT, 1);

//Thunderstrike trail
set_hitbox_value(AT_DSPECIAL_2, 6, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_WINDOW, noone);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_LIFETIME, 4);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_WIDTH, 30);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_HEIGHT, 30);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_SHAPE, 1);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_PRIORITY, 6);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_DAMAGE, 12);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_ANGLE, 90);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_BASE_KNOCKBACK, 8);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_KNOCKBACK_SCALING, 1);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_BASE_HITPAUSE, 8);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_HITPAUSE_SCALING, 3);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_ANGLE_FLIPPER, 0);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_HIT_LOCKOUT, 3);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_VISUAL_EFFECT, HFX_ABS_SWEET_BIG);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_HIT_SFX, asset_get("sfx_absa_uair"));

set_hitbox_value(AT_DSPECIAL_2, 6, HG_PROJECTILE_SPRITE, asset_get("empty_sprite"));
set_hitbox_value(AT_DSPECIAL_2, 6, HG_PROJECTILE_ANIM_SPEED, 0);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_PROJECTILE_PARRY_STUN, 1);
set_hitbox_value(AT_DSPECIAL_2, 6, HG_PROJECTILE_IS_TRANSCENDENT, 1);