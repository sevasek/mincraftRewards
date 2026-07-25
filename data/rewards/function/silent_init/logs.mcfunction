scoreboard players set @s rwd_logs 0
scoreboard players operation @s rwd_logs += @s st_oak_log
scoreboard players operation @s rwd_logs += @s st_birch_log
scoreboard players operation @s rwd_logs += @s st_spruce_log
scoreboard players operation @s rwd_logs += @s st_jungle_log
scoreboard players operation @s rwd_logs += @s st_acacia_log
scoreboard players operation @s rwd_logs += @s st_dark_oak_log
scoreboard players operation @s rwd_logs += @s st_mangrove_log
scoreboard players operation @s rwd_logs += @s st_cherry_log
scoreboard players operation @s rwd_logs += @s st_oak_wood
scoreboard players operation @s rwd_logs += @s st_birch_wood
scoreboard players operation @s rwd_logs += @s st_spruce_wood
scoreboard players operation @s rwd_logs += @s st_jungle_wood
scoreboard players operation @s rwd_logs += @s st_acacia_wood
scoreboard players operation @s rwd_logs += @s st_dark_oak_woo
scoreboard players operation @s rwd_logs += @s st_mangrove_woo
scoreboard players operation @s rwd_logs += @s st_cherry_wood
execute if score @s rwd_logs matches 10.. run scoreboard players set @s rwd_log_stage 1
execute if score @s rwd_logs matches 88.. run scoreboard players set @s rwd_log_stage 2
execute if score @s rwd_logs matches 167.. run scoreboard players set @s rwd_log_stage 3
execute if score @s rwd_logs matches 245.. run scoreboard players set @s rwd_log_stage 4
execute if score @s rwd_logs matches 324.. run scoreboard players set @s rwd_log_stage 5
execute if score @s rwd_logs matches 402.. run scoreboard players set @s rwd_log_stage 6
execute if score @s rwd_logs matches 481.. run scoreboard players set @s rwd_log_stage 7
execute if score @s rwd_logs matches 559.. run scoreboard players set @s rwd_log_stage 8
execute if score @s rwd_logs matches 637.. run scoreboard players set @s rwd_log_stage 9
execute if score @s rwd_logs matches 716.. run scoreboard players set @s rwd_log_stage 10
execute if score @s rwd_logs matches 794.. run scoreboard players set @s rwd_log_stage 11
execute if score @s rwd_logs matches 873.. run scoreboard players set @s rwd_log_stage 12
execute if score @s rwd_logs matches 951.. run scoreboard players set @s rwd_log_stage 13
execute if score @s rwd_logs matches 1029.. run scoreboard players set @s rwd_log_stage 14
execute if score @s rwd_logs matches 1108.. run scoreboard players set @s rwd_log_stage 15
execute if score @s rwd_logs matches 1186.. run scoreboard players set @s rwd_log_stage 16
execute if score @s rwd_logs matches 1265.. run scoreboard players set @s rwd_log_stage 17
execute if score @s rwd_logs matches 1343.. run scoreboard players set @s rwd_log_stage 18
execute if score @s rwd_logs matches 1422.. run scoreboard players set @s rwd_log_stage 19
execute if score @s rwd_logs matches 1500.. run scoreboard players set @s rwd_log_stage 20
scoreboard players operation @s rwd_log_last = @s rwd_logs