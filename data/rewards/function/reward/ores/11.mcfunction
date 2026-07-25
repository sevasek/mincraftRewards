give @s minecraft:diamond_pickaxe[enchantments={fortune:3}]
scoreboard players set @s rwd_ore_stage 11
title @s subtitle {"text":"⭐ Mine Ores — Level 11  |  Diamond Pickaxe (Fortune III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Pickaxe (Fortune III)","color":"aqua","bold":true}]