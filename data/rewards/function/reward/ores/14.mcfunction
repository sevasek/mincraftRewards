give @s minecraft:netherite_pickaxe[enchantments={fortune:3, efficiency:1}]
scoreboard players set @s rwd_ore_stage 14
title @s subtitle {"text":"⭐ Mine Ores — Level 14  |  Netherite Pickaxe (Fortune III, Efficiency I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Pickaxe (Fortune III, Efficiency I)","color":"aqua","bold":true}]