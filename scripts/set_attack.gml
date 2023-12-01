/// set_attack.gml(dummy_atk) to prevent GMEdit from panicking

if (joke_explainer_mode)
{
    //robotic attack variants
         if (attack == AT_USPECIAL) attack = AT_USPECIAL_2;
    else if (attack == AT_FSPECIAL) attack = AT_FSPECIAL_2;
    else if (attack == AT_DSPECIAL) attack = AT_DSPECIAL_2;
    else if (attack == AT_TAUNT)    attack = AT_TAUNT_2;
}

if (attack == AT_DSPECIAL_2)
{
    at_dspecial_thunder_feeler_pos.x = x;
    at_dspecial_thunder_feeler_pos.y = y;
}

//Enhanced hover rune: turn off hovering when starting a special (usually prevented by cooldown)
if ( (attack == AT_NSPECIAL)
  || (attack == AT_FSPECIAL)
  || (attack == AT_DSPECIAL)
  || (attack == AT_FSPECIAL_2)
  || (attack == AT_DSPECIAL_2))
  && (move_cooldown[attack] < 1)
{
    at_uspecial_hovering = false;
}
