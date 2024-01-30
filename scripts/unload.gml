
if (noone != thrusters_sfx)
{
    sound_stop(thrusters_sfx);
    thrusters_sfx = noone;
}

if (!joke_explainer_mode && special_down)
{
    set_ui_element(UI_WIN_THEME, sound_get("victory_legacy"));
}