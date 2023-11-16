//ai_update.gml

if (custom_clone && instance_exists(noz_climber_twin))
{
    //disable_ai = true;
    //Priority list:
    // 1. recover to stage
    // 2. return to master
    // 3. delayed-input-copy master's inputs
    transfer_inputs();

    fix_corrolary_inputs();

    //if (noz_climber_twin.shield_pressed) shield_pressed = true;
    //left_down = true;
}
else
{
    if (get_training_cpu_action() == CPU_ROLL)
    {
        //Reflector debug mode
        if (state == PS_IDLE || state == PS_PARRY_START)
        { 
            set_attack(AT_DSPECIAL); 
        }
        else
        {
            special_down = true;
        }
    }

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
#define transfer_inputs()
{
    var latest_write = 0;
    var early_read  =  noz_climber_input_buffer[(noz_climber_input_pointer + 4) % noz_climber_input_buffer_size];
    var normal_read =  noz_climber_input_buffer[(noz_climber_input_pointer + 4) % noz_climber_input_buffer_size];

    for (var i = 0; i < array_length(noz_climber_input_names); i++)
    {
        var name = noz_climber_input_names[i];
        //get inputs and store as latest entry
        latest_write += ((variable_instance_get(noz_climber_twin, name) > 0) << i);

        //use storage from X frames before to apply
        switch (i)
        {
            case 0: case 1: case 2: case 3: //direction
            case 4: case 5: case 6: case 7: //hard_direction
            case 12: case 13: //jump
            case 14: case 15: //run
            case 25: case 26: //shield
                //variable_instance_set(self, name, (early_read & (1 << i)) != 0);
                //break;
            default:
                variable_instance_set(self, name, (normal_read & (1 << i)) != 0);
                break;
        }
    }


    //write out
    noz_climber_input_buffer[(noz_climber_input_pointer % noz_climber_input_buffer_size)] = latest_write;

    //process buffer (this runs backwards because I felt like it)
    noz_climber_input_pointer--;
    if (noz_climber_input_pointer < 0) 
        noz_climber_input_pointer = noz_climber_input_buffer_size - 1;
}

#define fix_corrolary_inputs()
{
    //these inputs are determined in a second step (some moves depend on them, notably USPEC and airdodge)
    //joy_dir
    joy_dir = point_direction(0, 0, (right_down - left_down), (down_down - up_down) );
    joy_pad_idle = !(left_down || right_down || up_down || down_down);

    if !joy_pad_idle && (angle_difference(noz_climber_twin.joy_dir, joy_dir) < 30)
    {
        joy_dir = noz_climber_twin.joy_dir;
    }
}