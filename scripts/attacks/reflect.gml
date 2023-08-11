set_attack_value(AT_NTHROW, AG_CATEGORY, 2);
set_attack_value(AT_NTHROW, AG_SPRITE, sprite_get("reflect"));
set_attack_value(AT_NTHROW, AG_NUM_WINDOWS, 2);
set_attack_value(AT_NTHROW, AG_HURTBOX_SPRITE, sprite_get("reflect_hurt"));


//Reflection window
set_window_value(AT_NTHROW, 1, AG_WINDOW_TYPE, 1);
set_window_value(AT_NTHROW, 1, AG_WINDOW_LENGTH, 20);
set_window_value(AT_NTHROW, 1, AG_WINDOW_INVINCIBILITY, 2);
set_window_value(AT_NTHROW, 1, AG_WINDOW_ANIM_FRAMES, 4);

//End
set_window_value(AT_NTHROW, 2, AG_WINDOW_TYPE, 1);
set_window_value(AT_NTHROW, 2, AG_WINDOW_LENGTH, 15);
set_window_value(AT_NTHROW, 2, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_NTHROW, 2, AG_WINDOW_ANIM_FRAME_START, 4);

//Hidden instant-Parry window
set_window_value(AT_NTHROW, 3, AG_WINDOW_TYPE, 1);
set_window_value(AT_NTHROW, 3, AG_WINDOW_LENGTH, 3);
set_window_value(AT_NTHROW, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_NTHROW, 3, AG_WINDOW_ANIM_FRAME_START, 3);

//Hidden vulnerability window
set_window_value(AT_NTHROW, 4, AG_WINDOW_TYPE, 1);
set_window_value(AT_NTHROW, 4, AG_WINDOW_LENGTH, 3);
set_window_value(AT_NTHROW, 4, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_NTHROW, 4, AG_WINDOW_ANIM_FRAME_START, 3);


set_num_hitboxes(AT_NTHROW, 0);
