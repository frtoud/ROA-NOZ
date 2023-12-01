//article3_init

//Dessin
sprite_index = sprite_get("reflect_hurt");
mask_index = sprite_get("smol_mask");
image_index = 0;
spr_dir = player_id.spr_dir;
uses_shader = true;

effet_electrique = player_id.vfx_electric_twinkle;

//Attributs physique
hitstop = 0;
hsp = 0;
vsp = 0;
can_be_grounded = false;
free = true;
ignores_walls = false;
hit_wall = false;
through_platforms = true;

//Machine à états
etat = 0;
temps_etat = 0;
nouvel_etat = noone;
doit_mourrir = false;

//paramètres du coup de foudre (ha!)
foudre_projectile = noone;
foudre_destination_y = y;
foudre_appartenance = player_id;

//si le projectile finit inexplicablement trop loin de la position x originale, déconnection
foudre_tolerance_horizontale = 40;
