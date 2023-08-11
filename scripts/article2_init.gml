//article2_init

//Rendering
sprite_index = asset_get("empty_sprite");
image_index = 0;
spr_dir = player_id.spr_dir;
uses_shader = true;

//Physics
hitstop = 0;
hsp = 0;
vsp = 0;
can_be_grounded = false;
//free = true;
ignores_walls = true;
hit_wall = false;
through_platforms = true;
