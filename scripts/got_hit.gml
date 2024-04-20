//got_hit

if (enemy_hitboxID.type == 1) 
&& (hit_player_obj.noz_handler_id == self)
&& (hit_player_obj.noz_sleep_interrupt_timer > 0)
{
    //hitting the source of Sing before you fall asleep immunizes you
    hit_player_obj.noz_sleep_timer = 0; 
    hit_player_obj.noz_sleep_anim_timer = 0;
    hit_player_obj.noz_sleep_mashanim_timer = 0;
    hit_player_obj.noz_sleep_interrupt_timer = 0;
    hit_player_obj.noz_sleepimmune_timer = 20;
}
