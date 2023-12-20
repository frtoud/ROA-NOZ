//article2_init

//Rendering
sprite_index = sprite_get("cloud_article");
mask_index = sprite_get("smol_mask");
image_index = 0;
spr_dir = player_id.spr_dir;
uses_shader = true;

aura_spr = sprite_get("cloud_aura");
vfx_snow_twinkle = player_id.vfx_snow_twinkle;

//Physics
hitstop = 0;
hsp = 0;
vsp = 0;
can_be_grounded = false;
free = true;
ignores_walls = false;
hit_wall = false;
through_platforms = true;

should_die = false;
lifetime_timer = 0;
lifetime_max = 20 * 60;

//Snowbox parameters
snow_column_step = 2;
snow_column_solid_distance = 120;
snow_column_plat_distance = 80;
snow_column_width = 0; //current witdh (doubles)
snow_column_width_max = 45; //doubled; distance in both directions
snow_column_top = y; 
snow_column_bottom = y; 

//one-cloud-limit per Nozomi!
with (asset_get("obj_article2")) if (self != other)
                                 && (player_id == other.player_id)
{
    should_die = true;
}