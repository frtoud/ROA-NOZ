//article1_post_draw
var scale = 1 + player_id.small_sprites;

if (!should_die && anim_timer < 9)
{
    draw_sprite_ext(sprite_spawn, floor(anim_timer / 3), 
                    x, y, spr_dir*scale, scale, 0, c_white, 1);
}

if (spike_timer > 0)
{
    draw_sprite_ext(sprite_spike, floor(spike_timer / 3), 
                    x, y, spike_dir*scale, scale, 0, c_white, 1);
}