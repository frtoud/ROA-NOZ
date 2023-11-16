// Other_post_draw
if ("other_player_id" in self && (other_player_id != noz_handler_id) ) 
//for some reason, climber-mode doesnt allow this to run from the POV of the main Nozomi... hmm
&& (other_player_id.noz_climber_twin != noz_handler_id)
exit;

if (noz_freeze_timer > 0)
{
    var scale = 1 + other_player_id.small_sprites;
    //Icicle sprite (front)
    with (other_player_id) { shader_start(); }
    var fx_frame = noz_freeze_timer > other_player_id.noz_freeze_base_stun ? 1 : 2;
    draw_sprite_ext(other_player_id.vfx_frozen_sprite, fx_frame, 
                    x, y-(char_height / 2), -scale*spr_dir, scale, noz_freeze_anim_rotate, c_white, 1);
    with (other_player_id) { shader_end(); }
}
