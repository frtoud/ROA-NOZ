//shader shenanigans
//Update this if color.gml changes
#macro ALT_DEFAULT  0
#macro ALT_GAMEBOY  7
#macro ALT_CELESTE 10
#macro ALT_ROBOTIC 14
#macro ALT_BOOTLEG 15

var jokex_mode = ("joke_explainer_mode" in self) ? joke_explainer_mode : (get_synced_var(player) & 0x01);
var color_alt = get_player_color(player);

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
//==========================================================================
// Joke Explainer Considerations
else if (jokex_mode)
{
    set_character_color_shading( 6, 2.0 );

    //All robots recieve metal skintone and Light (for now)

    apply_color_slot(1, ALT_ROBOTIC, 1)
    apply_color_slot(7, ALT_ROBOTIC, 7)

    if (color_alt == ALT_DEFAULT)
    {
        //Default Alt in robot mode: force usage of all Joke Explainer palette
        apply_color_slot(0, ALT_ROBOTIC, 0)
        apply_color_slot(2, ALT_ROBOTIC, 2)
        apply_color_slot(3, ALT_ROBOTIC, 3)
        apply_color_slot(4, ALT_ROBOTIC, 4)
        apply_color_slot(5, ALT_ROBOTIC, 5)
        apply_color_slot(6, ALT_ROBOTIC, 6)
    }
}
else if (color_alt == ALT_ROBOTIC)
{
    //Robotic Alt in non-robot mode: force usage of default palette
        apply_color_slot(0, ALT_DEFAULT, 0)
        apply_color_slot(1, ALT_DEFAULT, 1)
        apply_color_slot(2, ALT_DEFAULT, 2)
        apply_color_slot(3, ALT_DEFAULT, 3)
        apply_color_slot(4, ALT_DEFAULT, 4)
        apply_color_slot(5, ALT_DEFAULT, 5)
        apply_color_slot(6, ALT_DEFAULT, 6)

}
//==========================================================================
//Hair color effects (only for Madeline)
if ("at_uspecial_was_hovering" in self)
{
    var hair_color = [get_color_profile_slot_r(color_alt, 0),
                        get_color_profile_slot_g(color_alt, 0), 
                        get_color_profile_slot_b(color_alt, 0)];

    if (color_alt == ALT_CELESTE)
    {
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
    }
    else if (joke_explainer_mode && at_uspecial_exhausted)
    {
        hair_color[0] *= 0.5;
        hair_color[1] *= 0.5;
        hair_color[2] *= 0.5;
    }

    set_character_color_slot( 0, floor(hair_color[0]), 
                                 floor(hair_color[1]), 
                                 floor(hair_color[2]));
    set_article_color_slot( 0, floor(hair_color[0]), 
                               floor(hair_color[1]), 
                               floor(hair_color[2]));

}
//==========================================================================

#define apply_color_slot(target_shade, source_color, source_shade)
{
   set_character_color_slot(target_shade,  
        get_color_profile_slot_r(source_color, source_shade),  
        get_color_profile_slot_g(source_color, source_shade),
        get_color_profile_slot_b(source_color, source_shade), 1);
   set_article_color_slot(target_shade,  
        get_color_profile_slot_r(source_color, source_shade),  
        get_color_profile_slot_g(source_color, source_shade),
        get_color_profile_slot_b(source_color, source_shade), 1);
}