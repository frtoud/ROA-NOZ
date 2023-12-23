//ai_update.gml

if (custom_clone && instance_exists(noz_climber_twin))
{
    if (noz_climber_twin.noz_climber_is_dead)
    {
        //manual mode
        instant_transfer_inputs();
        exit;
    }

    //Partner wants to move closer to master    
    //but in cases where the joystick input is important, we must not do it

    var distance_to_master = point_distance(noz_climber_twin.x, noz_climber_twin.y, x, y);

    if (ai_recovering && distance_to_master > 120)
    {
        //let the AI do its thing
        storeonly_inputs();
        if (at_uspecial_hovering)
        {
            pilot_hovering(noz_climber_twin.x, noz_climber_twin.y);
        }
        exit;
    }
    //else
    transfer_inputs();



    if (state_cat == SC_HITSTUN) && hitpause
    {
        //no DI.
        joy_dir = 90;
        joy_pad_idle = true;
        exit;
    }
    else if !is_joystick_input_critical()
    {
        if (at_uspecial_hovering)
        {
            if (distance_to_master > 40)
            pilot_hovering(noz_climber_twin.x, noz_climber_twin.y);
            exit;
        }
    
        if (abs(noz_climber_twin.x - x) > 40)
        {
            if (noz_climber_twin.x > x)
            {
                left_down = false;
                left_hard_pressed = false;
                right_down = true;
            }
            else
            {
                right_down = false;
                right_hard_pressed = false;
                left_down = true;
            }
        }

        //want to stand at the same master's y
        if (noz_climber_twin.y > (y + 40)) && !free
        {
            down_hard_pressed = true;
        }
        else if !jump_pressed && (noz_climber_twin.y < (y - 40)) && (vsp > -1)
        //heh. edgecase where we don't want to interrupt a taunt
        && !(!free && noz_climber_twin.taunt_pressed)
        {
            jump_pressed = true;
            jump_down |= (noz_climber_twin.y < y - noz_climber_estimated_shorthop_height);
        }
    }

    fix_corrolary_inputs();

    //fudging spr_dir in cases that allow it to go unnoticed
    if (state_cat == SC_GROUND_NEUTRAL) && (distance_to_master <= 40) && joy_pad_idle
    || (state == PS_JUMPSQUAT)
    || (state == PS_SPAWN)
    {
        spr_dir = noz_climber_master_spr_dir;
    }
}
else
{
    if (at_uspecial_hovering)
    {
        joy_pad_idle = false;
        if (ai_recovering)
        {
            var stage_height = get_stage_data(SD_Y_POS);
            var stage_center = room_width / 2;
            if ( y > stage_height)
            {
                joy_dir = 90;
            }
            else if (y > stage_height - 30)
            {
                joy_dir = (x < stage_center) ? 45 : 135;
            }
            else
            {
                joy_dir = (x < stage_center) ? 0 : 180;
            }
        }
        else
        {
            joy_dir = (x < stage_center) ? 315 : 225;
        }
        
    }
}

//================================================================================
#define pilot_hovering(target_x, target_y)
{
    //guide to location...
    joy_pad_idle = false;
    joy_dir = point_direction(x, y, target_x, target_y);

    if (joke_explainer_mode)
    {
        //this version must gain height explicitly with up_down
        up_down = (target_y < y + vsp)

        if (target_x > x)
        {
            left_down = false;
            left_hard_pressed = false;
            right_down = true;
        }
        else
        {
            right_down = false;
            right_hard_pressed = false;
            left_down = true;
        }
    }
}

//================================================================================
#define storeonly_inputs()
{
    return parse_inputs(false);
}
#define transfer_inputs()
{
    return parse_inputs(true);
}
//================================================================================
#define parse_inputs(apply_now)
{
    var latest_write = 0;
    var delay_slot = (noz_climber_input_pointer + noz_climber_input_delay) % noz_climber_input_buffer_size;
    var delayed_read = noz_climber_input_buffer[delay_slot];

    var current_spr_dir = spr_dir;

    for (var i = 0; i < array_length(noz_climber_input_names); i++)
    {
        var name = noz_climber_input_names[i];
        //get inputs and store as latest entry
        latest_write += ((variable_instance_get(noz_climber_twin, name) > 0) << i);

        //use storage from X frames before to apply
        if (apply_now) variable_instance_set(self, name, (delayed_read & (1 << i)) != 0);
    }

    //special case: spr_dir. not applied directly, only applied in cases where it's wanted
    noz_climber_master_spr_dir = spr_dir ? 1 : -1;
    spr_dir = current_spr_dir;

    //write out
    noz_climber_input_buffer[(noz_climber_input_pointer % noz_climber_input_buffer_size)] = latest_write;

    //process buffer (this runs backwards because I felt like it)
    noz_climber_input_pointer--;
    if (noz_climber_input_pointer < 0) 
        noz_climber_input_pointer = noz_climber_input_buffer_size - 1;
}
//==============================================================================================
#define instant_transfer_inputs()
{
    for (var i = 0; i < array_length(noz_climber_input_names); i++)
    {
        var name = noz_climber_input_names[i];
        //get inputs and use directly
        if (name != "spr_dir")
            variable_instance_set(self, name, variable_instance_get(noz_climber_twin, name));
    }

    fix_corrolary_inputs();
}
#define fix_corrolary_inputs()
{
    //these inputs are determined in a second step (some moves depend on them, notably USPEC and airdodge)
    //joy_dir
    joy_dir = point_direction(0, 0, (right_down - left_down), (down_down - up_down) );
    joy_pad_idle = !(left_down || right_down || up_down || down_down);

}

//================================================================================
#define is_joystick_input_critical()
{
    return (
    //if there is a possibility that an attack starts this frame; joystick direction is important
       (can_attack && attack_pressed)
    || (can_strong && (left_strong_pressed || right_strong_pressed || down_strong_pressed))
    || (can_ustrong && (up_strong_pressed))
    || (can_special && special_pressed)
    //airdodge and rolls as well
    || (state == PS_AIR_DODGE)
    || (state == PS_PARRY_START)
    //During certain attacks, joystick direction is important
    || (state == PS_ATTACK_GROUND)
    || ( (state == PS_ATTACK_AIR) && (attack == AT_FSPECIAL) )

    );
}
