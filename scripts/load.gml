sprite_change_offset("idle", 14, 25, true);
sprite_change_offset("hurt", 12, 25);
sprite_change_offset("spinhurt", 14, 26);
sprite_change_offset("crouch", 17, 24, true);
sprite_change_offset("walk", 16, 25);
sprite_change_offset("walkturn", 14, 24);
sprite_change_offset("dash", 15, 30);
sprite_change_offset("dashstart", 17, 26);
sprite_change_offset("dashstop", 19, 28);
sprite_change_offset("dashturn", 16, 33);

sprite_change_offset("jumpstart", 15, 22);
sprite_change_offset("jump", 15, 34);
sprite_change_offset("doublejump", 13, 27);
sprite_change_offset("doublejump_back", 14, 30);
sprite_change_offset("walljump", 16, 26);
sprite_change_offset("pratfall", 15, 30);
sprite_change_offset("pratland", 16, 22);
sprite_change_offset("land", 14, 22);
sprite_change_offset("landinglag", 14, 22);

sprite_change_offset("parry", 18, 30);
sprite_change_offset("roll_forward", 14, 24);
sprite_change_offset("roll_backward", 14, 26);
sprite_change_offset("airdodge", 15, 33);
sprite_change_offset("waveland", 14, 22);
sprite_change_offset("tech", 14, 27);

sprite_change_offset("jab", 17, 24, true);
sprite_change_offset("dattack", 21, 30, true);
sprite_change_offset("ftilt", 17, 24, true);
sprite_change_offset("dtilt", 21, 22, true);
sprite_change_offset("utilt", 20, 37, true);

sprite_change_offset("fstrong", 16, 24, true);
sprite_change_offset("dstrong", 14, 30, true);
sprite_change_offset("ustrong", 16, 26, true);

sprite_change_offset("nair", 21, 33, true);
sprite_change_offset("fair", 16, 34, true);
sprite_change_offset("bair", 20, 34, true);
sprite_change_offset("uair", 19, 38, true);
sprite_change_offset("dair", 15, 36, true);

//should align 1:1 with the regular variants above
sprite_change_offset("nair_hover", 9, 25);
sprite_change_offset("fair_hover", 10, 26);
sprite_change_offset("bair_hover", 20, 25);
sprite_change_offset("uair_hover", 19, 38);

sprite_change_offset("idle_hover", 10, 25);
sprite_change_offset("vfx_hair_hover", 18, 8);
sprite_change_offset("vfx_hair_exhausted", 18, 12);
sprite_change_offset("hovermeter", 15, 0);
sprite_change_offset("indicator_triangle", 3, 3);

sprite_change_offset("nspecial", 13, 24, true);
sprite_change_offset("nspecial_air", 14, 28);
sprite_change_offset("fspecial", 17, 33, true);
sprite_change_offset("uspecial", 22, 30, true);
sprite_change_offset("dspecial", 16, 30, true);

sprite_change_offset("reflect", 16, 28, true);
sprite_change_offset("reflect_shine", 18, 18);
sprite_change_offset("reflect_shock", 23, 23);
 
sprite_change_offset("article1", 18, 0);
sprite_change_collision_mask( "article1", false, 2, 10, -2, 26, 0, 1 );
sprite_change_offset("article1_despawn", 8, 0);
sprite_change_offset("article1_col", 8, 0);
sprite_change_offset("article1_spike", 3, 8);

sprite_change_offset("cloud_proj_small", 32, 32);
sprite_change_offset("cloud_proj_big", 28, 26);
sprite_change_collision_mask( "cloud_proj_big", false, 2, 18, 18, 36, 36, 1 );
sprite_change_offset("shard_proj", 14, 7);
sprite_change_offset("drip_proj", 5, 11);
sprite_change_offset("vfx_snow_twinkle", 3, 3);
sprite_change_offset("vfx_snow_twinkle_falling", 3, 3);
sprite_change_offset("vfx_scraping", 2, 24);
sprite_change_offset("vfx_ice_small", 26, 24);
sprite_change_offset("vfx_ice_big", 33, 36);
sprite_change_offset("vfx_ice_dstrong", 56, 30);
sprite_change_collision_mask( "vfx_ice_dstrong", false, 2, 0, 0, 112, 30, 1 );
sprite_change_offset("vfx_frozen", 26, 28);
sprite_change_offset("vfx_nspecial", 26, 26);
sprite_change_offset("vfx_nspecial_notes_left", 52, 52);
sprite_change_offset("vfx_nspecial_notes_right", 52, 52);
sprite_change_offset("vfx_sleep", 24, 38);

sprite_change_offset("taunt", 20, 32);
sprite_change_offset("plat", 18, 7);
sprite_change_offset("smol_mask", 19, 44);

set_victory_theme(sound_get("victory"));
set_victory_bg(sprite_get("victory"));

//Compatibility
sprite_change_offset("cmp_miiverse", 60, 30);
sprite_change_offset("cmp_trial_grounds", 31, 0);
sprite_change_offset("cmp_kirby", 36, 76);

//================================================================
// Joke Explainer Mode
sprite_change_offset("jex_idle", 12, 30);
sprite_change_offset("jex_jumpstart", 12, 25);
sprite_change_offset("jex_jump", 11, 32);
sprite_change_offset("jex_doublejump", 11, 31);
sprite_change_offset("jex_doublejump_back", 16, 31);
sprite_change_offset("jex_walljump", 15, 31);
sprite_change_offset("jex_land", 12, 27);
sprite_change_offset("jex_crouch", 12, 29);
sprite_change_offset("jex_walk", 13, 30);
sprite_change_offset("jex_walkturn", 12, 29);
sprite_change_offset("jex_dashstart", 19, 28);
sprite_change_offset("jex_dash", 27, 26);
sprite_change_offset("jex_dashturn", 22, 27);
sprite_change_offset("jex_dashstop", 33, 28);
sprite_change_offset("jex_parry", 17, 29);
sprite_change_offset("jex_reflect", 24, 29);
sprite_change_offset("jex_airdodge", 15, 31);
sprite_change_offset("jex_waveland", 14, 27);
sprite_change_offset("jex_tech", 9, 27);
sprite_change_offset("jex_pratfall", 11, 26);
sprite_change_offset("jex_pratland", 12, 25);
sprite_change_offset("jex_roll_forward", 14, 27);
sprite_change_offset("jex_roll_backward", 14, 28);
sprite_change_offset("jex_hurt", 11, 30);
sprite_change_offset("jex_spinhurt", 14, 28);
sprite_change_offset("jex_taunt", 14, 30);

sprite_change_offset("jex_jab", 15, 28);

sprite_change_offset("jex_dtilt", 10, 27, true);
sprite_change_offset("jex_utilt", 20, 37);
sprite_change_offset("jex_dattack", 18, 27, true);

sprite_change_offset("jex_ustrong", 14, 49);
sprite_change_offset("jex_nair", 23, 30);
sprite_change_offset("jex_nair_hover", 23, 30);
sprite_change_offset("jex_fair", 12, 30);
sprite_change_offset("jex_fair_hover", 11, 30);
sprite_change_offset("jex_bair", 21, 29);
sprite_change_offset("jex_bair_hover", 21, 29);
sprite_change_offset("jex_uair", 20, 37);
sprite_change_offset("jex_uair_hover", 20, 37);
sprite_change_offset("jex_dair", 13, 33);

sprite_change_offset("jex_nspecial", 12, 30);
sprite_change_offset("jex_fspecial", 19, 29, true);
sprite_change_offset("jex_uspecial", 18, 28);
sprite_change_offset("jex_hover", 9, 32);
sprite_change_offset("jex_thrusters", 13, 17);

sprite_change_offset("vfx_electric_twinkle", 7, 10);
sprite_change_offset("vfx_spark_big", 34, 34);
sprite_change_offset("vfx_smokepuff", 16, 16);
sprite_change_offset("vfx_fspecial_charge", 48, 4);
sprite_change_offset("steam_hit_spr_mini", 20, 20);

sprite_change_offset("jex_hud", 0, -2);
sprite_change_offset("jex_hudhurt", 0, -2);
sprite_change_offset("jex_offscreen", 17, 17);
