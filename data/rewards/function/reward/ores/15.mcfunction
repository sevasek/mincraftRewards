give @s minecraft:diamond_pickaxe[enchantments={fortune:3, efficiency:5}]
scoreboard players set @s rwd_ore_stage 15
title @s subtitle {"text":"⭐ Mine Ores — Level 15  |  Diamond Pickaxe (Fortune III, Efficiency V)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Pickaxe (Fortune III, Efficiency V)","color":"aqua","bold":true}]