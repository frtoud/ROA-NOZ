//preDraw
#macro ETAT_ACTIF  0
#macro ETAT_FOUDRE 9

//dessin du choc; par segment, dépendamment de la distance et de l'état
if (etat == ETAT_ACTIF) && instance_exists(foudre_projectile)
&& (temps_etat % 4 <= 1)
{
    var distance = round(foudre_projectile.y - 20 - y);
    while (distance > 0)
    {
        var longueur_segment = min(distance/2, 64)
        draw_sprite_part_ext(image_pre_foudre, temps_etat%2, 0, 64 - longueur_segment, 6, longueur_segment,
                             x - 6, y + distance - 2*longueur_segment, 2, 2, c_white, 1);
        distance -= 2*64;
    }
}
else if (etat == ETAT_FOUDRE) && (temps_etat > 1)
{
    var numero_image = min(3, (temps_etat - 1) / 4);
    var distance = round(foudre_destination_y - y);
    //dessiner le point de contact avec le sol
    draw_sprite_part_ext(image_foudre, numero_image, 0, 64, 30, 16,
                         x - 30, foudre_destination_y - 32, 2, 2, c_white, 1);

    distance -= 32;
    while (distance > 0)
    {
        var longueur_segment = min(distance/2, 64);
        draw_sprite_part_ext(image_foudre, numero_image, 0, 64 - longueur_segment, 30, longueur_segment,
                             x - 30, y + distance - 2*longueur_segment, 2, 2, c_white, 1);
        distance -= 2*64;
    }
}