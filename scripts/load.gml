sprite_change_offset("idle", 14, 25, true);
sprite_change_offset("idle_bot", 14, 30);
sprite_change_offset("hurt", 13, 25);
sprite_change_offset("hurt_bot", 14, 30);
sprite_change_offset("spinhurt", 15, 26);
sprite_change_offset("crouch", 17, 24, true);
sprite_change_offset("walk", 16, 25);
sprite_change_offset("walk_bot", 16, 30);
sprite_change_offset("walkturn", 14, 24);
sprite_change_offset("walkturn_bot", 14, 29);
sprite_change_offset("dash", 16, 30);
sprite_change_offset("dashstart", 17, 26);
sprite_change_offset("dashstop", 18, 28);
sprite_change_offset("dashturn", 16, 33);

sprite_change_offset("jumpstart", 15, 22);
sprite_change_offset("jump", 15, 34);
sprite_change_offset("doublejump", 15, 30);
sprite_change_offset("walljump", 16, 26);
sprite_change_offset("pratfall", 16, 31);
sprite_change_offset("pratland", 16, 22);
sprite_change_offset("land", 14, 22);
sprite_change_offset("landinglag", 14, 22);

sprite_change_offset("parry", 15, 26);
sprite_change_offset("roll_forward", 14, 24);
sprite_change_offset("roll_backward", 14, 26);
sprite_change_offset("airdodge", 16, 33);
sprite_change_offset("waveland", 16, 22);
sprite_change_offset("tech", 16, 27);

sprite_change_offset("jab", 19, 24, true);
sprite_change_offset("dattack", 20, 28, true);
sprite_change_offset("ftilt", 18, 24, true);
sprite_change_offset("dtilt", 16, 23, true);
sprite_change_offset("utilt", 20, 37, true);
sprite_change_offset("utilt_bot", 20, 37);

sprite_change_offset("nair", 24, 34, true);
sprite_change_offset("fair", 16, 34, true);
sprite_change_offset("bair", 19, 34, true);
sprite_change_offset("uair", 19, 38, true);
sprite_change_offset("dair", 15, 36, true);

//should match 1:1 with the regular variant offsets above
sprite_change_offset("nair_hover", 24, 34);
sprite_change_offset("fair_hover", 16, 34);
sprite_change_offset("bair_hover", 19, 34);
sprite_change_offset("uair_hover", 19, 38);

sprite_change_offset("idle_hover", 10, 25);
sprite_change_offset("vfx_hair_hover", 18, 8);
sprite_change_offset("vfx_hair_exhausted", 18, 12);
sprite_change_offset("hovermeter", 15, 0);
sprite_change_offset("indicator_triangle", 3, 3);

sprite_change_offset("article1", 8, 2);
sprite_change_offset("article1_spike", 3, 8);
sprite_change_offset("article1_spawn", 9, -2);
sprite_change_offset("article1_col", 8, 0);
sprite_change_collision_mask( "article1", false, 2, 0, 0, 16, 2, 1 );

sprite_change_offset("cloud_proj_small", 32, 32);
sprite_change_offset("cloud_proj_big", 28, 26);
sprite_change_offset("shard_proj", 14, 7);
sprite_change_offset("drip_proj", 5, 11);
sprite_change_offset("vfx_snow_twinkle", 3, 3);
sprite_change_offset("vfx_snow_twinkle_falling", 3, 3);
sprite_change_offset("vfx_ice_small", 27, 28);
sprite_change_offset("vfx_ice_big", 29, 32);
sprite_change_offset("vfx_ice_dstrong", 56, 30);
sprite_change_collision_mask( "vfx_ice_dstrong", false, 2, 0, 0, 112, 30, 1 );
sprite_change_offset("vfx_frozen", 26, 28);
sprite_change_offset("vfx_nspecial", 26, 26);
sprite_change_offset("vfx_nspecial_notes_left", 52, 52);
sprite_change_offset("vfx_nspecial_notes_right", 52, 52);
sprite_change_offset("vfx_sleep", 24, 38);
sprite_change_offset("vfx_shine", 23, 23);
sprite_change_offset("vfx_dspecial_flake", 60, 60);
sprite_change_offset("vfx_dspecial_zone", 60, 60);
 
sprite_change_offset("fstrong", 18, 24, true);
sprite_change_offset("ustrong", 16, 26, true);
sprite_change_offset("dstrong", 14, 30, true);
 
sprite_change_offset("nspecial", 14, 28, true);
sprite_change_offset("nspecial_air", 14, 28);
sprite_change_offset("fspecial", 17, 33, true);
sprite_change_offset("uspecial", 23, 30, true);
sprite_change_offset("dspecial", 16, 28, true);
sprite_change_offset("dspecial_air", 16, 28);
sprite_change_offset("dspecial_shine", 18, 18);
 
sprite_change_offset("taunt", 20, 34);
sprite_change_offset("plat", 18, 7);
sprite_change_offset("smol_mask", 19, 44);

set_victory_theme(sound_get("victory"));
set_victory_bg(sprite_get("victory"));

//Compatibility
sprite_change_offset("cmp_miiverse", 60, 30);
sprite_change_offset("cmp_trial_grounds", 31, 0);
sprite_change_offset("cmp_kirby", 36, 76);