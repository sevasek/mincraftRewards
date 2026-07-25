give @s minecraft:diamond_pickaxe[enchantments={fortune:1}]
scoreboard players set @s rwd_ore_stage 7
title @s subtitle {"text":"⭐ Mine Ores — Level 7  |  Diamond Pickaxe (Fortune I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Pickaxe (Fortune I)","color":"aqua","bold":true}]