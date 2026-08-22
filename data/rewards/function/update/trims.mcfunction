# Sum all trim stats into rwd_trims
scoreboard players set @s rwd_trims 0
scoreboard players operation @s rwd_trims += @s st_t_coast
scoreboard players operation @s rwd_trims += @s st_t_dune
scoreboard players operation @s rwd_trims += @s st_t_eye
scoreboard players operation @s rwd_trims += @s st_t_flow
scoreboard players operation @s rwd_trims += @s st_t_host
scoreboard players operation @s rwd_trims += @s st_t_raiser
scoreboard players operation @s rwd_trims += @s st_t_rib
scoreboard players operation @s rwd_trims += @s st_t_sentry
scoreboard players operation @s rwd_trims += @s st_t_shaper
scoreboard players operation @s rwd_trims += @s st_t_silence
scoreboard players operation @s rwd_trims += @s st_t_snout
scoreboard players operation @s rwd_trims += @s st_t_spire
scoreboard players operation @s rwd_trims += @s st_t_tide
scoreboard players operation @s rwd_trims += @s st_t_vex
scoreboard players operation @s rwd_trims += @s st_t_ward
scoreboard players operation @s rwd_trims += @s st_t_wayfindr
scoreboard players operation @s rwd_trims += @s st_t_wild
scoreboard players operation @s rwd_trims += @s st_t_bolt
# Return the template used since last tick
execute unless score @s st_t_coast = @s rwd_t_coast_l run give @s minecraft:coast_armor_trim_smithing_template 1
execute unless score @s st_t_coast = @s rwd_t_coast_l run scoreboard players operation @s rwd_t_coast_l = @s st_t_coast
execute unless score @s st_t_dune = @s rwd_t_dune_l run give @s minecraft:dune_armor_trim_smithing_template 1
execute unless score @s st_t_dune = @s rwd_t_dune_l run scoreboard players operation @s rwd_t_dune_l = @s st_t_dune
execute unless score @s st_t_eye = @s rwd_t_eye_l run give @s minecraft:eye_armor_trim_smithing_template 1
execute unless score @s st_t_eye = @s rwd_t_eye_l run scoreboard players operation @s rwd_t_eye_l = @s st_t_eye
execute unless score @s st_t_flow = @s rwd_t_flow_l run give @s minecraft:flow_armor_trim_smithing_template 1
execute unless score @s st_t_flow = @s rwd_t_flow_l run scoreboard players operation @s rwd_t_flow_l = @s st_t_flow
execute unless score @s st_t_host = @s rwd_t_host_l run give @s minecraft:host_armor_trim_smithing_template 1
execute unless score @s st_t_host = @s rwd_t_host_l run scoreboard players operation @s rwd_t_host_l = @s st_t_host
execute unless score @s st_t_raiser = @s rwd_t_raiser_l run give @s minecraft:raiser_armor_trim_smithing_template 1
execute unless score @s st_t_raiser = @s rwd_t_raiser_l run scoreboard players operation @s rwd_t_raiser_l = @s st_t_raiser
execute unless score @s st_t_rib = @s rwd_t_rib_l run give @s minecraft:rib_armor_trim_smithing_template 1
execute unless score @s st_t_rib = @s rwd_t_rib_l run scoreboard players operation @s rwd_t_rib_l = @s st_t_rib
execute unless score @s st_t_sentry = @s rwd_t_sentry_l run give @s minecraft:sentry_armor_trim_smithing_template 1
execute unless score @s st_t_sentry = @s rwd_t_sentry_l run scoreboard players operation @s rwd_t_sentry_l = @s st_t_sentry
execute unless score @s st_t_shaper = @s rwd_t_shaper_l run give @s minecraft:shaper_armor_trim_smithing_template 1
execute unless score @s st_t_shaper = @s rwd_t_shaper_l run scoreboard players operation @s rwd_t_shaper_l = @s st_t_shaper
execute unless score @s st_t_silence = @s rwd_t_silence_l run give @s minecraft:silence_armor_trim_smithing_template 1
execute unless score @s st_t_silence = @s rwd_t_silence_l run scoreboard players operation @s rwd_t_silence_l = @s st_t_silence
execute unless score @s st_t_snout = @s rwd_t_snout_l run give @s minecraft:snout_armor_trim_smithing_template 1
execute unless score @s st_t_snout = @s rwd_t_snout_l run scoreboard players operation @s rwd_t_snout_l = @s st_t_snout
execute unless score @s st_t_spire = @s rwd_t_spire_l run give @s minecraft:spire_armor_trim_smithing_template 1
execute unless score @s st_t_spire = @s rwd_t_spire_l run scoreboard players operation @s rwd_t_spire_l = @s st_t_spire
execute unless score @s st_t_tide = @s rwd_t_tide_l run give @s minecraft:tide_armor_trim_smithing_template 1
execute unless score @s st_t_tide = @s rwd_t_tide_l run scoreboard players operation @s rwd_t_tide_l = @s st_t_tide
execute unless score @s st_t_vex = @s rwd_t_vex_l run give @s minecraft:vex_armor_trim_smithing_template 1
execute unless score @s st_t_vex = @s rwd_t_vex_l run scoreboard players operation @s rwd_t_vex_l = @s st_t_vex
execute unless score @s st_t_ward = @s rwd_t_ward_l run give @s minecraft:ward_armor_trim_smithing_template 1
execute unless score @s st_t_ward = @s rwd_t_ward_l run scoreboard players operation @s rwd_t_ward_l = @s st_t_ward
execute unless score @s st_t_wayfindr = @s rwd_t_wayfindr_l run give @s minecraft:wayfinder_armor_trim_smithing_template 1
execute unless score @s st_t_wayfindr = @s rwd_t_wayfindr_l run scoreboard players operation @s rwd_t_wayfindr_l = @s st_t_wayfindr
execute unless score @s st_t_wild = @s rwd_t_wild_l run give @s minecraft:wild_armor_trim_smithing_template 1
execute unless score @s st_t_wild = @s rwd_t_wild_l run scoreboard players operation @s rwd_t_wild_l = @s st_t_wild
execute unless score @s st_t_bolt = @s rwd_t_bolt_l run give @s minecraft:bolt_armor_trim_smithing_template 1
execute unless score @s st_t_bolt = @s rwd_t_bolt_l run scoreboard players operation @s rwd_t_bolt_l = @s st_t_bolt