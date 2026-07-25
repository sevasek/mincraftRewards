give @s minecraft:netherite_pickaxe[enchantments={fortune:3, efficiency:5, unbreaking:3}]
scoreboard players set @s rwd_ore_stage 20
title @s subtitle {"text":"⭐ Mine Ores — Level 20  |  Netherite Pickaxe (Fortune III, Efficiency V, Unbreaking III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Pickaxe (Fortune III, Efficiency V, Unbreaking III)","color":"aqua","bold":true}]