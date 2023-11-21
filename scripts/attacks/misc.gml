//Reflector Rune
set_attack_value(AT_NSPECIAL_2, AG_CATEGORY, 2);
set_attack_value(AT_NSPECIAL_2, AG_SPRITE, sprite_get("reflect"));
set_attack_value(AT_NSPECIAL_2, AG_NUM_WINDOWS, 2);
set_attack_value(AT_NSPECIAL_2, AG_HURTBOX_SPRITE, sprite_get("reflect_hurt"));

//Reflection window
set_window_value(AT_NSPECIAL_2, 1, AG_WINDOW_TYPE, 1);
set_window_value(AT_NSPECIAL_2, 1, AG_WINDOW_LENGTH, 20);
set_window_value(AT_NSPECIAL_2, 1, AG_WINDOW_INVINCIBILITY, 2);
set_window_value(AT_NSPECIAL_2, 1, AG_WINDOW_ANIM_FRAMES, 4);

//End
set_window_value(AT_NSPECIAL_2, 2, AG_WINDOW_TYPE, 1);
set_window_value(AT_NSPECIAL_2, 2, AG_WINDOW_LENGTH, 15);
set_window_value(AT_NSPECIAL_2, 2, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_NSPECIAL_2, 2, AG_WINDOW_ANIM_FRAME_START, 4);

//Hidden instant-Parry window
set_window_value(AT_NSPECIAL_2, 3, AG_WINDOW_TYPE, 1);
set_window_value(AT_NSPECIAL_2, 3, AG_WINDOW_LENGTH, 3);
set_window_value(AT_NSPECIAL_2, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_NSPECIAL_2, 3, AG_WINDOW_ANIM_FRAME_START, 3);

//Hidden vulnerability window
set_window_value(AT_NSPECIAL_2, 4, AG_WINDOW_TYPE, 1);
set_window_value(AT_NSPECIAL_2, 4, AG_WINDOW_LENGTH, 3);
set_window_value(AT_NSPECIAL_2, 4, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_NSPECIAL_2, 4, AG_WINDOW_ANIM_FRAME_START, 3);

set_num_hitboxes(AT_NSPECIAL_2, 0);

//Nozomi Climbers Rune
set_attack_value(AT_EXTRA_4, AG_CATEGORY, 2);
set_attack_value(AT_EXTRA_4, AG_SPRITE, asset_get("empty_sprite"));
set_attack_value(AT_EXTRA_4, AG_HURTBOX_SPRITE, asset_get("empty_sprite"));
set_attack_value(AT_EXTRA_4, AG_NUM_WINDOWS, 1);

//Stalling window
set_window_value(AT_EXTRA_4, 1, AG_WINDOW_LENGTH, 20);
set_window_value(AT_EXTRA_4, 1, AG_WINDOW_INVINCIBILITY, 1);
