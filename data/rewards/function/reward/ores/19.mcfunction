give @s minecraft:netherite_pickaxe[enchantments={fortune:3, efficiency:5, unbreaking:2}]
scoreboard players set @s rwd_ore_stage 19
title @s subtitle {"text":"⭐ Mine Ores — Level 19  |  Netherite Pickaxe (Fortune III, Efficiency V, Unbreaking II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Pickaxe (Fortune III, Efficiency V, Unbreaking II)","color":"aqua","bold":true}]