//CSS_DRAW
if ("joke_explainer_mode" not in self) exit;


if (joke_explainer_mode)
{
    var temp_x = floor(x + 12);
    var temp_y = floor(y + 140);

    var color = get_player_color(player);
    if (color < array_length(noz_alt_jokes))
        draw_debug_text(temp_x, temp_y, noz_alt_jokes[color]);
}