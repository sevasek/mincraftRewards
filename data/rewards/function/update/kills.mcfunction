scoreboard players set @s rwd_tot_kills 0
scoreboard players operation @s rwd_tot_kills += @s rwd_kills
scoreboard players operation @s rwd_tot_kills += @s rwd_pkills
execute unless score @s rwd_tot_kills = @s rwd_kill_last if score @s rwd_kills_delay matches 0 run function rewards:progress/kills
execute unless score @s rwd_tot_kills = @s rwd_kill_last if score @s rwd_kills_delay matches 0 run scoreboard players operation @s rwd_kill_last = @s rwd_tot_kills