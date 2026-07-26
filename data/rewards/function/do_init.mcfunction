scoreboard players add @s rwd_log_stage 0
scoreboard players add @s rwd_ore_stage 0
scoreboard players add @s rwd_kill_stage 0
scoreboard players add @s rwd_dmg_stage 0
scoreboard players add @s rwd_dirt_stage 0
scoreboard players add @s rwd_shear_stage 0
scoreboard players add @s rwd_milk_stage 0
scoreboard players add @s rwd_egg_stage 0
scoreboard players add @s rwd_bread_stage 0
scoreboard players add @s rwd_spear_stage 0
scoreboard players add @s rwd_mace_stage 0
scoreboard players add @s rwd_spear_kills 0
scoreboard players add @s rwd_spear_win 0
scoreboard players add @s rwd_spear_ul 0
scoreboard players add @s rwd_spear_used 0
scoreboard players add @s rwd_mace_kills 0
scoreboard players add @s rwd_mace_win 0
scoreboard players add @s rwd_mace_ul 0
scoreboard players add @s rwd_kill_snap 0
scoreboard players add @s rwd_kills_delay 0
scoreboard players add @s rwd_tot_kills 0
scoreboard players add @s rwd_enc_m10 0
scoreboard players add @s rwd_enc_m50 0
scoreboard players add @s rwd_enc_m100 0
scoreboard players add @s rwd_enc_delta 0
function rewards:silent_init/logs
function rewards:silent_init/ores
scoreboard players set @s rwd_tot_kills 0
scoreboard players operation @s rwd_tot_kills += @s rwd_kills
scoreboard players operation @s rwd_tot_kills += @s rwd_pkills
function rewards:silent_init/kills
function rewards:silent_init/damage
function rewards:silent_init/dirt
function rewards:silent_init/shear
function rewards:silent_init/milk
function rewards:silent_init/egg
function rewards:silent_init/bread
function rewards:silent_init/spear
function rewards:silent_init/mace
scoreboard players set @s rwd_init 1