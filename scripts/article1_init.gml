//article1_init

//Rendering
sprite_index = player_id.article1_spr;
mask_index = player_id.article1_spr;
image_index = 3;
spr_dir = player_id.spr_dir;
uses_shader = true;

despawn_vfx = player_id.vfx_article_despawn;

//Physics
hitstop = 0;
hsp = 0;
vsp = 0;
can_be_grounded = true;
//free = true;
ignores_walls = false;
hit_wall = false;
through_platforms = false;

//platform-variables
should_die = false; //set to trigger removal
article_timer = 0;

left_segment = noone;
right_segment = noone;

prev_x = x; //detects movement

random_twinkle = player_id.anim_rand_twinkle;

//check neighbors on creation
var needleft = true; 
var needright = true;
with (asset_get("obj_article1")) if (self != other)
&& (player_id == other.player_id) && (abs(y - other.y) < 2)
{
    if (needleft) && ((x + 16) == other.x)
    {
        needleft = false;
        other.left_segment = self;
        right_segment = other;
    }
    else if (needright) && ((x - 16) == other.x)
    {
        needright = false;
        other.right_segment = self;
        left_segment = other;
    }
}
with (asset_get("obj_article_platform")) if (self != other)
&& (player_id == other.player_id) && (abs(y - other.y) < 2)
{
    if (needleft) && ((x + 16) == other.x)
    {
        needleft = false;
        other.left_segment = self;
        right_segment = other;
    }
    else if (needright) && ((x - 16) == other.x)
    {
        needright = false;
        other.right_segment = self;
        left_segment = other;
    }
}

//animation sync
image_index = 3 + 4* (spr_dir ? (2*(!needleft) + (!needright))
                              : ((!needleft) + 2*(!needright)) );
