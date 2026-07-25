# Sum all spear tier uses
scoreboard players set @s rwd_spear_used 0
scoreboard players operation @s rwd_spear_used += @s st_wooden_sp
scoreboard players operation @s rwd_spear_used += @s st_stone_sp
scoreboard players operation @s rwd_spear_used += @s st_iron_sp
scoreboard players operation @s rwd_spear_used += @s st_golden_sp
scoreboard players operation @s rwd_spear_used += @s st_diamon_sp
scoreboard players operation @s rwd_spear_used += @s st_nether_sp

# Open spear window if a new jab was detected
execute unless score @s rwd_spear_used = @s rwd_spear_ul run scoreboard players set @s rwd_spear_win 20
scoreboard players operation @s rwd_spear_ul = @s rwd_spear_used

# Open mace window if mace was swung
execute unless score @s rwd_mace = @s rwd_mace_ul run scoreboard players set @s rwd_mace_win 20
scoreboard players operation @s rwd_mace_ul = @s rwd_mace

# Compute total kills this tick (mob + player)
scoreboard players set @s rwd_all_kills 0
scoreboard players operation @s rwd_all_kills += @s rwd_kills
scoreboard players operation @s rwd_all_kills += @s rwd_pkills

# Credit weapon kill if kill happened while window is open
execute if score @s rwd_spear_win matches 1.. if score @s rwd_all_kills > @s rwd_kill_snap if score @s rwd_spear_stage matches ..19 run function rewards:weapon_kill/spear
execute if score @s rwd_mace_win matches 1.. if score @s rwd_all_kills > @s rwd_kill_snap if score @s rwd_mace_stage matches ..19 run function rewards:weapon_kill/mace

# Decrement open windows
execute if score @s rwd_spear_win matches 1.. run scoreboard players remove @s rwd_spear_win 1
execute if score @s rwd_mace_win matches 1.. run scoreboard players remove @s rwd_mace_win 1

# Decrement kills-message delay (queues mob-kills progress after weapon kill)
execute if score @s rwd_kills_delay matches 1.. run scoreboard players remove @s rwd_kills_delay 1

# Sync kill snapshot for next tick
scoreboard players operation @s rwd_kill_snap = @s rwd_all_kills