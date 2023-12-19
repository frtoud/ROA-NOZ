set_attack_value(AT_FSPECIAL, AG_CATEGORY, 2);
set_attack_value(AT_FSPECIAL, AG_SPRITE, sprite_get("fspecial"));
set_attack_value(AT_FSPECIAL, AG_NUM_WINDOWS, 4);
set_attack_value(AT_FSPECIAL, AG_OFF_LEDGE, 0);
set_attack_value(AT_FSPECIAL, AG_AIR_SPRITE, sprite_get("fspecial"));
set_attack_value(AT_FSPECIAL, AG_HURTBOX_SPRITE, sprite_get("fspecial_hurt"));

set_window_value(AT_FSPECIAL, 1, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_LENGTH, 6);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_ANIM_FRAME_START, 1);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSPECIAL, 1, AG_WINDOW_VSPEED_TYPE, 1);

set_window_value(AT_FSPECIAL, 2, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_LENGTH, 12);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HSPEED, 8);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HSPEED_TYPE, 2);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_VSPEED_TYPE, 1);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSPECIAL, 2, AG_WINDOW_SFX, asset_get("sfx_orca_snow_evaporate"));

set_window_value(AT_FSPECIAL, 3, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_LENGTH, 24);
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_ANIM_FRAME_START, 7);
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.15);
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.25);
set_window_value(AT_FSPECIAL, 3, AG_WINDOW_VSPEED_TYPE, 1);

set_window_value(AT_FSPECIAL, 4, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL, 4, AG_WINDOW_LENGTH, 20);
set_window_value(AT_FSPECIAL, 4, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_FSPECIAL, 4, AG_WINDOW_ANIM_FRAME_START, 7);
set_window_value(AT_FSPECIAL, 4, AG_WINDOW_VSPEED, 0);
set_window_value(AT_FSPECIAL, 4, AG_WINDOW_VSPEED_TYPE, 2);

set_num_hitboxes(AT_FSPECIAL, 2);

set_hitbox_value(AT_FSPECIAL, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FSPECIAL, 1, HG_WINDOW, 2);
set_hitbox_value(AT_FSPECIAL, 1, HG_LIFETIME, 6);
set_hitbox_value(AT_FSPECIAL, 1, HG_HITBOX_Y, -24);
set_hitbox_value(AT_FSPECIAL, 1, HG_WIDTH, 60);
set_hitbox_value(AT_FSPECIAL, 1, HG_HEIGHT, 44);
set_hitbox_value(AT_FSPECIAL, 1, HG_PRIORITY, 5);
set_hitbox_value(AT_FSPECIAL, 1, HG_DAMAGE, 6);
set_hitbox_value(AT_FSPECIAL, 1, HG_ANGLE, 75);
set_hitbox_value(AT_FSPECIAL, 1, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_FSPECIAL, 1, HG_KNOCKBACK_SCALING, .4);
set_hitbox_value(AT_FSPECIAL, 1, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_FSPECIAL, 1, HG_VISUAL_EFFECT, 28);
set_hitbox_value(AT_FSPECIAL, 1, HG_HIT_SFX, asset_get("sfx_icehit_medium2"));
set_hitbox_value(AT_FSPECIAL, 1, HG_IGNORES_PROJECTILES, 1);

set_hitbox_value(AT_FSPECIAL, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FSPECIAL, 2, HG_WINDOW, 2);
set_hitbox_value(AT_FSPECIAL, 2, HG_WINDOW_CREATION_FRAME, 6);
set_hitbox_value(AT_FSPECIAL, 2, HG_LIFETIME, 20);
set_hitbox_value(AT_FSPECIAL, 2, HG_HITBOX_X, 16);
set_hitbox_value(AT_FSPECIAL, 2, HG_HITBOX_Y, -24);
set_hitbox_value(AT_FSPECIAL, 2, HG_WIDTH, 30);
set_hitbox_value(AT_FSPECIAL, 2, HG_HEIGHT, 30);
set_hitbox_value(AT_FSPECIAL, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_FSPECIAL, 2, HG_DAMAGE, 4);
set_hitbox_value(AT_FSPECIAL, 2, HG_ANGLE, 85);
set_hitbox_value(AT_FSPECIAL, 2, HG_BASE_KNOCKBACK, 5);
set_hitbox_value(AT_FSPECIAL, 2, HG_KNOCKBACK_SCALING, .3);
set_hitbox_value(AT_FSPECIAL, 2, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_FSPECIAL, 2, HG_VISUAL_EFFECT, 28);
set_hitbox_value(AT_FSPECIAL, 2, HG_HIT_SFX, asset_get("sfx_icehit_medium2"));
set_hitbox_value(AT_FSPECIAL, 2, HG_IGNORES_PROJECTILES, 1);


//==============================================================
//Joke Explainer mode
set_attack_value(AT_FSPECIAL_2, AG_CATEGORY, 2);
set_attack_value(AT_FSPECIAL_2, AG_SPRITE, sprite_get("jex_fspecial"));
set_attack_value(AT_FSPECIAL_2, AG_NUM_WINDOWS, 7);
set_attack_value(AT_FSPECIAL_2, AG_AIR_SPRITE, sprite_get("jex_fspecial"));
set_attack_value(AT_FSPECIAL_2, AG_HURTBOX_SPRITE, sprite_get("jex_fspecial_hurt"));
set_attack_value(AT_FSPECIAL_2, AG_USES_CUSTOM_GRAVITY, 1);
set_attack_value(AT_FSPECIAL_2, AG_LANDING_LAG, 25); //applied manually. see attack_update

//startup
set_window_value(AT_FSPECIAL_2, 1, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL_2, 1, AG_WINDOW_LENGTH, 10);
set_window_value(AT_FSPECIAL_2, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FSPECIAL_2, 1, AG_WINDOW_CUSTOM_GRAVITY, 2);

//charge
set_window_value(AT_FSPECIAL_2, 2, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL_2, 2, AG_WINDOW_LENGTH, 4);
set_window_value(AT_FSPECIAL_2, 2, AG_WINDOW_ANIM_FRAMES, 1); //animated manually >:]
set_window_value(AT_FSPECIAL_2, 2, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_FSPECIAL_2, 2, AG_WINDOW_CUSTOM_GRAVITY, 0.08);
set_window_value(AT_FSPECIAL_2, 2, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_FSPECIAL_2, 2, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.5);
set_window_value(AT_FSPECIAL_2, 2, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.5);

//pre-launch
set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_LENGTH, 5);
set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_ANIM_FRAME_START, 7);
set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_HSPEED_TYPE, 2);
set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_VSPEED_TYPE, 2);
set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_CUSTOM_GRAVITY, 0);
set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_SFX_FRAME, 4);
set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_SFX, asset_get("sfx_ori_spirit_flame_hit_1")); //dynamic
set_window_value(AT_FSPECIAL_2, 3, AG_WINDOW_HITPAUSE_FRAME, 3);


//active
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_LENGTH, 12);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_ANIM_FRAMES, 3); //Dynamic
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_ANIM_FRAME_START, 8);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_HSPEED, 6); //Dynamic
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_VSPEED, 0);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_HSPEED_TYPE, 2);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_VSPEED_TYPE, 2);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_CUSTOM_GRAVITY, 0);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.1);
set_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.1);

//late-active
set_window_value(AT_FSPECIAL_2, 5, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL_2, 5, AG_WINDOW_LENGTH, 16);
set_window_value(AT_FSPECIAL_2, 5, AG_WINDOW_ANIM_FRAMES, 4); //Dynamic
set_window_value(AT_FSPECIAL_2, 5, AG_WINDOW_ANIM_FRAME_START, 11);
set_window_value(AT_FSPECIAL_2, 5, AG_WINDOW_CUSTOM_GRAVITY, 0.3);
set_window_value(AT_FSPECIAL_2, 5, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_FSPECIAL_2, 5, AG_WINDOW_CUSTOM_AIR_FRICTION, 1); //Dynamic
set_window_value(AT_FSPECIAL_2, 5, AG_WINDOW_CUSTOM_GROUND_FRICTION, 1);

//prat-endlag
set_window_value(AT_FSPECIAL_2, 6, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL_2, 6, AG_WINDOW_LENGTH, 15);
set_window_value(AT_FSPECIAL_2, 6, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FSPECIAL_2, 6, AG_WINDOW_ANIM_FRAME_START, 14);
set_window_value(AT_FSPECIAL_2, 6, AG_WINDOW_CUSTOM_GRAVITY, 0.5);
set_window_value(AT_FSPECIAL_2, 6, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_FSPECIAL_2, 6, AG_WINDOW_CUSTOM_AIR_FRICTION, 1);
set_window_value(AT_FSPECIAL_2, 6, AG_WINDOW_HITPAUSE_FRAME, 14);

//endlag
set_window_value(AT_FSPECIAL_2, 7, AG_WINDOW_TYPE, 1);
set_window_value(AT_FSPECIAL_2, 7, AG_WINDOW_LENGTH, 16);
set_window_value(AT_FSPECIAL_2, 7, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_FSPECIAL_2, 7, AG_WINDOW_ANIM_FRAME_START, 17);
set_window_value(AT_FSPECIAL_2, 7, AG_WINDOW_CUSTOM_GRAVITY, 0.7);

set_num_hitboxes(AT_FSPECIAL_2, 1);

set_hitbox_value(AT_FSPECIAL_2, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_WINDOW, 4);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_LIFETIME, get_window_value(AT_FSPECIAL_2, 4, AG_WINDOW_LENGTH)
                                              + get_window_value(AT_FSPECIAL_2, 5, AG_WINDOW_LENGTH) );
set_hitbox_value(AT_FSPECIAL_2, 1, HG_HITBOX_X, 8);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_HITBOX_Y, -14);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_WIDTH, 32);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_HEIGHT, 32);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_PRIORITY, 5);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_DAMAGE, 6); //dynamic
set_hitbox_value(AT_FSPECIAL_2, 1, HG_ANGLE, 361);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_KNOCKBACK_SCALING, 1.1); //dynamic
set_hitbox_value(AT_FSPECIAL_2, 1, HG_BASE_HITPAUSE, 12);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_HITPAUSE_SCALING, 0.8);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_VISUAL_EFFECT, HFX_GEN_BIG);
set_hitbox_value(AT_FSPECIAL_2, 1, HG_HIT_SFX, asset_get("sfx_tow_anchor_land"));
set_hitbox_value(AT_FSPECIAL_2, 1, HG_IGNORES_PROJECTILES, 1);