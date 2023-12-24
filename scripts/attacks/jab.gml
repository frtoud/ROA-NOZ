set_attack_value(AT_JAB, AG_SPRITE, sprite_get("jab"));
set_attack_value(AT_JAB, AG_NUM_WINDOWS, 14);
set_attack_value(AT_JAB, AG_HURTBOX_SPRITE, sprite_get("jab_hurt"));

//First Hit
set_window_value(AT_JAB, 1, AG_WINDOW_LENGTH, 3);
set_window_value(AT_JAB, 1, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_JAB, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_JAB, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_weak1"));
set_window_value(AT_JAB, 1, AG_WINDOW_SFX_FRAME, 2);

set_window_value(AT_JAB, 2, AG_WINDOW_LENGTH, 3);
set_window_value(AT_JAB, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_JAB, 2, AG_WINDOW_ANIM_FRAME_START, 1);

set_window_value(AT_JAB, 3, AG_WINDOW_LENGTH, 15);
set_window_value(AT_JAB, 3, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_JAB, 3, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_JAB, 3, AG_WINDOW_CANCEL_TYPE, 1);
set_window_value(AT_JAB, 3, AG_WINDOW_CANCEL_FRAME, 5);

set_hitbox_value(AT_JAB, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_JAB, 1, HG_WINDOW, 2);
set_hitbox_value(AT_JAB, 1, HG_LIFETIME, 3);
set_hitbox_value(AT_JAB, 1, HG_HITBOX_X, 22);
set_hitbox_value(AT_JAB, 1, HG_HITBOX_Y, -15);
set_hitbox_value(AT_JAB, 1, HG_WIDTH, 40);
set_hitbox_value(AT_JAB, 1, HG_HEIGHT, 25);
set_hitbox_value(AT_JAB, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_JAB, 1, HG_DAMAGE, 3);
set_hitbox_value(AT_JAB, 1, HG_ANGLE, 45);
set_hitbox_value(AT_JAB, 1, HG_BASE_KNOCKBACK, 2);
set_hitbox_value(AT_JAB, 1, HG_KNOCKBACK_SCALING, 0.02);
set_hitbox_value(AT_JAB, 1, HG_BASE_HITPAUSE, 4);
set_hitbox_value(AT_JAB, 1, HG_EXTRA_HITPAUSE, 2);
set_hitbox_value(AT_JAB, 1, HG_HITSTUN_MULTIPLIER, 1.3);
set_hitbox_value(AT_JAB, 1, HG_VISUAL_EFFECT_X_OFFSET, 0);
set_hitbox_value(AT_JAB, 1, HG_VISUAL_EFFECT_Y_OFFSET, -5);
set_hitbox_value(AT_JAB, 1, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_JAB, 1, HG_HIT_SFX, asset_get("sfx_blow_weak1"));
set_hitbox_value(AT_JAB, 1, HG_MUNO_OBJECT_LAUNCH_ANGLE, 1);


//Infinites
set_window_value(AT_JAB, 4, AG_WINDOW_LENGTH, 2);
set_window_value(AT_JAB, 4, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_JAB, 4, AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(AT_JAB, 4, AG_WINDOW_HSPEED, 4.4);
set_window_value(AT_JAB, 4, AG_WINDOW_GOTO, 7);

//Defines WINDOWS 5-10 and HITBOXES 2-7
for (var i = 0; i < 6; i++)
{
    var w = 5+i;
    var h = 2+i;

    set_window_value(AT_JAB, w, AG_WINDOW_TYPE, 0);
    set_window_value(AT_JAB, w, AG_WINDOW_LENGTH, 5);
    set_window_value(AT_JAB, w, AG_WINDOW_ANIM_FRAMES, 2);
    set_window_value(AT_JAB, w, AG_WINDOW_ANIM_FRAME_START, 6+2*i);
    set_window_value(AT_JAB, w, AG_WINDOW_HAS_SFX, 1);
    set_window_value(AT_JAB, w, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));

    set_hitbox_value(AT_JAB, h, HG_HITBOX_TYPE, 1);
    set_hitbox_value(AT_JAB, h, HG_WINDOW, w);
    set_hitbox_value(AT_JAB, h, HG_WINDOW_CREATION_FRAME, 1);
    set_hitbox_value(AT_JAB, h, HG_HITBOX_GROUP, -1);
    set_hitbox_value(AT_JAB, h, HG_HITBOX_X, 24);
    set_hitbox_value(AT_JAB, h, HG_HITBOX_Y, -20);
    set_hitbox_value(AT_JAB, h, HG_LIFETIME, 1);
    set_hitbox_value(AT_JAB, h, HG_MUNO_OBJECT_LAUNCH_ANGLE, 1);

    if (i == 0)
    {
        set_hitbox_value(AT_JAB, h, HG_PRIORITY, 2);
        set_hitbox_value(AT_JAB, h, HG_WIDTH, 48);
        set_hitbox_value(AT_JAB, h, HG_HEIGHT, 32);
        set_hitbox_value(AT_JAB, h, HG_DAMAGE, 1);
        set_hitbox_value(AT_JAB, h, HG_ANGLE, 50);
        set_hitbox_value(AT_JAB, h, HG_BASE_KNOCKBACK, 1.6);
        set_hitbox_value(AT_JAB, h, HG_KNOCKBACK_SCALING, 0.01);
        set_hitbox_value(AT_JAB, h, HG_BASE_HITPAUSE, 1);
        set_hitbox_value(AT_JAB, h, HG_EXTRA_HITPAUSE, 2);
        set_hitbox_value(AT_JAB, h, HG_HITSTUN_MULTIPLIER, 1.5);
        set_hitbox_value(AT_JAB, h, HG_VISUAL_EFFECT_X_OFFSET, 0);
        set_hitbox_value(AT_JAB, h, HG_VISUAL_EFFECT_Y_OFFSET, -5);
        set_hitbox_value(AT_JAB, h, HG_HIT_SFX, asset_get("sfx_blow_weak2"));
    }
    else set_hitbox_value(AT_JAB, h, HG_PARENT_HITBOX, 2);
}


//Endlag
set_window_value(AT_JAB, 11, AG_WINDOW_LENGTH, 15);
set_window_value(AT_JAB, 11, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_JAB, 11, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_JAB, 11, AG_WINDOW_CANCEL_TYPE, 1);
set_window_value(AT_JAB, 11, AG_WINDOW_CANCEL_FRAME, 1);


//Finisher
set_window_value(AT_JAB, 12, AG_WINDOW_TYPE, 0);
set_window_value(AT_JAB, 12, AG_WINDOW_LENGTH, 3);
set_window_value(AT_JAB, 12, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_JAB, 12, AG_WINDOW_ANIM_FRAME_START, 18);
set_window_value(AT_JAB, 12, AG_WINDOW_HSPEED, 5);
set_window_value(AT_JAB, 12, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_JAB, 12, AG_WINDOW_SFX, asset_get("sfx_swipe_medium1"));
set_window_value(AT_JAB, 12, AG_WINDOW_SFX_FRAME, 2);

set_window_value(AT_JAB, 13, AG_WINDOW_TYPE, 0);
set_window_value(AT_JAB, 13, AG_WINDOW_LENGTH, 9);
set_window_value(AT_JAB, 13, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_JAB, 13, AG_WINDOW_ANIM_FRAME_START, 19);

set_window_value(AT_JAB, 14, AG_WINDOW_TYPE, 0);
set_window_value(AT_JAB, 14, AG_WINDOW_LENGTH, 15);
set_window_value(AT_JAB, 14, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_JAB, 14, AG_WINDOW_ANIM_FRAME_START, 21);

set_hitbox_value(AT_JAB, 8, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_JAB, 8, HG_WINDOW, 13);
set_hitbox_value(AT_JAB, 8, HG_LIFETIME, 4);
set_hitbox_value(AT_JAB, 8, HG_HITBOX_X, 22);
set_hitbox_value(AT_JAB, 8, HG_HITBOX_Y, -24);
set_hitbox_value(AT_JAB, 8, HG_WIDTH, 52);
set_hitbox_value(AT_JAB, 8, HG_HEIGHT, 40);
set_hitbox_value(AT_JAB, 8, HG_PRIORITY, 2);
set_hitbox_value(AT_JAB, 8, HG_DAMAGE, 4);
set_hitbox_value(AT_JAB, 8, HG_ANGLE, 55);
set_hitbox_value(AT_JAB, 8, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_JAB, 8, HG_KNOCKBACK_SCALING, 0.75);
set_hitbox_value(AT_JAB, 8, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_JAB, 8, HG_HITPAUSE_SCALING, 0.3);
set_hitbox_value(AT_JAB, 8, HG_VISUAL_EFFECT_X_OFFSET, 0);
set_hitbox_value(AT_JAB, 8, HG_VISUAL_EFFECT_Y_OFFSET, -5);
set_hitbox_value(AT_JAB, 8, HG_HITBOX_GROUP, -1);
set_hitbox_value(AT_JAB, 8, HG_HIT_SFX, asset_get("sfx_blow_medium2"));

set_num_hitboxes(AT_JAB, 8);