//CSS_UPDATE
if ("joke_explainer_mode" not in self) exit;


//echo checks
var color = get_player_color(player);
if ((color == 14) && !joke_explainer_mode)
|| ((color ==  0) &&  joke_explainer_mode)
{
    joke_explainer_mode = !joke_explainer_mode;
    sound_play(sound_get(joke_explainer_mode ? "gunslinger_three_hit" : "sfx_noz_ice_medium"));
    set_synced_var(player, joke_explainer_mode);
    init_shader();
}