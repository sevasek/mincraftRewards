give @s minecraft:diamond_pickaxe[enchantments={fortune:2}]
scoreboard players set @s rwd_ore_stage 9
title @s subtitle {"text":"⭐ Mine Ores — Level 9  |  Diamond Pickaxe (Fortune II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Pickaxe (Fortune II)","color":"aqua","bold":true}]