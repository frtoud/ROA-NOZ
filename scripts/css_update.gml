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

    set_UI(joke_explainer_mode)
}



//===========================================================================
//Keep in sync across CSS and userevent 7
#define set_UI(jex)
{
    if (jex)
    {
        set_ui_element(UI_HUD_ICON,     sprite_get("jex_hud"));
        set_ui_element(UI_HUDHURT_ICON, sprite_get("jex_hudhurt"));
        set_ui_element(UI_CHARSELECT,   sprite_get("jex_charselect"));
        set_ui_element(UI_WIN_PORTRAIT, sprite_get("jex_portrait"));
        set_ui_element(UI_WIN_SIDEBAR,  sprite_get("jex_result_small"));
        set_ui_element(UI_WIN_THEME,    sound_get("jex_victory"));
    }
    else
    {
        //This manages to grab data from the main folder. neat.
        set_ui_element(UI_HUD_ICON,     get_char_info(player, INFO_HUD));
        set_ui_element(UI_HUDHURT_ICON, get_char_info(player, INFO_HUDHURT));
        set_ui_element(UI_CHARSELECT,   get_char_info(player, INFO_CHARSELECT));
        set_ui_element(UI_WIN_PORTRAIT, get_char_info(player, INFO_PORTRAIT));
        set_ui_element(UI_WIN_SIDEBAR,  get_char_info(player, INFO_SIDEBAR));
        set_ui_element(UI_WIN_THEME,    sound_get("victory"));
        //Offscreen handled separately.
    }
}