scoreboard players set @s rwd_dirt 0
scoreboard players operation @s rwd_dirt += @s st_d_dirt
scoreboard players operation @s rwd_dirt += @s st_d_coarse_di
scoreboard players operation @s rwd_dirt += @s st_d_rooted_di
scoreboard players operation @s rwd_dirt += @s st_d_grass_blo
scoreboard players operation @s rwd_dirt += @s st_d_mycelium
scoreboard players operation @s rwd_dirt += @s st_d_podzol
scoreboard players operation @s rwd_dirt += @s st_d_farmland
scoreboard players operation @s rwd_dirt += @s st_d_gravel
scoreboard players operation @s rwd_dirt += @s st_d_sand
scoreboard players operation @s rwd_dirt += @s st_d_red_sand
scoreboard players operation @s rwd_dirt += @s st_d_soul_sand
scoreboard players operation @s rwd_dirt += @s st_d_soul_soil
scoreboard players operation @s rwd_dirt += @s st_d_mud
scoreboard players operation @s rwd_dirt += @s st_d_muddy_man
execute unless score @s rwd_dirt = @s rwd_dirt_last run function rewards:progress/dirt
scoreboard players operation @s rwd_dirt_last = @s rwd_dirt