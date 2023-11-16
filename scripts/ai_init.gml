far_down_attacks[0] = AT_DAIR;

far_side_attacks[0] = AT_FSPECIAL;

mid_side_attacks[0] = AT_DATTACK;
mid_side_attacks[1] = AT_FTILT;
mid_side_attacks[2] = AT_FSPECIAL;

close_up_attacks[0] = AT_USTRONG;
close_up_attacks[1] = AT_UAIR;
close_up_attacks[2] = AT_UTILT;
close_up_attacks[3] = AT_NAIR;

close_down_attacks[0] = AT_DAIR;
close_down_attacks[1] = AT_DTILT;
close_down_attacks[2] = AT_DSTRONG;

close_side_attacks[0] = AT_FAIR;
close_side_attacks[1] = AT_BAIR;
close_side_attacks[2] = AT_FTILT;
close_side_attacks[3] = AT_FSTRONG;

neutral_attacks[0] = AT_NSPECIAL;
neutral_attacks[1] = AT_NAIR;
neutral_attacks[2] = AT_FAIR;
neutral_attacks[3] = AT_BAIR;
neutral_attacks[4] = AT_DSPECIAL;

//climbers-AI data structures
noz_climber_input_buffer_size = 32;
noz_climber_input_buffer = array_create(noz_climber_input_buffer_size, 0);
noz_climber_input_pointer = 20;

noz_climber_input_names = 
[
    "left_down", "right_down", "up_down", "down_down",
    "left_hard_pressed", "right_hard_pressed", "up_hard_pressed", "down_hard_pressed",
    "left_stick_pressed", "right_stick_pressed", "up_stick_pressed", "down_stick_pressed",
    "jump_down", "jump_pressed",
    "run_down", "run_pressed",
    "attack_down", "attack_pressed", 
    "strong_down", "left_strong_pressed", "right_strong_pressed", "up_strong_pressed", "down_strong_pressed",
    "special_down", "special_pressed",
    "shield_down", "shield_pressed",
    "taunt_down", "taunt_pressed",
]