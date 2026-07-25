give @s minecraft:diamond_pickaxe[enchantments={fortune:3, efficiency:1}]
scoreboard players set @s rwd_ore_stage 13
title @s subtitle {"text":"⭐ Mine Ores — Level 13  |  Diamond Pickaxe (Fortune III, Efficiency I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Pickaxe (Fortune III, Efficiency I)","color":"aqua","bold":true}]