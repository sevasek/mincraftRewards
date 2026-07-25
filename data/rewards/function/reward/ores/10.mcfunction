give @s minecraft:netherite_pickaxe[enchantments={fortune:2}]
scoreboard players set @s rwd_ore_stage 10
title @s subtitle {"text":"⭐ Mine Ores — Level 10  |  Netherite Pickaxe (Fortune II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Pickaxe (Fortune II)","color":"aqua","bold":true}]