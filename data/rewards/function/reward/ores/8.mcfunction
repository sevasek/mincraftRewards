give @s minecraft:netherite_pickaxe[enchantments={fortune:1}]
scoreboard players set @s rwd_ore_stage 8
title @s subtitle {"text":"⭐ Mine Ores — Level 8  |  Netherite Pickaxe (Fortune I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Pickaxe (Fortune I)","color":"aqua","bold":true}]