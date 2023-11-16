//on death
//reset status
at_reflector_damage_block = noz_reflector_damage_max;

at_fspecial_soft_cooldown_timer = 0;

at_uspecial_hover_meter = noz_uspecial_hover_max;
at_uspecial_was_hovering = false;
at_uspecial_hovering = false;
at_uspecial_exhausted = false;

move_cooldown[AT_DSPECIAL] = 0;
move_cooldown[AT_NSPECIAL] = 0;
move_cooldown[AT_FSPECIAL] = 0;
move_cooldown[AT_USPECIAL] = 0;
at_uspecial_cooldown_override = false;
at_fspecial_cooldown_override = false;

//===========================================================================
// Merci Mawral
if instance_exists(noz_climber_twin)
{
    noz_climber_is_dead = true;

    //first death:
    if (!noz_climber_twin.noz_climber_is_dead)
    {
        if (noz_climber_is_master)
        {
            //if main dies, allow clone to be independent
            noz_climber_twin.custom_clone = false;
        }
        else
        {
            //if clone dies, must prevent it from being deleted
            custom_clone = false;
        }

        //in either case, must prevent the death from taking out a stock
        set_player_stocks(player, get_player_stocks(player) + 1);

        noz_climber_damage_restore = get_player_damage(player);
    }
    else
    {
        //second death:
        //protocol continues normally, both will respawn
        clear_articles(self);
        clear_articles(noz_climber_twin);

        //except if this is the final stock; the twin was waiting in Respawn.
        //this messes with match-end.
        if (get_player_stocks(player) == 1)
        {
            set_state(PS_DEAD);
            with (noz_climber_twin) set_state(PS_DEAD);
        }

    }

}
else
{
   //just destroy articles
   clear_articles(self);
}




//===========================================================================
//destroy articles
#define clear_articles(dead_owner)
{
    with (obj_article1) if (player_id == dead_owner)
    {
        should_die = true;
    }
    with (obj_article_platform) if (player_id == dead_owner)
    {
        should_die = true;
    }
    with (obj_article2) if (player_id == dead_owner)
    {
        should_die = true;
    }
}