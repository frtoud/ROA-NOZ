
if (my_hitboxID.orig_player == player) //ONLY CHECK WITH YOUR OWN HITBOXES!!
{
    var is_a_cloud = ("is_a_cloud" in my_hitboxID) && my_hitboxID.is_a_cloud;
    // Lingering projectile hitboxes: applies snow effects
    if (( ( is_a_cloud )
    // Plus some specials!
       || (my_hitboxID.attack == AT_FSPECIAL) ))
    {
        if (hit_player_obj.noz_snowimmune_timer == 0)
        {
            hit_player_obj.noz_snowstack_timer = noz_snowstack_timer_max;
            hit_player_obj.noz_handler_id = self;

            if (noz_rune_flags.frostbite) // Frostbite debuff
            { hit_player_obj.noz_snow_frostbite_timer = noz_snowstack_timer_max; }
        }

        // Exploding clouds
        if (is_a_cloud && noz_rune_flags.cloud_explode)
        {
            create_hitbox(my_hitboxID.attack, 9, my_hitboxID.x, my_hitboxID.y);
        }
    }
    // Strong attacks: apply ice effects
    else if ((hit_player_obj.noz_snowstack_timer > 0  || 
            //Standing on ice forces freeze on victims (if not immune)
             (hit_player_obj.noz_snowimmune_timer == 0 && noz_frostzone_timer > 0) )
            &&((my_hitboxID.attack == AT_USTRONG)
            || (my_hitboxID.attack == AT_FSTRONG && (my_hitboxID.hbox_num != 1))
            || (my_hitboxID.attack == AT_DSTRONG && (my_hitboxID.hbox_num != 1))
            // RUNE: Aerials with STRONG effects
            || (my_hitboxID.attack == AT_BAIR && noz_rune_flags.aerial_strongs)
            || (my_hitboxID.attack == AT_BAIR && noz_rune_flags.aerial_strongs)
            ))
    {
        hit_player_obj.should_make_shockwave = false;
        hit_player_obj.orig_knock = 3;
        hit_player_obj.noz_snowstack_timer = 0;
        hit_player_obj.noz_snowimmune_timer = noz_snowimmune_timer_max;
        hit_player_obj.noz_freeze_timer = -8; //signal for initial ice effect
        hit_player_obj.noz_handler_id = self;

        //animation
        hit_player_obj.noz_freeze_anim_sprite = hit_player_obj.sprite_index;
        hit_player_obj.noz_freeze_anim_index = hit_player_obj.image_index;
        hit_player_obj.noz_freeze_anim_rotate = 0;
        hit_player_obj.noz_freeze_anim_rotate_speed = 2 + random_func(2, 10, true);
    }
}