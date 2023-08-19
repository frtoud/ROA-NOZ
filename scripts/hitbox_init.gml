is_a_cloud = false;

//====================================================================
// Lingering projectile cloud hitboxes
if (attack == AT_DTILT && hbox_num == 2)
|| (attack == AT_DATTACK && hbox_num == 2)
{
    is_a_cloud = true;
}
else if (attack == AT_FAIR && hbox_num == 2)
     || (attack == AT_BAIR && hbox_num == 2)
{
    is_a_cloud = !player_id.noz_rune_flags.aerial_strongs;

    // Lingering projectile for BAIR needs to be flipped
    if (attack == AT_BAIR) spr_dir *= -1;

    if (!is_a_cloud)
    {
       //still inherit Nozomi's speed
       hsp += player_id.hsp;
    }
}

if (is_a_cloud)
{
    //Save length (in timer) of 2 frames of animation
    anim_fade_frames = (2.0 / img_spd);

    //inherit Nozomi's speed
    hsp += player_id.hsp * ((attack == AT_DTILT) ? 0.75 : 1);

    //DATTACK cloud needs some help on platforms
    if (attack == AT_DATTACK) { dattack_speedcheck_timer = 20; }

    // Kicking clouds
    is_kickable = player_id.noz_rune_flags.cloud_explode;
    if (is_kickable)
    {
        //save friction
        saved_friction = frict;
        boosted_friction = frict * player_id.noz_cloudkick_friction;

        kick_cooldown = 8;
        kick_boosted = 0;
    }
    restore_hit_timer = 0;
}

