//got_parried

if (my_hitboxID.attack == AT_USPECIAL)
{
    at_uspecial_hover_meter = -1;
    set_window_value(AT_USPECIAL, 5, AG_WINDOW_TYPE, 7);
}

//This hitbox can't put you in parrystun because you are not attacking... do it manually!
else if (my_hitboxID.attack == AT_DAIR) && (state == PS_LANDING_LAG)
{
    set_state(PS_PRATLAND);
}

//Parrying the lighting strike makes you the owner of the strike
else if (my_hitboxID.attack == AT_DSPECIAL_2) && ( (my_hitboxID.hbox_num == 4)
                                                || (my_hitboxID.hbox_num == 5) )
{
    my_hitboxID.article_nuage.foudre_appartenance = hit_player_obj;
}