//pre_draw.gml

//===================================================================
//Setting Outline color
if (noz_handler_id == self)
{
    if (noz_snowstack_timer > 0) 
    {
        outline_color = [0,80,120]; 
    }
    else 
    {
        outline_color = [0, 0, 0]; 
    }
}
init_shader();
//Reset in case anything happens & init_shader() can revert to black
//Also prevents the HUD icon from changing
outline_color = [0, 0, 0];

var scale = 1 + small_sprites;

//Debug Climber link visual
if get_match_setting(SET_HITBOX_VIS) && instance_exists(noz_climber_twin)
{
    draw_line_color(x, y, noz_climber_twin.x, noz_climber_twin.y, c_red, c_red);
}

//===================================================================
// Hovering hair

//frames with exceptions to the Hover Hair drawing.
var attack_exceptions = (state == PS_ATTACK_AIR) && (
(attack == AT_USPECIAL && !(image_index > 12 && image_index < 16) && image_index != 22)
|| (attack == AT_USPECIAL_2)
|| (attack == AT_UAIR && image_index >= (joke_explainer_mode ? 0 : 1)
                      && image_index <  (joke_explainer_mode ? 6 : 5) )
|| (attack == AT_NAIR && (at_uspecial_exhausted  || joke_explainer_mode) ) )

if (at_uspecial_hovering && state != PS_PRATFALL) && !attack_exceptions
{
    if (joke_explainer_mode)
    {
        shader_start();
        draw_sprite_ext(vfx_thrusters_spr, 
                        floor(anim_hover_hair_frame), x, y,
                        spr_dir*scale, scale, 0, c_white, 1);
        shader_end();
    }
    else
    {
        shader_start();
        draw_sprite_ext(at_uspecial_exhausted ? vfx_hair_exhausted_spr : vfx_hair_hover_spr, 
                        floor(anim_hover_hair_frame), x - (spr_dir * 4), y - 44, 
                        spr_dir*scale, scale, 0, c_white, 1);
        shader_end();
    }
}

//===================================================================
//NSPECIAL: Sing
if (attack == AT_NSPECIAL && (window > 1) &&
   (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) )
{
    var alpha = window == 2 ? ease_quadOut(0, 100, window_timer, 
                      get_window_value(AT_NSPECIAL, 2, AG_WINDOW_LENGTH))
             : (window == 5 ? ease_sineInOut(100, 0, window_timer, 
                       get_window_value(AT_NSPECIAL, 5, AG_WINDOW_LENGTH)) 
             : 100);

    var radius_mult = scale * (noz_rune_flags.enhanced_sleep ? 1.6 : 1);

    shader_start();
    draw_sprite_ext(vfx_nspecial_spr, 
                    floor(get_gameplay_time() / 5 ) % 4, x, y-(char_height/2), radius_mult, radius_mult, 
                    floor(get_gameplay_time() * 5 ) % 360, c_white,
                    (alpha) * 0.01 * 0.7 );
    shader_end();

    if (get_match_setting(SET_HITBOX_VIS) && (window == 2 || window == 4))
    {
        //show effective range of Sing
        var alpha = draw_get_alpha();
        draw_set_alpha(0.5);
        draw_circle_color(x, y-(char_height/2), noz_nspecial_radius, c_blue, c_blue, false);
        draw_set_alpha(alpha);
    }
}
//===================================================================

//===================================================================
//Simulate parry VFX
if (anim_fakeparry_timer > 0)
{
    draw_sprite_ext(anim_fakeparry_bg, clamp(floor((20 - anim_fakeparry_timer)/4), 0, 5),
                    x, y-28, 2, 2, 0, c_white, 0.5);
}