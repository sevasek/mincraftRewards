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
execute if score @s rwd_dirt matches 10.. run scoreboard players set @s rwd_dirt_stage 1
execute if score @s rwd_dirt matches 168.. run scoreboard players set @s rwd_dirt_stage 2
execute if score @s rwd_dirt matches 326.. run scoreboard players set @s rwd_dirt_stage 3
execute if score @s rwd_dirt matches 484.. run scoreboard players set @s rwd_dirt_stage 4
execute if score @s rwd_dirt matches 643.. run scoreboard players set @s rwd_dirt_stage 5
execute if score @s rwd_dirt matches 801.. run scoreboard players set @s rwd_dirt_stage 6
execute if score @s rwd_dirt matches 959.. run scoreboard players set @s rwd_dirt_stage 7
execute if score @s rwd_dirt matches 1117.. run scoreboard players set @s rwd_dirt_stage 8
execute if score @s rwd_dirt matches 1275.. run scoreboard players set @s rwd_dirt_stage 9
execute if score @s rwd_dirt matches 1433.. run scoreboard players set @s rwd_dirt_stage 10
execute if score @s rwd_dirt matches 1592.. run scoreboard players set @s rwd_dirt_stage 11
execute if score @s rwd_dirt matches 1750.. run scoreboard players set @s rwd_dirt_stage 12
execute if score @s rwd_dirt matches 1908.. run scoreboard players set @s rwd_dirt_stage 13
execute if score @s rwd_dirt matches 2066.. run scoreboard players set @s rwd_dirt_stage 14
execute if score @s rwd_dirt matches 2224.. run scoreboard players set @s rwd_dirt_stage 15
execute if score @s rwd_dirt matches 2382.. run scoreboard players set @s rwd_dirt_stage 16
execute if score @s rwd_dirt matches 2541.. run scoreboard players set @s rwd_dirt_stage 17
execute if score @s rwd_dirt matches 2699.. run scoreboard players set @s rwd_dirt_stage 18
execute if score @s rwd_dirt matches 2857.. run scoreboard players set @s rwd_dirt_stage 19
execute if score @s rwd_dirt matches 3015.. run scoreboard players set @s rwd_dirt_stage 20
scoreboard players operation @s rwd_dirt_last = @s rwd_dirt