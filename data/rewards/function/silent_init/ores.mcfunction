scoreboard players set @s rwd_ores 0
scoreboard players operation @s rwd_ores += @s st_coal
scoreboard players operation @s rwd_ores += @s st_ds_coal
scoreboard players operation @s rwd_ores += @s st_iron
scoreboard players operation @s rwd_ores += @s st_ds_iron
scoreboard players operation @s rwd_ores += @s st_copper
scoreboard players operation @s rwd_ores += @s st_ds_copper
scoreboard players operation @s rwd_ores += @s st_gold
scoreboard players operation @s rwd_ores += @s st_ds_gold
scoreboard players operation @s rwd_ores += @s st_nether_gold
scoreboard players operation @s rwd_ores += @s st_lapis
scoreboard players operation @s rwd_ores += @s st_ds_lapis
scoreboard players operation @s rwd_ores += @s st_redstone
scoreboard players operation @s rwd_ores += @s st_ds_redstone
scoreboard players operation @s rwd_ores += @s st_emerald
scoreboard players operation @s rwd_ores += @s st_ds_emerald
scoreboard players operation @s rwd_ores += @s st_diamond
scoreboard players operation @s rwd_ores += @s st_ds_diamond
scoreboard players operation @s rwd_ores += @s st_nether_quart
scoreboard players operation @s rwd_ores += @s st_ancient_debr
execute if score @s rwd_ores matches 10.. run scoreboard players set @s rwd_ore_stage 1
execute if score @s rwd_ores matches 88.. run scoreboard players set @s rwd_ore_stage 2
execute if score @s rwd_ores matches 167.. run scoreboard players set @s rwd_ore_stage 3
execute if score @s rwd_ores matches 245.. run scoreboard players set @s rwd_ore_stage 4
execute if score @s rwd_ores matches 324.. run scoreboard players set @s rwd_ore_stage 5
execute if score @s rwd_ores matches 402.. run scoreboard players set @s rwd_ore_stage 6
execute if score @s rwd_ores matches 481.. run scoreboard players set @s rwd_ore_stage 7
execute if score @s rwd_ores matches 559.. run scoreboard players set @s rwd_ore_stage 8
execute if score @s rwd_ores matches 637.. run scoreboard players set @s rwd_ore_stage 9
execute if score @s rwd_ores matches 716.. run scoreboard players set @s rwd_ore_stage 10
execute if score @s rwd_ores matches 794.. run scoreboard players set @s rwd_ore_stage 11
execute if score @s rwd_ores matches 873.. run scoreboard players set @s rwd_ore_stage 12
execute if score @s rwd_ores matches 951.. run scoreboard players set @s rwd_ore_stage 13
execute if score @s rwd_ores matches 1029.. run scoreboard players set @s rwd_ore_stage 14
execute if score @s rwd_ores matches 1108.. run scoreboard players set @s rwd_ore_stage 15
execute if score @s rwd_ores matches 1186.. run scoreboard players set @s rwd_ore_stage 16
execute if score @s rwd_ores matches 1265.. run scoreboard players set @s rwd_ore_stage 17
execute if score @s rwd_ores matches 1343.. run scoreboard players set @s rwd_ore_stage 18
execute if score @s rwd_ores matches 1422.. run scoreboard players set @s rwd_ore_stage 19
execute if score @s rwd_ores matches 1500.. run scoreboard players set @s rwd_ore_stage 20
scoreboard players operation @s rwd_ore_last = @s rwd_ores