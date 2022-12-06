//shader shenanigans
//Update this if color.gml changes
#macro ALT_GAMEBOY  7
#macro ALT_CELESTE 14
#macro ALT_BOOTLEG 15

var color_alt = get_player_color(player);
/*
if ("joke_explainer_mode" in self && joke_explainer_mode
    && color_alt != ALT_ROBOT)
{
    color_alt = ALT_ROBOT;
    for (i = 0; i < 8; i++)
    {
        set_character_color_slot( i, get_color_profile_slot_r(color_alt, i), 
                                     get_color_profile_slot_g(color_alt, i), 
                                     get_color_profile_slot_b(color_alt, i));
        set_article_color_slot( i, get_color_profile_slot_r(color_alt, i), 
                                   get_color_profile_slot_g(color_alt, i), 
                                   get_color_profile_slot_b(color_alt, i));
    }
}*/

//==========================================================================
//Unshaded alts
if ( (color_alt == ALT_GAMEBOY) 
  || (color_alt == ALT_BOOTLEG) )
{
    set_character_color_shading( 0, 0.0 ); 
    set_character_color_shading( 1, 0.0 );
    set_character_color_shading( 2, 0.0 );
    set_character_color_shading( 3, 0.0 );
    set_character_color_shading( 4, 0.0 );
    set_character_color_shading( 5, 0.0 );
    set_character_color_shading( 6, 0.5 );
}
//else if (color_alt == ALT_ROBOT)
{
    //set_character_color_shading( 6, 2.0 );
}
//==========================================================================
//Hair color effects (only for Madeline)
if ( ("at_uspecial_was_hovering" in self)
  && (color_alt == ALT_CELESTE) )
{
    var hair_color = [get_color_profile_slot_r(color_alt, 0),
                      get_color_profile_slot_g(color_alt, 0), 
                      get_color_profile_slot_b(color_alt, 0)];
    if (at_uspecial_was_hovering)
    {
        //Fade to blue
        hair_color[0] = ease_linear(hair_color[0], 60, 
           anim_hairblink_timer, anim_hairblink_max); //R
        hair_color[1] = ease_linear(hair_color[1], 240, 
           anim_hairblink_timer, anim_hairblink_max); //G
        hair_color[2] = ease_linear(hair_color[2], 255, 
           anim_hairblink_timer, anim_hairblink_max); //B
    }
    else
    {
        //White flash 
        hair_color[0] = ease_linear(hair_color[0], 250, 
           anim_hairblink_timer, anim_hairblink_max); //R
        hair_color[1] = ease_linear(hair_color[1], 255, 
           anim_hairblink_timer, anim_hairblink_max); //G
        hair_color[2] = ease_linear(hair_color[2], 255, 
           anim_hairblink_timer, anim_hairblink_max); //B
    }
    
    set_character_color_slot( 0, floor(hair_color[0]), 
                                 floor(hair_color[1]), 
                                 floor(hair_color[2]));
    set_article_color_slot( 0, floor(hair_color[0]), 
                               floor(hair_color[1]), 
                               floor(hair_color[2]));
}
//==========================================================================
