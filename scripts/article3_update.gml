//article3_update
#macro ETAT_AUCUN noone
#macro ETAT_ACTIF  0
#macro ETAT_FOUDRE 9
#macro ETAT_ETEINT 6
#macro rien noone


if (doit_mourrir)
{
    if (etat == ETAT_ACTIF) 
        changer_etat(ETAT_ETEINT);
}

if (nouvel_etat != ETAT_AUCUN)
{
    changer_etat(ETAT_FOUDRE);
    nouvel_etat = ETAT_AUCUN;
}

switch (etat)
{
//=======================================================================
    case ETAT_ACTIF:
    {
        //animer l'apparition

        if (temps_etat == 0) && !instance_exists(foudre_projectile)
        {
            with (player_id)
            { other.foudre_projectile = create_hitbox(AT_DSPECIAL_2, 4, other.x, other.y + 20); }
            foudre_projectile.article_nuage = self;
        }
        else if ((temps_etat % 4) == 3)
        {
            //creer un choc sur la hauteur complète de l'éclair
            choquer(foudre_projectile);
        }
        else if (temps_etat > 120) changer_etat(ETAT_ETEINT);
    } break;
//=======================================================================
    case ETAT_FOUDRE:
    {
        //animer l'electrocution
        //image_index = ...

        if (temps_etat == 1) 
        {
            sound_play(sound_get("sfx_thunder"))
            foudroyer();
        }
        else if (temps_etat > 16) changer_etat(ETAT_ETEINT);
    } break;
//=======================================================================
    case ETAT_ETEINT:
    {
        //animer la dissipation
        //image_index = ...

        if (temps_etat > 20)
        {
            instance_destroy(self); exit;
        }
    } break;
//=======================================================================
    default:
    {
        instance_destroy(self); exit;
    } break;
}

//avancer
temps_etat++;

//=======================================================================
#define changer_etat(nouv_etat)
{
    etat = nouv_etat;
    temps_etat = 0;
}
//=======================================================================
#define choquer(point_foudre)
{
    //notes:
    // 1. on ne peux faire le choc que si le projectile existe encore
    if !instance_exists(point_foudre)
    {
        changer_etat(ETAT_ETEINT);
    }
    // 2. si le projectile est à une position étrange (Missingno, Villageois):
    // - si le projectile est trop loin (ou au dessus) du nuage, déconnecter et rendre indépendant
    else if (point_foudre.y < y) || (abs((point_foudre.x < x)) > foudre_tolerance_horizontale)
    {
        point_foudre.article_nuage = noone;
        changer_etat(ETAT_ETEINT);
    }
    // 3. sinon, continuer pour la série de chocs
    else
    {
        var distance = point_distance(x, y, point_foudre.x, point_foudre.y);
        var nombre_points = distance / 30;

        for (var i = 0; i < nombre_points; i++)
        {
            var fraction = i/nombre_points;
            creer_coup(AT_DSPECIAL_2, 5, lerp(x, point_foudre.x, fraction), 
                                         lerp(y, point_foudre.y, fraction));
        }
    }

}
//=======================================================================
#define foudroyer()
{

    var distance = abs(y - foudre_destination_y);
    var nombre_points = distance / 30;

    for (var i = 0; i < nombre_points; i++)
    {
        var fraction = i/nombre_points;
        creer_coup(AT_DSPECIAL_2, 6, x, lerp(y - 10, 10 + foudre_destination_y, fraction));
    }
}

//=======================================================================
#define creer_coup(attaque, numero, pos_x, pos_y)
{
    var coup = noone;
    with (player_id)
    {
        coup = create_hitbox(attaque, numero, floor(pos_x), floor(pos_y));
    }
    return coup;
}